import 'package:uni_store/common_libs.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  final String text;

  const CustomOutlinedButton(
      {Key? key,
      this.color = kPrimaryColor,
      required this.onPressed,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 1.0, color: color),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: kDefaultPadding / 2, bottom: kDefaultPadding / 2),
          child: Text(
            text,
            style: bodyMedium!.copyWith(color: color),
          ),
        ),
      ),
    );
  }
}
