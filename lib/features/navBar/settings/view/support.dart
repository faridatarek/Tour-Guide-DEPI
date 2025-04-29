import 'package:flutter/material.dart';
import 'package:tour_guide/core/utils/text_styles.dart';
import 'package:tour_guide/features/layout/view/widgets/custom_appBar.dart';

class support extends StatelessWidget {
  const support({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: CustomAppbar(title: "الدعم",onBackPressed: (){},)),
      body:  Padding(
        padding: EdgeInsets.all(16),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Text(
              '''يمكنك التواصل معنا من خلال الارقام الشات الخاص بنا او عن طريق  الارقام الموضحه  
        011234567890''' ,style: TextStyles.font18LightBrown2ExtraBold,),
        ),
      ),
    );
  }
}
