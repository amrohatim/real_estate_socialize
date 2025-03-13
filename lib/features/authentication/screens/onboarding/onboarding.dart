import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/authentication/screens/Registration/registration.dart';
import 'package:flutter_application_2/features/authentication/screens/onboarding/page1.dart';
import 'package:flutter_application_2/features/authentication/screens/onboarding/page2.dart';
import 'package:flutter_application_2/features/authentication/screens/onboarding/page3.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Myonboardscreen extends StatefulWidget {
  const Myonboardscreen({super.key});

  @override
  State<Myonboardscreen> createState() => _MyonboardscreenState();
}

class _MyonboardscreenState extends State<Myonboardscreen> {
  bool xpage = true;
  bool lpage = false;
  PageController _controller = PageController();

  void go() {
    _controller.nextPage(
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  void tomyreg() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return MyregPage();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          //---------------PageView---------------//

          PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  xpage = (index == 0);
                  lpage = (index == 2);
                });
              },
              children: [Pageone(), Pagetwo(), Pagethree()]),
          Padding(
              padding: EdgeInsets.only(bottom: 70.h),
              child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                    //------------------indicator-------------------

                    xpage
                        ? //------------------Next-------------------
                        Padding(
                            padding: const EdgeInsets.fromLTRB(1, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 120.w, 0),
                                  child: SmoothPageIndicator(
                                    controller: _controller,
                                    count: 3,
                                    effect: WormEffect(
                                        dotHeight: 10.h,
                                        dotWidth: 30.w,
                                        activeDotColor:
                                            Color.fromARGB(255, 22, 124, 207),
                                        dotColor:
                                            Color.fromARGB(255, 200, 202, 204)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(50.w, 0, 0, 0),
                                  child: FloatingActionButton(
                                    onPressed: go,
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                    backgroundColor:
                                        const Color.fromARGB(255, 22, 124, 207),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : lpage
                            ? Padding(
                                padding: const EdgeInsets.fromLTRB(1, 0, 0, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 0, 120, 0),
                                      child: SmoothPageIndicator(
                                        controller: _controller,
                                        count: 3,
                                        effect: WormEffect(
                                            dotWidth: 30.w,
                                            dotHeight: 10.h,
                                            activeDotColor:
                                                Color.fromARGB(255, 15, 14, 15),
                                            dotColor: Color.fromARGB(
                                                255, 200, 202, 204)),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(50.w, 0, 0, 0),
                                      child: FloatingActionButton(
                                        onPressed: tomyreg,
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                        ),
                                        backgroundColor:
                                            Color.fromARGB(255, 15, 14, 15),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.fromLTRB(1, 0, 0, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 0, 120.w, 0),
                                      child: SmoothPageIndicator(
                                        controller: _controller,
                                        count: 3,
                                        effect: WormEffect(
                                            dotWidth: 30.w,
                                            dotHeight: 10.h,
                                            activeDotColor:
                                                Color.fromARGB(255, 15, 14, 15),
                                            dotColor: Color.fromARGB(
                                                255, 200, 202, 204)),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(50.w, 0, 0, 0),
                                      child: FloatingActionButton(
                                        onPressed: go,
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                        ),
                                        backgroundColor:
                                            Color.fromARGB(255, 15, 14, 15),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                  ]))),
        ],
      ),
    );
  }
}
