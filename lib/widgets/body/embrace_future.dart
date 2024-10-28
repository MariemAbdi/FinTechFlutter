import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../utils/assets_paths.dart';
import '../../utils/constants.dart';
import '../../utils/responsive.dart';
import '../../utils/theme_style.dart';
import '../utils/custom_positioned_image.dart';

class EmbraceFuture extends StatefulWidget {
  const EmbraceFuture({Key? key}) : super(key: key);

  @override
  EmbraceFutureState createState() => EmbraceFutureState();
}

class EmbraceFutureState extends State<EmbraceFuture> {
  bool isVisible = false;
  updateVisibility(){
    setState(() {
      isVisible = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key("embraceFutureVisibility"),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.3 && !isVisible) {
          updateVisibility();
        }
      },
      child: BounceInDown(
        animate: isVisible,
        child: Stack(
          clipBehavior: Clip.none, // Allow overflowing widgets to be visible
          children: [
            Container(
              decoration: BoxDecoration(
                color: CustomStyle.primaryFontColorLight,
                borderRadius: BorderRadius.circular(50),
              ),
              padding: EdgeInsets.symmetric(
                vertical: Responsive.screenWidth(context) * 0.05,
                horizontal: Responsive.screenWidth(context) * (Responsive.isDesktop(context) ? 0.2 : 0.1),
              ),
              child: Column(
                children: [
                  const AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: "Embrace A Brighter Financial Future With Fintech, "),
                        TextSpan(
                          text: "Starting Today!",
                          style: TextStyle(color: CustomStyle.primaryColorLight),
                        ),
                      ],
                    ),
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.2,
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                    maxLines: 3,
                  ),
                  verticalSpacing,
                  const AutoSizeText(
                    "Welcome to our fintech platform, we revolutionize your fintech journey! Our cutting-edge fintech solutions are what you're searching for.",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),
                  verticalSpacing,
                  ElevatedButton(
                    onPressed: () {},
                    style: embraceFutureButtonStyle,
                    child: const FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text("Try Finance Now",
                          maxLines: 1,
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    ),
                  )
                ],
              ),
            ),
            // Positioned elements remain unchanged
            CustomPositionedImage(
              top: Responsive.isDesktop(context) ? -30 : -5,
              right: Responsive.isDesktop(context) ? -30 : -5,
              assetPath: AssetPath.flowerIcon,
              widthFactor: Responsive.isDesktop(context) ? 0.06 : 0.1,
            ),
            CustomPositionedImage(
              left: Responsive.isDesktop(context) ? 50 : 30,
              bottom: Responsive.isDesktop(context) ? 50 : 30,
              assetPath: AssetPath.starIcon,
              widthFactor: Responsive.isDesktop(context) ? 0.03 : 0.05,
              opacity: 0.5,
            ),
            CustomPositionedImage(
              right: Responsive.isDesktop(context) ? 100 : 20,
              top: Responsive.isDesktop(context) ? 70 : 40,
              assetPath: AssetPath.starIcon,
              widthFactor: Responsive.isDesktop(context) ? 0.03 : 0.05,
              opacity: 0.5,
            ),
            CustomPositionedImage(
              right: Responsive.isDesktop(context) ? 20 : 20,
              bottom: Responsive.isDesktop(context) ? 20 : 20,
              assetPath: AssetPath.shapeIcon,
              widthFactor: Responsive.isDesktop(context) ? 0.08 : 0.08,
            ),
            CustomPositionedImage(
              left: Responsive.isDesktop(context) ? 20 : 20,
              top: Responsive.isDesktop(context) ? 20 : 20,
              assetPath: AssetPath.shapeIcon,
              widthFactor: Responsive.isDesktop(context) ? 0.08 : 0.08,
            ),

          ],
        ),
      ),
    );
  }
}
