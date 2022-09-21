import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageWidget extends StatelessWidget {
  final String imageNetworkPath;
  final double? defaultHeight;
  const ImageWidget({
    Key? key,
    required this.imageNetworkPath,
    this.defaultHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageNetworkPath.isEmpty) {
      return Image.asset(
        'assets/images/placeholder1.png',
        height: defaultHeight,
        fit: BoxFit.cover,
      );
    }

    return FadeInImage.assetNetwork(
      placeholder: 'assets/images/placeholder1.png',
      height: 200.h,
      image: imageNetworkPath,
      fit: BoxFit.cover,
    );
  }
}
