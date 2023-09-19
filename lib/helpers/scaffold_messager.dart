import 'package:uni_store/common_libs.dart';
import 'package:uni_store/main.dart';

AppScaffoldMessenger $scaffold = AppScaffoldMessenger();

class AppScaffoldMessenger {
  showSnackBar(String text) {
    MyApp.scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
          content: Text(
        text,
      )),
    );
  }
}
