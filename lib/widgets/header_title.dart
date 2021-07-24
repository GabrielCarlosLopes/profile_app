import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, left: 32.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Find the best\n',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontSize: 28,
                  ),
            ),
            TextSpan(
              text: 'mentor',
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontSize: 28,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
