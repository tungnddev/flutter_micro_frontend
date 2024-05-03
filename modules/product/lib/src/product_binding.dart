import 'package:core/core.dart';

import 'data/bindings/bindings.dart';

class ProductBinding extends Bindings {
  @override
  Future dependencies() async {
    RemoteServiceBinding().dependencies();
  }
}
