import 'package:animals/feature/home/color/color.dart';
import 'package:animals/feature/home/model/cat_data.dart';
import 'package:animals/feature/home/model/cat_model.dart';
import 'package:animals/feature/home/view/widget/custom_widget.dart';
import 'package:flutter/material.dart';

class ScreenCats extends StatefulWidget {
  const ScreenCats({super.key});

  @override
  State<ScreenCats> createState() => _ScreenCatsState();
}

class _ScreenCatsState extends State<ScreenCats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: FutureBuilder<CatModel>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.green),
            );
          }

          if (snapshot.hasError) {
            return Center(child: Card(child: Text(snapshot.error.toString())));
          }

          if (snapshot.hasData) {
            return CustomWidgetcat(cat: snapshot.data!);
          }

          return const Center(child: Text("No Data Found"));
        },
      ),
    );
  }
}
