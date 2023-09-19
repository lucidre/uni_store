import 'dart:math';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:uni_store/controllers/saved_codes_controller.dart';
import 'package:uni_store/models/saved_codes/saved_codes.dart';
import 'package:uni_store/presentations/add_success/show_qr_code_bar.dart';
import 'package:uni_store/common_libs.dart';
import 'package:uni_store/models/store_item/store_item.dart';

class AddSuccessScreen extends StatefulWidget {
  final StoreItem storeItem;
  final StoreVariety variety;
  const AddSuccessScreen(
      {super.key, required this.storeItem, required this.variety});

  @override
  State<AddSuccessScreen> createState() => _AddSuccessScreenState();
}

class _AddSuccessScreenState extends State<AddSuccessScreen> {
  String code = '';

  @override
  void initState() {
    super.initState();
    code = generateStringWithInteger();

    Future.delayed(Duration.zero, () {
      Random random = Random();
      final validTill = DateTime.now()
          .add(
            Duration(
              days: random.nextInt(5),
            ),
          )
          .millisecondsSinceEpoch;
      final SavedCode savedCode = SavedCode(
        code: code,
        validTill: validTill,
        storeItem: widget.storeItem,
        variety: widget.variety,
      );

      SavedCodesController().saveCode(savedCode);
    });
  }

  Widget buildBackground() {
    return AnimatedContainer(
      duration: medDuration,
      width: double.infinity,
      height: double.infinity,
      color: widget.variety.backgroundColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      enableInternetCheck: false,
      body: Stack(
        children: [
          buildBackground(),
          buildBackgroundLogo(),
          Container(
            padding: const EdgeInsets.all(kDefaultPadding / 2),
            child: Column(
              children: [
                buildAppBar(),
                verticalSpaceLarge,
                buildText1().fadeInAndMoveFromBottom(delay: 300.ms),
                verticalSpaceMedium,
                buildText2().fadeInAndMoveFromBottom(delay: 300.ms),
                verticalSpaceLarge,
                Expanded(child: buildImage()),
                verticalSpaceMedium,
                buildText3(),
                verticalSpaceLarge,
                buildCodeItem(),
                verticalSpaceLarge,
                buildText4().fadeInAndMoveFromBottom(),
                verticalSpaceLarge,
                Row(
                  children: [
                    Expanded(
                      child: buildRedeemYourCodeButton(),
                    ),
                    horizontalSpaceMedium,
                    buildShowQrButton(),
                  ],
                ),
                verticalSpaceLarge,
                verticalSpaceLarge,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildShowQrButton() {
    return buildExchangeCoupon(
      Icon(
        Icons.qr_code_scanner_rounded,
        color: widget.variety.textColor,
      ),
      () {
        context.showBottomBar(
            child: ShowQrCodeBar(
          code: code,
        ));
      },
    );
  }

  Widget buildRedeemYourCodeButton() {
    return buildExchangeCoupon(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            widget.storeItem.logo,
            color: widget.variety.textColor,
            width: 30,
            height: 30,
          ),
          horizontalSpaceMedium,
          Text(
            'Redeem your code.',
            style: context.bodyMedium(
                fontWeight: FontWeight.bold, color: widget.variety.textColor),
          ),
        ],
      ),
      () {
        redeemUserCodes();
      },
    );
  }

  Text buildText4() {
    return Text(
      'After redeeming your code will be valid for the next 7 days.\nUse it in either online or offline stores.',
      style: context.bodyMedium(
        color: widget.variety.textColor.withOpacity(.6),
      ),
      textAlign: TextAlign.center,
    );
  }

  Row buildCodeItem() {
    final codeWidget = getCodeWidget();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        codeWidget[0],
        horizontalSpaceMedium,
        codeWidget[1],
        horizontalSpaceMedium,
        codeWidget[2],
        horizontalSpaceMedium,
        codeWidget[3],
        horizontalSpaceMedium,
        codeWidget[4],
        horizontalSpaceMedium,
        codeWidget[5],
      ],
    );
  }

  Text buildText3() {
    return Text(
      'CODE',
      style: context.bodyMedium(color: widget.variety.textColor, fontSize: 16),
    );
  }

  RichText buildText2() {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: "Your code for ",
          style:
              context.bodyMedium(color: widget.variety.textColor, fontSize: 16),
        ),
        TextSpan(
            text: widget.storeItem.name.replaceAll('\n', ''),
            style: context.bodyMedium(
                color: widget.variety.textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        TextSpan(
            text: "\nhas been revealed!",
            style: context.bodyMedium(
                color: widget.variety.textColor, fontSize: 16)),
      ], style: context.bodyMedium(color: widget.variety.textColor)),
      textAlign: TextAlign.center,
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
    );
  }

