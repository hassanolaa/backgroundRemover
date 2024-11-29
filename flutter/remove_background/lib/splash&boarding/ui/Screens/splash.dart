import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:remove_background/core/theming/size.dart';
import 'package:remove_background/splash&boarding/ui/Screens/OnBoarding.dart';
import 'package:responsive_framework/responsive_framework.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
            body: Center(
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
                child: FlutterSplashScreen.fadeIn(
                  duration: Duration(seconds: 2),
                  backgroundImage: Image.asset('images/icon.gif',),
                          
                  childWidget: SizedBox(),
                          
                  onAnimationEnd: () => debugPrint("On Fade In End"),
                  nextScreen: OnBoarding(),
                  //  nextScreen: navi(),
                ),
              ),
            ),
          );
  }
}
