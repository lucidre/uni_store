import 'package:qr_flutter/qr_flutter.dart';
import 'package:uni_store/common_libs.dart';

class ShowQrCodeBar extends StatefulWidget {
  final String code;
  const ShowQrCodeBar({super.key, required this.code});

  @override
  State<ShowQrCodeBar> createState() => _ShowQrCodeBarState();
}

class _ShowQrCodeBarState extends State<ShowQrCodeBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cornersLarge),
          color: kLightColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Scan to redeem',
                    style: context.bodyMedium(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                horizontalSpaceMedium,
                const Icon(
                  Icons.qr_code_scanner_rounded,
                  color: kDarkColor,
                ),
              ],
            ),
            verticalSpaceLarge,
            Center(
              child: QrImageView(
                data: widget.code,
                version: QrVersions.auto,
                size: 300.0,
              ),
            ),
            verticalSpaceLarge,
            Text(
              'Scan the code above to redeem your code and get your discount in the store.',
              style: context.bodyMedium(
                color: kDarkColor.withOpacity(.6),
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpaceMedium,
            context.divider,
            verticalSpaceMedium,
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                context.popRoute();
              },
              child: Center(
                child: Text(
                  'Hide code',
                  style: context.bodyMedium(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            verticalSpaceSmall,
          ],
        ),
      ).fadeInAndMoveFromBottom(),
    );
  }
}
