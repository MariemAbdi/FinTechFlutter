import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../utils/constants.dart';
import '../../utils/custom_string.dart';
import '../../utils/data.dart';
import '../../utils/responsive.dart';
import '../../utils/theme_style.dart';

class FeaturesRow extends StatefulWidget {
  const FeaturesRow({Key? key}) : super(key: key);

  @override
  State<FeaturesRow> createState() => _FeaturesRowState();
}

class _FeaturesRowState extends State<FeaturesRow> {
  bool isVisible = false;
  int index = 0;
  updateVisibility(){
    setState(() {
      isVisible = true;
    });
  }
  updateIndex(bool increment){
    if(increment){
      index ++;
    }else{
      index --;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key("featuresRowVisibility"),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.3 && !isVisible) {
          updateVisibility();
        }
      },
      child: SlideInLeft(
        animate: isVisible,
        child: Wrap(
          runSpacing: 30,
          alignment: WrapAlignment.spaceBetween,
          runAlignment: WrapAlignment.center,
          children: [
            Container(
                width: Responsive.screenWidth(context) / (Responsive.isDesktop(context) ? 2.5 : 1),
                padding: Responsive.isDesktop(context) ? horizontalPadding : null,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Amazing ",
                            style: TextStyle(color: CustomStyle.primaryColorLight),
                          ),
                          TextSpan(text: "Features"),
                        ],
                      ),
                      softWrap: true,
                      style: TextStyle(
                        height: 1.2,
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                      ),
                      maxLines: 1,
                    ),

                    verticalSpacing,
                    Text(CustomString.featuresDescription, style: TextStyle(color: CustomStyle.primaryFontColorLight.withOpacity(0.6)))
                  ],
                )
            ),
            Container(
                width: Responsive.screenWidth(context) / (Responsive.isDesktop(context) ? 2.5 : 1),
                padding: Responsive.isDesktop(context) ? horizontalPadding : null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(featuresDescriptions[index], style: TextStyle(color: CustomStyle.primaryFontColorLight.withOpacity(0.6))),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          margin: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            color: Colors.transparent, // Transparent background
                            border: Border.all(color: index == 0 ? CustomStyle.primaryFontColorLight.withOpacity(0.6)  : CustomStyle.primaryColorLight, width: 1), // Black border
                            borderRadius: BorderRadius.circular(100), // Rounded corners
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back_ios_sharp),
                            iconSize: 20,
                            color: index == 0 ? CustomStyle.primaryFontColorLight.withOpacity(0.6) : CustomStyle.primaryColorLight, // Icon color
                            onPressed: index > 0 ? ()=>updateIndex(false) : null,
                            padding: EdgeInsets.zero, // Remove padding from IconButton
                            constraints: const BoxConstraints(), // Remove default constraints
                          ),
                        ),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.transparent, // Transparent background
                            border: Border.all(color: index == featuresDescriptions.length-1 ? CustomStyle.primaryFontColorLight.withOpacity(0.6) : CustomStyle.primaryColorLight, width: 1), // Black border
                            borderRadius: BorderRadius.circular(100), // Rounded corners
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_forward_ios_sharp),
                            iconSize: 20,
                            color: index == featuresDescriptions.length-1 ? CustomStyle.primaryFontColorLight.withOpacity(0.6) : CustomStyle.primaryColorLight,
                            onPressed: index != featuresDescriptions.length-1 ? ()=>updateIndex(true) : null,
                            padding: EdgeInsets.zero, // Remove padding from IconButton
                            constraints: const BoxConstraints(), // Remove default constraints
                          ),
                        ),
                      ],
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
