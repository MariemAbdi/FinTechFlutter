import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../utils/data.dart';

class DescriptionTitle extends StatelessWidget {
  const DescriptionTitle({Key? key, required this.index}) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          descriptionsList[index].title,
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 5),
        AutoSizeText(
          descriptionsList[index].description,
          softWrap: true,
          style: const TextStyle(height: 1.2),
        ),
      ],
    );
  }
}
