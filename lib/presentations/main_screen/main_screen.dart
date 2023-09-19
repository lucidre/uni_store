import 'package:uni_store/common_libs.dart';
import 'package:uni_store/presentations/main_screen/tabs/codes_tab.dart';
import 'package:uni_store/presentations/main_screen/tabs/home_tab.dart';
import 'package:uni_store/presentations/main_screen/widget/bottom_bar_item.dart';

class MainScreen extends StatefulWidget {
  final bool isViewSaved;
  const MainScreen({
    Key? key,
    this.isViewSaved = false,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> tabs = [
    HomeTab(
      key: UniqueKey(),
    ),
    const SizedBox(),
    CodesTab(
      key: UniqueKey(),
    ),
  ];
  int tabPosition = 0;

  @override
  void initState() {
    super.initState();
    if (widget.isViewSaved) {
      tabPosition = tabs.length - 1;
    }
  }

  Widget buildBottomBarItem(String title, IconData icon, int index) {
    bool isSelected = tabPosition == index;

    return BottomBarItem(
        title: title,
        icon: icon,
        index: index,
        isSelected: isSelected,
        onPressed: () {
          setState(() {
            tabPosition = index;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      enableInternetCheck: false,
      appBar: buildAppBar(),
      body: SizedBox(
        height: context.screenHeight,
        width: context.screenWidth,
        child: Column(
          children: [buildBody(), context.divider, buildBottomBar()],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: Text(
        'Coupons',
        style: context.bodyLarge(),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.person,
            color: kDarkColor,
          ),
        )
      ],
    );
  }

  Container buildBottomBar() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: kDefaultMargin / 2,
        bottom: kDefaultMargin * 1.5,
        right: kDefaultMargin * 1.5,
        left: kDefaultMargin * 1.5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildBottomBarItem("Products", Icons.calendar_view_day_rounded, 0),
          buildBottomBarItem("Add", Icons.add_rounded, 1),
          buildBottomBarItem("Gift Cards", Icons.card_giftcard_rounded, 2),
        ],
      ),
    );
  }

  Expanded buildBody() {
    return Expanded(
      child: IndexedStack(
        index: tabPosition,
        children: tabs,
      ),
    );
  }
}
