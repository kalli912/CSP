import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Messages")),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text("New plumber job matches your profile"),
            subtitle: const Text("5 min ago"),
          ),
          ListTile(
            leading: const Icon(Icons.remove_red_eye),
            title: const Text("Your application was viewed by employer"),
            subtitle: const Text("1 hour ago"),
          ),
          ListTile(
            leading: const Icon(Icons.schedule),
            title: const Text("Interview scheduled for tomorrow 10 AM"),
            subtitle: const Text("2 hours ago"),
          ),
          const Divider(),
          const Center(
            child: Text(
              "No messages yet\nMessages from employers will appear here",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
