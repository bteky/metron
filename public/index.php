<?php

declare(strict_types=1);
/**
 * SSPanel-Uim Public Entrance File
 *
 * @license MIT(https://github.com/Anankke/SSPanel-Uim/blob/dev/LICENSE)
 *          Addition: You shouldn't remove staff page or entrance of that page.
 */
require __DIR__ . '/../vendor/autoload.php';
require __DIR__ . '/../config/.config.example.php';
require __DIR__ . '/../config/appprofile.example.php';
require __DIR__ . '/../app/predefine.php';
require __DIR__ . '/../app/envload.php';
require __DIR__ . '/../config/.metron_setting.example.php';
require __DIR__ . '/../config/style.php';
require __DIR__ . '/../config/.i18n.php';

// 限制地区访问
if ($_MT['Restricted_access'] === true) {
    $acc = \App\Metron\Metron::Restricted_access();
    if (!$acc['ok']) {
        die('Your IP：' . $acc['info']['ip'] . ' | Access Denied');
    }
}

// TODO: legacy boot function
use App\Services\Boot;

Boot::setTime();
Boot::bootDb();

/** @var Slim\Container $container */
$container = require __DIR__ . '/../app/container.php';
$app = new Slim\App($container);

/** @var closure $middleware */
$middleware = require __DIR__ . '/../app/middleware.php';
$middleware($app);

/** @var closure $routes */
$routes = require __DIR__ . '/../app/routes.php';
$routes($app);

$app->run();
