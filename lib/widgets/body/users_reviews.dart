import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:finance_website/utils/assets_paths.dart';
import 'package:finance_website/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../models/reviews.dart';
import '../../utils/data.dart';
import '../../utils/responsive.dart';
import '../../utils/theme_style.dart';
import '../utils/testimonial_arrow.dart';

class UsersReviews extends StatefulWidget {
  const UsersReviews({Key? key}) : super(key: key);

  @override
  State<UsersReviews> createState() => _UsersReviewsState();
}

class _UsersReviewsState extends State<UsersReviews> {
  CarouselSliderController carouselController = CarouselSliderController();
  int currentIndex = 0;
  bool forwardArrowHover = false, backwardArrowHover = false;
  void _setForwardArrowHover(bool isHovered) {
    setState(() {
      forwardArrowHover = isHovered;
    });
  }

  void _setBackwardArrowHover(bool isHovered) {
    setState(() {
      backwardArrowHover = isHovered;
    });
  }
  updateIndex(bool increment){
    if(increment){
      currentIndex ++;
      carouselController.nextPage();
    }else{
      currentIndex --;
      carouselController.previousPage();
    }
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: reviewsList.length,
      carouselController: carouselController,
      options: CarouselOptions(
        aspectRatio: Responsive.isDesktop(context) ? 2.8 : (Responsive.isMobile(context) ? 0.8 : 1.5), // Adjust aspect ratio for medium screens
        autoPlay: false,
        viewportFraction: 1,
        enlargeCenterPage: true,
      ),
      itemBuilder: (context, index, pageViewIndex) {
        Review review = reviewsList[index];
        return Container(
          decoration: BoxDecoration(
            color: CustomStyle.footerColorLight,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Responsive.isDesktop(context)
              ? Row( // Horizontal alignment for larger screens
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image Section
              Expanded(
                child: userImageWidget(review.photo, context),
              ),
              // Content Section
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 30, 80, 30),
                    child: reviewWidget(
                        context,
                        review,
                        Row(
                          children: [
                            MouseRegion(
                              onEnter: (_) => _setBackwardArrowHover(true),
                              onExit: (_) => _setBackwardArrowHover(false),
                              child: TestimonialArrow(
                                icon: Icons.arrow_back_ios_sharp,
                                updateIndex: index > 0 ? () => updateIndex(false) : null,
                                iconColor: index == 0 ? CustomStyle.primaryFontColorLight : Colors.white,
                                borderColor: backwardArrowHover && index > 0 ? CustomStyle.primaryColorLight : CustomStyle.primaryFontColorLight,
                                circleColor: index == 0 ? Colors.transparent : backwardArrowHover ? CustomStyle.primaryColorLight : CustomStyle.primaryFontColorLight,
                              ),
                            ),
                            MouseRegion(
                              onEnter: (_) => _setForwardArrowHover(true),
                              onExit: (_) => _setForwardArrowHover(false),
                              child: TestimonialArrow(
                                icon: Icons.arrow_forward_ios_sharp,
                                updateIndex: index != featuresDescriptions.length - 1 ? () => updateIndex(true) : null,
                                iconColor: index == featuresDescriptions.length - 1 ? CustomStyle.primaryFontColorLight : Colors.white,
                                borderColor: forwardArrowHover && index != featuresDescriptions.length - 1 ? CustomStyle.primaryColorLight : CustomStyle.primaryFontColorLight,
                                circleColor: index == featuresDescriptions.length - 1 ? Colors.transparent : forwardArrowHover ? CustomStyle.primaryColorLight : CustomStyle.primaryFontColorLight,
                              ),
                            ),
                          ],
                        )
                    )
                ),
              ),
            ],
          )
              : Column( // Vertical alignment for smaller screens
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image Section
              userImageWidget(review.photo, context),
              // Content Section
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: reviewWidget(
                        context,
                        review,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TestimonialArrow(
                              icon: Icons.arrow_back_ios_sharp,
                              updateIndex: index > 0 ? () => updateIndex(false) : null,
                              iconColor: index == 0 ? CustomStyle.primaryFontColorLight : Colors.white,
                              borderColor: CustomStyle.primaryFontColorLight,
                              circleColor: index == 0 ? Colors.transparent : CustomStyle.primaryFontColorLight,
                            ),
                            TestimonialArrow(
                              icon: Icons.arrow_forward_ios_sharp,
                              updateIndex: index != featuresDescriptions.length - 1 ? () => updateIndex(true) : null,
                              iconColor: index == featuresDescriptions.length - 1 ? CustomStyle.primaryFontColorLight : Colors.white,
                              borderColor: CustomStyle.primaryFontColorLight,
                              circleColor: index == featuresDescriptions.length - 1 ? Colors.transparent : CustomStyle.primaryFontColorLight,
                            ),
                          ],
                        )
                    )
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget userImageWidget(String image, BuildContext context){
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: FadeInImage.assetNetwork(
      image: image,
      placeholder: AssetPath.placeholderPhoto,
      fit: BoxFit.cover,
      height: Responsive.isMobile(context) ? 200 : 300, // Adjust height based on screen size
      width: double.infinity, // Ensure it fills the width
    ),
  );
}

Widget reviewWidget(BuildContext context, Review review, Widget buttonsRow){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Expanded(child: Text("Client Says", style: TextStyle(fontWeight: FontWeight.w900))),
      verticalSpacing,
      Expanded(
        flex: Responsive.isDesktop(context) ? 8 : 4,
        child: AutoSizeText.rich(
          TextSpan(
            children: [
              TextSpan(
                text: review.title,
                style: const TextStyle(fontWeight: FontWeight.w900),
              ),
              TextSpan(text: " ${review.comment}"),
            ],
          ),
          softWrap: true,
          maxLines: Responsive.isDesktop(context) ? 6 : 4,
          style: const TextStyle(
            height: 1.2,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      verticalSpacing,
      Expanded(child: Text(review.name, style: const TextStyle(fontWeight: FontWeight.w800))),
      Expanded(child: Text(review.position)),
      verticalSpacing,
      buttonsRow
    ],
  );
}