import 'package:animals/feature/home/model/dog_data.dart';
import 'package:animals/feature/home/model/dog_model.dart';
import 'package:animals/feature/home/view/widget/custom_widget.dart';
import 'package:flutter/material.dart';

class ScreenDogs extends StatefulWidget {
  const ScreenDogs({super.key});

  @override
  State<ScreenDogs> createState() => _ScreenDogsState();
}

class _ScreenDogsState extends State<ScreenDogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 192, 252, 186),
      body: FutureBuilder<DogModel>(
        future: GetData(),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.green),
            );
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (snapshot.hasData) {
            return CustomWidgetDog(dog: snapshot.data!);
          }

          return const Center(child: Text("No Data Found"));
        },
      ),
    );
  }
}
