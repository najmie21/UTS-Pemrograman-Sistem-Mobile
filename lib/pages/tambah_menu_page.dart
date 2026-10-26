import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/menu_model.dart';
import '../widgets/custom_text.dart';

class TambahMenuPage extends StatefulWidget {
  const TambahMenuPage({super.key});

  @override
  State<TambahMenuPage> createState() => _TambahMenuPageState();
}

class _TambahMenuPageState extends State<TambahMenuPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _hargaController = TextEditingController();

  void _simpanData() {
    if (_formKey.currentState!.validate()) {
      final menuBaru = MenuItem(
        nama: _namaController.text.trim(),
        harga: int.parse(_hargaController.text.trim()),
      );
      // Mengirimkan hasil kembali ke halaman daftar
      Get.back(result: menuBaru);
    }
  }

  @override
  void dispose() {
    _namaController.dispose();
    _hargaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const CustomText(
          'Tambah Menu',
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Color.fromARGB(255, 100, 183, 251),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Menu',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama menu tidak boleh kosong';
                  }
                  return null;
                },
              ),

              
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _hargaController,
                decoration: const InputDecoration(
                  labelText: 'Harga Menu',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Harga tidak boleh kosong';
                  }
                  if (int.tryParse(value.trim()) == null) {
                    return 'Harga harus berupa angka';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: _simpanData,
                style: ElevatedButton.styleFrom(
                  backgroundColor:Color.fromARGB(255, 100, 183, 251),
                  minimumSize: const Size.fromHeight(48),
                ),
                child: const CustomText(
                  'Simpan',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}