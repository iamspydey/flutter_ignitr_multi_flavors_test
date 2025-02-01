import 'package:flutter/material.dart';

class LoadingIcon extends StatelessWidget {
  final double? height;
  final Color? color;
  final bool circular;

  LoadingIcon({Key? key, this.height, this.color, this.circular = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      circular
          ? 'assets/icons/loading-circular.gif'
          : 'assets/icons/loading.gif',
      height: height ?? 14.0,
      color: color ?? null,
    );
  }
}
