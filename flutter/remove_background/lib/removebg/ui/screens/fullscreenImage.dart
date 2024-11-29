

import 'package:remove_background/core/theming/size.dart';
import 'package:remove_background/removebg/data/imageFun.dart';

import 'package:flutter/material.dart';

class fullscreenImage extends StatefulWidget {
  const fullscreenImage({super.key});

  @override
  State<fullscreenImage> createState() => _fullscreenImageState();
}

class _fullscreenImageState extends State<fullscreenImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
               // The container acts like a "mobile screen" inside the desktop screen
          width: context.isMobileView
              ? context.screenWidth
              : context
                  .mobileWidth, // Mobile width or full screen width for larger screens
          height: context.isMobileView
              ? null
              : 700, // Adjust height for non-mobile view
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                context.isMobileView ? null : BorderRadius.circular(10),
            border: context.isMobileView
                ? null
                : Border.all(
                    color: Colors.white,
                    width: 20), // White border for larger screens
          ),
          child: Container(
            width: 400,
            height: 400,
            child: Image.memory(
              imageFun.imageWithoutBackground!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}