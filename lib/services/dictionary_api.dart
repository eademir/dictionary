import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class DictionaryApi extends GetConnect {
  final String _id = dotenv.get('ID');
  final String _url = dotenv.get('URL');
  final String _key = dotenv.get('KEY');

  Future<Map<String, dynamic>> getWord({
    required String endpoint,
    required String languageCode,
    required String wordID,
  }) async {
    final response = await get(
      '$_url/$endpoint/$languageCode/$wordID',
      headers: {
        "app_id": _id,
        "app_key": _key,
      },
    );
    if (response.status.hasError) {
      return Future.error(response.status);
    } else {
      return response.body;
    }
  }
}
