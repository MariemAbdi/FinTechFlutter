import 'package:finance_website/widgets/body/embrace_future.dart';
import 'package:finance_website/widgets/body/learn_more_about_cards.dart';
import 'package:finance_website/widgets/body/partners_list.dart';
import 'package:flutter/material.dart';
import '../../utils/responsive.dart';

class Partners extends StatefulWidget {
  const Partners({Key? key}) : super(key: key);

  @override
  State<Partners> createState() => _PartnersState();
}

class _PartnersState extends State<Partners> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.screenWidth(context) / (Responsive.isDesktop(context) ? 1.2 : 1),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: const Column(
        children: [
          PartnersList(),
          LearnMoreAboutCards(),
          EmbraceFuture()
        ],
      ),
    );
  }
}
