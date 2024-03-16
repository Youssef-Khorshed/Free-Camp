import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_camp/Core/util/screensize.dart';

import '../../../../Core/util/constant.dart';
import '../../Domain/Entity/counteyEntity.dart';
import 'details.dart';

class VerticalPlaceItem extends StatelessWidget {
  final CountryEntity place;

  VerticalPlaceItem({required this.place});

  @override
  Widget build(BuildContext context) {
    double width = screen_width(context: context);
    double height = screen_height(context: context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: InkWell(
        child: Container(
          height: height / 8,
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  afiracn_countries[Random().nextInt(22)],
                  height: height / 10,
                  width: height / 10,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 15.0),
              // Container(
              //   height: 80.0,
              //   width: width - 130.0,
              //   child: ListView(
              //     primary: false,
              //     physics: NeverScrollableScrollPhysics(),
              //     shrinkWrap: true,
              //     children: <Widget>[
              //       Container(
              //         alignment: Alignment.centerLeft,
              //         child: Text(
              //           place.name,
              //           style: TextStyle(
              //             fontWeight: FontWeight.w700,
              //             fontSize: 14.0,
              //           ),
              //           maxLines: 2,
              //           textAlign: TextAlign.left,
              //         ),
              //       ),
              //       SizedBox(height: 3.0),
              //       Row(
              //         children: <Widget>[
              //           Icon(
              //             Icons.location_on,
              //             size: 13.0,
              //             color: Colors.blueGrey[300],
              //           ),
              //           SizedBox(width: 3.0),
              //           Container(
              //             alignment: Alignment.centerLeft,
              //             child: Text(
              //               "${place.capital}",
              //               style: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 13.0,
              //                 color: Colors.blueGrey[300],
              //               ),
              //               maxLines: 1,
              //               textAlign: TextAlign.left,
              //             ),
              //           ),
              //         ],
              //       ),
              //       SizedBox(height: 10.0),
              //       Row(
              //         children: [
              //           Icon(
              //             Icons.attach_money_rounded,
              //             size: 13.0,
              //             color: Colors.blueGrey[300],
              //           ),
              //           SizedBox(width: 3.0),
              //           Container(
              //             alignment: Alignment.centerLeft,
              //             child: Text(
              //               "${place.currency}",
              //               style: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 16.0,
              //               ),
              //               maxLines: 1,
              //               textAlign: TextAlign.left,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return Details(
                  place: place,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
