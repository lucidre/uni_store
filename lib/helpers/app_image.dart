import 'package:uni_store/common_libs.dart';

class AppImage extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final bool isLoadingProgressBar;
  final double? width;
  final BoxFit? fit;
  final String? heroTag;
  const AppImage({
    Key? key,
    this.imageUrl,
    this.height,
    this.width,
    this.isLoadingProgressBar = false,
    this.fit,
    this.heroTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return heroTag != null
        ? AppHero(
            tag: heroTag!,
            child: buildBody(),
          )
        : buildBody();
  }

  Widget buildBody() {
    return Image.asset(
      imageUrl ?? '',
      fit: fit ?? BoxFit.cover,
      width: height ?? double.infinity,
      height: width ?? double.infinity,
    );
  }
}
