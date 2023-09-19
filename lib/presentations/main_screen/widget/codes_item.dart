import 'package:flutter_animate/flutter_animate.dart';
import 'package:uni_store/common_libs.dart';
import 'package:uni_store/models/saved_codes/saved_codes.dart';
import 'package:uni_store/presentations/add_success/show_qr_code_bar.dart';

class CodesItem extends StatelessWidget {
  final SavedCode savedCode;
  const CodesItem({
    super.key,
    required this.savedCode,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      final width = constraint.maxWidth;
      return Container(
        // margin: const EdgeInsets.all(kDefaultPadding / 2),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: savedCode.variety.backgroundColor,
          borderRadius: BorderRadius.circular(cornersLarge),
        ),
        child: Stack(
          children: [
            buildBackgroudImage(width),
            buildContext(width, context),
          ],
        ),
      );
    });
  }

  Column buildContext(double width, BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              buildImage(width),
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildWidget1(context),
                    verticalSpaceLarge,
                    buildTitle(context),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: width / 1.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildSpecifications(context),
                              verticalSpaceMedium,
                              buildDescription(width, context),
                              verticalSpaceMedium,
                              buildValidThru(context),
                              const Spacer(),
                              buildCodeText(context),
                              verticalSpaceSmall,
                              buildCodeItem(context),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //
                  ],
                ),
              ),
            ],
          ),
        ),
        buildDivider(),
        buildButtons(context),
      ],
    );
  }

  Padding buildButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      child: Row(
        children: [
          Expanded(
            child: buildRedeemYourCodeButton(context),
          ),
          horizontalSpaceMedium,
          buildShowQrButton(context),
        ],
      ),
    );
  }

  Widget buildCodeText(BuildContext context) {
    return Text(
      'CODE',
      style: context.bodyMedium(
        color: savedCode.variety.textColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ).fadeInAndMoveFromTop();
  }

  Widget buildValidThru(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Valid thru: ',
            style: context.bodyMedium(
              color: savedCode.variety.textColor,
            ),
          ),
          TextSpan(
            text: AppUtils().formattedDate(savedCode.validTill),
            style: context.bodyMedium(
              color: savedCode.variety.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
        style: context.bodyMedium(
          color: savedCode.variety.textColor,
        ),
      ),
      textAlign: TextAlign.start,
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
    ).fadeInAndMoveFromTop();
  }

  Widget buildDescription(double width, BuildContext context) {
    return SizedBox(
      width: width / 2,
      child: Text(
        savedCode.storeItem.description,
        maxLines: 3,
        style: context.bodyMedium(
          color: savedCode.variety.textColor,
        ),
      ),
    ).fadeInAndMoveFromTop();
  }

  Widget buildSpecifications(BuildContext context) {
    return Text(
      savedCode.storeItem.specifications,
      style: context.bodyMedium(
          color: savedCode.variety.textColor, fontWeight: FontWeight.bold),
    ).fadeInAndMoveFromTop();
  }

  Widget buildTitle(BuildContext context) {
    return Text(
      savedCode.storeItem.name,
      style: context.bodyLarge(
        color: savedCode.variety.textColor,
        fontSize: 50,
      ),
    ).fadeInAndMoveFromTop();
  }

  Widget buildWidget1(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          savedCode.storeItem.logo,
          color: savedCode.variety.textColor,
          width: 30,
          height: 30,
        ).fadeInAndMoveFromTop(),
        const Spacer(),
        buildDiscount(context),
      ],
    );
  }

  Positioned buildImage(double width) {
    return Positioned(
      bottom: -width / 4,
      left: width / 2,
      child: Transform.scale(
        scale: 1.2,
        child: Image.asset(
          savedCode.variety.image,
          height: width,
          fit: BoxFit.fitHeight,
        ),
      ).fadeIn(delay: 200.ms),
    );
  }

  Widget buildDivider() {
    return Container(
      width: double.infinity,
      height: 1,
      color: savedCode.variety.textColor.withOpacity(.6),
    ).fadeIn();
  }

  Positioned buildBackgroudImage(double width) {
    return Positioned(
      bottom: -kDefaultMargin * 2,
      right: -kDefaultMargin * 2,
      child: Transform.scale(
        scale: 1.5,
        child: Image.asset(
          savedCode.storeItem.logo,
          width: width,
          height: width,
          color: savedCode.variety.textColor,
          opacity: const AlwaysStoppedAnimation(0.1),
        ),
      ).fadeInAndMoveFromBottom(),
    );
  }

  List<Widget> getCodeWidget(BuildContext context) {
    List<Widget> widget = [];
    for (int i = 0; i < savedCode.code.length; i++) {
      widget.add(buildCode(
        savedCode.code[i].toUpperCase(),
        i + 1,
        context,
      ));
    }
    return widget;
  }

  Widget buildCode(String text, int index, BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding / 2,
      ),
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornersSmall),
        border: Border.all(color: savedCode.variety.textColor),
      ),
      child: Text(
        text,
        style: context.bodyLarge(
          color: savedCode.variety.textColor,
          fontWeight: FontWeight.normal,
          fontSize: 24,
        ),
      ),
    ).fadeInAndMoveFromTop(delay: (index * 300).ms);
  }

  Row buildCodeItem(BuildContext context) {
    final codeWidget = getCodeWidget(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        codeWidget[0],
        horizontalSpaceSmall,
        codeWidget[1],
        horizontalSpaceSmall,
        codeWidget[2],
        horizontalSpaceSmall,
        codeWidget[3],
        horizontalSpaceSmall,
        codeWidget[4],
        horizontalSpaceSmall,
        codeWidget[5],
      ],
    );
  }

  Positioned buildDiscount(BuildContext context) {
    return Positioned(
      top: kDefaultMargin / 2,
      right: kDefaultMargin / 2,
      child: Container(
        padding: const EdgeInsets.only(
          top: kDefaultPadding / 4,
          bottom: kDefaultPadding / 4,
          left: kDefaultPadding / 2,
          right: kDefaultPadding / 2,
        ),
        decoration: BoxDecoration(
          color: savedCode.variety.textColor.withOpacity(.15),
          borderRadius: BorderRadius.circular(cornersLarge),
        ),
        child: Text(
          '-${savedCode.storeItem.discount}%',
          style: context.bodyMedium(
            color: savedCode.variety.discountColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ).fadeInAndMoveFromTop(),
    );
  }

  Widget buildShowQrButton(BuildContext context) {
    return buildExchangeCoupon(
      Icon(
        Icons.qr_code_scanner_rounded,
        color: savedCode.variety.textColor,
      ),
      () {
        context.showBottomBar(
            child: ShowQrCodeBar(
          code: savedCode.code,
        ));
      },
    );
  }

  Widget buildRedeemYourCodeButton(BuildContext context) {
    return buildExchangeCoupon(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            savedCode.storeItem.logo,
            color: savedCode.variety.textColor,
            width: 30,
            height: 30,
          ),
          horizontalSpaceMedium,
          Text(
            'Copy code.',
            style: context.bodyMedium(
                fontWeight: FontWeight.bold,
                color: savedCode.variety.textColor),
          ),
        ],
      ),
      () {},
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
          gradient: LinearGradient(colors: savedCode.variety.gradientColors),
        ),
        child: child,
      ),
    ).fadeIn();
  }
}
