import 'package:flutter/material.dart';
import 'package:jump_q/models/dashboard/service_grid_model.dart';

class ServicesCard extends StatelessWidget {

  const ServicesCard({Key? key, required this.data}) : super(key: key);
  final ServicesGridModel data;

  @override
  Widget build(BuildContext context) {

    return Center(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InkWell(child: ClipRRect(
                 borderRadius: BorderRadius.circular(100.0),
                 child: Image.network(
                   data.icon,

                 ),
               ),onTap: (){},),
              const SizedBox(height: 10,),
              Text(data.title, style: const TextStyle(fontWeight: FontWeight.w100,fontSize: 14)),
            ]


    ));
  }
}