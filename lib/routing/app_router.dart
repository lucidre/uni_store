import 'package:uni_store/common_libs.dart';
import 'package:uni_store/presentations/add_success/add_success_screen.dart';
import 'package:uni_store/presentations/detail_screen/details_screen.dart';
import 'package:uni_store/presentations/main_screen/main_screen.dart';
import 'package:uni_store/presentations/splash/splash_screen.dart';

Widget fadePageBuilder<T>(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return FadeTransition(
    opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
    child: child,
  );
}

@CustomAutoRouter(
  transitionsBuilder: fadePageBuilder,
  replaceInRouteName: 'Screen,Route',
  durationInMilliseconds: 600,
  reverseDurationInMilliseconds: 300,
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashScreen,
      initial: true,
    ),
    AutoRoute(
      page: MainScreen,
    ),
    AutoRoute(
      page: DetailsScreen,
    ),
    AutoRoute(
      page: AddSuccessScreen,
    ),
  ],
)
class $AppRouter {}
