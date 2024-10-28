import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class About extends StatelessWidget {
  const About({Key? key, required this.scrollTo}) : super(key: key);

  final void Function(GlobalKey key) scrollTo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("About", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
        verticalSpacing,
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: menuTitles.length,
            itemBuilder: (context, index){
              return TextButton(
                  onPressed: ()=>scrollTo(menuTitles[index].key),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.zero,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(child: Text(menuTitles[index].title, style: const TextStyle(fontWeight: FontWeight.normal))),
                    ],
                  )
              );
            })
      ],
    );
  }
}
