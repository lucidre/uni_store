import 'package:flutter_animate/flutter_animate.dart';
import 'package:uni_store/common_libs.dart';
import 'package:uni_store/models/store_item/store_item.dart';

class HomeItem extends StatelessWidget {
  final StoreItem model;
  final VoidCallback onPressed;

  const HomeItem({
    super.key,
    required this.model,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: kDefaultPadding / 2,
        left: kDefaultPadding / 2,
        right: kDefaultPadding / 2,
      ),
      child: AspectRatio(
        aspectRatio: 3 / 2,
        child: LayoutBuilder(builder: (context, constraints) {
          final width = constraints.maxWidth / 2;

          return Stack(
            children: [
              AppHero(
                tag: '${model.id}background',
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    color: model.varieties.first.backgroundColor,
                    borderRadius: BorderRadius.circular(cornersLarge),
                  ),
                ),
              ),
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: model.varieties.first.backgroundColor,
                  borderRadius: BorderRadius.circular(cornersLarge),
                ),
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: () => onPressed.call(),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: -kDefaultMargin * 2,
                        right: -kDefaultMargin * 2,
                        child: AppHero(
                          tag: '${model.id}background2',
                          child: Transform.scale(
                            scale: 1.5,
                            child: Image.asset(
                              model.logo,
                              width: context.screenWidth,
                              height: context.screenWidth,
                              color: model.varieties.first.textColor,
                              opacity: const AlwaysStoppedAnimation(0.1),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 60,
                        left: 0,
                        right: 0,
                        child: Divider(
                          color:
                              model.varieties.first.textColor.withOpacity(.6),
                        ),
                      ),
                      buildImage(constraints),
                      buildDiscount(context),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTexts(width, context),
                          const Spacer(),
                          buildSpecifications(context),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ).fadeInAndMoveFromBottom(animationDuration: 100.milliseconds);
        }),
      ),
    );
  }

  Container buildTexts(double width1, BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: kDefaultPadding,
        bottom: kDefaultPadding / 4,
        left: kDefaultPadding,
        right: kDefaultPadding / 4,
      ),
      width: width1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppHero(
            tag: model.id + model.name,
            child: Text(
              model.name,
              style: context.bodyLarge(
                color: model.varieties.first.textColor,
              ),
            ),
          ).fadeInAndMoveFromBottom(),
          verticalSpaceMedium,
          AppHero(
            tag: model.id + model.description,
            child: SizedBox(
              child: Text(
                model.description,
                maxLines: 3,
                style: context.bodyMedium(
                  color: model.varieties.first.textColor,
                ),
              ),
            ),
          ).fadeInAndMoveFromBottom(),
        ],
      ),
    );
  }

  Padding buildSpecifications(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: kDefaultPadding,
        top: kDefaultPadding / 4,
        left: kDefaultPadding,
        right: kDefaultPadding / 4,
      ),
      child: Row(
        children: [
          AppHero(
            tag: '${model.id}logo',
            child: Image.asset(
              model.logo,
              color: model.varieties.first.textColor,
              width: 30,
              height: 30,
            ),
          ),
          horizontalSpaceSmall,
          AppHero(
            tag: model.id + model.specifications,
            child: Text(
              model.specifications,
              style: context.bodyMedium(
                  color: model.varieties.first.textColor,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ).fadeIn(),
    );
  }

  Positioned buildImage(BoxConstraints constraints) {
    final maxWidth = constraints.maxWidth;
    final maxHeight = constraints.maxHeight;

    return Positioned(
      bottom: -maxWidth / 4,
      left: maxWidth / 2,
      child: Transform.scale(
        scale: 1.2,
        child: AppHero(
          tag: model.id + model.varieties.first.image,
          child: Image.asset(
            model.varieties.first.image,
            height: maxHeight,
            fit: BoxFit.fitHeight,
          ),
        ),
      ).fadeInAndMoveFromBottom(),
    );
  }

  Positioned buildDiscount(BuildContext context) {
    return Positioned(
      top: kDefaultMargin / 2,
      right: kDefaultMargin / 2,
      child: AppHero(
        tag: model.id + model.discount.toString(),
        child: Container(
          padding: const EdgeInsets.only(
            top: kDefaultPadding / 4,
            bottom: kDefaultPadding / 4,
            left: kDefaultPadding / 2,
            right: kDefaultPadding / 2,
          ),
          decoration: BoxDecoration(
            color: model.varieties.first.textColor.withOpacity(.15),
            borderRadius: BorderRadius.circular(cornersLarge),
          ),
          child: Text(
            '-${model.discount}%',
            style: context.bodyMedium(
              color: model.varieties.first.discountColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ).fadeIn(),
    );
  }
}
