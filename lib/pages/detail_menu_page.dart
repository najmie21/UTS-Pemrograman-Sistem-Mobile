import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_text.dart';
import '../models/menu_model.dart';

class DetailMenuPage extends StatelessWidget {
  final MenuItem menu;

  const DetailMenuPage({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          'Detail Menu', 
          color: Colors.white, 
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: const Color.fromARGB(255, 100, 183, 251),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back, 
            color: Colors.white
          ),
            onPressed: () => Get.back(),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.restaurant, 
              size: 80, 
              color: Color.fromARGB(255, 100, 183, 251)
            ),

            const SizedBox(height: 16),
            CustomText(
              menu.nama,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),

            const SizedBox(height: 8),
            CustomText(
             'Harga: Rp. ${menu.harga}',
              fontSize: 18,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}