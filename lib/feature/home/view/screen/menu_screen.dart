import 'package:animals/feature/home/view/screen/cat_screen.dart';
import 'package:animals/feature/home/view/screen/dog_screen.dart';
import 'package:animals/feature/home/view/widget/custom_widget.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<Map<String, dynamic>> menuItems = [
    {
      'title': 'Dogs',
      'image': 'assets/images/dog.jpg',
      'icon': Icons.pets,
      'color': Color.fromARGB(255, 192, 167, 251),
    },
    {
      'title': 'Cats',
      'image': 'assets/images/cat.webp',
      'icon': Icons.pets,
      'color': Color.fromARGB(255, 143, 238, 184),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 115, 235, 221),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Your Dog',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  IconButton(
                    icon: const Icon(
                      Icons.more_horiz_rounded,
                      color: Colors.black,
                      size: 28,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.navigate_next_outlined,
                      color: Colors.black,
                      size: 28,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ScreenDogs()),
                      );
                    },
                  ),
                ],
              ),
            ),

            InkWell(
              child: CustomCard(
                color: menuItems[0]['color'],
                image: menuItems[0]['image'],
                icon: menuItems[0]['icon'],
                title: menuItems[0]['title'],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScreenDogs()),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Info about cats',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  IconButton(
                    icon: const Icon(
                      Icons.more_horiz_rounded,
                      color: Colors.black,
                      size: 28,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.navigate_next_outlined,
                      color: Colors.black,
                      size: 28,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ScreenCats()),
                      );
                    },
                  ),
                ],
              ),
            ),

            InkWell(
              child: CustomCard(
                color: menuItems[1]['color'],
                image: menuItems[1]['image'],
                icon: menuItems[1]['icon'],
                title: menuItems[1]['title'],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScreenCats()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
