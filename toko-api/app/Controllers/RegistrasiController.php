<?php

namespace App\Controllers;

use App\Models\MRegistrasi;

class RegistrasiController extends RestfulController
{
    public function registrasi()
    {
        $nama     = trim((string) $this->request->getVar('nama'));
        $email    = trim((string) $this->request->getVar('email'));
        $password = (string) $this->request->getVar('password');

        if ($nama === '' || $email === '' || $password === '') {
            return $this->responseHasil(400, false, 'Nama, email, dan password wajib diisi');
        }
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            return $this->responseHasil(400, false, 'Format email tidak valid');
        }

        $model = new MRegistrasi();

        // email harus unique (sesuai API SPEC)
        if ($model->where('email', $email)->first()) {
            return $this->responseHasil(400, false, 'Email sudah terdaftar');
        }

        $model->insert([
            'nama'     => $nama,
            'email'    => $email,
            'password' => password_hash($password, PASSWORD_DEFAULT),
        ]);

        return $this->responseHasil(200, true, 'Registrasi Berhasil');
    }
}
