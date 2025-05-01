import 'package:flutter/material.dart';
import 'package:tour_guide/core/utils/color_manager.dart';
import 'package:tour_guide/features/home/data/models/gov_model.dart';
import 'package:tour_guide/features/home/view/widgets/promote_places.dart';
import 'package:tour_guide/core/widgets/custom_appBar.dart';
import 'package:tour_guide/features/places/view/places_screen.dart';

class allGovernorates_screen extends StatelessWidget {
  const allGovernorates_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: CustomAppbar(
          title: "كل المحافظات السياحية",
          onBackPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<GovModel>>(
        future: fetchGovernorates(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: ColorManager.darkOrangeColor,));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('لا توجد بيانات'));
          }

          final items = snapshot.data!;

          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(8),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      final item = items[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllPlacesScreen(governorate: item.name),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              image: NetworkImage(item.image),
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
                                item.name,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: items.length,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 30,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
