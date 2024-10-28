import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:finance_website/widgets/body/users_reviews.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../utils/constants.dart';
import '../../utils/responsive.dart';
import '../../utils/theme_style.dart';

class Testimonials extends StatefulWidget {
  const Testimonials({Key? key}) : super(key: key);

  @override
  State<Testimonials> createState() => _TestimonialsState();
}

class _TestimonialsState extends State<Testimonials> {
  bool isVisible = false;

  updateVisibility(){
    setState(() {
      isVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key("testimonialsVisibility"),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.3 && !isVisible) {
          updateVisibility();
        }
      },
      child: FadeInDown(
        animate: isVisible,
        child: Container(
          width: Responsive.screenWidth(context) / (Responsive.isDesktop(context) ? 1.2 : 1),
          padding: horizontalPadding,
          child: Column(
            children: [
              Text("Testimonials".toUpperCase(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              verticalSpacing,
              const AutoSizeText.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "What"),
                    TextSpan(
                      text: " Our Customers ",
                      style: TextStyle(color: CustomStyle.primaryColorLight),
                    ),
                    TextSpan(text: "Are Saying"),
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
              const SizedBox(height: 40),
              const UsersReviews()
            ],
          ),
        ),
      ),
    );
  }
}
