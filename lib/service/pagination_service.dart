import 'package:dio/dio.dart';
import 'package:pagination/core/constants/base_url.dart';
import 'package:pagination/core/model/photos_model.dart';

class PhotosService {
  static Future<List<PhotosModel>> getDate(int start, int end) async {
    Response response = await Dio().get(BaseUrl.baseUrl(start, end));
    try {
      return (response.data as List)
          .map((e) => PhotosModel.fromJson(e))
          .toList();
    } catch (e) {
      throw Exception('Error Has Date : $e');
    }
  }
}
