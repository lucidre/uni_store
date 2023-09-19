import 'package:flutter_animate/flutter_animate.dart';
import 'package:uni_store/common_libs.dart';
import 'package:uni_store/models/store_item/store_item.dart';

class DetailsExchangeDialog extends StatelessWidget {
  final StoreVariety storeVariety;
  final StoreItem storeItem;
  const DetailsExchangeDialog(
      {super.key, required this.storeVariety, required this.storeItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(cornersLarge),
              color: storeVariety.backgroundColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                buildTitleWidget(context),
                verticalSpaceMedium,
                buildSpecification(context),
                verticalSpaceMedium,
                buildImage(),
                verticalSpaceMedium,
                Center(
                  child: Text(
                    'Once you exchange your code it will be valid for the next 7 days.\nYou can redeem it either in online or offline store.',
                    style: context.bodyMedium(
                      color: storeVariety.textColor.withOpacity(.8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ).fadeIn(delay: 600.ms)
              ],
            ),
          ).fadeInAndMoveFromBottom(),
          verticalSpaceMedium,
          buildExchangeCoupon(context),
          verticalSpaceMedium,
          buildCancelButton(context).fadeInAndMoveFromBottom(),
          verticalSpaceMedium,
        ],
      ),
    );
  }

  InkWell buildCancelButton(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        context.popRoute();
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cornersLarge),
          color: storeVariety.backgroundColor,
        ),
        child: Text(
          'Cancel',
          style: context.bodyMedium(
              fontWeight: FontWeight.bold, color: storeVariety.textColor),
        ),
      ),
    );
  }

  Widget buildExchangeCoupon(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context, rootNavigator: true).pop();

        context.router.pushAndPopUntil(
            AddSuccessRoute(storeItem: storeItem, variety: storeVariety),
            predicate: (route) => route.isFirst);
      },
      splashColor: Colors.transparent,
      child: AnimatedContainer(
        duration: medDuration,
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cornersLarge),
          gradient: LinearGradient(colors: storeVariety.gradientColors),
        ),
        child: Text(
          'Exchange Coupon',
          style: context.bodyMedium(
              fontWeight: FontWeight.bold, color: storeVariety.textColor),
        ),
      ),
    ).fadeInAndMoveFromBottom();
  }

  Widget buildImage() {
    return LayoutBuilder(builder: (context, constraint) {
      final actualWidth = constraint.maxWidth - 40;
      return Center(
        child: Image.asset(
          storeVariety.image,
          key: UniqueKey(),
          width: actualWidth,
          height: actualWidth,
          fit: BoxFit.contain,
        ),
      ).fadeIn(delay: 600.ms);
    });
  }

  Widget buildSpecification(BuildContext context) {
    return Text(
      storeItem.specifications,
      style: context.bodyMedium(
          color: storeVariety.textColor, fontWeight: FontWeight.bold),
    ).fadeIn(delay: 600.ms);
  }

  Widget buildTitleWidget(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        Text(
          storeItem.name,
          style: context.bodyLarge(color: storeVariety.textColor, fontSize: 40),
        ).fadeIn(delay: 600.ms),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.only(
              top: kDefaultPadding / 4,
              bottom: kDefaultPadding / 4,
              left: kDefaultPadding / 2,
              right: kDefaultPadding / 2,
            ),
            decoration: BoxDecoration(
              color: storeVariety.textColor.withOpacity(.15),
              borderRadius: BorderRadius.circular(cornersLarge),
            ),
            child: Text(
              '-${storeItem.discount}%',
              style: context.bodyMedium(
                color: storeVariety.discountColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ).fadeIn(delay: 600.ms),
        )
      ],
    );
  }
}
