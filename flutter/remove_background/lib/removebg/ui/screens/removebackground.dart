

import 'package:flutter/material.dart';
import 'package:remove_background/core/routing/router.dart';
import 'package:remove_background/core/theming/colors.dart';
import 'package:remove_background/core/theming/size.dart';
import 'package:remove_background/removebg/data/imageFun.dart';

import 'fullscreenImage.dart';

class removebackground extends StatefulWidget {
  const removebackground({super.key});

  @override
  State<removebackground> createState() => _removebackgroundState();
}

class _removebackgroundState extends State<removebackground> {

  bool isloading = false;
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
                // image before the background is removed
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Image.memory(
                    imageFun.image!,
                    width: 200,
                    height: 200,
                  ),
                ),
                // container as button to remove background
                GestureDetector(
                  onTap: () async{
                   setState(() {
                      isloading = true;
                   });
                  await imageFun.sendImageToServer();
                  setState(() {
                    isloading = false;
                  });
                  },
                  child: Container(
                    width: 300,
                    margin: EdgeInsets.only(top: 50),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: colors.coco,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.eco_outlined,
                          color: colors.backbackground,
                        ),
                                              SizedBox(width: 5,),
                        Text(
                          'Remove Background',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: context.fontSize(20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // image after the background is removed
                       isloading==false&&imageFun.imageWithoutBackground==null?Container():
                    imageFun.imageWithoutBackground == null?CircularProgressIndicator(color: colors.coco,):
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Image.memory(
                    imageFun.imageWithoutBackground!,
                    width: 200,
                    height: 200,
                  ),
                ),
              context.height_box(0.01),
                // container as button to save image
            
               imageFun.imageWithoutBackground == null?Container():
                Row(
                  children: [
               SizedBox(width: 30,),
          
                    GestureDetector(
                  onTap: () {
                   context.navigateTo(fullscreenImage());
                  },
                  child: Container(
                    width: 160,
                    margin: EdgeInsets.only(top: 50),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: colors.coco,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.fullscreen,
                          color: colors.backbackground,
                        ),
                     SizedBox(width: 5,),
          
                        Text(
                          'View full size',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: context.fontSize(12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                context.width_box(0.02),
                 GestureDetector(
                  onTap: () {
                    imageFun.downloadImage();
                  },
                  child: Container(
                    width: 160,
                    margin: EdgeInsets.only(top: 50),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: colors.coco,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.download_for_offline_rounded,
                          color: colors.backbackground,
                        ),
                        SizedBox(width: 5,),
                        Text(
                          'Download Image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: context.fontSize(12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                  ],
                ),
          
              ],
            ),
          ),
        ),
        
      ),
    );
  }
}