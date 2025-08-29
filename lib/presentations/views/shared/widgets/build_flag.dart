import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuildFlag extends StatelessWidget {
  String pngUrl;
  String svgUrl;

  BuildFlag({super.key, required this.pngUrl, required this.svgUrl});

  @override
  Widget build(BuildContext context) {
    if (svgUrl != null && svgUrl.isNotEmpty) {
      return SvgPicture.network(
        svgUrl,
        height: 250,
        width: double.infinity,
        fit: BoxFit.cover,
        placeholderBuilder:
            (context) => const SizedBox(
              height: 150,
              child: Center(child: CircularProgressIndicator()),
            ),
      );
    }

    if (pngUrl != null && pngUrl.isNotEmpty) {
      return Image.network(
        pngUrl,
        height: 250,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder:
            (context, error, stackTrace) => const SizedBox(
              height: 150,
              child: Center(child: Text('No Flag')),
            ),
      );
    }

    return const SizedBox(height: 150, child: Center(child: Text('No Flag')));
  }
}
