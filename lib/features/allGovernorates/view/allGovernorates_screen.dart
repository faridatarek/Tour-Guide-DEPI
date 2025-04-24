import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: allGovernorates_screen(),
    );
  }
}

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
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            expandedHeight: 120,
            backgroundColor: Color.fromARGB(255, 209, 147, 12),
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('الإعدادت'),
              centerTitle: true,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                return InkWell(
                  onTap: () {},
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
