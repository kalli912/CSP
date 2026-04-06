import 'package:flutter/material.dart';

// Import your tab screens here
import 'package:work_hive/screens/dashboards/employee/applications_page.dart';
import 'package:work_hive/screens/dashboards/employee/jobs_page.dart';
import 'package:work_hive/screens/dashboards/employee/messages_page.dart';
import 'package:work_hive/screens/dashboards/employee/eprofile_page.dart';
import 'package:work_hive/screens/dashboards/employee/saved_jobs_page.dart';





class EmployeeDashboard extends StatefulWidget {
  @override
  _EmployeeDashboardState createState() => _EmployeeDashboardState();
}

class _EmployeeDashboardState extends State<EmployeeDashboard> {
  int _currentIndex = 0;

  // List of all pages
  final List<Widget> _pages = [
    JobsPage(),
    SavedJobsPage(),
    ApplicationsPage(),
    MessagesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Show selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: "Jobs",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Saved",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "Applications",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
