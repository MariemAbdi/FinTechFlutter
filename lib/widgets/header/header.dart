import 'package:finance_website/widgets/header/site_description.dart';
import 'package:flutter/material.dart';

import '../../utils/responsive.dart';
import 'introduction.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.screenWidth(context) / (Responsive.isDesktop(context) ? 1.2 : 1),
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * (Responsive.isDesktop(context) ? 0.1 : 0.2), bottom: 20, left: 20, right: 20),
      child: const Column(
        children: [
          Introduction(),
          SiteDescription(),
        ],
      ),
    );
  }
}
