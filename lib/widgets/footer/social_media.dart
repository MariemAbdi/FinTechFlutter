import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/custom_string.dart';
import '../../utils/data.dart';
import '../../utils/theme_style.dart';
import '../utils/logo_row.dart';
import 'hover_icon.dart';

class SocialMedia extends StatefulWidget {
  const SocialMedia({Key? key}) : super(key: key);

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {

  Color iconColor = CustomStyle.primaryFontColorLight.withOpacity(0.6);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LogoRow(),
        verticalSpacing,

        const Text(CustomString.mainDescription, textAlign: TextAlign.justify),
        verticalSpacing,

        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for(int i=0; i<4; i++)
              HoverIcon(
                icon: socialMediaIcons[i],
                hoverColor: CustomStyle.primaryColorLight,
              ),
          ],
        )
      ],
    );
  }
}
