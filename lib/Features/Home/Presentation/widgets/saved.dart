import 'package:flutter/material.dart';
import 'package:flutter_application_camp/Features/Home/Domain/Entity/counteyEntity.dart';

class SavedData extends StatefulWidget {
  final List<CountryEntity> posts;
  SavedData({required this.posts});
  @override
  _SavedDataState createState() => _SavedDataState();
}

class _SavedDataState extends State<SavedData> {
  bool startAnimation = false;
  @override
  void initState() {
    super.initState();
    if (mounted) // mounted check if the widget still in the widget tree or not
    {
      // add post frame callback ensure after the frame intialized  or built or rendered performs the method (action)
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {
          startAnimation = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Saved',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView.builder(
            itemCount: widget.posts.length,
            itemBuilder: (context, index) {
              return item(
                  index: index,
                  height: screenHeight,
                  width: screenWidth,
                  posts: widget.posts);
            }));
  }

  Widget item(
      {required int index,
      required double width,
      required double height,
      required List<CountryEntity> posts}) {
    return AnimatedContainer(
      height: 55,
      width: width,
      curve: Curves.bounceInOut, // style of animation in screen
      duration: Duration(
          milliseconds: 300 +
              (index * 200)), // each item take time more than previous item
      transform: Matrix4.translationValues(startAnimation ? 0 : width, 0,
          0), // the dimension of the item apperance upper,lower,left ,right
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: width / 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            posts[index].capital,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Icon(
            Icons.abc_sharp,
          ),
        ],
      ),
    );
  }
}
