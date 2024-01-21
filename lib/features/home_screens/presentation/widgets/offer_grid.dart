import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';

class MyGridView extends StatelessWidget {
  final List<GridItem> items;

  const MyGridView({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      childAspectRatio: 1,
      children: items.map((item) {
        return Container(
          color: AppColors.onboardingBackgroundColor,
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(item.imagePath, width: 80),
              Text(item.text1),
              Text(item.text2),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class GridItem {
  final String imagePath;
  final String text1;
  final String text2;

  const GridItem(this.imagePath, this.text1, this.text2);
}

final List<GridItem> items = [
  const GridItem('assets/image1.png', 'Text 1.1', 'Text 1.2'),
  const GridItem('assets/image2.png', 'Text 2.1', 'Text 2.2'),
  const GridItem('assets/image1.png', 'Text 1.1', 'Text 1.2'),
  const GridItem('assets/image1.png', 'Text 1.1', 'Text 1.2'),

];

