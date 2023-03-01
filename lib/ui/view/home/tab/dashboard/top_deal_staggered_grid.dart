import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'image_tile.dart';

class TopDealGrid extends StatelessWidget{
  List<String?> images;
  TopDealGrid(this.images);
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 4,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context, index) {
        return Text(index.toString());
      },
    );

  }

}