import 'package:flutter/material.dart';

class JobsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Available Jobs")),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text("Bathroom Plumbing Repair"),
              subtitle: Text("₹800 • Urgent • Patamata"),
              trailing: ElevatedButton(
                onPressed: () {},
                child: Text("Apply Now"),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Daily House Cleaning"),
              subtitle: Text("₹500/day • Labipet"),
              trailing: ElevatedButton(
                onPressed: () {},
                child: Text("Apply Now"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