  Text buildText1() {
    return Text(
      'Hooray!',
      style: context.bodyLarge(color: widget.variety.textColor, fontSize: 40),
    );
  }

  Positioned buildBackgroundLogo() {
    return Positioned(
      bottom: kDefaultMargin,
      child: Transform.scale(
        scale: 2,
        child: Image.asset(
          widget.storeItem.logo,
          width: context.screenWidth,
          height: context.screenWidth,
          color: widget.variety.textColor,
          opacity: const AlwaysStoppedAnimation(0.1),
        ),
      ),
    );
  }

  Widget buildExchangeCoupon(Widget child, VoidCallback onPressed) {
    return InkWell(
      onTap: () => onPressed.call(),
      splashColor: Colors.transparent,
      child: AnimatedContainer(
        duration: medDuration,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cornersLarge),
          gradient: LinearGradient(colors: widget.variety.gradientColors),
        ),
        child: child,
      ),
    ).fadeInAndMoveFromBottom();
  }

  String generateStringWithInteger() {
    Random random = Random();
    int integerPosition =
        random.nextInt(6); // Generate a random position between 0 and 5

    String value = '';

    for (int i = 0; i < 6; i++) {
      if (i == integerPosition) {
        // Insert an integer at the randomly chosen position
        int randomInteger =
            random.nextInt(10); // Generate a random integer between 0 and 9

        value += randomInteger.toString();
      } else {
        // Insert a random lowercase letter at other positions
        int randomLetter =
            random.nextInt(26); // Generate a random number between 0 and 25
        String letter = String.fromCharCode(97 +
            randomLetter); // Convert the number to lowercase ASCII character

        value += letter.toUpperCase();
      }
    }

    return value;
  }

  List<Widget> getCodeWidget() {
    List<Widget> widget = [];
    for (int i = 0; i < code.length; i++) {
      widget.add(buildCode(code[i].toUpperCase(), i + 1));
    }
    return widget;
  }

  Widget buildCode(String text, int index) {
    return Container(
      padding: const EdgeInsets.only(
        top: kDefaultPadding / 1.5,
        bottom: kDefaultPadding / 1.5,
      ),
      width: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornersSmall),
        border: Border.all(color: widget.variety.textColor),
      ),
      child: Text(
        text,
        style: context.bodyLarge(
          color: widget.variety.textColor,
          fontSize: 40,
          fontWeight: FontWeight.normal,
        ),
      ),
    ).fadeInAndMoveFromTop(delay: (index * 500).ms);
  }

  Widget buildImage() {
    return LayoutBuilder(builder: (context, constraint) {
      final actualWidth = min(constraint.maxWidth, constraint.maxHeight);
      return Center(
        child: Image.asset(
          widget.variety.image,
          key: UniqueKey(),
          width: actualWidth,
          height: actualWidth,
          fit: BoxFit.contain,
        ),
      ).fadeIn(delay: 600.ms);
    });
  }

  Widget buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: BackButton(
        color: widget.variety.textColor,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ).fadeInAndMoveFromTop();
  }

  void redeemUserCodes() {
    context.router.pushAndPopUntil(
      MainRoute(isViewSaved: true),
      predicate: (route) => route.isFirst,
    );
  }
}
