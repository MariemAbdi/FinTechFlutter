import 'package:finance_website/models/description.dart';
import 'package:finance_website/models/feature.dart';
import 'package:finance_website/models/statistic.dart';
import 'package:finance_website/utils/assets_paths.dart';
import 'package:finance_website/utils/custom_string.dart';
import 'package:finance_website/utils/theme_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/reviews.dart';

List randomAvatars = [
  'https://cdn.pixabay.com/photo/2016/11/29/13/14/attractive-1869761_1280.jpg',
  'https://cdn.pixabay.com/photo/2019/04/12/21/19/man-4123268_640.jpg',
  'https://cdn.pixabay.com/photo/2016/11/18/15/03/man-1835195_640.jpg',
  'https://cdn.pixabay.com/photo/2016/11/21/12/42/beard-1845166_640.jpg'
];

final List<Description> descriptionsList = [
  Description(title: "User Friendly", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras condimentum, massa eu lobortis facilisis, elit nibh fermentum felis, et convallis odio sapien efficitur enim.", icon: Icons.supervised_user_circle),
  Description(title: "24/7 Support", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras condimentum, massa eu lobortis facilisis, elit nibh fermentum felis, et convallis odio sapien efficitur enim.", icon: Icons.support_agent),
  Description(title: "Best Security", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras condimentum, massa eu lobortis facilisis, elit nibh fermentum felis, et convallis odio sapien efficitur enim.", icon: Icons.security),
];

final List<String> featuresDescriptions=[
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras condimentum, massa eu lobortis facilisis, elit nibh fermentum felis, et convallis odio sapien efficitur enim. Suspendisse iaculis nibh leo, id lacinia sapien tempus at. Sed ut dictum arcu.",
  "Aenean ornare vehicula risus vitae accumsan. Suspendisse vitae iaculis nunc. Suspendisse vehicula luctus felis, id blandit ex ullamcorper eget. Duis eget orci est.",
  "Suspendisse potenti. Maecenas malesuada vulputate elit, at mollis urna. Cras congue ex tortor, eu scelerisque nisl cursus at. Nulla tristique urna arcu. Quisque placerat nisl a bibendum laoreet. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed at magna non mauris euismod ultrices eget id lectus."
];

final List<Feature> featuresList = [
  Feature(title: "Seamless Digital Payments", description: CustomString.mainDescription, icon: AssetPath.digitalPaymentIcon, primaryColor: CustomStyle.footerColorLight, secondaryColor: CustomStyle.primaryColorLight),
  Feature(title: "Simplified Loan Management", description: CustomString.mainDescription, icon: AssetPath.loanManagementIcon, primaryColor: const Color(0xFFf0f6fe), secondaryColor: const Color(0xFF5ca7fe)),
  Feature(title: "Financial Goal Tracking", description: CustomString.mainDescription, icon: AssetPath.goalTrackingIcon, primaryColor: const Color(0xFFfffbec), secondaryColor: const Color(0xFFb58d0b)),
  Feature(title: "Open Banking Integration", description: CustomString.mainDescription, icon: AssetPath.bankingIntegrationIcon, primaryColor: const Color(0xFFffebf5), secondaryColor: const Color(0xFFff096f)),
];

final List<String> quickLinks=["Browse FinanceTime","Browse FinTech","Registrations"];

final List<IconData> socialMediaIcons=[
  FontAwesomeIcons.facebookF,
  FontAwesomeIcons.youtube,
  FontAwesomeIcons.twitter,
  FontAwesomeIcons.instagram,
];

final List<Review> reviewsList = [
  Review(
    name: "Alex Pandalama",
    position: "CEO, Ballus Industries",
    photo: "https://cdn.pixabay.com/photo/2022/07/04/04/37/musician-7300353_640.jpg",
    comment: "and its promise to simplify users' financial lives, I couldn't resist signing up - and it turned out to be the best decision I've ever made.",
    title: "After learning about Finance",
  ),
  Review(
    name: "Sarah Green",
    position: "Marketing Director, GreenTech",
    photo: "https://cdn.pixabay.com/photo/2024/06/28/18/47/business-8859960_640.jpg",
    comment: "Finance has completely transformed the way we manage our investments. The intuitive interface and robust features are unmatched.",
    title: "A Game Changer in Finance!",
  ),
  Review(
    name: "John Doe",
    position: "Entrepreneur",
    photo: "https://cdn.pixabay.com/photo/2024/01/10/16/22/engineer-8499949_640.jpg",
    comment: "As a small business owner, Finance has given me the tools I need to keep track of my finances effortlessly. Highly recommended!",
    title: "The Best Tool for Small Businesses.",
  )
];

final List<Statistic> statisticsList = [
  Statistic(number: 95, description: "Lorem ipsum dolor sit amet", unit: "%"),
  Statistic(number: 25, description: "Lorem ipsum dolor sit amet"),
  Statistic(number: 40, description: "Lorem ipsum dolor sit amet", unit: "%"),
  Statistic(number: 2, description: "Lorem ipsum dolor sit amet", unit: "M"),
];

final List<String> sponsorsList = [
  "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Amazon_logo.svg/2560px-Amazon_logo.svg.png",
  "https://wwwmarketing.scdn.co/img/structured-data/logo.png",
  "https://www.openbanking.org.uk/wp-content/uploads/PayPal_Logo_Horizontal_Full_Color_RGB-002-1.png",
  "https://raw.githubusercontent.com/stripe/stripe-android/master/assets/stripe_logo_slate_small.png",
  "https://cdn.logojoy.com/wp-content/uploads/20230801145635/Google_logo_2013-2015-600x206.png",
  "https://wisperisp.com/wp-content/uploads/Meta-Logo-1.png",
];