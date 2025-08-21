class DogModel {
  final String image;
  String petName = "Luna";

  DogModel({required this.image});

  factory DogModel.fromJson(Map<String, dynamic> json) {
    return DogModel(image: json['message']);
  }
}
