import 'package:flutter/material.dart';
import 'package:ralp/ui/sign_up_page/sign_up_page.dart';
import 'package:ralp/util/ui/routes.dart';
import 'package:ralp/util/ui/transitions.dart';

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/home_background.png'),
                fit: BoxFit.fill,
                repeat: ImageRepeat.repeat,
              ),
            ),
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 114, 0, 66),
                  child: const Text(
                    "Welcome to RALP",
                    style: TextStyle(
                      fontSize: 50.0,
                      letterSpacing: 1.0,
                      color: Color(0xffDFCAEF),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                      width: 223.0,
                      height: 294.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/img/julia.png'),
                          fit: BoxFit.fill,
                          repeat: ImageRepeat.repeat,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      )),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(50, 42, 0, 68),
                  color: const Color.fromRGBO(255, 255, 255, 0.0),
                  child: const Text(
                    "Watch quick lessons on various topics every day.",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20.0,
                      letterSpacing: 1.0,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 58,
                      width: 325,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                SlideRightRoute(
                                    page: const SignUpView(),
                                    route: Routes.REGISTER_ROUTE));
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Start Learning",
                                style: TextStyle(
                                    fontSize: 22.0,
                                    letterSpacing: 1.0,
                                    color: Color(0xff000000)),
                              ),
                              Container(
                                height: 30,
                                width: 55,
                                margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/img/arrow.png'),
                                      fit: BoxFit.fill),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
