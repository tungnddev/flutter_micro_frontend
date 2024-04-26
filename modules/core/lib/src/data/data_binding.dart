import 'package:get/get.dart';

import 'bindings/bindings.dart';

class CoreDataBinding extends Bindings {
  @override
  Future dependencies() async {
    RemoveServiceBinding().dependencies();
  }
}
