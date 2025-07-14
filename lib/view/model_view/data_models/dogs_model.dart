class DogImageModel {
  final String imageUrl;
  final String status;

  const DogImageModel({required this.imageUrl, required this.status});

  factory DogImageModel.fromJson(Map<String, dynamic> json) {
    return DogImageModel(
      imageUrl: json['message'] as String,
      status: json['status'] as String,
    );
  }
}
