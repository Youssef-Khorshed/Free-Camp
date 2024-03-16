// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_camp/Core/util/Strings.dart';
import 'package:flutter_application_camp/Core/util/homeLoading.dart';
import 'package:flutter_application_camp/Core/util/networkimage.dart';
import 'package:flutter_application_camp/Features/Home/Presentation/widgets/SavedData/saved.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../Core/util/theme_cubit.dart';
import '../Logic/providerCountry.dart';
import 'horizontal_place_item.dart';
import 'icon_badge.dart';
import 'vertical_place_item.dart';

class Home extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final mycubit = ref.watch(countr_cubit);
    final cubit = ref.watch(theme_cubit);
    return mycubit.countries.isEmpty
        ? HomeLoading()
        : Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              SavedData(posts: mycubit.getSaved))));
                },
                icon: Icon(
                  Icons.bookmark_border,
                  color: Theme.of(context).shadowColor,
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: IconBadge(
                    icon: Icons.mode_night_rounded,
                    color: Theme.of(context).shadowColor,
                  ),
                  onPressed: () {
                    cubit.check = !cubit.check;
                    cubit.switch_theme(themestate: cubit.check);
                    // print(cubit.check);
                  },
                ),
              ],
            ),
            body: ListView(
              key: Key('Home first list'),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Where are you \ngoing?",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Container(),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.28),
                        borderRadius: BorderRadius.circular(5)),
                    child: TextFormField(
                      enabled: false,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        hintText: 'E.g: New York, United States',
                        prefixIcon:
                            const Icon(Icons.location_on, color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                buildHorizontalList(context, mycubit),
                buildVerticalList(context, mycubit),
              ],
            ),
          );
  }

  Widget buildHorizontalList(BuildContext context, MyCountryProvider mycubit) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 20.0),
      height: MediaQuery.of(context).size.height / 2.5,
      child: mycubit.countries.isEmpty
          ? CustomNetworkImage(imageUrl: no_files)
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              primary: false,
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                final country = mycubit.countries[index];
                return HorizontalPlaceItem(
                  place: country,
                );
              },
            ),
    );
  }

  buildVerticalList(BuildContext context, MyCountryProvider mycubit) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: ListView.builder(
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          final place = mycubit.countries[index + 10];
          return VerticalPlaceItem(place: place);
        },
      ),
    );
  }
}
