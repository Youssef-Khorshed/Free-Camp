import 'package:flutter/material.dart';
import 'package:flutter_application_camp/Core/util/AlertDialog.dart';
import 'package:flutter_application_camp/Core/util/internet.dart';
import 'package:flutter_application_camp/Features/Compass/Widgets/compass.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../Travel/flights.dart';
import 'countries.dart';
import 'icon_badge.dart';
import 'home.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  int _page = 0;
  List<Widget> screens = [
    Home(),
    CompassPage(),
    const Search(),
    const Travel()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        key: Key('pageview'),
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: List.generate(4, (index) => screens[_page]),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SizedBox(width: 7.0),
            barIcon(icon: Icons.home_outlined, page: 0),
            barIcon(icon: Icons.compass_calibration_outlined, page: 1),
            barIcon(icon: Icons.search, page: 2, badge: true),
            barIcon(icon: Icons.car_crash_outlined, page: 3),
            const SizedBox(width: 7.0),
          ],
        ),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _pageController.dispose();
  // }

  void onPageChanged(int page) async {
    if (await NetworkInfoImpl(InternetConnectionChecker()).isConnected()) {
      setState(() {
        this._page = page;
      });
    } else {
      message(message: 'message', context: context);
    }
  }

  Widget barIcon(
      {IconData icon = Icons.home, int page = 0, bool badge = false}) {
    return IconButton(
      icon: badge ? IconBadge(icon: icon, size: 24.0) : Icon(icon, size: 24.0),
      color:
          _page == page ? Theme.of(context).shadowColor : Colors.blueGrey[300],
      onPressed: () => navigationTapped(page),
    );
  }
}
