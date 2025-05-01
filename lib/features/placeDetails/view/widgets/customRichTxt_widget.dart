import 'package:flutter/material.dart';
import 'package:tour_guide/core/utils/text_styles.dart';

class CustomRichTextWidget extends StatelessWidget {
  final String title;
  final String value;

  const CustomRichTextWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: RichText(
        text: TextSpan(
          text: '$title : ',
          style: TextStyles.font18BrownBold,
          children: <TextSpan>[
            TextSpan(
              text: value,
              style: TextStyles.font18BrownMedium,
            ),
          ],
        ),
      ),
    );
  }
}