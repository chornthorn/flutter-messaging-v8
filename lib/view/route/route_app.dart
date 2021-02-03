import 'package:flutter/material.dart';
import '../page/homes/home_page.dart';
import '../state/getx/binding/message.binding.dart';
import 'package:get/get.dart';

//MaterialPageRoute _pageRoute({Widget builder, RouteSettings settings}) =>
//    MaterialPageRoute(builder: (_) => builder, settings: settings);

Route generateRoute(RouteSettings settings) {
  final args = settings.arguments;
  switch (settings.name) {
    case '/':
      return GetPageRoute(
        routeName: '/',
        page: () => HomePage(),
        binding: MessageBinding(),
      );
  }
  return generateRoute(settings);
}
