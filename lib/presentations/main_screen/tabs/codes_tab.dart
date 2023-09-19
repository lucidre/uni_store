import 'dart:math';

import 'package:uni_store/common_libs.dart';
import 'package:uni_store/controllers/saved_codes_controller.dart';
import 'package:uni_store/presentations/main_screen/widget/codes_item.dart';

class CodesTab extends StatefulWidget {
  const CodesTab({super.key});

  @override
  State<CodesTab> createState() => _CodesTabState();
}

class _CodesTabState extends State<CodesTab> {
  final SavedCodesController controller = SavedCodesController();
  final scrollNotifier = ValueNotifier(0.0);
  final pageController = PageController(
    viewportFraction: 0.9,
  );
  final idicatorController = ScrollController();

  void _listener() {
    scrollNotifier.value = pageController.page ?? 0;
  }

  @override
  void initState() {
    pageController.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    pageController.removeListener(_listener);
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      height: context.screenHeight,
      child: ValueListenableBuilder<double>(
          valueListenable: scrollNotifier,
          builder: (comtext, scroll, child) {
            return PageView.builder(
                controller: pageController,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.savedCodes.length,
                itemBuilder: (ctx, index) {
                  double scale = getPageScale(index, scroll);

                  return Transform.scale(
                    scale: scale,
                    child: CodesItem(savedCode: controller.savedCodes[index]),
                  );
                });
          }),

      /* ListView.builder(
        itemCount: controller.itemCount,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return CodesItem(savedCode: controller.savedCodes[index]);
        },
      ), */
    );
  }

  double getPageScale(int index, double scroll) {
    final value = index - (scroll);
    final percentLeft = (value + 1).clamp(0.8, 1.0);
    final percentRight = (1 - value).clamp(0.8, 1.0);
    final scaleCal = percentRight < 1 ? percentRight : percentLeft;
    final scale = pow(scaleCal, 0.8).toDouble();
    return scale;
  }
}
