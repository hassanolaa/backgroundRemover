import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:remove_background/core/routing/router.dart';
import 'package:remove_background/core/theming/colors.dart';
import 'package:remove_background/core/theming/size.dart';
import 'package:remove_background/removebg/ui/screens/uploadimage.dart';
import 'package:remove_background/splash&boarding/ui/Screens/splash.dart';


class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  Widget _buildImage(String assetName, [double width = 150]) {
    return Column(
      children: [
        //SizedBox(height: 1,),
        Image.asset('images/$assetName', width: context.width(1),fit: BoxFit.fitWidth,height:context.height(0.3),),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyPadding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.only(top:context.height(0.04)),
    );
    return Center(
      child: Container(
                // The container acts like a "mobile screen" inside the desktop screen
            width: context.isMobileView ?context.screenWidth :context.mobileWidth, // Mobile width or full screen width for larger screens
            height:context.isMobileView ? null : 700, // Adjust height for non-mobile view
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: context.isMobileView ? null : BorderRadius.circular(10),
              border:context. isMobileView
                  ? null
                  : Border.all(color: Colors.white, width: 20), // White border for larger screens
            ),
        child: IntroductionScreen(
          onDone: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => uploadimage(),
                ));
          },
          onSkip: () {
             Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => uploadimage(),
                ));
          }, // You can override onSkip callback
          
          globalBackgroundColor: colors.background,
          showSkipButton: true,
          showNextButton: true,
          back: const Icon(
            Icons.arrow_back,
            color: colors.background,
          ),
          skip: const Text('Skip',
              style:
                  TextStyle(color: colors.background, fontWeight: FontWeight.w600)),
          next: const Icon(Icons.arrow_forward, color:colors.background),
          done: const Text('Done',
              style:
                  TextStyle(color: colors.background, fontWeight: FontWeight.w600)),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(16),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color:colors.background,
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          dotsContainerDecorator: const ShapeDecoration(
            color: colors.coco,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
          pages: [
            PageViewModel(
             title: "Welcome to Removify!",
             body: "Start removing backgrounds effortlessly and make your images stand out with ease.",
              image: _buildImage('icon.png'),
              decoration: pageDecoration,
            ),
            PageViewModel(
             title: "Ready to Clean Up Your Images?",
             body: "Upload an image and let Removify handle the background removal in seconds!",
              image: _buildImage('img2.png'),
              decoration: pageDecoration,
            ),
            PageViewModel(
             title: "Transform Your Photos with Removify!",
          body: "Say goodbye to distracting backgrounds and focus on what matters with just a few clicks.",
              image: _buildImage('img1.png'),
              decoration: pageDecoration,
            ),
          ],
        ),
      ),
    );
  }
}
