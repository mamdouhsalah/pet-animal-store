import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ScreenDogs extends StatefulWidget {
  const ScreenDogs({super.key});

  @override
  State<ScreenDogs> createState() => _ScreenDogsState();
}

class _ScreenDogsState extends State<ScreenDogs> {
  String? imageUrl;
  bool isLoading = true;
  String petName = "Luna";
  String sex = "Male";
  int age = 3;
  String breed = "Husky";
  String about =
      "Luna is a snow-loving beauty who enjoys long walks and cuddles. She's leash-trained, friendly with kids, and dreams of a family who loves adventures. Her gentle eyes and calm nature make her impossible to resist.";

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() => isLoading = true);

    Dio dio = Dio();
    var response = await dio.get('https://dog.ceo/api/breeds/image/random');
    var data = response.data;

    imageUrl = data['message'];

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 230, 255),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 6,
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.orange,
                              strokeWidth: 4,
                            ),
                          )
                        : AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  imageUrl!,
                                  key: ValueKey(imageUrl),
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                            ),
                          ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.more_horiz_rounded,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.navigate_next_outlined,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () {
                              getData();
                            },
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      top: 20,
                      left: 20,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 20,
                      child: IconButton(
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pet Store: $petName',
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Pacifico',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 6,
                      childAspectRatio: 1.6,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 230, 200, 245),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Gender\n$sex',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 245, 240, 200),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Age\n$age years',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 200, 245, 200),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Breed\n$breed',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),

                    const Text(
                      'About Luna',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      about,
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
