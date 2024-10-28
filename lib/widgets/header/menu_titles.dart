import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/responsive.dart';
import '../../utils/theme_style.dart';
import '../utils/logo_row.dart';

class MenuTitles extends StatelessWidget {
  const MenuTitles({Key? key, required this.isScrolled, required this.scrollTo, required this.isScrollingDown, required this.openDrawer}) : super(key: key);

  final bool isScrolled, isScrollingDown;
  final void Function(GlobalKey key) scrollTo;
  final void Function() openDrawer;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: isScrollingDown ? 0 : 1,
        duration: const Duration(milliseconds: 50),
        curve: Curves.easeInOut,
        child: Stack(//this stack is needed since it's inside an animated container
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  color: Colors.white,
                  width: Responsive.screenWidth(context) / (Responsive.isDesktop(context) ? 1.2 : 1),
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      //----------------------------------------------------LOGO----------------------------------------------------
                      Expanded(
                        flex: Responsive.isMobile(context) ? 10 : 4,
                        child: GestureDetector(
                          onTap: () => scrollTo(menuTitles.first.key), // Scroll action
                          child: const LogoRow(),
                        ),
                      ),


                      //----------------------------------------------------MENU----------------------------------------------------
                      Responsive.isDesktop(context)
                          ? Expanded(
                        flex: 15,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Center(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: menuTitles.map((item) {
                                return TextButton(
                                  onPressed: ()=>scrollTo(item.key),//-------------------------------MOVE TO
                                  child: Text(item.title),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      )
                          : const Spacer(flex: 8),
                      //----------------------------------------------------LOGIN BUTTON----------------------------------------------------
                      Expanded(
                        flex: 2,
                          child: Responsive.isDesktop(context)
                              ? ElevatedButton(
                              onPressed: (){},
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                                ),
                              ),
                              child: const FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text("Sign Up", maxLines: 1)
                          ))
                              : IconButton(onPressed: openDrawer, icon: const Icon(Icons.menu, color: CustomStyle.primaryFontColorLight))
                      )
                    ],

                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}
