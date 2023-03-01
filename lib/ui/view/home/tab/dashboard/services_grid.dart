import 'package:flutter/material.dart';
import 'package:jump_q/models/dashboard/service_grid_model.dart';

import 'services_card.dart';

class ServicesGrid extends StatelessWidget {
  List<ServicesGridModel> servicesGridModelList;

  ServicesGrid(this.servicesGridModelList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 8.0,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(servicesGridModelList.length, (index) {
          return Center(
              child: ServicesCard(data: servicesGridModelList[index]));
        }));
  }}
