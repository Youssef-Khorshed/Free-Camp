import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_camp/Core/util/constant.dart';
import 'package:flutter_application_camp/Core/util/readmore.dart';
import 'package:flutter_application_camp/Features/Home/Data/Model/countryModel.dart';
import 'package:flutter_application_camp/Features/Travel/flights.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../Core/util/places.dart';
import '../../Domain/Entity/counteyEntity.dart';
import '../Logic/providerCountry.dart';
import 'icon_badge.dart';

class Details extends ConsumerWidget {
  final CountryEntity place;

  Details({required this.place});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mycubit = ref.watch(countr_cubit);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).shadowColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: IconBadge(
              icon: Icons.notifications_none,
              color: Colors.black,
            ),
            onPressed: () async {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10.0),
          buildSlider(),
          SizedBox(height: 20),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            primary: false,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      place.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.bookmark,
                    ),
                    onPressed: () async {
                      await mycubit.cashdata(
                          country: CounteryModel(
                              name: place.name,
                              capital: place.capital,
                              currency: place.currency,
                              phone: place.phone));
                      await mycubit.getcashedata(query: 'key');

                      mycubit.message == null
                          ? null
                          // ignore: use_build_context_synchronously
                          : ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(mycubit.message!)));
                    },
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    size: 14,
                    color: Colors.blueGrey[300],
                  ),
                  SizedBox(width: 3),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      place.capital,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.blueGrey[300],
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  place.currency,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "About",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                alignment: Alignment.centerLeft,
                child: ReadMoreText(
                  trimLines: 5,
                  text: "${places[0]["details"]}",
                  // style: const TextStyle(
                  //   fontWeight: FontWeight.normal,
                  //   fontSize: 15.0,
                  // ),
                  // textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.airplanemode_active,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return Travel();
              },
            ),
          );
        },
      ),
    );
  }

  buildSlider() {
    return Container(
      padding: EdgeInsets.only(left: 20),
      height: 250.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          // Map place = places[index];

          return Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                afiracn_countries[Random().nextInt(afiracn_countries.length)],
                height: 250.0,
                width: MediaQuery.of(context).size.width - 40.0,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
