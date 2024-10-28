import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:finance_website/widgets/utils/statistics_column.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../utils/assets_paths.dart';
import '../../utils/custom_string.dart';
import '../../utils/data.dart';
import '../../utils/responsive.dart';
import '../../utils/theme_style.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  bool isVisible = false;
  updateVisibility(){
    setState(() {
      isVisible = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key("statisticsVisibility"),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.3 && !isVisible) {
          updateVisibility();
        }
      },
      child: ElasticInDown(
        animate: isVisible,
        child: Wrap(
          spacing: 100,
          runSpacing: 50,
          alignment: WrapAlignment.spaceBetween,
          runAlignment: WrapAlignment.center,
          children: [
            //------------------------------------RIGHT SIDE------------------------------------
            SizedBox(
              width: Responsive.screenWidth(context) / (Responsive.isDesktop(context) ? 2.5 : 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Embark On",
                          style: TextStyle(color: CustomStyle.primaryColorLight),
                        ),
                        TextSpan(text: " Our Carefully Crafted Roadmap To Effortlessly Achieve Your Seamless "),
                        TextSpan(
                          text: "Payment Solution",
                          style: TextStyle(color: CustomStyle.primaryColorLight),
                        ),
                      ],
                    ),
                    softWrap: true,
                    style: TextStyle(
                      height: 1.2,
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                    ),
                    maxLines: 3,
                  ),

                  const SizedBox(height: 20),

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

                  const SizedBox(height: 40),

                  Responsive.isDesktop(context)
                      ? Row(
                    children: [
                      for(int index=0; index<statisticsList.length; index++)
                        ...[Expanded(child: StatisticsColumn(statistic: statisticsList[index], index: index)),
                          if (index < statisticsList.length - 1) const SizedBox(height: 60, child: VerticalDivider(thickness: 1, color: Colors.grey)),
                        ]
                    ],
                  ) : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: statisticsList.length,
                      padding: EdgeInsets.zero,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2),
                      itemBuilder: (context, index){
                        return StatisticsColumn(statistic: statisticsList[index], index: 1);
                      })

                ],
              ),
            ),


            //------------------------------------LEFT SIDE------------------------------------
            Image.asset(AssetPath.headerMainPhoto, width: Responsive.screenWidth(context) / (Responsive.isDesktop(context) ? 3.5 : 1)),
          ],
        ),
      ),
    );
  }
}
