class CatModel {
  final String facts;
  String petName = "Milo";

  CatModel({required this.facts});

  factory CatModel.fromJson(Map<String, dynamic> json) {
    return CatModel(facts: json['fact']);
  }
}
