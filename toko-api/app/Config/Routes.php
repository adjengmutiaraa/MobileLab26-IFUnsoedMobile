<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Home::index');

$routes->post('registrasi', 'RegistrasiController::registrasi');
$routes->post('login', 'LoginController::login');

$routes->group('produk', function ($routes) {
    $routes->post('/', 'ProdukController::create');
    $routes->get('/', 'ProdukController::list');
    $routes->get('(:num)', 'ProdukController::detail/$1');
    $routes->put('(:num)', 'ProdukController::ubah/$1');
    $routes->post('(:num)/update', 'ProdukController::ubah/$1');
    $routes->delete('(:num)', 'ProdukController::hapus/$1');
});
