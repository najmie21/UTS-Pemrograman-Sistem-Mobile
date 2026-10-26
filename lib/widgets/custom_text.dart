import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Alasan desain: Memilih font Poppins karena bentuk fontnya bagus, cocok buat aplikasi simpel kayak kantin dan dan enak dibaca di layar HP.
// Parameter gaya diberikan nilai default agar widget fleksibel digunakan di berbagai halaman.
// Parameter warna dan ukuran disiapkan agar widget ini bisa menyesuaikan tempatnya,
// misalnya teks warna abu-abu untuk subjudul harga dan hitam tebal untuk nama menu.

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const CustomText(
    this.text, {
    super.key,
    this.fontSize = 14.0,                   
    this.fontWeight = FontWeight.normal,    
    this.color = Colors.black,            
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}