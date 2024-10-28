import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/responsive.dart';
import '../../utils/theme_style.dart';
import 'custom_list.dart';
import 'logo_row.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key, required this.scrollTo, required this.closeDrawer});
  final void Function(GlobalKey key) scrollTo;
  final void Function() closeDrawer;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SizedBox(
        width: Responsive.screenWidth(context),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: GestureDetector(
                      onTap: () => scrollTo(menuTitles.first.key),//-------------------------------SCROLL UP
                      child: const LogoRow(),
                    ),
                  ),
                  const Spacer(flex: 2),
                  Expanded(child: IconButton(onPressed: closeDrawer, icon: const Icon(Icons.clear, color: CustomStyle.primaryFontColorLight)))
                ],
              ),
              verticalSpacing,
              CustomListView(
                  itemCount: menuTitles.length,
                  itemBuilder: (context, index){
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: ()=>scrollTo(menuTitles[index].key),//-------------------------------MOVE TO
                        child: Text(menuTitles[index].title),
                      ),
                    );
                  }),
              const SizedBox(height: 40),
              ElevatedButton(
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
            ],
          ),
        ),
      ),
    );
  }
}