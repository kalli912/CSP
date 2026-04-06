import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade700,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(24),
          margin: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.deepPurple.shade100,
                child: Icon(Icons.lock, color: Colors.deepPurple, size: 30),
              ),
              SizedBox(height: 16),
              Text("Verify OTP",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple)),
              SizedBox(height: 20),
              TextField(
                controller: _otpController,
                decoration: InputDecoration(
                  hintText: "Enter OTP",
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/roleSelection");
                },
                child: Text("Verify",style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
