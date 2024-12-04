import 'package:flutter/material.dart';

class Seller extends StatefulWidget {
  const Seller({super.key});

  @override
  State<Seller> createState() => _SellerDashState();
}

class _SellerDashState extends State<Seller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                _buildHeader(),
              
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: const Color(0xff1C1C2E),
      height: 150,
      child: const Padding(
        padding: EdgeInsets.only(top: 22.0, left: 22.0, right: 22.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              foregroundImage: AssetImage('images/bhatti-cup.png'),
              maxRadius: 20,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello Minal!!',
                  style: TextStyle(
                    fontFamily: 'Lovelo',
                    fontSize: 12,
                    color: Color(0xffF5F5DC),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Welcome to Bhattimandu!!',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: Color(0xffF5F5DC),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
