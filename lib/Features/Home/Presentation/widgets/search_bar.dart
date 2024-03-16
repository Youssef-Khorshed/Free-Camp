import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController _searchControl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontSize: 15.0,
        color: Colors.blueGrey[300],
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        hintText: "E.g: New York, United States",
        prefixIcon: Icon(
          Icons.location_on,
          color: Colors.amber,
        ),
        hintStyle: TextStyle(
          fontSize: 15.0,
          color: Colors.blueGrey[300],
        ),
      ),
      maxLines: 1,
      controller: _searchControl,
    );
  }
}
