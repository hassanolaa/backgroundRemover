import 'package:flutter/material.dart';
import 'package:remove_background/core/routing/router.dart';
import 'package:remove_background/core/theming/colors.dart';
import 'package:remove_background/core/theming/size.dart';
import 'package:remove_background/removebg/data/imageFun.dart';
import 'package:remove_background/removebg/ui/screens/removebackground.dart';

class uploadimage extends StatefulWidget {
  const uploadimage({super.key});

  @override
  State<uploadimage> createState() => _homeState();
}

class _homeState extends State<uploadimage> {
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
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/background.png'),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                context.height_box(0.25),
                // upload icon
                GestureDetector(
                  onTap: () async{
                  await  imageFun.uploadImage();
                    
                    context.navigateTo(removebackground());
                    
                
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Icon(
                      color: colors.coco,
                      Icons.cloud_upload,
                      size: context.fontSize(110),
                    ),
                  ),
                ),
                context.height_box(0.01),

                // upload text
                Container(
                  child: Text(
                    'Upload Image',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: context.fontSize(30),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
