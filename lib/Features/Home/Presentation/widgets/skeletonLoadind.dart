import 'package:flutter/material.dart';

import '../../../../Core/util/screensize.dart';

class Virtical extends StatelessWidget {
  Virtical({super.key});

  @override
  Widget build(BuildContext context) {
    double width = screen_width(context: context);
    double height = screen_height(context: context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        child: Container(
          height: 70.0,
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  color: Colors.grey,
                  height: 70.0,
                  width: 70.0,
                ),
              ),
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
                      child: Text(
                        '......',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.0,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 3.0),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          size: 13.0,
                          color: Colors.blueGrey[300],
                        ),
                        SizedBox(width: 3.0),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "--------",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                              color: Colors.blueGrey[300],
                            ),
                            maxLines: 1,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money_rounded,
                          size: 20.0,
                          color: Colors.blueGrey[300],
                        ),
                        SizedBox(width: 3.0),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "-------------",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
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
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
