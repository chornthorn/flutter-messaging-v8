import '../controller/notification.controller.dart';
import 'package:get/get.dart';

class NotificationBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<NotificationController>(NotificationController());
  }
}