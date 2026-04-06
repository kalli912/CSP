import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF3F51B5), Color(0xFF9C27B0)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Hi, Rajesh Kumar!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text("Available",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Profile Card
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 6,
                      spreadRadius: 2)
                ],
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.blueGrey,
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Rajesh Kumar",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        const Text("Benz Circle, Vijayawada",
                            style: TextStyle(color: Colors.grey)),
                        const SizedBox(height: 4),
                        Row(
                          children: const [
                            Icon(Icons.star, color: Colors.amber, size: 18),
                            SizedBox(width: 4),
                            Text("4.5 (47 jobs)",
                                style: TextStyle(color: Colors.black54)),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Personal Details
            sectionTitle("Personal Details"),
            detailRow("Age", "28 years"),
            detailRow("Phone", "+91 9876543210"),
            detailRow("Email", "rajesh.kumar@email.com"),
            detailRow("Experience", "5 years"),

            // Skills
            sectionTitle("Skills"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Wrap(
                spacing: 8,
                children: const [
                  Chip(label: Text("Plumbing")),
                  Chip(label: Text("Electrical Work")),
                  Chip(label: Text("Home Repair")),
                ],
              ),
            ),

            // Documents
            sectionTitle("Documents"),
            documentRow("ID Proof"),
            documentRow("Certificates"),

            // Availability
            sectionTitle("Availability"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Row(
                children: const [
                  Text("Status:",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  SizedBox(width: 8),
                  Icon(Icons.circle, color: Colors.green, size: 12),
                  SizedBox(width: 4),
                  Text("Available",
                      style: TextStyle(color: Colors.green, fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // 🔹 Section Title Widget
  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }

  // 🔹 Detail Row Widget
  Widget detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54)),
          Text(value,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87)),
        ],
      ),
    );
  }

  // 🔹 Document Row Widget
  Widget documentRow(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(fontSize: 16, color: Colors.black87)),
          const Icon(Icons.download, color: Colors.blue),
        ],
      ),
    );
  }
}
