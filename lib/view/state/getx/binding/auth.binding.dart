import '../../../../data/datasource/firebase/auth/auth.firebase.datasource.dart';
import '../../../../data/service/auth/auth.firebase.service.dart';
import '../../../../domain/repository/auth/auth.firebase.repository.dart';
import '../../../../domain/usecase/auth/reset_password_usecase.dart';
import '../../../../domain/usecase/auth/sign_in_usecase.dart';
import '../../../../domain/usecase/auth/sign_out_usecase.dart';
import '../../../../domain/usecase/auth/sign_up_usecase.dart';
import '../controller/auth.controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthFirebaseDatasource>(AuthFirebaseDatasource());
    Get.put<AuthFirebaseDatasource>(AuthFirebaseDatasource());
    Get.put<AuthFirebaseService>(AuthFirebaseService(datasource: Get.find()));
    Get.put<AuthFirebaseRepository>(
        AuthFirebaseService(datasource: Get.find()));
    Get.put<SignUpUseCase>(SignUpUseCase(repository: Get.find()));
    Get.put<SignInUseCase>(SignInUseCase(repository: Get.find()));
    Get.put<ResetPasswordUseCase>(ResetPasswordUseCase(repository: Get.find()));
    Get.put<SignOutUseCase>(SignOutUseCase(repository: Get.find()));
    Get.put<AuthController>(AuthController(
      signUpUseCase: Get.find(),
      signInUseCase: Get.find(),
      resetPasswordUseCase: Get.find(),
      signOutUseCase: Get.find(),
    ));
  }
}
