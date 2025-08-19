import 'package:animals/feature/home/view/screen/menu_screen.dart';
import 'package:animals/feature/home/view/screen/notification_screen.dart';
import 'package:animals/feature/home/view/screen/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screen = [MenuScreen(), ScreenNotification(), ScreenProfile()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 238, 215),

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 253, 238, 215),
        toolbarHeight: 60,

        leading: Icon(Icons.location_on, color: Colors.orange),
        title: Text(
          'pet animal store',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Pacifico',
          ),
        ),

        actions: [
          Icon(Icons.search, color: Colors.orange),
          SizedBox(width: 8),

          Icon(Icons.notifications_active, color: Colors.orange),
          SizedBox(width: 8),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 253, 238, 215),

        currentIndex: currentIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,

        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notify",
          ),

          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: screen[currentIndex],
    );
  }
}
