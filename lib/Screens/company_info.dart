import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_and_home_page/constants/styles.dart';

class CompanyInfo extends StatelessWidget {
  const CompanyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Company info',
          style: TextStyle(color: white),
        ),
        backgroundColor: HexColor('2196f3'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: const [
                Text(
                  'Company: Geeksynergy Technologies Pvt Ltd',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Address: Sanjayanagar, Bengaluru-56',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Phone: XXXXXXXXX09',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'email: XXXXXX@gmail.com',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
