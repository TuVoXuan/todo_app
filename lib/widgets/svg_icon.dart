import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/widgets/svg_assets.dart';

class SvgIcon extends StatelessWidget {
  final SvgIconName name;
  final double size;
  final Color color;
  static final _cache = <String, Widget>{};

  const SvgIcon({
    super.key,
    required this.name,
    this.size = 24,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    final svgData = svgIcons[name];
    if (svgData == null) {
      return const SizedBox.shrink();
    }
    if (Platform.isAndroid) {
      return _renderSVG(svgData);
    }
    return Transform.scale(
      filterQuality: FilterQuality.low,
      scale: 0.9999,
      child: _renderSVG(svgData),
    );
  }

  Widget _renderSVG(String svgData) {
    if (_cache.containsKey(name)) {
      return _cache[name]!;
    }

    final widget = SvgPicture.string(
      svgData,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
    _cache[name.name] = widget;
    return widget;
  }
}
