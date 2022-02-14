<!DOCTYPE html>
<html lang="en">
<head>
    <title>Clash 使用教程 &mdash; {$config["appName"]}</title>
    <link href="{$metron['assets_url']}/css/client/metron-icon.css" rel="stylesheet" type="text/css" />
    <link href="{$metron['assets_url']}/plugins/tutorial/lightbox/lightbox.min.css" rel="stylesheet" >
    {include file='include/global/head.tpl'}
    <div class="d-flex flex-column flex-root">
        <div class="d-flex flex-row flex-column-fluid page">
            <div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
                {include file='include/global/menu.tpl'}
                <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
                    <div class="subheader min-h-lg-175px pt-5 pb-7 subheader-transparent" id="kt_subheader">
                        <div class="container d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
                            <div class="d-flex align-items-center flex-wrap mr-2">
                                <div class="d-flex flex-column">
                                    <h2 class="text-white font-weight-bold my-2 mr-5">v2rayN 使用教程</h2>
                                </div>
                            </div>
                            <div class="d-flex align-items-center">

                            </div>
                        </div>
                    </div>

                    <div class="d-flex flex-column-fluid">
                        <div class="container">

                            <!-- 开始 :: 教程内容 -->
                            <div class="row" data-sticky-container>
                                <div class="col-12">
                                    <div class="card card-custom gutter-b {$metron['style_shadow']}">
                                        <div class="card-header">
                                            <div class="card-title">
                                            </div>
                                        </div>
                                        <div class="card-body">

                                            <!-- 开始 :: 内容段落 1 -->
                                            <div class="row p-5">

                                                <!-- 开始 :: 段落文本区 -->
                                                <div class="col-sm-12 col-md-12 col-lg-7 pb-5">
                                                    <!-- 开始 :: 段落标题 -->
                                                    <p class="font-size-h1 pb-5"><strong>0. 简介</strong></p>
                                                    <!-- 结束 :: 段落标题 -->
                                                    <div class="example-preview">
                                                        {*                                                            <p><code>Clash</code>是一款用 Go语言 开发的支持 Linux/MacOS/Windows/Android 等多平台的代理工具，支持 ss/v2ray（不支持 ssr），支持规则分流（类似于 Surge 的配置）。</p>*}
                                                        {*                                                            <p>由于客户端长期更新中可能出现界面或功能与教程不符，我们建议您把本教程仅作为参考，具体需要根据自己使用过程中熟悉了解。</p>*}
                                                        {*                                                            <p><code>ClashR</code>则在Clash的基础上增加对SSR的支持</p>
                                                                                                                      <code>Clash for Windows 仅支持Windows 64位系统，32位系统请选用其他客户端</code>
                                                        *}
                                                        <p>下载APP后需登录网站<span style="color: green; font-size: medium; ">添加订阅</span>，见第二步教程</p>
                                                        <code>连接失败，请联系网站右下角在线客服</code>
                                                    </div>
                                                </div>
                                                <!-- 结束 :: 段落文本区 -->

                                                <!-- 开始 :: 图片 -->
                                                <div class="col-sm-12 col-md-12 col-lg-5">
                                                    <!-- 图片点击打开的灯箱高清图 -->
                                                    <a class="image-popup-no-margins" href="/theme/metron/images/win/v2rayn-0.png" data-lightbox="images">
                                                        <!-- 页面显示的图片缩略图 -->
                                                        <img class="rounded-lg" style="width:100%" src="/theme/metron/images/win/v2rayn-0.png"/></a>
                                                </div>
                                                <!-- 结束 :: 图片 -->

                                            </div>
                                            <!-- 结束 :: 内容段落 1 -->

                                            <!-- 开始 :: 分割线 -->
                                            <div class="separator separator-dashed separator-border-4"></div>
                                            <!-- 结束 :: 分割线 -->

                                            <!-- 开始 :: 内容段落 2 -->
                                            <div class="row p-5">
                                                <!-- 段落内容 -->
                                                <div class="col-sm-12 col-md-12 col-lg-7 pb-5">
                                                    <!-- 开始 :: 段落标题 -->
                                                    <p class="font-size-h1 pb-5"><strong>1. 下载客户端</strong></p>
                                                    <!-- 结束 :: 段落标题 -->
                                                    <!-- 开始 :: 客户端下载按钮 -->
                                                    <a href="{$metron['client_windows']['V2rayN']['down']}" class="btn btn-pill btn-v2ray mb-4" target="_blank">&nbsp;&nbsp;<i class="metron-v2rayng text-white"></i>下载 V2rayN</a>&nbsp;&nbsp;&nbsp;
                                                    <!-- 结束 :: 客户端下载按钮 -->
                                                    <br />
                                                    <br />
                                                    <div class="h6 pt-2">下载后解压到任意文件夹，从解压目录中打开 <code>v2rayN.exe</code></div>
                                                </div>
                                                <!-- 开始 :: 图片 -->
                                                <div class="col-sm-12 col-md-12 col-lg-5">
                                                    <a class="image-popup-no-margins" href="/theme/metron/images/win/v2rayn-1.png"  data-lightbox="images">
                                                        <img class="rounded-lg" style="width:100%" src="/theme/metron/images/win/v2rayn-1.png"/></a>
                                                </div>
                                                <!-- 结束 :: 图片 -->
                                            </div>
                                            <!-- 结束 :: 内容段落 2 -->

                                            <!-- 开始 :: 分割线 -->
                                            <div class="separator separator-dashed separator-border-4"></div>
                                            <!-- 结束 :: 分割线 -->

                                            <!-- 开始 :: 内容段落 3 -->
                                            <div class="row p-5">
                                                <div class="col-sm-12 col-md-12 col-lg-7 pb-5">
                                                    <!-- 开始 :: 段落标题 -->
                                                    <p class="font-size-h1 pb-5"><strong>2. 设置订阅地址</strong></p>
                                                    <!-- 结束 :: 段落标题 -->
                                                    <!-- 开始 :: 订阅按钮 -->

                                                    <div class="btn-group mb-3 mr-3">
                                                        <button type="button" class="btn btn-pill btn-v2ray mb-4 copy-text" data-clipboard-text="{$subInfo["v2ray"]}">&nbsp;&nbsp;<i class="metron-v2rayng text-white"></i> 复制 V2Ray 订阅&nbsp;&nbsp;</button>
                                                    </div>
                                                    <div class="h6 pt-2">复制上方v2ray订阅链接 (先开启v2ray客户端)</div>
                                                    <div class="h6 pt-2">找到 <code>订阅</code> 并点击 <code>订阅设置</code>然后把地址输入到<code>地址(url)</code>点击确定</div>
                                                    <br>
                                                    <div class="alert alert-custom alert-outline-primary fade show mb-5" role="alert">
                                                        <div class="alert-icon">
                                                            <i class="flaticon-warning"></i>
                                                        </div>
                                                        <div class="alert-text">
                                                            <p class="mb-2">订阅后无法使用？</p>
                                                            <p class="mb-2">找到检测更新</p>
                                                            <p class="mb-2">点击 <code>检测更新V2RayN</code>,再点击<code>检测更新V2RayN-Core</code>将两项更到最新版本即可 </p>
                                                        </div>
                                                        <div class="alert-close">
                                                            <button type="button" class="close" data-dismiss="alert" aria-label="关">
                                                                    <span aria-hidden="true">
                                                                        <i class="ki ki-close"></i>
                                                                    </span>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <!-- 结束 :: 订阅按钮 -->

                                                </div>
                                                <div class="col-sm-12 col-md-12 col-lg-5">
                                                    <a class="image-popup-no-margins" href="/theme/metron/images/win/v2rayn-2.png" data-lightbox="images">
                                                        <img class="rounded-lg" style="width:100%" src="/theme/metron/images/win/v2rayn-2.png"/></a>
                                                </div>
                                            </div>
                                            <!-- 结束 :: 内容段落 3 -->

                                            <!-- 开始 :: 分割线 -->
                                            <div class="separator separator-dashed separator-border-4"></div>
                                            <!-- 结束 :: 分割线 -->

                                            <!-- 开始 :: 内容段落 4 -->
                                            <div class="row p-5">
                                                <div class="col-sm-12 col-md-12 col-lg-7 pb-5">
                                                    <!-- 开始 :: 段落标题 -->
                                                    <p class="font-size-h1 pb-5"><strong>3. 选择节点</strong></p>
                                                    <!-- 结束 :: 段落标题 -->
                                                    <div class="h6 pt-2">点击 <code>Profiles</code> 选项切换到代理节点界面</div>
                                                    <div class="h6 pt-2">更新订阅后出现服务器列表。</div>
                                                    <div class="h6 pt-2">根据需要选择相应的节点，点击服务器列表中的任意节点即可选中，右键菜单选择设为活动服务器即表示使用对应的服务器节点。</div>
                                                    <div class="h6 pt-2">通常情况，亚太地区（港、台）距离大陆较近，节点延迟较低。部分服务器线路价格较高，可能会设置高倍率，请按照您的需求自行选择节点。</div>
                                                </div>
                                                <div class="col-sm-12 col-md-12 col-lg-5">
                                                    <a class="image-popup-no-margins" href="/theme/metron/images/win/v2rayn-3.png" data-lightbox="images">
                                                        <img class="rounded-lg" style="width:100%" src="/theme/metron/images/win/v2rayn-3.png"/></a>
                                                </div>
                                            </div>
                                            <!-- 结束 :: 内容段落 4 -->

                                            <!-- 开始 :: 分割线 -->
                                            <div class="separator separator-dashed separator-border-4"></div>
                                            <!-- 结束 :: 分割线 -->

                                            <!-- 开始 :: 内容段落 5 -->
                                            <div class="row p-5">
                                                <div class="col-sm-12 col-md-12 col-lg-7 pb-5">
                                                    <!-- 开始 :: 段落标题 -->
                                                    <p class="font-size-h1 pb-5"><strong>4. 开启代理</strong></p>
                                                    <!-- 结束 :: 段落标题 -->
                                                    <div class="h6 pt-2">点击你电脑状态栏右下角右键点击V字图标 并开启代理。。</div>
                                                    <div class="h6 pt-2">点击 <code>HTTP代理(推荐)</code> - <code>开启PAC,并自动配置代理PAC(PAC模式)</code></div>
                                                    <div class="h6 pt-2">点击 <code>HTTP代理</code> 设置为 <code>开启http代理,并自动配置代理服务器(全局模式)</code></div>
                                                    <div class="h6 pt-2">两种模式任选根据自己的需求进行设置</div>
                                                    <div class="h6 pt-2">一切准备就绪~~~</div>
                                                </div>
                                                <div class="col-sm-12 col-md-12 col-lg-5">
                                                    <a class="image-popup-no-margins" href="/theme/metron/images/win/v2rayn-4.png" data-lightbox="images">
                                                        <img class="rounded-lg" style="width:100%" src="/theme/metron/images/win/v2rayn-4.png"/></a>
                                                </div>
                                            </div>
                                            {*<!-- 结束 :: 内容段落 5 -->*}

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 结束 :: 教程内容 -->

                        </div>
                    </div>
                </div>
                {include file='include/global/footer.tpl'}
            </div>
        </div>
    </div>

    {include file='include/global/scripts.tpl'}
    {include file='include/global/import_sublink.tpl'}
    <script src="{$metron['assets_url']}/plugins/tutorial/lightbox/lightbox.min.js" type="text/javascript"></script>

    </body>
</html>
