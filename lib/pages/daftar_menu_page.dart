import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/menu_model.dart';
import '../widgets/custom_text.dart';
import 'detail_menu_page.dart';
import 'tambah_menu_page.dart';

class DaftarMenuPage extends StatefulWidget {
  const DaftarMenuPage({super.key});

  @override
  State<DaftarMenuPage> createState() => _DaftarMenuPageState();
}

class _DaftarMenuPageState extends State<DaftarMenuPage> {
 
  final List<MenuItem> _daftarMenu = [
    MenuItem(nama: 'Nasi Goreng Seafood', harga: 15000),
    MenuItem(nama: 'Ayam Geprek Sambal Bawang', harga: 13000),
    MenuItem(nama: 'Mie Tek-Tek Telur', harga: 12000),
    MenuItem(nama: 'Soto Ayam', harga: 14000),
    MenuItem(nama: 'Es Teh Manis Jumbo', harga: 4000),
    MenuItem(nama: 'Milk Tea Gula Aren', harga: 10000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          'MyKantin',
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Color.fromARGB(255, 100, 183, 251),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: const CustomText(
              'Menu Makanan & Minuman',
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 100, 183, 251),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _daftarMenu.length,
              itemBuilder: (context, index) {
                final menu = _daftarMenu[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                  child: ListTile(
                    leading: const Icon(Icons.restaurant, color: Color.fromARGB(255, 100, 183, 251)),
                    title: CustomText(menu.nama, fontWeight: FontWeight.bold),
                    subtitle: CustomText('Rp. ${menu.harga}', color: Colors.grey),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      // Buka halaman detail menggunakan Get.to()
                      Get.to(() => DetailMenuPage(menu: menu));
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 100, 183, 251),
        onPressed: () async {
          // Buka halaman tambah menu dan tunggu kembalian data
          final hasil = await Get.to(() => const TambahMenuPage());
          if (hasil != null && hasil is MenuItem) {
            setState(() {
              _daftarMenu.add(hasil);
            });
          }
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}