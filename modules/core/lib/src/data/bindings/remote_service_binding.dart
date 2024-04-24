import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class RemoveServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BaseOptions(
        baseUrl:
            "https://bbdd19e4-7ba1-4d22-8960-d3f6cf8b2e29.mock.pstmn.io/api/"));
    Get.put(Dio(Get.find<BaseOptions>()));
    if (kDebugMode) {
      Get.find<Dio>().interceptors.add(LogInterceptor(requestBody: true));
    }
  }
}
