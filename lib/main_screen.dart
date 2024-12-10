import 'package:finance_website/utils/constants.dart';
import 'package:finance_website/utils/responsive.dart';
import 'package:finance_website/widgets/body/main_features.dart';
import 'package:finance_website/widgets/body/partners.dart';
import 'package:finance_website/widgets/body/testimonials.dart';
import 'package:finance_website/widgets/footer/footer.dart';
import 'package:finance_website/widgets/header/header.dart';
import 'package:finance_website/widgets/header/menu_titles.dart';
import 'package:finance_website/widgets/utils/side_menu.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  final ScrollController scrollController = ScrollController();
  bool isLoading = true, isScrolled = false, isScrollingDown = false;

  double previousScrollOffset = 0;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }
  void _scrollListener() {
    bool isScrollingNow = scrollController.position.pixels > previousScrollOffset;
    if (isScrollingDown != isScrollingNow) {
      setState(() {
        isScrollingDown = isScrollingNow;
      });
    }
    previousScrollOffset = scrollController.position.pixels;
  }

  scrollToWidget(GlobalKey key){
    if(!Responsive.isDesktop(context)){
      closeDrawer();
    }
    Scrollable.ensureVisible(key.currentContext!, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
  }

  openDrawer(){
    drawerKey.currentState?.openDrawer();
  }

  closeDrawer(){
    drawerKey.currentState?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      drawer: SideMenu(scrollTo: (GlobalKey key) =>scrollToWidget(key), closeDrawer: closeDrawer),
      body: Stack(
        children: [
          //----------------------------------------------------MAIN CONTENT----------------------------------------------------
          SingleChildScrollView(
            controller: scrollController,
            physics: const ClampingScrollPhysics(),
            child: Column(
              key: GlobalKey(),
              children: [
                Header(key: menuTitles[0].key),
                MainFeatures(key: menuTitles[1].key),
                Testimonials(key: menuTitles[2].key),
                Partners(key: menuTitles[3].key),
                Footer(scrollTo: (GlobalKey key) =>scrollToWidget(key)),
              ],
            ),
          ),
          //----------------------------------------------------MENU----------------------------------------------------
          MenuTitles(
            isScrolled: isScrolled,
            isScrollingDown: isScrollingDown,
            scrollTo: (GlobalKey key) =>scrollToWidget(key),
            openDrawer: openDrawer,
          ),// Fixed Menu at the Top
        ],
      ),
    );
  }
}
