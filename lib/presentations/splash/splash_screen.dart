import 'dart:ui';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:uni_store/common_libs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  //fade in transition for logo and app name
  Animation<double>? _opacityAnimation;
  AnimationController? _controller;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final heading1 = textTheme.displayLarge!;

    return AppScaffold(
      enableInternetCheck: false,
      body: Container(
          height: context.screenHeight,
          width: context.screenWidth,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [])),
          child: buildBody(heading1)),
    );
  }

  Widget buildBody(TextStyle heading1) {
    return FadeTransition(
      opacity: _opacityAnimation!,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /*  AppHero(
              tag: "apple",
              child: Lottie.asset(
                lottieRocket,
                width: 400,
              ),
            ), */
            Text(
              'Uni Stores',
              style: context.bodyLarge(
                color: kLightColor,
                fontWeight: FontWeight.w900,
                fontSize: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    setUpAnimation();
  }

  void setUpAnimation() {
    //initialize controller and animation
    _controller = AnimationController(
      vsync: this,
      duration: slowDuration,
    );
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeIn,
      ),
    );

    // action on animation completion
    _controller?.addListener(() {
      if (_controller!.isCompleted) {
        startTime();
      }
    });

    // 2 seconds delay before animation starts
    const duration = Duration(seconds: 2);
    Timer(duration, () {
      _controller?.forward();
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void route() {
    context.router.replace(MainRoute());
  }

  Future startTime() async {
    const duration = Duration(seconds: 4);
    return Timer(duration, route);
  }
}
