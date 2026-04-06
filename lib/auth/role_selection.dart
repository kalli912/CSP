import 'package:flutter/material.dart';

class RoleSelectionPage extends StatefulWidget {
  @override
  _RoleSelectionPageState createState() => _RoleSelectionPageState();
}

class _RoleSelectionPageState extends State<RoleSelectionPage> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade700,
      body: Center(
        child: SingleChildScrollView(
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
                  child: Icon(Icons.person, color: Colors.deepPurple, size: 30),
                ),
                SizedBox(height: 16),
                Text("Complete Your Profile",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple)),
                SizedBox(height: 8),
                Text("Help us personalize your WorkExchange experience",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey)),
                SizedBox(height: 20),

                // Full Name
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: "Enter your full name",
                    prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(height: 16),

                // Address
                TextField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    hintText: "Enter your complete address",
                    prefixIcon: Icon(Icons.location_on_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(height: 16),

                // Role Selection
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Select Your Role *",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                SizedBox(height: 10),

                GestureDetector(
                  onTap: () {
                    setState(() => selectedRole = "Job Seeker");
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: selectedRole == "Job Seeker"
                          ? Colors.deepPurple.shade100
                          : Colors.grey.shade100,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.person, color: Colors.deepPurple),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Job Seeker",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            Text("Looking for jobs & freelance projects",
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    setState(() => selectedRole = "Employer");
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: selectedRole == "Employer"
                          ? Colors.deepPurple.shade100
                          : Colors.grey.shade100,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.business_center, color: Colors.deepPurple),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Employer",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            Text("Looking to hire & build your team",
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/home");
                  },
                  child: Text("Complete Registration"),
                ),

                SizedBox(height: 10),
                Text(
                  "By continuing, you agree to our Terms of Service and Privacy Policy",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
