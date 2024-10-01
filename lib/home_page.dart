import 'package:flutter/material.dart';
import 'dummy_data.dart'; // Import data dummy
import 'detail_order_page.dart'; // Import halaman detail order
import 'package:flutter/gestures.dart';

class HomePage extends StatelessWidget {
  final String username; // Parameter username dari LoginPage

  HomePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'), // Background image
              fit: BoxFit.cover,
            ),
          ),
        ),
        toolbarHeight: 150,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat pagi, $username', // Menggunakan username dari login
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Yuk, buat perubahan positif bagi lingkungan ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: 'sekarang.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Card Apa Itu Bank Sampah Keliling
            GestureDetector(
              onTap: () {
                // Navigasi ke halaman detail order
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailOrderPage()),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Apa itu bank sampah keliling?',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                      SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Bank sampah akan hadir di dekat rumah Anda. ',
                              style: TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            TextSpan(
                              text: 'Pelajari teknisnya lebih lanjut.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[800], 
                                fontWeight: FontWeight.bold, 
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DetailOrderPage()), // Navigasi ke halaman detail order
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            Text(
              'Jadwal Keliling',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal, 
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20),

            // ListView untuk Jadwal Keliling
            Column(
              children: scheduleList.map((schedule) {
                return _buildScheduleCard(schedule);
              }).toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigasi kembali ke halaman login
          Navigator.pop(context);
        },
        child: Icon(Icons.logout), // Ikon logout
        backgroundColor: Colors.teal, 
      ),
    );
  }

  // Fungsi untuk membuat Card dari jadwal
  Widget _buildScheduleCard(Schedule schedule) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.purple),
                SizedBox(width: 8),
                Text(
                  schedule.coverageArea,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Image.network(
                  schedule.imageUrl,
                  height: 50,
                  width: 50,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      schedule.wasteBankName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Minggu, ${schedule.implementationDate}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Waktu', style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 4),
                    Text('${schedule.startTime} - ${schedule.endTime} WIB'), 
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
