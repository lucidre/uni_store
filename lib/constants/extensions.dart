import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uni_store/common_libs.dart';

extension DeviceStyles on BuildContext {
  TextStyle? bodyLarge({
    final FontWeight? fontWeight,
    double? fontSize,
    double? height,
    Color? color,
    String? fontFamily,
  }) {
    final style = Theme.of(this).textTheme.bodyLarge;
    return style?.copyWith(
      fontWeight: fontWeight ?? style.fontWeight,
      fontSize: fontSize ?? style.fontSize,
      color: color ?? style.color,
      height: height ?? style.height,
      fontFamily: fontFamily ?? style.fontFamily,
    );
  }

  TextStyle? bodyMedium({
    final FontWeight? fontWeight,
    double? fontSize,
    Color? color,
    String? fontFamily,
    double? height,
    FontStyle? fontStyle,
  }) {
    final style = GoogleFonts.poppins(
      fontSize: 11,
      color: kDarkColor,
    );

    return style.copyWith(
      height: 1.5,
      fontStyle: fontStyle ?? style.fontStyle,
      fontWeight: fontWeight ?? style.fontWeight,
      fontSize: fontSize ?? style.fontSize,
      color: (color ?? style.color),
      fontFamily: fontFamily ?? style.fontFamily,
    );
  }
}

extension DeviceTheme on BuildContext {
  Color get textColor => kDarkColor;
  Color get backgroundColor => kDarkColor;

  Divider get divider => Divider(color: textColor.withOpacity(.3));

  ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: kLightColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: kPrimaryColor),
        canvasColor: kLightColor,
        dialogBackgroundColor: kLightColor,
        floatingActionButtonTheme: ThemeData.light()
            .floatingActionButtonTheme
            .copyWith(backgroundColor: kDarkColor),
        cardColor: kLightColor,
        iconTheme:
            ThemeData.light().iconTheme.copyWith(color: kDarkColor, size: 24),
        textTheme: GoogleFonts.dmSerifDisplayTextTheme(
          Theme.of(this).textTheme.copyWith(
                bodyLarge: const TextStyle(
                  fontSize: 25,
                  color: kDarkColor,
                  fontWeight: FontWeight.w600,
                ),
                bodyMedium: const TextStyle(
                  fontSize: 12,
                  color: kDarkColor,
                ),
              ),
        ).apply(
          bodyColor: kDarkColor,
        ),
      );
}

extension DeviceSize on BuildContext {
  MediaQueryData get _mediaQuery => MediaQuery.of(this);
  Size get _size => _mediaQuery.size;

  double get topPadding => _mediaQuery.padding.top;
  double get screenHeight => _size.height;
  double get screenWidth => _size.width;
}

extension DeviceBottomBar on BuildContext {
  Future<T?> showBottomBar<T>({required Widget child, double? height}) {
    final result = showModalBottomSheet<T>(
      context: this,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Material(
        color: Colors.transparent,
        child: Container(
          child: child.fadeInAndMoveFromBottom(),
        ),
      ),
    );
    return result;
  }

  Future<T?> showAlertDialog<T>(
      {required String title,
      String? desctiption,
      List<Widget> actions = const []}) {
    return showDialog<T>(
        context: this,
        builder: (ctx) {
          return AlertDialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(cornersMedium),
                ),
              ),
              title: Text(
                title,
                style: bodyLarge(),
              ).fadeIn(),
              titlePadding: const EdgeInsets.only(
                  top: kDefaultPadding / 2,
                  left: kDefaultPadding / 2,
                  right: kDefaultPadding / 2),
              contentPadding: const EdgeInsets.all(kDefaultPadding / 2),
              content: Text(
                desctiption ?? '',
                style: bodyMedium(),
              ).fadeIn(),
              actions: actions,
              actionsPadding: const EdgeInsets.only(
                  bottom: kDefaultPadding / 2,
                  right: kDefaultPadding / 2,
                  left: kDefaultPadding / 2));
        });
  }

  Future<T?> showInformationDialog<T>(String desciption) {
    return showAlertDialog<T>(
        title: "Information",
        desctiption: desciption,
        actions: [
          AppBtn.basic(
            onPressed: () => router.pop(),
            isSecondary: false,
            child: Text(
              'Close',
              style: bodyMedium(fontWeight: FontWeight.bold),
            ),
          ).fadeIn(),
        ]);
  }

  Future<T?> $showGeneralDialog<T>({
    required Widget child,
    required String barrierLabel,
    bool dismissible = true,
  }) {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: dismissible,
      barrierLabel: barrierLabel,
      barrierColor: kDarkColor.withOpacity(0.5),
      transitionDuration: fastDuration,
      pageBuilder: (_, __, ___) => Dialog(
        backgroundColor: backgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(cornersMedium),
          ),
        ),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding / 2),
          child: child.fadeInAndMoveFromBottom(),
        ),
      ),
      transitionBuilder: (_, anim, __, child) => FadeTransition(
        opacity: Tween(begin: 0.0, end: 1.0).animate(anim),
        child: child,
      ),
    );
  }
}

extension WidgetAnimation on Widget {
  fadeInAndMoveFromTop({
    Duration? delay,
    Duration? animationDuration,
    Offset? offset,
  }) =>
      animate(delay: delay ?? fastDuration)
          .move(
              duration: animationDuration ?? fastDuration,
              begin: offset ?? const Offset(0, -10))
          .fade(duration: animationDuration ?? fastDuration);

  fadeInAndMoveFromBottom({
    Duration? delay,
    Duration? animationDuration,
    Offset? offset,
  }) =>
      animate(delay: delay ?? fastDuration)
          .move(
              duration: animationDuration ?? fastDuration,
              begin: offset ?? const Offset(0, 10))
          .fade(duration: animationDuration ?? fastDuration);

  fadeIn({
    Duration? delay,
    Duration? animationDuration,
    Curve? curve,
  }) =>
      animate(delay: delay ?? fastDuration).fade(
          duration: animationDuration ?? fastDuration,
          curve: curve ?? Curves.decelerate);
}
