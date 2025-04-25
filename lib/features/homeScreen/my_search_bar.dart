import 'package:flutter/material.dart';

import '../../core/utils/color_manager.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 75),
        child: TextFormField(
          onChanged: (value) {},
          decoration: InputDecoration(
            hintText: 'ابحث هنا...',
            hintStyle: const TextStyle(color: ColorManager.brownColor),
            prefixIcon: const Icon(
              Icons.search,
              color: ColorManager.brownColor,
            ),
            filled: true,
            fillColor: Colors.white.withAlpha(200),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
