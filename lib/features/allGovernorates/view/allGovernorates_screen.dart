import 'package:flutter/material.dart';
import 'package:tour_guide/features/layout/view/widgets/custom_appBar.dart';
import 'package:tour_guide/features/places/view/places_screen.dart';

class allGovernorates_screen extends StatelessWidget {
  const allGovernorates_screen({super.key});

  final List<String> countries = const [
    'الغردقه',
    'الاقصر',
    'دهب',
    'الاسكندريه',
    'شرم الشيخ',
    'مرسي مطروح',
    'القاهره',
    'المنصوره',
  ];

  final List<String> imagePath = const [
    'assets/icons/1.jpeg',
    'assets/icons/2.jpeg',
    'assets/icons/3.jpeg',
    'assets/icons/4.jpeg',
    'assets/icons/5.jpeg',
    'assets/icons/6.jpeg',
    'assets/icons/7.jpeg',
    'assets/icons/8.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: CustomAppbar(title: "أشهر المحافظات السياحية",onBackPressed: (){},)),
      body: CustomScrollView(
        slivers: [

          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const AllPlacesScreen()));

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: AssetImage(imagePath[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(113, 255, 255, 255),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          countries[index],
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }, childCount: countries.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
