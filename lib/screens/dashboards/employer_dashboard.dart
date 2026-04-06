import 'package:flutter/material.dart';
import 'package:work_hive/screens/dashboards/employer/employer_messages_page.dart';
import 'package:work_hive/screens/dashboards/employer/manage_jobs_page.dart';
import 'package:work_hive/screens/dashboards/employer/search_workers_page.dart';
import 'package:work_hive/screens/dashboards/employer/employer_messages_page.dart';
import 'package:work_hive/screens/dashboards/employer/employer_profile_page.dart';
import 'package:work_hive/screens/dashboards/employer/workforce_page.dart';

import 'employer/post_job_page.dart';

class EmployerDashboard extends StatefulWidget {
  const EmployerDashboard({super.key});

  @override
  State<EmployerDashboard> createState() => _EmployerDashboardState();
}

class _EmployerDashboardState extends State<EmployerDashboard> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const PostJobPage(),
    const ManageJobsPage(),
    const SearchWorkersPage(),
    const EmployerMessagesPage(),
    const WorkforcePage(),
    const EmployerProfilePage(),
  ];

  final List<String> _titles = [
    "Post Job",
    "Manage Jobs",
    "Search Workers",
    "Messages",
    "Workforce",
    "Profile",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: "Post"),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: "Manage"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Messages"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Workforce"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
