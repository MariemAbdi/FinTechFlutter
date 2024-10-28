import 'package:auto_size_text/auto_size_text.dart';
import 'package:finance_website/models/statistic.dart';
import 'package:finance_website/utils/theme_style.dart';
import 'package:flutter/material.dart';

import '../../utils/data.dart';

class StatisticsColumn extends StatelessWidget {
  const StatisticsColumn({Key? key, required this.statistic, this.index = 10}) : super(key: key);

  final Statistic statistic;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: index==0 ? const EdgeInsets.only(right: 20) : index == statisticsList.length-1 ? const EdgeInsets.only(left: 20) : const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText("${statistic.number}${statistic.unit??""}", style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 30), maxLines: 1),
          AutoSizeText(statistic.description, maxLines: 3, minFontSize: 6, style: TextStyle(color: CustomStyle.primaryFontColorLight.withOpacity(0.6))),
        ],
      ),
    );
  }
}
