import 'package:uni_store/common_libs.dart';

class BottomBarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final int index;
  final bool isSelected;
  final VoidCallback onPressed;
  const BottomBarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.index,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: fastDuration,
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: isSelected ? kPrimaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(cornersMedium),
      ),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () => onPressed.call(),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? kLightColor : kDarkColor,
            ),
            if (isSelected) ...[
              horizontalSpaceMedium,
              Text(
                title,
                style: context.bodyMedium(
                    color: kLightColor, fontWeight: FontWeight.bold),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
