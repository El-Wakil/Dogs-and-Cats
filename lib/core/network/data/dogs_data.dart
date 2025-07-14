import 'package:dio/dio.dart';

import '../../../view/model_view/data_models/dogs_model.dart';

final Dio dio = Dio();

class DogImageService {
  final Dio _dio;

  DogImageService(this._dio);

  Future<DogImageModel> getRandomDogImage() async {
    print("DogImageService: Fetching random dog image...");
    try {
      final response = await _dio.get(
        'https://dog.ceo/api/breeds/image/random',
      );

      if (response.statusCode == 200 && response.data != null) {
        return DogImageModel.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception(
          'Failed to load dog image: Status ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      print("DogImageService: DioError - ${e.message}");
      throw Exception('Network error fetching dog image: ${e.message}');
    } catch (e) {
      print("DogImageService: Unknown error - $e");
      throw Exception('An unknown error occurred: $e');
    }
  }
}
