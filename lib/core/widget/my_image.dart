import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../res/theme/colors.dart';

class MyImage extends StatelessWidget {
  final double? height;

  final double? width;

  final double? boarderRadius;

  final Color? color;
  final BoxFit? fit;

  final String? defaultUrl;

  final String? url;

  final Widget? defaultDesign;

  const MyImage({
    Key? key,
    this.height = 100,
    this.width = 100,
    this.color,
    this.fit = BoxFit.fill,
    this.defaultUrl = 'assets/images/logo.png',
    this.defaultDesign,
    this.url,
    this.boarderRadius = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url == null) {
      if (defaultDesign != null) {
        return defaultDesign!;
      } else {
        if (defaultUrl!.toLowerCase().endsWith(".svg")) {
          return SvgPicture.asset(
            defaultUrl!,
            width: width,
            height: height,
            fit: fit!,
            color: Colors.transparent,
            placeholderBuilder: (v) => const CircularProgressIndicator(
              color: primaryColor,
            ),
          );
        } else {
          return Image.asset(
            defaultUrl!,
            width: width,
            height: height,
            fit: fit,
          );
        }
      }
    } else {
      if (url!.startsWith("http")) {
        if (url!.toLowerCase().endsWith(".svg")) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(boarderRadius!),
            child: SvgPicture.network(
              url!,
              width: width,
              height: height,
              fit: fit!,
              placeholderBuilder: (context) => Image.asset(
                defaultUrl!,
                height: height,
                width: width,
                fit: fit,
              ),
            ),
          );
        } else {
          return ClipRRect(
            borderRadius: BorderRadius.circular(boarderRadius!),
            child: Image.network(
              url!,
              width: width,
              height: height,
              fit: fit,
              loadingBuilder: (context, child, c) {
                if (c == null) return child;
                return const CircularProgressIndicator(
                  color:primaryColor,
                );
              },
              errorBuilder: (context, child, error) {
                if(defaultDesign != null){
                  return defaultDesign!;
                }
                return MyImage(
                  url: defaultUrl!,
                  height: 100,
                  width: 100,
                  fit: fit,
                );
              }
            ),
          );
        }
      } else {
        if (url!.toLowerCase().endsWith(".svg")) {
          return color == null
              ? SvgPicture.asset(
                  url!,
                  // allowDrawingOutsideViewBox: true,
                  width: width,
                  height: height,
                  fit: fit!,
                  placeholderBuilder: (context) => Image.asset(
                    defaultUrl!,
                    height: height,
                    width: width,
                    fit: fit,
                  ),
                )
              : SvgPicture.asset(
                  url!,
                  // allowDrawingOutsideViewBox: true,
                  width: width,
                  height: height,
                  color: color,
                  fit: fit!,
                  placeholderBuilder: (context) => Image.asset(
                    defaultUrl!,
                    height: height,
                    width: width,
                    fit: fit,
                  ),
                );
        } else if (url!.startsWith("assets/images")) {
          return Image.asset(
            url!,
            width: width,
            height: height,
            fit: fit,
            errorBuilder: (context, child, error) => Image.asset(
              defaultUrl!,
              height: height,
              width: width,
              fit: fit,
            ),
          );
        } else {
          return Image.file(
            File(url!),
            fit: fit,
            height: height,
            width: width,
            errorBuilder: (context, child, error) => Image.asset(
              defaultUrl!,
              height: height,
              width: width,
              fit: fit,
            ),
          );
        }
      }
    }
  }
}
