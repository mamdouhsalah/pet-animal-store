import 'package:animals/feature/home/model/cat_model.dart';
import 'package:dio/dio.dart';

final Dio dio = Dio();
Future<CatModel> getData() async {
  
  var response = await dio.get('https://catfact.ninja/fact');
  var data = response.data; 
  print(data);

  CatModel model = CatModel.fromJson(data);
  print(model.facts);
  return model;
}

