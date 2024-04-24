import 'package:get/get.dart';

import 'base_handle_controller.dart';
import 'base_view_status.dart';

class BaseController extends GetxController with BaseHandleController   {
  Rx<BaseViewStatus> viewStatus = BaseViewStatus.loading.obs;
}


