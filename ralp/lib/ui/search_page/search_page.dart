import 'dart:math';

import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<StatefulWidget> createState() => SearchViewState();
}

class SearchViewState extends State<SearchView> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff201822),
                  Color.fromARGB(217, 41, 7, 50),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.6154, 1],
                transform: GradientRotation(pi),
              ),
            ),
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 70, left: 35, right: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        Icons.arrow_back,
                        color: Color(0xfff392f5),
                        size: 30.0,
                      ),
                      Text(
                        "RALP",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.0,
                          letterSpacing: -0.3,
                          color: Color(0xffDFC7F0),
                        ),
                      ),
                      Icon(
                        Icons.account_circle,
                        color: Color(0xffa147cc),
                        size: 40.0,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 69,
                  margin: const EdgeInsets.only(
                      top: 35, left: 45, right: 45, bottom: 25),
                  alignment: Alignment.center,
                  child: const Text(
                    "What is the topic you want to learn?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 24.0,
                      letterSpacing: -0.3,
                      color: Color(0xffBA6CF1),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 45, right: 45, bottom: 39),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 41.0,
                            margin: const EdgeInsets.only(right: 14),
                            decoration: const BoxDecoration(
                              color: Color(0xff463949),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 0.0,
                                  height: 26.0,
                                  margin: const EdgeInsets.only(
                                      left: 35, right: 13),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xffCE9AF2),
                                        width: 1.0,
                                        style: BorderStyle.solid),
                                  ),
                                ),
                                Container(
                                  height: 22.0,
                                  width: 143.0,
                                  margin: const EdgeInsets.only(top: 14),
                                  child: TextField(
                                    controller: controller,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.0,
                                      letterSpacing: -0.3,
                                      color: Color(0xffC795EB),
                                    ),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Search',
                                      hintStyle: TextStyle(
                                        color: Color(0xffC795EB),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            width: 43.0,
                            height: 41.0,
                            decoration: const BoxDecoration(
                              color: Color(0xffA147CC),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                            child: const Icon(
                              Icons.search,
                              size: 26,
                              color: Colors.white,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
