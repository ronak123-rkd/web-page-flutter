import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webpage/smartchargingmanagment.dart';
import 'package:webpage/smartchargingsendsrecod.dart';
import 'package:webpage/testdemo/homepage.dart';
import 'package:webpage/vehicleprioritymanagment.dart';
import 'package:webpage/webPage.dart';
import 'dart:html';

import 'Home.dart';
import 'chargermanagment.dart';
import 'chargingstatin.dart';
import 'chargermanagment.dart';
import 'models/dropdownmodel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController mywrapController1 = TextEditingController();
  TextEditingController mywrapController2 = TextEditingController();
  TextEditingController mywrapController3 = TextEditingController();
  TextEditingController mywrapController4 = TextEditingController();
  TextEditingController mywrapController5 = TextEditingController();
  String act = "";
  int webscreen = 0;

  List<String> homes = [
    "home page",
    "business management",
    "smart charging management",
    " card business management",
    " transaction recode",
    "pile fault recode",
    "real time recode"
  ];
  // Map<String, List<String>> menu = {};
  List<List<String>> menu = [
    ["management", "charger history"],
    ["charging station management", "charger management"],
    [
      "vehical periority management",
      "smart chargering management",
      "smart chargering sends recods ",
    ],
    [
      "visual card user",
      "visual card information",
      "visual card opration recodes",
    ],
    [
      "transation recodes",
      "about transation recodes",
    ],
    [
      "falut recodes",
      "about transation recodes",
      "about transation recodes",
    ],
    [
      "falut recodes",
      "about transation recodes",
      "about transation recodes",
    ]
  ];

  List<IconData> icon = [
    Icons.home,
    Icons.settings,
    Icons.account_circle,
    Icons.receipt_long_outlined,
    Icons.receipt_long_outlined,
    Icons.addchart,
    Icons.addchart,
  ];
  String nameCar = "";
  var _car = ["customer", "logout"];
  var _carItemSelected = "customer";

  String nameBar = "";
  var _bar = ["English", "中文"];
  var _barItemSelected = "English";

  String name = "";
  var _name = [
    "Asia/Calcutta",
    "Africa/Accra",
    "Africa/Algiers",
    "Africa/Asmara",
    "Africa/Bamako",
    "Africa/Lagos"
  ];
  var _nameItemSelected = "Asia/Calcutta";

  var _currencies = [
    "business management",
    "charging station management",
    "charger management"
  ];
  var _currentItemSelected = "business management";
  bool _collapse = false;
  int value = 0;
  List<int> selecteditems = [];
  var store;
  List<dynamic> detail = [];
  // bool? single;
  List<bool> _selected = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 20, 0),
          child: Image.asset(
            "assets/tata power logo.jpg",
            fit: BoxFit.cover,
            height: 50,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                items: _name.map((String dropDownStringItem) {
                  return DropdownMenuItem(
                    value: dropDownStringItem,
                    child: Text(
                      dropDownStringItem,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (newValueSelected) {
                  setState(() {
                    this._nameItemSelected = newValueSelected.toString();
                  });
                },
                value: _nameItemSelected,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                style: TextStyle(fontSize: 15, color: Colors.black),
                items: _bar.map((String dropDownStringItem) {
                  return DropdownMenuItem(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (newValueSelected) {
                  setState(() {
                    this._barItemSelected = newValueSelected.toString();
                  });
                },
                value: _barItemSelected,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                style: TextStyle(fontSize: 15, color: Colors.black),
                items: _car.map((String dropDownStringItem) {
                  return DropdownMenuItem(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (newValueSelected) {
                  setState(() {
                    this._carItemSelected = newValueSelected.toString();
                  });
                },
                value: _carItemSelected,
              ),
            ),
          ),
        ],
        backgroundColor: Color(0xFF20a0ff),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.20,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.only(top: 25, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.80,
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: homes.length,
                          itemBuilder: (context, index) {
                            return index == 0
                                ? Theme(
                                    data: Theme.of(context).copyWith(
                                        dividerColor: Colors.transparent),
                                    child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            webscreen = int.parse(
                                                index.toString() +
                                                    index.toString());
                                          });
                                        },
                                        child: Container(
                                          height: 50,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.home,
                                                size: 20,
                                                color: Color(0xFF909399),
                                              ),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Text("home",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  )),
                                            ],
                                          ),
                                        )))
                                : Column(
                                    children: [
                                      Theme(
                                        data: Theme.of(context).copyWith(
                                            dividerColor: Colors.transparent),
                                        child: ExpansionTile(
                                            tilePadding: EdgeInsets.zero,
                                            textColor: Colors.black,
                                            iconColor: Colors.black38,
                                            leading: Icon(
                                              icon[index],
                                              size: 20,
                                              color: Color(0xFF909399),
                                            ),
                                            title: Row(
                                              children: [
                                                Text(homes[index],
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    )),
                                              ],
                                            ),
                                            children: [
                                              ConstrainedBox(
                                                constraints: BoxConstraints(
                                                    maxHeight: 200,
                                                    minHeight: 0.0),
                                                child: ListView.builder(
                                                    shrinkWrap: true,
                                                    padding: EdgeInsets.zero,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    itemCount:
                                                        menu[index].length,
                                                    itemBuilder: (context, i) {
                                                      return index == 0
                                                          ? SizedBox.shrink()
                                                          : InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  webscreen = int
                                                                      .parse(index
                                                                              .toString() +
                                                                          i.toString());
                                                                });
                                                              },
                                                              child: Expanded(
                                                                child:
                                                                    Container(
                                                                  height: 50,
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            47),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      child: Text(
                                                                          menu[index][i]
                                                                              .toString(),
                                                                          textAlign: TextAlign
                                                                              .start,
                                                                          style:
                                                                              TextStyle(fontSize: 12)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                    }),
                                              ),
                                            ]),
                                      ),
                                    ],
                                  );
                          }),
                    ),
                  ],
                ),
              ),
            ),
            VerticalDivider(thickness: 0.1, color: Colors.black),
            Expanded(
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 0.78,
                  child: webscreen == 0
                      ? home()
                      : webscreen == 10
                          ? Webpage()
                          : webscreen == 11
                              ? Chargermanagment()
                              : webscreen == 20
                                  ? VehiclePriority()
                                  : webscreen == 21
                                      ? Smartcharging()
                                      : Sendrecod()),
            ),
          ],
        ),
      ),
    );
  }
}
