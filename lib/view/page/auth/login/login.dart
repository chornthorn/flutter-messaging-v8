import 'package:flutter/material.dart';
import '../../../state/getx/controller/auth.controller.dart';
import '../../../widget/text_field/custom_text_field.widget.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(38),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 70),
                Text(
                  'ลงชื่อเข้าใช้งาน',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
                SizedBox(height: 50),
                TFCustom(
                  label: 'ชื่อผู้ใช้งาน',
                  hintText: 'กรอกชื่อผู้ใช้งานของคุณ',
                  controller: controller.emailController,
                ),
                SizedBox(height: 25),
                TFCustom(
                  label: 'รหัสผ่าน',
                  hintText: 'กรอกรหัสผ่าน 8 ตัว',
                  controller: controller.passwordController,
                ),
                SizedBox(height: 45),
                GetX<AuthController>(
                  builder: (controller) {
                    return controller.isLoading
                        ? Center(child: CircularProgressIndicator())
                        : Container(
                            height: 50,
                            width: double.infinity,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35)),
                              color: Theme.of(context).primaryColor,
                              child: Text(
                                'เข้าสู่ระบบ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              onPressed: () =>
                                  controller.registerWithEmailAndPassword(),
                            ),
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
