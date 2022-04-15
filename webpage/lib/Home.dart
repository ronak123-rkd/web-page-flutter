import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 370,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 28),
                            child: Container(
                              height: 130,
                              width: 150,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xFF0a5fa7),
                                  Color(0xFF0eb7e7),
                                ]),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "2",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                  Text(
                                    "charging station total",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  Text(
                                    "quantity(counts)",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          customBox("0", "charger total", "quantity(set)"),
                          customBox1("standby", "0set", "0%"),
                          customBox1("charging", "0set", "0%"),
                          customBox1("offline", "0set", "0%"),
                          customBox1("fault", "0set", "0%"),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 20, 0, 0),
                                  child: Container(
                                    height: 175,
                                    width: 230,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      gradient: LinearGradient(colors: [
                                        Color(0xFF0a5fa7),
                                        Color(0xFF0eb7e7),
                                      ]),
                                    ),
                                    child: customBox2(
                                        "transaction amount today",
                                        "Y 0",
                                        "￥ 0",
                                        "current month",
                                        "amount",
                                        "￥ 0",
                                        "accumulated",
                                        "amount"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 20, 0, 0),
                                  child: Container(
                                    height: 175,
                                    width: 230,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      gradient: LinearGradient(colors: [
                                        Color(0xFFf99b2a),
                                        Color(0xFFe8c93f),
                                      ]),
                                    ),
                                    child: customBox2(
                                        "order No. today",
                                        "0 counts",
                                        "0 counts",
                                        "order No. this",
                                        "month",
                                        "0 counts",
                                        "accumulated order",
                                        "No."),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 20, 0, 0),
                                  child: Container(
                                    height: 175,
                                    width: 230,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      gradient: LinearGradient(colors: [
                                        Color(0xFF18d2a4),
                                        Color(0xFF3fafba),
                                      ]),
                                    ),
                                    child: customBox2(
                                        "consumed electric quantity today",
                                        "0 kW·h",
                                        "0 kW·h",
                                        "current month",
                                        "quantity",
                                        "0 kW·h",
                                        "accumulated ",
                                        "quantity"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 20, 0, 0),
                                  child: Container(
                                    height: 175,
                                    width: 230,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      gradient: LinearGradient(colors: [
                                        Color(0xFFd75db4),
                                        Color(0xFFe56c6d),
                                      ]),
                                    ),
                                    child: customBox2(
                                        "consumed customer today",
                                        "0 user",
                                        "0 user",
                                        "current month",
                                        "users",
                                        "0 user",
                                        "accumulated",
                                        "users"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customBox(String txt1, String txt2, String txt3) {
    return Container(
      height: 100,
      width: 150,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xFF0a5fa7),
        Color(0xFF0eb7e7),
      ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            txt1,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          Text(
            txt2,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          Text(
            txt3,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget customBox1(String txt1, String txt2, String txt3) {
    return Container(
      height: 120,
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            txt1,
            style: TextStyle(fontSize: 15),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                txt2,
                style: TextStyle(fontSize: 25),
              ),
              Text(txt3),
            ],
          ),
          Container(
            height: 5,
            width: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xFFebeef5),
            ),
          )
        ],
      ),
    );
  }

  Widget customBox2(String txt1, String txt2, String txt3, String txt4,
      String txt5, String txt6, String txt7, String txt8) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            txt1,
            style: TextStyle(color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            txt2,
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            height: 80,
            width: 210,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(txt3),
                    Text(txt4),
                    Text(txt5),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(txt6),
                    Text(txt7),
                    Text(txt8),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
