import 'package:auto_size_text/auto_size_text.dart';
import 'package:finance_website/widgets/footer/quick_links.dart';
import 'package:finance_website/widgets/footer/social_media.dart';
import 'package:flutter/material.dart';
import 'package:finance_website/utils/constants.dart';

import '../../utils/responsive.dart';
import '../../utils/theme_style.dart';
import '../../utils/utils.dart';
import 'about.dart';
import 'newsletter.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key, required this.scrollTo}) : super(key: key);

  final void Function(GlobalKey key) scrollTo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.screenWidth(context),
      color: CustomStyle.footerColorLight,
      padding: EdgeInsets.symmetric(horizontal: Responsive.screenWidth(context) * 0.1, vertical: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Responsive.isMobile(context)
              ? Column(
            children: [
              const SocialMedia(),
              verticalSpacing,
              const QuickLinks(),
              verticalSpacing,
              About(scrollTo: scrollTo),
              verticalSpacing,
              const Newsletter()
            ],
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(flex: 4, child: SocialMedia()),
              const Spacer(),
              const Expanded(flex: 3, child: QuickLinks()),
              Expanded(flex: 3, child: About(scrollTo: scrollTo)),
              const Expanded(flex: 4, child: Newsletter()),
            ],
          ),
          //----------------------------------------------------COPYRIGHT ROW----------------------------------------------------
          const Divider(color: Colors.grey, thickness: 0.5),
          const TextButton(
              onPressed: openUrl,
              child: AutoSizeText("Inspired From This Design", maxLines: 1)),
        ],
      )
    );
  }
}
