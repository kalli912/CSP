import 'package:flutter/material.dart';
import 'profile_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  bool otpSent = false;

  // Static dummy values
  final String staticMobile = "9876543210";
  final String staticOtp = "1234";

  void sendOtp() {
    if (mobileController.text == staticMobile) {
      setState(() {
        otpSent = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("OTP Sent: $staticOtp")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid Mobile Number")),
      );
    }
  }

  void verifyOtp() {
    if (otpController.text == staticOtp) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid OTP ❌")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3A0CA3),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.deepPurple,
                child: Icon(Icons.work, color: Colors.white, size: 40),
              ),
              SizedBox(height: 20),
              Text(
                "WorkExchange",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Connect. Work. Grow Together.",
                style: TextStyle(color: Colors.black54),
              ),
              SizedBox(height: 20),
              TextField(
                controller: mobileController,
                decoration: InputDecoration(
                  labelText: "Mobile Number",
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 15),
              otpSent
                  ? TextField(
                controller: otpController,
                decoration: InputDecoration(
                  labelText: "Enter OTP",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
              )
                  : Container(),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: otpSent ? verifyOtp : sendOtp,
                child: Text(
                  otpSent ? "Verify OTP" : "Send OTP",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
