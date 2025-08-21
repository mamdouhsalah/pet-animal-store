import 'package:flutter/material.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 6,
          child: Column(
            children: [
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 60,
                child: Icon(Icons.manage_accounts),
              ),

              const SizedBox(height: 16),
              const Text(
                "Mamdouh Salah",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Software Engineer",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.email, color: Colors.orange),
                title: const Text("Email"),
                subtitle: const Text("mamdouhsalah631@gmail.com"),
                trailing: IconButton(
                  icon: const Icon(Icons.edit, color: Colors.orange),
                  onPressed: () {},
                ),
              ),
              ListTile(
                leading: const Icon(Icons.phone, color: Colors.orange),
                title: const Text("Phone"),
                subtitle: const Text("+20 01017430238"),
              ),
              ListTile(
                leading: const Icon(Icons.location_on, color: Colors.orange),
                title: const Text("Address"),
                subtitle: const Text("Cairo, Egypt"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
