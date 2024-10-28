import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/constants.dart';
import '../../utils/theme_style.dart';

class Newsletter extends StatefulWidget {
  const Newsletter({Key? key}) : super(key: key);

  @override
  State<Newsletter> createState() => _NewsletterState();
}

class _NewsletterState extends State<Newsletter> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Newsletter", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
        verticalSpacing,

        const Text("Suspendisse potenti. Maecenas malesuada vulputate elit"),
        verticalSpacing,

        TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: "Enter your email",
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none, // No border to match the rounded container
            ),
            suffixIcon: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: CustomStyle.primaryColorLight, // Background color of the icon container
                borderRadius: BorderRadius.circular(5), // Rounded corners for the icon container
              ),
              child: IconButton(
                iconSize: 20,
                icon: const FaIcon(FontAwesomeIcons.paperPlane, color: Colors.white), // Icon inside the rounded container
                onPressed: () {
                  textEditingController.clear();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
