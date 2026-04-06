import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();

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
                child: Icon(Icons.work, color: Colors.deepPurple, size: 30),
              ),
              SizedBox(height: 16),
              Text("WorkExchange",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple)),
              SizedBox(height: 4),
              Text("Connect. Work. Grow Together.",
                  style: TextStyle(color: Colors.grey)),
              SizedBox(height: 20),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  hintText: "Enter your mobile number",
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                keyboardType: TextInputType.phone,
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
                  Navigator.pushNamed(context, "/otp");
                },
                child: Text("Send OTP",),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
