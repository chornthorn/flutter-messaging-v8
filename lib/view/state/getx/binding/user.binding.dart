import '../../../../data/datasource/firebase/users/user.firebase.datasource.dart';
import '../../../../data/service/users/user.firebase.service.dart';
import '../../../../domain/repository/users/user.firebase.repository.dart';
import '../../../../domain/usecase/users/firebase/create_user_usecase.dart';
import '../../../../domain/usecase/users/firebase/save_token_usecase.dart';
import '../../../../domain/usecase/users/firebase/update_user_usecase.dart';
import '../controller/user.controller.dart';
import 'package:get/get.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserFirebaseDatasource>(UserFirebaseDatasource());
    Get.put<UserFirebaseService>(UserFirebaseService(datasource: Get.find()));
    Get.put<UserFirebaseRepository>(
        UserFirebaseService(datasource: Get.find()));
    Get.put<CreateUserFirebaseUseCase>(
        CreateUserFirebaseUseCase(repository: Get.find()));
    Get.put<UpdateUserFirebaseUseCase>(
        UpdateUserFirebaseUseCase(repository: Get.find()));
    Get.put<SaveTokenUseCase>(SaveTokenUseCase(repository: Get.find()));
    Get.put<UserController>(UserController(
      createUserFirebaseUseCase: Get.find(),
      updateUserFirebaseUseCase: Get.find(),
      saveTokenUseCase: Get.find(),
    ));
  }
}
