import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class DetailOrderPage extends StatefulWidget {
  @override
  _DetailOrderPageState createState() => _DetailOrderPageState();
}

class _DetailOrderPageState extends State<DetailOrderPage> {
  String _paragraphText = '';

  Future<void> loadParagraphText() async {
    final String loadedText = await rootBundle.loadString('assets/Paragraf.txt');
    setState(() {
      _paragraphText = loadedText;
    });
  }

  @override
  void initState() {
    super.initState();
    loadParagraphText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
      
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
                child: Image.asset(
                  'assets/images/header.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 200,  
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Apa itu Bank Sampah Keliling?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
    
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  _paragraphText,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
          // Tombol kembali di pojok kiri atas
          Positioned(
            top: 40, 
            left: 16,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Navigasi kembali
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, 
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.arrow_back, // Icon tombol kembali
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}