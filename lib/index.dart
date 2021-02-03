import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/themes/themes.dart';
import 'view/route/route_app.dart';
import 'view/state/getx/binding/notification.binding.dart';
import 'view/widget/flavor/flavor_banner.dart';


class AppIndex extends StatelessWidget {
  const AppIndex({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        return FlavorBanner(
          child: Listener(
            onPointerDown: (_) {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                currentFocus.focusedChild.unfocus();
              }
              // Close Keyboard active
            },
            child: GetMaterialApp(
              initialRoute: '/',
              initialBinding: NotificationBinding(),
              onGenerateRoute: generateRoute,
              theme: Themes.lightTheme,
            ),
          ),
        );
      });
    });
  }
}
