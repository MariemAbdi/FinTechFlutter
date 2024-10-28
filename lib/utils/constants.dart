
import 'package:finance_website/utils/theme_style.dart';
import 'package:flutter/material.dart';

import '../models/menu_item.dart';

const horizontalPadding = EdgeInsets.symmetric(horizontal: 20);
const verticalSpacing = SizedBox(height: 20);
const sourceURL = "https://www.behance.net/gallery/176383337/Fintech-Financial-SAAS-Landing-page-UI-Design";

final List<MenuItem> menuTitles = [
  MenuItem("Home", GlobalKey()),
  MenuItem("Banking", GlobalKey()),
  MenuItem("Customers", GlobalKey()),
  MenuItem("Partners", GlobalKey()),
];

final aboutCardsGradientBackground = BoxDecoration(
borderRadius: BorderRadius.circular(20),
gradient: LinearGradient(
colors: [
CustomStyle.footerColorLight,
CustomStyle.footerColorLight.withOpacity(0.8),
CustomStyle.footerColorLight.withOpacity(0.6),
],
begin: Alignment.topCenter,
end: Alignment.bottomCenter,
stops: const [0.0, 0.6, 1.0],
tileMode: TileMode.clamp),
);

final learnMoreAboutCardsButtonStyle = ButtonStyle(
  foregroundColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
    if (states.contains(MaterialState.hovered)) {
      return CustomStyle.primaryFontColorLight.withOpacity(0.8); // Return the hover text color
    }
    return CustomStyle.primaryColorLight; // Return the default text color
  }),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
    EdgeInsets.zero,
  ),
);

final embraceFutureButtonStyle = ButtonStyle(
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
  ),
  backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return CustomStyle.primaryColorLight; // Hover color
        }
        return Colors.white; // Default color
      }),
  foregroundColor:
  MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.hovered)) {
        return Colors.white; // Hover text color
      }
      return CustomStyle.primaryFontColorLight; // Default text color
    },
  ),
);