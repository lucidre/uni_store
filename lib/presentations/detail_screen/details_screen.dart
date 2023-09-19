import 'package:uni_store/common_libs.dart';
import 'package:uni_store/models/store_item/store_item.dart';
import 'package:uni_store/presentations/detail_screen/details_exchange_dialog.dart';

class DetailsScreen extends StatefulWidget {
  final StoreItem model;

  const DetailsScreen({Key? key, required this.model}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late StoreVariety variety;

  @override
  void initState() {
    super.initState();
    variety = widget.model.varieties.first;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      enableInternetCheck: false,
      body: Stack(
        children: [
          buildBackground(),
          buildBackgroundLogo(),
          buildBody(),
        ],
      ),
    );
  }

  Positioned buildBackgroundLogo() {
    return Positioned(
      bottom: kDefaultMargin,
      child: AppHero(
        tag: '${widget.model.id}background2',
        child: Transform.scale(
          scale: 2,
          child: Image.asset(
            widget.model.logo,
            width: context.screenWidth,
            height: context.screenWidth,
            color: variety.textColor,
            opacity: const AlwaysStoppedAnimation(0.1),
          ),
        ),
      ),
    );
  }

  AppHero buildBackground() {
    return AppHero(
      tag: '${widget.model.id}background',
      child: AnimatedContainer(
        duration: medDuration,
        width: double.infinity,
        height: double.infinity,
        color: variety.backgroundColor,
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildAppBar(),
          Padding(
            padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceLarge,
                buildTitleWidget(),
                verticalSpaceMedium,
                buildSpecification(),
                verticalSpaceLarge,
                buildDescription(),
                verticalSpaceLarge,
                buildImage(),
                verticalSpaceLarge,
                Row(
                  children: [
                    Expanded(child: buildPrice()),
                    horizontalSpaceMedium,
                    Expanded(child: buildVariation()),
                  ],
                ),
                verticalSpaceLarge,
                divider(),
                verticalSpaceLarge,
                buildExchangeCoupon(),
                verticalSpaceLarge,
                buildExcangeCouponText(),
                verticalSpaceLarge,
                verticalSpaceLarge,
                verticalSpaceLarge,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildExcangeCouponText() {
    return Center(
      child: Text(
        'Exchange your coupons to receive your individiual discount code.\nYou can use your code in either online or offline stores.',
        style: context.bodyMedium(
          color: variety.textColor.withOpacity(.6),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget divider() {
    return Divider(
      color: variety.textColor.withOpacity(.6),
    ).fadeInAndMoveFromBottom();
  }

  Widget buildExchangeCoupon() {
    return InkWell(
      onTap: () {
        context.showBottomBar(
          child: DetailsExchangeDialog(
            storeItem: widget.model,
            storeVariety: variety,
          ),
        );
      },
      splashColor: Colors.transparent,
      child: AnimatedContainer(
        duration: medDuration,
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cornersLarge),
          gradient: LinearGradient(colors: variety.gradientColors),
        ),
        child: Text(
          'Exchange Coupon',
          style: context.bodyMedium(
              fontWeight: FontWeight.bold, color: variety.textColor),
        ),
      ),
    ).fadeInAndMoveFromBottom();
  }

  Widget buildVariation() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(
        top: kDefaultPadding / 4,
        bottom: kDefaultPadding / 4,
        left: kDefaultPadding / 2,
        right: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: variety.textColor.withOpacity(.15),
        borderRadius: BorderRadius.circular(cornersLarge),
      ),
      height: 200,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Variations',
          style: context.bodyMedium(color: variety.textColor.withOpacity(.8)),
        ),
        verticalSpaceMedium,
        Wrap(
          alignment: WrapAlignment.center,
          children: widget.model.varieties
              .map(
                (item) => InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      variety = item;
                    });
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    margin: const EdgeInsets.all(kDefaultMargin / 4),
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                      color: item.backgroundColor,
                      borderRadius: BorderRadius.circular(cornersLarge),
                      border: Border.all(
                        color: variety.textColor,
                      ),
                    ),
                    child: item == variety
                        ? Container(
                            margin: const EdgeInsets.all(5),
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              color: variety.textColor,
                              borderRadius: BorderRadius.circular(cornersLarge),
                              border: Border.all(
                                color: variety.textColor,
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ).fadeIn(),
                ),
              )
              .toList(),
        ),
      ]),
    ).fadeInAndMoveFromBottom();
  }

  Widget buildPrice() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(
        top: kDefaultPadding / 4,
        bottom: kDefaultPadding / 4,
        left: kDefaultPadding / 2,
        right: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: variety.textColor.withOpacity(.15),
        borderRadius: BorderRadius.circular(cornersLarge),
      ),
      height: 200,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          '\$${widget.model.price}',
          style: context.bodyMedium(
            color: variety.textColor.withOpacity(.8),
          ),
        ),
        verticalSpaceMedium,
        Text(
          '\$${widget.model.price * (100 - widget.model.discount) / 100}',
          style: context.bodyLarge(
            color: variety.textColor,
            fontSize: 40,
          ),
        )
      ]),
    ).fadeInAndMoveFromBottom();
  }

  Widget buildImage() {
    return LayoutBuilder(builder: (context, constraint) {
      final actualWidth = constraint.maxWidth - 40;
      return Center(
        child: AppHero(
          tag: widget.model.id + variety.image,
          child: AnimatedSwitcher(
            duration: slowDuration,
            child: Image.asset(
              variety.image,
              key: UniqueKey(),
              width: actualWidth,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ).fadeInAndMoveFromBottom();
    });
  }

  Widget buildDescription() {
    return AppHero(
      tag: widget.model.id + widget.model.description,
      child: SizedBox(
        child: Text(
          widget.model.description,
          softWrap: true,
          overflow: TextOverflow.fade,
          style: context.bodyMedium(
            color: variety.textColor,
          ),
        ),
      ),
    ).fadeInAndMoveFromBottom();
  }

  Widget buildSpecification() {
    return AppHero(
      tag: widget.model.id + widget.model.specifications,
      child: Text(
        widget.model.specifications,
        style: context.bodyMedium(
            color: variety.textColor, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildTitleWidget() {
    return Stack(
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        AppHero(
          tag: widget.model.id + widget.model.name,
          child: Text(
            widget.model.name,
            style: context.bodyLarge(
              color: variety.textColor,
              fontSize: 50,
            ),
          ),
        ).fadeInAndMoveFromBottom(),
        Positioned(
          top: 0,
          right: 0,
          child: AppHero(
            tag: widget.model.id + widget.model.discount.toString(),
            child: Container(
              padding: const EdgeInsets.only(
                top: kDefaultPadding / 4,
                bottom: kDefaultPadding / 4,
                left: kDefaultPadding / 2,
                right: kDefaultPadding / 2,
              ),
              decoration: BoxDecoration(
                color: variety.textColor.withOpacity(.15),
                borderRadius: BorderRadius.circular(cornersLarge),
              ),
              child: Text(
                '-${widget.model.discount}%',
                style: context.bodyMedium(
                  color: variety.discountColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ).fadeIn(),
        )
      ],
    );
  }

  Widget buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: BackButton(
        color: variety.textColor,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: AppHero(
        tag: '${widget.model.id}logo',
        child: Image.asset(
          widget.model.logo,
          color: variety.textColor,
          width: 30,
          height: 30,
        ),
      ),
    ).fadeInAndMoveFromTop();
  }
}
