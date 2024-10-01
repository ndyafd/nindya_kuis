import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(BankSampahApp());
}

class BankSampahApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank Sampah App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginPage(),
    );
  }
}
