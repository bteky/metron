<?php

namespace App\Services\Gateway;

use App\Services\View;
use App\Services\Auth;
use App\Services\Config;
use App\Models\Paylist;

class WellPay extends AbstractPayment
{

   private $appid;
    private $appkey;
    private $gatewayUri;

    /**
     * 签名初始化
     * @param merKey    签名密钥
     */

    public function __construct($appSecret)
    {
        $this->appid = Config::get('wellpay_app_id');
        $this->appSecret = Config::get('wellpay_app_secret');
        $this->serverID = Config::get('server_id');
        $this->gatewayUri = 'https://api.crossz.pro/v1/service/payment';
    }

    public function MetronPay($type, $price, $buyshop, $paylist_id = 0)
    {
        if ($paylist_id == 0 && $price <1) {
            return ['errcode' => -1, 'errmsg' => '付款金额至少要1.00元'];
        }
        $user = Auth::getUser();
        $orderno = date("Ymdhms") . sprintf("%05d", rand(1, 99999));
        if ($paylist_id == 0) {
            $pl = new Paylist();
            $pl->userid = $user->id;
            $pl->total = $price;
            if ($buyshop['id'] != 0) $pl->shop = json_encode($buyshop);
            $pl->datetime = time();
            $pl->tradeno = $orderno;
            $pl->save();
        } else {
            $pl = Paylist::find($paylist_id);
            if ($pl->status === 1) {
                return ['errcode' => -1, 'errmsg' => "该订单已交易完成"];
            }
        }
        $data = array(
            'appid'=>$this->appid,//商户编号
            'orderno' => $pl->tradeno,//商户订单号，需保证在商户平台唯一
            'totalfee'=> $price,//单位元
            'server_id'=> $this->serverID,//
            'panel'=> 'metron',//
            'ver'=> '101',//
            'request_time'=> time(),//
            'remark'=> '',//
            'notifyurl' =>'/payment/notify/wellpay',//	异步通知地址
            'returnurl' => $_SERVER['HTTP_ORIGIN'].'/user/payment/return?tradeno=' . $pl->tradeno
        );
        $data['sign'] = $this->sign($data);
        $resdata = $this->post($data);
        $result = json_decode($resdata,true);
        if (!isset($result['resultCode'])!=0) {
            return ['errcode' => -1, 'errmsg' => '处理支付网关失败。'];
        }
        return (['url' => $result['data']['payUrl'], 'code' => 0,'errcode' => 0, 'pid' => $pl->tradeno]);
    }
    public function purchase($type, $price, $buyshop, $paylist_id = 0)
    {
        if ($paylist_id == 0 && $price <1) {
            return ['errcode' => -1, 'errmsg' => '付款金额至少要1.00元'];
        }
        $user = Auth::getUser();
        $orderno = date("Ymdhms") . sprintf("%05d", rand(1, 99999));
        if ($paylist_id == 0) {
            $pl = new Paylist();
            $pl->userid = $user->id;
            $pl->total = $price;
            if ($buyshop['id'] != 0) $pl->shop = json_encode($buyshop);
            $pl->datetime = time();
            $pl->tradeno = $orderno;
            $pl->save();
        } else {
            $pl = Paylist::find($paylist_id);
            if ($pl->status === 1) {
                return ['errcode' => -1, 'errmsg' => "该订单已交易完成"];
            }
        }
        $data = array(
            'appid'=>$this->appid,//商户编号
            'orderno' => $pl->tradeno,//商户订单号，需保证在商户平台唯一
            'totalfee'=> $price,//单位元
            'server_id'=> $this->serverID,//
            'panel'=> 'metron',//
            'ver'=> '101',//
            'request_time'=> time(),//
            'remark'=> '',//
            'notifyurl' =>'/payment/notify/wellpay',//	异步通知地址
            'returnurl' => '/user/payment/return?tradeno=' . $pl->tradeno
        );
        $data['sign'] = $this->sign($data);
        $resdata = $this->post($data);
        $result = json_decode($resdata,true);
        if (!isset($result['resultCode'])!=0) {
            return ['errcode' => -1, 'errmsg' => '处理支付网关失败。'];
        }
        return (['url' => $result['data']['payUrl'], 'code' => 0,'errcode' => 0, 'pid' => $pl->tradeno]);
    }

    public function notify($request, $response, $args)
    {
        $params = json_decode(@file_get_contents("php://input"),true);
        if (!$this->verify($params)) {
            abort(500,'签名错误');
        }
        $this->postPayment($params['orderno'], 'WellPay');
        die('success');
    }
    /**
     * @name    准备签名/验签字符串
     */
    public function prepareSign($data)
    {
        ksort($data);
        return htmlspecialchars(http_build_query($data));
    }

    public function verify(array $data)
    {
        $sign = $data['sign'] ?? null;
        return $sign === $this->sign($data);
    }

    private function sign(array $data)
    {
        $str = urldecode(http_build_query($this->argSorts($this->paraFilters($data))));
        return md5($str . "&app_secret=" . $this->appSecret);
    }
    private function paraFilters(array $para)
    {
        return array_filter($para, function ($item, $key) {
            if ($key != "sign" && !empty($item)) return true;
        }, ARRAY_FILTER_USE_BOTH);
    }
    private function argSorts(array $para)
    {
        ksort($para);
        reset($para);
        return $para;
    }

    public function post($data)
    {
        if (is_array($data))
        {
            $data = http_build_query($data);
        }
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $this->gatewayUri);
        curl_setopt($curl, CURLOPT_HEADER, 0);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        curl_setopt($curl, CURLOPT_HTTPHEADER,  array(
            "Content-Type: application/x-www-form-urlencoded") );
        $data = curl_exec($curl);
        // $data = curl_getinfo($curl,CURLINFO_EFFECTIVE_URL);
        curl_close($curl);
        return $data;
    }

    public function getPurchaseHTML()
    {
        //file_put_contents(BASE_PATH . '/storage/easypay.log', '888888', FILE_APPEND);
        return View::getSmarty()->fetch('user/easypay.tpl');
    }

    public function getReturnHTML($request, $response, $args)
    {
        header('Location:/user/code');
    }

    public function getStatus($request, $response, $args)
    {
        $return = [];
        $p = Paylist::where('tradeno', $_POST['pid'])->first();
        $return['ret'] = 1;
        $return['result'] = $p->status;
        return json_encode($return);
    }
}
