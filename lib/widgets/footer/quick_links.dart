import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/data.dart';

class QuickLinks extends StatelessWidget {
  const QuickLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Quick Links", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
        verticalSpacing,
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: quickLinks.length,
            itemBuilder: (context, index){
              return TextButton(
                  onPressed: (){},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.zero,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Ensures text aligns to the start
                    children: [
                      Flexible(child: Text(quickLinks[index], style: const TextStyle(fontWeight: FontWeight.normal) )),
                    ],
                  )
              );
            })
      ],
    );
  }
}
