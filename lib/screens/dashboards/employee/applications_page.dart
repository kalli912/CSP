import 'package:flutter/material.dart';

class ApplicationsPage extends StatelessWidget {
  const ApplicationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Applications")),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Card(
            child: ListTile(
              title: const Text("Kitchen Repair"),
              subtitle: const Text("15 Oct 2024 • by Lakshmi Devi"),
              trailing: const Text("₹600 • Completed",
                  style: TextStyle(color: Colors.green)),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text("Garden Maintenance"),
              subtitle: const Text("18 Oct 2024 • by Ravi Kumar"),
              trailing: const Text("₹400 • Hired",
                  style: TextStyle(color: Colors.blue)),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text("House Cleaning"),
              subtitle: const Text("20 Oct 2024 • by Meera Singh"),
              trailing: const Text("₹300 • Rejected",
                  style: TextStyle(color: Colors.red)),
            ),
          ),
        ],
      ),
    );
  }
}
