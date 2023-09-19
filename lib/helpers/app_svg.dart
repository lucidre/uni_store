import 'package:flutter_svg/svg.dart';
import 'package:uni_store/common_libs.dart';

class AppSvg extends StatelessWidget {
  final String icon;
  final String name;
  final double size;
  final Color? color;

  const AppSvg(
      {required this.icon,
      required this.name,
      this.size = 18,
      this.color,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(icon,
        alignment: Alignment.center,
        semanticsLabel: name,
        height: size,
        width: size,
        color: color ?? context.textColor);
  }
}
