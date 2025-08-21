import 'package:animals/feature/home/model/dog_model.dart';
import 'package:dio/dio.dart';

final Dio dio = Dio();
Future<DogModel> GetData() async {
  var response = await dio.get('https://dog.ceo/api/breeds/image/random');
  var data = response.data;
  print(data);

  DogModel model1 = DogModel.fromJson(data);
  print(model1.image);
  return model1;
}
