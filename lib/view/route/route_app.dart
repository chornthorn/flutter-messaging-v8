import 'package:flutter/material.dart';
import '../page/auth/login/login.dart';
import '../page/auth/login/sign_up_page.dart';
import '../state/getx/binding/auth.binding.dart';
import '../state/getx/binding/user.binding.dart';
import 'package:get/get.dart';

import '../page/homes/home_page.dart';
import '../page/splash/splash_page.dart';
import '../state/getx/binding/message.binding.dart';

//MaterialPageRoute _pageRoute({Widget builder, RouteSettings settings}) =>
//    MaterialPageRoute(builder: (_) => builder, settings: settings);

Route generateRoute(RouteSettings settings) {
  final args = settings.arguments;
  switch (settings.name) {
    case '/':
      return GetPageRoute(
        routeName: '/',
        page: () => SplashPage(),
        binding: UserBinding(),
      );
    case '/login':
      return GetPageRoute(
        routeName: '/login',
        page: () => LoginPage(),
        binding: AuthBinding(),
      );
    case '/sign_up':
      return GetPageRoute(
        routeName: '/sign_up',
        page: () => SignUpPage(),
        binding: AuthBinding(),
      );
    case '/home':
      return GetPageRoute(
        routeName: '/home',
        page: () => HomePage(),
        binding: MessageBinding(),
      );
  }
  return generateRoute(settings);
}
