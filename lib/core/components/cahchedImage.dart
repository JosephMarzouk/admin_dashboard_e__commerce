
import 'package:admin_dashboard_e__commerce/core/components/customCircleProgressIndecator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CaheImage extends StatelessWidget {
  const CaheImage({
    super.key,
    required this.url,
    required this.height,
    required this.width,
  });
  final double height;
  final double width;
  final String url;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      height: height,
      width: width,
      imageUrl: url,
      placeholder: (context, url) => const SizedBox(
        height: 200,
        child: CustomCircleProgIndicator(),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
