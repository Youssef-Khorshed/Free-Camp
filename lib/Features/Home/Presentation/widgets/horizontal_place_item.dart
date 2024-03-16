import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_camp/Core/util/networkimage.dart';
import 'package:flutter_application_camp/Features/Home/Domain/Entity/counteyEntity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../Core/util/constant.dart';
import '../../../../Core/util/screensize.dart';
import '../Logic/providerCountry.dart';
import 'details.dart';

class HorizontalPlaceItem extends ConsumerWidget {
  final CountryEntity place;

  HorizontalPlaceItem({required this.place});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mycubit = ref.watch(countr_cubit);
    double width = screen_width(context: context);
    double height = screen_height(context: context);
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: InkWell(
        child: Container(
          height: height,
          width: 140.0,
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CustomNetworkImage(
                  height: height / 4,
                  width: 140.0,
                  imageUrl: afiracn_countries[Random().nextInt(22)],
                ),
              ),
              SizedBox(height: 7.0),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${place.name}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 3.0),
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Icon(
                      Icons.place_outlined,
                      size: 13.0,
                      color: Colors.blueGrey[300],
                    ),
                  ),
                  // SizedBox(
                  //   width: 5,
                  // ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      "${place.capital}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0,
                        color: Colors.blueGrey[300],
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
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
