import 'package:flutter/material.dart';

import '../../utils/data.dart';

class ActiveUsers extends StatelessWidget {
  const ActiveUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            for (int i = 0; i < randomAvatars.length; i++)
              Container(
                margin: const EdgeInsets.symmetric(vertical: 0),
                child: Align(
                    widthFactor: 0.7,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage(
                          randomAvatars[i],
                        ),
                      ),
                    )),
              )
          ],
        ),
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("1.3M+", style: TextStyle(fontWeight: FontWeight.w900)),
            Text("Active Users", style: TextStyle(color: Colors.grey)),
          ],
        )
      ],
    );
  }
}
