import 'package:uni_store/common_libs.dart';
import 'package:uni_store/models/store_item/store_item.dart';
import 'package:uni_store/presentations/main_screen/widget/home_item.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(0),
      itemCount: storeModel.length,
      itemBuilder: (ctx, index) {
        final model = storeModel[index];
        return HomeItem(
          model: model,
          onPressed: () {
            context.router.push(DetailsRoute(model: model));
          },
        );
      },
    );
  }
}
