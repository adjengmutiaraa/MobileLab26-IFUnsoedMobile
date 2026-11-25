<?php

namespace App\Controllers;

use App\Models\MProduk;

class ProdukController extends RestfulController
{
    public function create()
    {
        $data = [
            'kode_produk' => $this->request->getVar('kode_produk'),
            'nama_produk' => $this->request->getVar('nama_produk'),
            'harga'       => $this->request->getVar('harga'),
        ];

        if (empty($data['kode_produk']) || empty($data['nama_produk']) || $data['harga'] === null || $data['harga'] === '') {
            return $this->responseHasil(400, false, 'kode_produk, nama_produk, dan harga wajib diisi');
        }

        $model = new MProduk();
        $model->insert($data);
        $produk = $model->find($model->getInsertID());
        return $this->responseHasil(200, true, $produk);
    }

    public function list()
    {
        $model  = new MProduk();
        $produk = $model->findAll();
        return $this->responseHasil(200, true, $produk);
    }

    public function detail($id)
    {
        $model  = new MProduk();
        $produk = $model->find($id);
        if (!$produk) {
            return $this->responseHasil(404, false, 'Produk tidak ditemukan');
        }
        return $this->responseHasil(200, true, $produk);
    }

    public function ubah($id)
    {
        $model = new MProduk();
        if (!$model->find($id)) {
            return $this->responseHasil(404, false, 'Produk tidak ditemukan');
        }

        $data = [
            'kode_produk' => $this->request->getVar('kode_produk'),
            'nama_produk' => $this->request->getVar('nama_produk'),
            'harga'       => $this->request->getVar('harga'),
        ];

        $model->update($id, $data);
        $produk = $model->find($id);
        return $this->responseHasil(200, true, $produk);
    }

    public function hapus($id)
    {
        $model = new MProduk();
        if (!$model->find($id)) {
            return $this->responseHasil(404, false, 'Produk tidak ditemukan');
        }
        $model->delete($id);
        return $this->responseHasil(200, true, true);
    }
}
