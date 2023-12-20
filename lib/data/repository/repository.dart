import 'package:dio/dio.dart';
import 'package:erp/api_service/api_service.dart';
import 'package:erp/data/model/photos_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Repository {

  static Future<List<PhotosModel>> getPhotos(data) async {
    try {
      EasyLoading.show(status: 'loading...');
      var response = await ApiService.getDio()!.get("photos?$data&_limit=20");
      EasyLoading.dismiss();
      if (response.statusCode == 200) {
        final responseData = (response.data as List)
            .map((e) => PhotosModel.fromJson(e))
            .toList();
        return responseData;
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      EasyLoading.dismiss();
    }
    return [];
  }

}