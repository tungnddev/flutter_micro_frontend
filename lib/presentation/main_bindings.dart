import 'package:core/core.dart';

class MainBindings extends Bindings {
  @override
  Future dependencies() async {
    await CoreDataBinding().dependencies();
  }
}
