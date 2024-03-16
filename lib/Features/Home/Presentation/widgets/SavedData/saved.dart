// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_application_camp/Features/Home/Domain/Entity/counteyEntity.dart';
import '../main_screen.dart';
import 'deletebutton.dart';

class SavedData extends StatefulWidget {
  final List<CountryEntity> posts;
  late List<bool> itemIndex;
  SavedData({required this.posts});
  @override
  _SavedDataState createState() => _SavedDataState();
}

class _SavedDataState extends State<SavedData> {
  bool startAnimation = false;
  bool change = false;
  @override
  void initState() {
    super.initState();
    if (mounted) // mounted check if the widget still in the widget tree or not
    {
      // add post frame callback ensure after the frame intialized  or built or rendered performs the method (action)
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {
          widget.itemIndex =
              List.filled(widget.posts.length, false, growable: true);

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
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).shadowColor,
            ),
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (builder) => MainScreen()),
                (route) => false),
          ),
          actions: [
            change
                ? Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              widget.itemIndex
                                  .fillRange(0, widget.itemIndex.length, true);
                            });
                          },
                          child: Text('Select All')),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              change = !change;
                            });
                          },
                          icon: Icon(
                            Icons.cancel_outlined,
                            color: Theme.of(context).shadowColor,
                          )),
                    ],
                  )
                : Icon(Icons.abc)
          ],
        ),
        bottomNavigationBar: change
            ? DeleteButton(posts: widget.posts, itemindex: widget.itemIndex)
            : null,
        body: ListView.builder(
            itemCount: widget.posts.length,
            itemBuilder: (context, index) {
              return item(
                  context: context,
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
      required BuildContext context,
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
      child: InkWell(
        onLongPress: () {
          setState(() {
            change = !change;
          });
        },
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
            change
                ? IconButton(
                    onPressed: () {
                      print(index);
                      setState(() {
                        widget.itemIndex[index] = !widget.itemIndex[index];
                      });
                    },
                    icon: Icon(
                      Icons.check_circle_outlined,
                      color: widget.itemIndex[index]
                          ? Colors.green
                          : Theme.of(context).shadowColor,
                    ))
                : Text('${posts[index].currency}'),
          ],
        ),
      ),
    );
  }
}
