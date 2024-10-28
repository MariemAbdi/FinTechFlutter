import 'package:flutter/material.dart';

import '../../models/text_item.dart';
import '../../utils/assets_paths.dart';
import '../../utils/responsive.dart';
import '../../utils/theme_style.dart';
import '../utils/circular_text.dart';

class LearnMoreCardImage extends StatelessWidget {
  const LearnMoreCardImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(Responsive.isMobile(context) ? 5 : 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(220),
              color: CustomStyle.primaryColorLight,
              image: const DecorationImage(
                  image: AssetImage(AssetPath.debitBackgroundPhoto),
                  fit: BoxFit.cover
              )
          ),
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.all(Responsive.isMobile(context) ? 5 : 30),
                  padding: EdgeInsets.all(Responsive.isMobile(context) ? 5 : 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    color: CustomStyle.primaryFontColorLight,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularText(
                          children: [
                            TextItem(
                                text: Text("Learn More About Cards", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: Responsive.isDesktop(context) ? 20 : 14), maxLines: 1),
                                space: 16,
                                startAngle: 90
                            )
                          ],
                          radius: Responsive.isMobile(context) ? 50 : 100
                      ),

                      Image.asset(AssetPath.fireworkIcon, width: MediaQuery.of(context).size.width/25)
                    ],
                  )),
            ],
          ),
        ),

        Positioned(
            right: Responsive.isDesktop(context) ? 100 : Responsive.isMobile(context) ? 10 : 80,
            bottom: Responsive.isTablet(context) ? 20 : 40,
            child: Image.asset(AssetPath.debitCardsPhoto, width: Responsive.screenWidth(context) * (Responsive.isMobile(context) ? 0.46 : 0.42)))
      ],
    );
  }
}
