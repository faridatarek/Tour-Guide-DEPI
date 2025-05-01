import 'package:flutter/material.dart';
import 'package:tour_guide/core/utils/text_styles.dart';
import 'package:tour_guide/core/widgets/custom_appBar.dart';

class About_us extends StatelessWidget {
  const About_us({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: CustomAppbar(title: "من نحن",onBackPressed: (){},)),
      body:  Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
                '''"السّياحه" هو تطبيق مرشد سياحي مصمم لمساعدتك على استكشاف المدن، المعالم السياحية، والتجارب المحلية بطريقة سهلة وممتعة. من خلال التطبيق، هتلاقي معلومات دقيقة ومحدثة عن أهم الأماكن السياحية، الأنشطة الترفيهية، والمطاعم والأسواق اللي تستحق الزيارة.

هدفنا هو تبسيط رحلتك، وتوفير دليل رقمي متكامل يخليك تعيش تجربة سياحية فريدة، سواء كنت مسافر لأول مرة أو بتستكشف مكان جديد في بلدك.

في "السّساحه"، نستخدم أحدث التقنيات عشان نوفّرلك:

خرائط تفاعلية ودليل خطوة بخطوة.

معلومات صوتية ومرئية عن كل موقع.

توصيات حسب اهتماماتك وموقعك الجغرافي.

دعم للغات متعددة لتجربة أكثر سلاسة.

خلّي رحلتك أذكى وأسهل مع "السّساحه"  معاك في كل خطوة!

''' ,style: TextStyles.font18LightBrown2ExtraBold,),
          ),
        ),
      ),
    );
  }
}
