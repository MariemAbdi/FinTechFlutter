import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:finance_website/utils/constants.dart';
import 'package:finance_website/widgets/header/active_users.dart';
import 'package:finance_website/widgets/header/learn_discover_buttons.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../utils/assets_paths.dart';
import '../../utils/custom_string.dart';
import '../../utils/responsive.dart';
import '../../utils/theme_style.dart';

class Introduction extends StatefulWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  IntroductionState createState() => IntroductionState();
}

class IntroductionState extends State<Introduction> {

  bool isVisible =  false;
  
  updateVisibility(){
    setState(() {
      isVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key("introductionSection"),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.3 && !isVisible) {
          updateVisibility();
        }
      },
      child: FadeInRight(
        animate: isVisible,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: Wrap(
            runSpacing: 80,
            alignment: WrapAlignment.spaceBetween,
            runAlignment: WrapAlignment.center,
            children: [
              //------------------------------------LEFT SIDE------------------------------------
              SizedBox(
                width: Responsive.screenWidth(context) / (Responsive.isDesktop(context) ? 3 : 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //------------------------------------ACTIVE USERS------------------------------------
                    const ActiveUsers(),
                    verticalSpacing,

                    //------------------------------------HEADER TEXT------------------------------------
                    const FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Transforming',
                        style: TextStyle(height: 1.1, fontSize: 90, fontWeight: FontWeight.w900,color: CustomStyle.primaryColorLight),
                      ),
                    ),

                    Text.rich(
                      TextSpan(
                        children: [
                        WidgetSpan(
                        alignment: PlaceholderAlignment.middle, // Center the image vertically
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Finance ",
                                style: TextStyle(height: 1, fontSize: 90, fontWeight: FontWeight.w900),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  AssetPath.moneyJarPhoto,
                                  height: 65, // Base height
                                  width: 180, // Base width
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        )],
                      ),
                      maxLines: 1,
                    ),

                    const FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'with Fintech',
                        style: TextStyle(height: 1.1, fontSize: 90, fontWeight: FontWeight.w900),
                      ),
                    ),

                    verticalSpacing,

                    SizedBox(
                      width: Responsive.screenWidth(context) / (Responsive.isDesktop(context) ? 3.5: 1.2),
                      child: AutoSizeText(
                        CustomString.mainDescription,
                        style: TextStyle(fontSize: 16, height: 1, color: CustomStyle.primaryFontColorLight.withOpacity(0.6)),
                        softWrap: true,
                        maxLines: Responsive.isDesktop(context) ? 3 : 5,
                        minFontSize: 8,
                      ),
                    ),

                    verticalSpacing,

                    //------------------------------------LEARN MORE & DISCOVER BUTTONS------------------------------------
                    const LearnDiscoverButtons(),


                  ]
                ),
              ),

              //------------------------------------RIGHT SIDE------------------------------------
              Image.asset(AssetPath.headerMainPhoto, width: Responsive.screenWidth(context) / (Responsive.isDesktop(context) ? 2.3 : 1)),
            ],
          ),
        ),
      ),
    );
  }
}
