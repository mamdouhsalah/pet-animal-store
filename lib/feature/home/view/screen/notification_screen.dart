import 'package:flutter/material.dart';

class ScreenNotification extends StatelessWidget {
  const ScreenNotification({super.key});

  @override
  Widget build(BuildContext context) {
    final List<dynamic> notifications = [
      {
        "title": "New Cat Fact!",
        "body": "Did you know cats sleep 70% of their lives?",
      },
      {"title": "Dog Update 🐶", "body": "Luna has been adopted! "},
      {
        "title": "App Update",
        "body": "New features have been added to the Pet Store app.",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.notifications, color: Colors.orange),
              title: Text(
                item["title"]!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(item["body"]!),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
