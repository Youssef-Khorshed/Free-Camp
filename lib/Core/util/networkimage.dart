import 'package:flutter/material.dart';
import 'package:flutter_application_camp/Core/util/skeletonLoader.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  CustomNetworkImage({
    required this.imageUrl,
    this.width = 100.0,
    this.height = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      width: width,
      height: height,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        return loadingProgress == null
            ? _checkForEmptyFile(child)
            : SkeletonLoader(
                height: 178.0,
                width: 140.0,
                borderRadius: 20,
              );
      },
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
        return _buildEmptyFilePlaceholder();
      },
    );
  }

  Widget _checkForEmptyFile(Widget child) {
    // ignore: unnecessary_null_comparison
    if (child is Image && (child.image == null)) {
      return _buildEmptyFilePlaceholder();
    }
    return child;
  }

  Widget _buildEmptyFilePlaceholder() {
    return Container(
      width: width,
      height: height,
      color: Colors.red, // Placeholder color or error indication
      child: const Center(
        child: Text('Empty File', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

// Usage

