import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:finance_website/widgets/header/description_list.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../utils/constants.dart';
import '../../utils/theme_style.dart';
import '../../utils/assets_paths.dart';
import '../../utils/custom_string.dart';
import '../../utils/responsive.dart';

class SiteDescription extends StatefulWidget {
  const SiteDescription({Key? key}) : super(key: key);

  @override
  State<SiteDescription> createState() => _SiteDescriptionState();
}

class _SiteDescriptionState extends State<SiteDescription> {
  bool isVisible =  false;
  updateVisibility(){
    setState(() {
      isVisible = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key("siteDescription"),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.2 && !isVisible) {
          updateVisibility();
        }
      },
      child: BounceInUp(
        animate: isVisible,
        child: Wrap(
          spacing: 50,
          runSpacing: 50,
          alignment: WrapAlignment.spaceBetween,
          runAlignment: WrapAlignment.center,
          children: [
            //------------------------------------RIGHT SIDE(IF DESKTOP ELSE BOTTOM)------------------------------------
            if(Responsive.isDesktop(context))
              FadeInImage.assetNetwork(
                  image: AssetPath.headerSecondaryPhoto,
                  placeholder: AssetPath.placeholderPhoto,
                  width: Responsive.screenWidth(context) / (Responsive.isDesktop(context) ? 3 : 1)
              ),

            //------------------------------------LEFT SIDE------------------------------------
            SizedBox(
              width: Responsive.screenWidth(context) / (Responsive.isDesktop(context) ? 2.3 : 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: "Take"),
                        TextSpan(
                          text: " Control of Everything ",
                          style: TextStyle(color: CustomStyle.primaryColorLight),
                        ),
                        TextSpan(text: "in Your Hands."),
                      ],
                    ),
                    softWrap: true,
                    style: TextStyle(
                      height: 1.2,
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                    ),
                    maxLines: 2,
                  ),

                  verticalSpacing,

                  AutoSizeText(
                    CustomString.secondaryDescription,
                    style: TextStyle(
                      height: 1,
                      color: CustomStyle.primaryFontColorLight.withOpacity(0.6),
                    ),
                    softWrap: true,
                    maxLines: Responsive.isDesktop(context) ? 3 : 5,
                    minFontSize: 8,
                  ),


                  const DescriptionList(),
                ],
              ),
            ),

            //------------------------------------RIGHT SIDE(IF DESKTOP ELSE BOTTOM)------------------------------------
            if(!Responsive.isDesktop(context))
              FadeInImage.assetNetwork(
                  image: AssetPath.headerSecondaryPhoto,
                  placeholder: AssetPath.placeholderPhoto,
                  width: Responsive.screenWidth(context) / (Responsive.isDesktop(context) ? 3 : 1)
              ),

          ],
        ),
      ),
    );
  }
}
