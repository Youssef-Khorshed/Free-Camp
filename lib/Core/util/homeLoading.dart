import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_camp/Core/util/skeletonLoader.dart';

import '../../Features/Home/Presentation/Logic/providerCountry.dart';
import '../../Features/Home/Presentation/widgets/horizontal_place_item.dart';
import '../../Features/Home/Presentation/widgets/vertical_place_item.dart';
import 'Strings.dart';
import 'networkimage.dart';

class HomeLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.bookmark_border,
          color: Colors.grey,
        ),
        actions: const <Widget>[
          Icon(
            Icons.mode_night,
            color: Colors.grey,
          ),
        ],
      ),
      body: ListView(
        key: const Key('Home first list'),
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SkeletonLoader(width: width, height: 30),
                  SizedBox(
                    height: 10,
                  ),
                  SkeletonLoader(width: width / 2, height: 20)
                ],
              )),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.28),
                  borderRadius: BorderRadius.circular(5)),
              child: TextFormField(
                enabled: false,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  hintText: '',
                  prefixIcon: const Icon(Icons.location_on, color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          buildHorizontalList(context),
          buildVerticalList(context),
        ],
      ),
    );
  }

  Widget buildHorizontalList(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 20.0),
      height: MediaQuery.of(context).size.height / 3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return HorizontalLoader();
        },
      ),
    );
  }

  buildVerticalList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: ListView.builder(
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return VerticalLoading();
        },
      ),
    );
  }
}

class HorizontalLoader extends StatelessWidget {
  HorizontalLoader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: InkWell(
        child: Container(
          height: 250.0,
          width: 140.0,
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SkeletonLoader(
                  height: 178.0,
                  width: 140.0,
                ),
              ),
              SizedBox(height: 7.0),
              Container(
                  alignment: Alignment.centerLeft,
                  child: SkeletonLoader(width: 50, height: 10)),
              SizedBox(height: 3.0),
              Row(
                children: [
                  Flexible(
                      flex: 2, child: SkeletonLoader(width: 10, height: 10)),
                  // SizedBox(
                  //   width: 5,
                  // ),
                  Flexible(
                      flex: 1, child: SkeletonLoader(width: 40, height: 10)),
                ],
              ),
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}

class VerticalLoading extends StatelessWidget {
  VerticalLoading();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        child: Container(
          height: 70.0,
          child: Row(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: SkeletonLoader(width: 70, height: 70)),
              SizedBox(width: 15.0),
              Container(
                height: 80.0,
                width: MediaQuery.of(context).size.width - 130.0,
                child: ListView(
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    Container(
                        alignment: Alignment.centerLeft,
                        child: SkeletonLoader(width: 10, height: 10)),
                    SizedBox(height: 3.0),
                    Row(
                      children: <Widget>[
                        SkeletonLoader(width: 10, height: 10),
                        SizedBox(width: 3.0),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: SkeletonLoader(width: 40, height: 10)),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money_rounded,
                          size: 13.0,
                          color: Colors.blueGrey[300],
                        ),
                        SizedBox(width: 3.0),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: SkeletonLoader(width: 10, height: 10)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
