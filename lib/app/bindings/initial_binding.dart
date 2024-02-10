import 'package:get/get.dart';

import 'controller_bindings.dart';
import 'repository_bindings.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    RepositoryBindings().dependencies();
    ControllerBindings().dependencies();
  }
}
