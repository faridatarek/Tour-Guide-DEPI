import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/core/utils/text_styles.dart';
import 'package:tour_guide/features/settings/%D9%90About_us.dart';
import 'package:tour_guide/features/settings/view/Terms_And_Conditions.dart';
import 'package:tour_guide/features/settings/view/support.dart';


import '../../../../core/widgets/custom_appBar.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _Page2State();
}

class _Page2State extends State<SettingsScreen> {
  bool _switchLanguageValue = false;
  bool notifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: CustomAppbar(title: "الأعدادات",)),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),
            SwitchListTile(
              value: _switchLanguageValue,
              title:  Text('اللغة',style: TextStyles.font18LightBrown2ExtraBold,),
              trackColor: WidgetStateProperty.all(_switchLanguageValue?ColorManager.darkOrangeColor:Colors.grey),
              thumbColor: WidgetStateProperty.all(Colors.white),
              trackOutlineColor: WidgetStateProperty.all(_switchLanguageValue?ColorManager.darkOrangeColor:Colors.grey),
              thumbIcon: WidgetStateProperty.all(
                Icon(Icons.circle, color: _switchLanguageValue?ColorManager.darkOrangeColor:Colors.grey),
              ),
              onChanged: (value) {
                setState(() {
                  _switchLanguageValue = value;
                });
              },
            ),
            SizedBox(height: 15.h),
            SwitchListTile(
              value: notifications,
              title:  Text('الأشعارات',style: TextStyles.font18LightBrown2ExtraBold,),
              trackColor: WidgetStateProperty.all(notifications?ColorManager.darkOrangeColor:Colors.grey),
              thumbColor: WidgetStateProperty.all(Colors.white),
              trackOutlineColor: WidgetStateProperty.all(notifications?ColorManager.darkOrangeColor:Colors.grey),
              thumbIcon: WidgetStateProperty.all(
                Icon(Icons.circle, color: notifications?ColorManager.darkOrangeColor:Colors.grey),
              ),
              onChanged: (value) {
                setState(() {
                  notifications = value;
                });
              },
            ),
            SizedBox(height: 25.h),
            _buildButton(
              text: 'من نحن',

              icon: const Icon(
                Icons.ads_click_sharp,
                color: Colors.deepOrangeAccent,
              ),
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const About_us()),
                );
              },
            ),
             SizedBox(height: 25.h),
            _buildButton(
              text: 'الدعم',
              icon: const Icon(Icons.support_outlined, color: Colors.green),
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const support()),
                );
              },
            ),
            SizedBox(height: 25.h),
            _buildButton(
              text: 'الشروط والأحكام',
              icon: const Icon(Icons.warning, color: Colors.deepOrangeAccent),
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TermsAndConditions(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required Widget icon,
    required VoidCallback onPress,
  }) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 16, top: 8),
        child: Row(children: [icon, const SizedBox(width: 8), Text(text,style: TextStyles.font18LightBrown2ExtraBold,)]),
      ),
    );
  }
}
