import 'package:flutter/material.dart';

import '../../utils/responsive.dart';

class LearnDiscoverButtons extends StatelessWidget {
  const LearnDiscoverButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = (Responsive.screenWidth(context) / 1.2)/2;
    return Wrap(
      spacing: 20,
      runSpacing: 5,
      children: [
        SizedBox(
          width: Responsive.isMobile(context) ? Responsive.screenWidth(context) : Responsive.isTablet(context) ? Responsive.screenWidth(context)/3 : width/3,
          child: ElevatedButton(
            child: const Text("Learn More"),
            onPressed: () {},
          ),
        ),
        SizedBox(
          width:Responsive.isMobile(context) ? Responsive.screenWidth(context) : Responsive.isTablet(context) ? Responsive.screenWidth(context)/3 : width/3,
          child: OutlinedButton(
            child: const Text("Discover More"),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
