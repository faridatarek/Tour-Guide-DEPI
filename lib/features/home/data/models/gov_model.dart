class GovModel {
  final String name;
  final String image;

  GovModel({required this.name, required this.image});

  factory GovModel.fromJson(Map<String, dynamic> json) {
    var imageList = List<String>.from(json['images'] ?? []);
    return GovModel(
      name: json['gov'] ?? '',
      image: imageList.isNotEmpty ? imageList[0] : '',
    );
  }
}