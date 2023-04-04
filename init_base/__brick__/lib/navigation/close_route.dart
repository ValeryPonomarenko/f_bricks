import 'package:{{{app_package}}}/navigation/app_navigator.dart';

mixin CloseRoute {
  AppNavigator get appNavigator;

  void close() => appNavigator.close();
}
