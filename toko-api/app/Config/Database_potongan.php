<?php
// JANGAN timpa seluruh file Database.php.
// Di app/Config/Database.php cari: public $default = [ ... ];
// lalu ubah hanya nilai berikut:

public $default = [
    'DSN'      => '',
    'hostname' => 'localhost',
    'username' => 'root',
    'password' => '',
    'database' => 'toko_api',
    'DBDriver' => 'MySQLi',
    // ... sisanya biarkan seperti bawaan
];
