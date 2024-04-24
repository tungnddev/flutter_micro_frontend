import 'package:core/src/environment.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class RemoveServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BaseOptions(baseUrl: CoreEnvironment.instance.baseUrl));
    Get.put(Dio(Get.find<BaseOptions>()));
    if (kDebugMode) {
      Get.find<Dio>().interceptors.add(LogInterceptor(requestBody: true));
    }
  }
}
