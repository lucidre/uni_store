import 'package:uni_store/common_libs.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color color;
  final double elevation;
  final Widget leadingIcon;
  final VoidCallback onPressed;
  final String text;
  final TextStyle? theme;

  final EdgeInsets padding;
  final bool isLoadingEnabled;

  const CustomElevatedButton(
      {Key? key,
      this.color = kPrimaryColor,
      this.elevation = 3,
      this.padding = const EdgeInsets.only(
          top: kDefaultPadding / 2, bottom: kDefaultPadding / 2),
      this.theme,
      this.leadingIcon = const SizedBox(
        width: 0,
        height: 0,
      ),
      required this.onPressed,
      required this.text,
      this.isLoadingEnabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          elevation: elevation,
        ),
        onPressed: onPressed,
        child: Padding(
          padding: padding,
          child: isLoadingEnabled
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: kLightColor,
                    valueColor: AlwaysStoppedAnimation(kPrimaryColor),
                  ),
                )
              : Row(children: [
                  Expanded(
                      child: Container(
                    alignment: Alignment.centerLeft,
                    child: leadingIcon,
                  )),
                  Text(
                    text,
                    style: theme ??
                        bodyMedium!.copyWith(
                          color: kLightColor,
                        ),
                  ),
                  Expanded(child: Container()),
                ]),
        ),
      ),
    );
  }
}
