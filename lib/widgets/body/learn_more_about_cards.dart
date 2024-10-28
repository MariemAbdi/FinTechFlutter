import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:finance_website/widgets/body/learn_more_card_image.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../utils/constants.dart';
import '../../utils/custom_string.dart';
import '../../utils/responsive.dart';
import '../../utils/theme_style.dart';

class LearnMoreAboutCards extends StatefulWidget {
  const LearnMoreAboutCards({Key? key}) : super(key: key);

  @override
  State<LearnMoreAboutCards> createState() => LearnMoreAboutCardsState();
}

class LearnMoreAboutCardsState extends State<LearnMoreAboutCards>{
  bool isVisible = false;
  updateVisibility(){
    setState(() {
      isVisible = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key("learnMoreCardsVisibility"),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.3 && !isVisible) {
          updateVisibility();
        }
      },
      child: FadeInRight(
        animate: isVisible,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 40),
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: Responsive.isMobile(context) ? 20 : 30),
          decoration: aboutCardsGradientBackground,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AutoSizeText(CustomString.debitTitle, maxLines: 3, style: TextStyle(fontSize: 45, fontWeight: FontWeight.w900)),
              verticalSpacing,

              SizedBox(
                  width: Responsive.screenWidth(context) / (Responsive.isMobile(context) ? 1 : 3),
                  child: AutoSizeText(CustomString.secondaryDescription, maxLines: 4, style: TextStyle(color: CustomStyle.primaryFontColorLight.withOpacity(0.6), fontSize: 16), minFontSize: 8)),
              verticalSpacing,

              TextButton(
                  onPressed: (){},
                  style: learnMoreAboutCardsButtonStyle,
                  child: const AutoSizeText("Learn More About Cards", maxLines: 1, style: TextStyle(fontWeight: FontWeight.w900))),
              SizedBox(height: Responsive.isMobile(context) ? 50 : 100),


              const LearnMoreCardImage()
            ],
          ),
        ),
      ),
    );
  }

}
