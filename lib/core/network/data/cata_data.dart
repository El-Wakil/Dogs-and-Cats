class CatImageService {
  // No Dio needed here if we just construct the URL
  final String _catApiUrl = 'https://cataas.com/cat';

  Future<String> getRandomCatImageUrl() async {
    final uniqueUrl =
        '$_catApiUrl?timestamp=${DateTime.now().millisecondsSinceEpoch}';
    print("CatImageService: Providing unique cat image URL: $uniqueUrl");
    return uniqueUrl;
  }
}
