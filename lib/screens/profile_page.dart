import 'package:flutter/material.dart';
import 'package:work_hive/screens/dashboards/employee_dashboard.dart';
import 'package:work_hive/screens/dashboards/employer_dashboard.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  String? selectedRole;

  void completeRegistration() {
    if (nameController.text.isEmpty ||
        addressController.text.isEmpty ||
        selectedRole == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all details")),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Registration Completed 🎉")),
    );

    // ✅ Navigate to different dashboards based on role
    if (selectedRole == "Job Seeker") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => EmployeeDashboard()),
      );
    } else if (selectedRole == "Employer") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => EmployerDashboard()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3A0CA3),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.deepPurple,
                  child: Icon(Icons.person, color: Colors.white, size: 40),
                ),
                SizedBox(height: 20),
                Text(
                  "Complete Your Profile",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Help us personalize your WorkExchange experience",
                  style: TextStyle(color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: "Complete Address",
                    prefixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  maxLines: 2,
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Select Your Role *",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () => setState(() => selectedRole = "Job Seeker"),
                  child: roleCard(
                    icon: Icons.person,
                    title: "Job Seeker",
                    subtitle: "Looking for jobs, freelance projects",
                    selected: selectedRole == "Job Seeker",
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => selectedRole = "Employer"),
                  child: roleCard(
                    icon: Icons.work,
                    title: "Employer",
                    subtitle: "Looking to hire & build your team",
                    selected: selectedRole == "Employer",
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: completeRegistration,
                  child: Text(
                    "Complete Registration →",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ✅ Helper widget for role selection cards
  Widget roleCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool selected,
  }) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: selected ? Colors.deepPurple : Colors.grey,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: selected ? Colors.deepPurple : Colors.grey),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
              Text(subtitle, style: TextStyle(color: Colors.black54)),
            ],
          ),
        ],
      ),
    );
  }
}
