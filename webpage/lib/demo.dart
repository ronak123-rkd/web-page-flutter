 Text(
                            "station name.",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 12),
                          ),
                          ListView.builder(
                              itemCount: stname.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(right: 3.w),
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                value = index;
                                              });
                                            },
                                            child: CustomRadioButton(
                                                stname[index], index))),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Divider(
                                      color: Colors.black.withOpacity(0.2),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                  ],
                                );
                              }),
                          Text(
                            "Ac Charging",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 12),
                          ),
                          ListView.builder(
                              itemCount: Ac.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(right: 3.w),
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                value = index;
                                              });
                                            },
                                            child: CustomRadioButton(
                                                Ac[index], index))),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Divider(
                                      color: Colors.black.withOpacity(0.2),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                  ],
                                );
                              }),
                          Text(
                            "Dc Charging",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 12),
                          ),
                          ListView.builder(
                              itemCount: Dc.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(right: 3.w),
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                value = index;
                                              });
                                            },
                                            child: CustomRadioButton(
                                                Dc[index], index))),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Divider(
                                      color: Colors.black.withOpacity(0.2),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                  ],
                                );
                              }),
                          Text(
                            "offline oprating mode",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 12),
                          ),
                          ListView.builder(
                              itemCount: offop.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(right: 3.w),
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                value = index;
                                              });
                                            },
                                            child: CustomRadioButton(
                                                offop[index], index))),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Divider(
                                      color: Colors.black.withOpacity(0.2),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                  ],
                                );
                              }),
                          Text(
                            "station address",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 12),
                          ),
                          ListView.builder(
                              itemCount: syadd.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(right: 3.w),
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                value = index;
                                              });
                                            },
                                            child: CustomRadioButton(
                                                syadd[index], index))),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Divider(
                                      color: Colors.black.withOpacity(0.2),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                  ],
                                );
                              }),
                          Text(
                            "station logitude.",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 12),
                          ),
                          ListView.builder(
                              itemCount: stalogitude.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(right: 3.w),
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                value = index;
                                              });
                                            },
                                            child: CustomRadioButton(
                                                stalogitude[index], index))),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Divider(
                                      color: Colors.black.withOpacity(0.2),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                  ],
                                );
                              }),


                              Widget CustomRadioButton(String text, int index) {
                                var value;
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 1, left: 6),
                                      child: Text(
                                        text,
                                        style: (value == index)
                                            ? TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w800,
                                                fontSize: 12)
                                            : TextStyle(color: Colors.black, fontSize: 12),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 3),
                                      child: Container(
                                        height: 4,
                                        width: 4,
                                        decoration: BoxDecoration(
                                            border: (value == index)
                                                ? null
                                                : Border.all(color: Colors.grey, width: 0.2),
                                            color: Colors.grey[900],
                                            borderRadius: BorderRadius.circular(2)),
                                        child: Container(
                                          height: (2),
                                          width: (2),
                                          decoration: BoxDecoration(
                                              color: (value == index) ? Colors.blue : Colors.white,
                                              borderRadius: BorderRadius.circular(3)),
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }


   String encodedMap = json.encode(SmartchargDetails); //convert to string map data
        print("Ronak" + encodedMap);// print map data
        _addToCookie("store", encodedMap);//add to cookie
      var getstorage = _getCookie("store");//get to cookie
      detail = json.decode(getstorage);//store in variable getstorage
      print(detail);//print data
      _selected = List<bool>.generate(detail.length, (int index) => false);


//////////////////////////////////////////////////////////////////////////////////////////////

import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:html';

import 'models/dropdownmodel.dart';

class Chargermanagment extends StatefulWidget {
  const Chargermanagment({Key? key}) : super(key: key);

  @override
  _ChargermanagmentState createState() => _ChargermanagmentState();
}

class _ChargermanagmentState extends State<Chargermanagment> {
  TextEditingController mywrapController1 = TextEditingController();
  TextEditingController mywrapController2 = TextEditingController();
  TextEditingController mywrapController3 = TextEditingController();
  TextEditingController mywrapController4 = TextEditingController();
  TextEditingController mywrapController5 = TextEditingController();
  String act = "";
  // TextEditingController mywrapController6 = TextEditingController();
  // TextEditingController mywrapController7 = TextEditingController();
  // TextEditingController mywrapController8 = TextEditingController();
  TextEditingController searchStationNameController = TextEditingController();
  List<String> homes = [
    "business management",
    "smart charging management",
    " card business management",
    " transaction recode",
    "pile fault recode",
    "real time recode"
  ];

  List<IconData> icon = [
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
  List<dynamic> searchList = [];
  List<Map> Details = [
    {
      'id': 1,
      'Charger serial no': '43526378',
      'charge ammeter': 'customer',
      'Whether to push': '0',
      'Dc': '1',
      'offline oprating on mode': 'normal card'
    },
    {
      'id': 2,
      'Station no': '75676569',
      'Station name': 'customer',
      'Ac': '0',
      'Dc': '1',
      'offline oprating on mode': 'normal card'
    },
    {
      'id': 3,
      'Station no': '63259878',
      'Station name': 'customer',
      'Ac': '0',
      'Dc': '1',
      'offline oprating on mode': 'normal card'
    }
  ];
  String dropdownvalue = 'Available';
  var items = [
    // 'Apple',
    // 'Banana',
    // 'Grapes',
    // 'Orange',
    // 'watermelon',
    // 'Pineapple',
    // 'Pineapple'

    'Available',
    'Offline',
    'Preparing',
    'Charging',
    'SuspendedEVSE',
    'SuspendedEV',
    'Finishing',
    'Reserved',
    'Unavailable',
    'Faulted',
  ];
  // bool? single;
  List<bool> _selected = [];

  void clearText() {
    mywrapController1.clear();
    mywrapController2.clear();
    mywrapController3.clear();
    mywrapController4.clear();
    mywrapController5.clear();
  }

  void initState() {
    //je display kravvu hoi ae always aani andr aavse
    super.initState();

    getData();
    var addstored = _getCookie("store");
    if (addstored == null || addstored.isEmpty) {
      String encodedMap = json.encode(Details); //convert to string map data
      print("Ronak" + encodedMap); //print map data
      _addToCookie("store", encodedMap); //add to cookie
    }

    var getstorage = _getCookie("store"); //get to cookie
    detail = json.decode(
        getstorage); //map (Details value)store in variable getstorage and decode
    print(detail); //print data
    _selected = List<bool>.generate(detail.length, (int index) => false);
  } //Data table

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: const [
                      Text("charger management",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 600),
                      Text("business management / charger management"),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 120,
                  color: Colors.black12,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              width: 150,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
//
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    setState(() {});
                                  },
                                  child: TextField(
                                    controller: searchStationNameController,
                                    style: TextStyle(
                                      color: Colors.black,
                                      height: 1,
                                    ),
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(fontSize: 15),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(),
                                      hintText: 'station name',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 40,
                              width: 150,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
//
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    setState(() {});
                                  },
                                  child: TextField(
                                    style: TextStyle(
                                      color: Colors.black,
                                      height: 1,
                                    ),
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(fontSize: 15),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(),
                                      hintText: 'Charger serial no',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                                height: 40,
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    hint: Text(
                                      'Select Item',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).hintColor,
                                      ),
                                    ),
                                    items: items
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    value: dropdownvalue,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue = newValue!;
                                      });
                                    },
                                    scrollbarRadius: const Radius.circular(40),
                                    scrollbarThickness: 6,
                                    scrollbarAlwaysShow: true,
                                    buttonHeight: 20,
                                    buttonWidth: 140,
                                    itemHeight: 30,
                                    dropdownMaxHeight: 200,
                                    dropdownWidth: 150,
                                    offset: const Offset(-5, 0),
                                  ),
                                )),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 40,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.blue,
                              ),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      detail = searchList
                                          .where((e) => e['Station name']
                                              .contains(
                                                  searchStationNameController
                                                      .text))
                                          .toList();
                                    });
                                  },
                                  child: const Text("inquiry",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () async {
                                setState(() {
                                  detail = searchList;
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: const Center(
                                  child: Text("reset",
                                      style: TextStyle(color: Colors.black)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                clearText();
                                showDialog<void>(
                                    context: context,
                                    builder: (context) => SimpleDialog(
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.5,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text("add"),
                                                      SizedBox(
                                                        width: 180,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 8.0),
                                                        child: InkWell(
                                                            onTap: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Icon(
                                                                Icons.close)),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Wrap(
                                                    direction: Axis.horizontal,
                                                    spacing: 5.0,
                                                    runSpacing: 10.0,
                                                    children: [
                                                      WrapContainer(
                                                          "charger serial no",
                                                          "Input Numbers",
                                                          mywrapController1),
                                                      WrapContainer(
                                                          "charge ammter",
                                                          "Input Numbers",
                                                          mywrapController2),
                                                      WrapContainer(
                                                          "Choose time Zone",
                                                          "Input Numbers",
                                                          mywrapController3),
                                                    ],
                                                  ),
                                                  Divider(
                                                    height: 15,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            30.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          height: 40,
                                                          width: 70,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            color: Colors.blue,
                                                          ),
                                                          child: Center(
                                                            child: InkWell(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                setState(() {});
                                                              },
                                                              child: Text(
                                                                  "Cancel",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white)),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 30),
                                                        Container(
                                                          height: 40,
                                                          width: 70,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            color: Colors.blue,
                                                          ),
                                                          child: Center(
                                                            child: InkWell(
                                                              // stno.add(ctrol.text);
                                                              // Details.add(mycontroller.text)
                                                              onTap: () async {
                                                                final prefs =
                                                                    await SharedPreferences
                                                                        .getInstance();
                                                                // prefs.setString(
                                                                //     'timeData',
                                                                //     encodedMap);
                                                                await prefs.setString(
                                                                    'action',
                                                                    mywrapController1
                                                                        .text);
                                                                // _addToCookie(
                                                                //     'Station no',
                                                                //     mywrapController1
                                                                //         .text);

                                                                detail.add({
                                                                  'id': detail
                                                                          .length +
                                                                      1,
                                                                  'Station no':
                                                                      mywrapController1
                                                                          .text,
                                                                  'Station name':
                                                                      mywrapController2
                                                                          .text,
                                                                  'Ac':
                                                                      mywrapController3
                                                                          .text,
                                                                  'Dc':
                                                                      mywrapController4
                                                                          .text,
                                                                  'offline oprating on mode':
                                                                      mywrapController5
                                                                          .text,
                                                                });
                                                                String
                                                                    encodedMap =
                                                                    json.encode(
                                                                        detail);
                                                                _addToCookie(
                                                                    "store",
                                                                    encodedMap);
                                                                _selected
                                                                    .add(false);
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: Text(
                                                                  "Submit",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white)),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // AddRequest(needToNavigate: true)
                                          ],
                                        )).then((val) {
                                  setState(() {});
                                });
                                // stno.add(ctrol.text);
                                //  setState(() {});
                              },
                              child: Container(
                                height: 40,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.blue,
                                ),
                                child: Center(
                                  child: Text("add",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {
                                showDialog<void>(
                                    context: context,
                                    builder: (context) =>
                                        SimpleDialog(children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.2,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Column(
                                              children: [
                                                const Text(
                                                  'Alert mesages',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const Text(
                                                  "Are you sure ?",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                        setState(
                                                          () {
                                                            setState(() {
                                                              for (int i = 0;
                                                                  i <=
                                                                      _selected
                                                                          .length;
                                                                  i++) {
                                                                if (_selected[
                                                                    i]) {
                                                                  detail
                                                                      .removeAt(
                                                                          i);
                                                                  _selected
                                                                      .removeAt(
                                                                          i);
                                                                  // selecteditems.add(i);
                                                                }
                                                              }
                                                            });
                                                            String encodedMap =
                                                                json.encode(
                                                                    detail);
                                                            _addToCookie(
                                                                "store",
                                                                encodedMap);
                                                            // _selected.add(false);
                                                            // Navigator.of(context)
                                                            //     .pop();
                                                          },
                                                        );
                                                      },
                                                      child: Container(
                                                        height: 40,
                                                        width: 70,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Colors.blue,
                                                        ),
                                                        child: const Center(
                                                          child: Text("Confirm",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white)),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                        setState(() {});
                                                      },
                                                      child: Container(
                                                        height: 40,
                                                        width: 70,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Colors.blue,
                                                        ),
                                                        child: const Center(
                                                          child: Text("Cancel",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ])).then((val) {
                                  setState(() {});
                                });

                                // _selected.add(true);
                                // Details.removeLast();
                                // Navigator.of(context).pop();
                              },
                              child: Container(
                                height: 40,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.red,
                                ),
                                child: const Center(
                                  child: Text("delete",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 40,
                              width: 230,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.green,
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text("profile managment upgrading",
                                        style: TextStyle(color: Colors.white)),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Icon(Icons.cloud_upload_sharp,
                                        color: Colors.white, size: 15),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 40,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.green,
                              ),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  child: const Text("export",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Scrollbar(
                    isAlwaysShown: true,
                    showTrackOnHover: true,
                    child: ListView(
                      children: [_createDataTable()],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 60,
                  color: Colors.black12,
                )
              ],
            )),
          ],
        ),
      ),
    );
  }

  Container WrapContainer(
    String title,
    String hinttext,
    TextEditingController mycontroller,
  ) {
    return Container(
      width: 400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 150,
              child: Text(title, style: TextStyle(color: Colors.black))),
          // SizedBox(
          //   width: 30,
          // ),
          SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () {
              setState(() {});
            },
            child: SizedBox(
              width: 200,
              child: TextField(
                controller: mycontroller,
                style: const TextStyle(
                  color: Colors.black,
                  height: 1,
                ),
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 15),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: hinttext,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataTable _createDataTable() {
    return DataTable(columns: _createColumns(), rows: _createRows());
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('ID')),
      DataColumn(label: Text('Charger serial no')),
      DataColumn(label: Text('Station name')),
      DataColumn(label: Text('charge ammeter')),
      DataColumn(label: Text('Whether to push')),
      DataColumn(label: Text('metr firmware version')),
    ];
  }

  List<DataRow> _createRows() {
    return detail
        .mapIndexed((index, book) => DataRow(
                cells: [
                  DataCell(Text('' + book['id'].toString())),
                  DataCell(Text(book['Station no'])),
                  DataCell(Text(book['Station name'])),
                  DataCell(Text(book['Ac'])),
                  DataCell(Text(book['Dc'])),
                  DataCell(Text(book['offline oprating on mode']))
                ],
                selected: _selected[index],
                onSelectChanged: (bool? selected) {
                  setState(() {
                    _selected[index] = selected!;
                    store = index;
                  });
                }))
        .toList();
  }

  void getData() async {
    final get = await SharedPreferences.getInstance();
    setState(() {
      act = get.getString('action')!;
    });
  }

  void _addToCookie(String key, String value) {
    // 2592000 sec = 30 days.
    document.cookie = "$key=$value; max-age=2592000; path=/;";
  }

  String _getCookie(String key) {
    String cookies = document.cookie!;
    List<String> listValues =
        cookies.isNotEmpty ? cookies.split(";") : <String>[];
    String matchVal = "";
    for (int i = 0; i < listValues.length; i++) {
      List<String> map = listValues[i].split("=");
      String _key = map[0].trim();
      String _val = map[1].trim();
      if (key == _key) {
        matchVal = _val;
        break;
      }
    }
    return matchVal;
  }
}
/////////////////////////////////////////////////////////////////////////////////////////


import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:html';

class Chargermanagment extends StatefulWidget {
  const Chargermanagment({Key? key}) : super(key: key);

  @override
  _ChargermanagmentState createState() => _ChargermanagmentState();
}

class _ChargermanagmentState extends State<Chargermanagment> {
  TextEditingController myController1 = TextEditingController();
  TextEditingController myController2 = TextEditingController();
  TextEditingController myController3 = TextEditingController();
  TextEditingController myController4 = TextEditingController();
  TextEditingController myController5 = TextEditingController();
  String act = "";
  TextEditingController StationController = TextEditingController();
  TextEditingController SerialController = TextEditingController();

  var data;
  List<dynamic> chargdetail = [];
  List<dynamic> chargsearchList = [];
  List<Map> ChargDetails = [
    {
      'id': 1,
      'Charger serial no': '123',
      'Station name': 'customer',
      'charge ammeter': '0',
      'Whether to push': '1',
      'metr firmware version': 'normal card'
    },
    {
      'id': 2,
      'Charger serial no': '7',
      'Station name': 'customer',
      'charge ammeter': '0',
      'Whether to push': '1',
      'metr firmware version': 'normal card'
    },
    {
      'id': 3,
      'Charger serial no': '6325',
      'Station name': 'customer',
      'charge ammeter': '0',
      'Whether to push': '1',
      'metr firmware version': 'normal card'
    }
  ];
  String dropdownvalue = 'Available';
  var items = [
    'Available',
    'Offline',
    'Preparing',
    'Charging',
    'SuspendedEVSE',
    'SuspendedEV',
    'Finishing',
    'Reserved',
    'Unavailable',
    'Faulted',
  ];
  String time = 'not';
  var choosedata = ['is', 'not'];
  String choose1 = "Africa/Accra";
  var _chooseTime = [
    ' Africa/Abidjan',
    'Africa/Accra',
    'Africa/Algiers',
    'Africa/Asmara',
    'Africa/Asmera',
    'Africa/Bamako',
    'Africa/Bangui',
    'Africa/Banjul',
    'Africa/Bissau',
    'Africa/Blantyre',
    'Africa/Brazzaville',
    'Africa/Bujumbura',
    'Africa/Cairo',
    'Africa/Casablanca',
    'Africa/Ceuta',
    'Africa/Conakry',
    'Africa/Dakar',
    'Africa/Dar_es_Salaam',
    'Africa/Djibouti',
    'Africa/Douala',
    'Africa/El_Aaiun',
    'Africa/Freetown',
    'Africa/Gaborone',
    'Africa/Harare',
    'Africa/Johannesburg',
    'Africa/Juba',
    'Africa/Kampala',
    'Africa/Khartoum',
    'Africa/Kigali',
    'Africa/Kinshasa',
    'Africa/Lagos',
    'Africa/Librevill',
    'Africa/Lome',
    'Africa/Luanda',
    'Africa/Lubu',
    'Africa/Lusaka',
    'Africa/Malabo',
    'Africa/Maputo',
    'Africa/Maseru',
    'Africa/Mbaban',
    'Africa/Mogadis',
    'Africa/Monro',
    'Africa/Nairobi',
    'Africa/Ndjame',
    'Africa/Niamey',
    'Africa/Nouakch',
    'Africa/Ouagado',
    'Africa/Porto-Novo',
    'Africa/Sao_Tome',
    'Africa/Timbuktu',
    'Africa/Tripoli',
    'Africa/Tunis',
    'Africa/Windhoek',
    'America/Adak',
    'America/Anchora',
    'America/Anguill',
    'America/Antigua',
    'America/Araguai',
    'America/Argentina',
    'America/Argentina',
    'America/Argentina/Cordoba',
    'America/Argentina/Jujuy',
    'America/Argentina',
    'America/Argentina',
    'America/Argentina',
    'America/Argentina/Salta',
    'America/Argentina',
    'America/Argentina',
    'America/Argentina',
    'America/Aruba',
    'America/Asuncion',
    'America/Atikokan',
    'America/Atka',
    'America/Bahia',
    'America/Bahia_Banderas',
    'America/Barbados',
    'America/Belem',
    'America/Belize',
    'America/Blanc-Sablon',
    'America/Boa_Vista',
    'America/Bogota',
    'America/Boise',
    'America/Buenos_Aires',
    'America/Cambridge_Bay',
    'America/Campo_Grande',
    'America/Cancun',
    'America/Caracas',
    'America/Catamarca',
    'America/Cayenne',
    'America/Cayman',
    'America/Chicago',
    'America/Chihuahua',
    'America/Cordoba',
    'America/Costa_Rica',
    'America/Creston',
    'America/Cuiaba',
    'America/Curacao',
    'merica/Danmarkshavn',
    'merica/Dawson',
    'merica/Dawson_Creek',
    'merica/Denver',
    'merica/Detroit',
    'merica/Dominica',
    'merica/Edmonton',
    'merica/Eirunepe',
    'merica/El_Salvador',
  ];

  // bool? single;
  List<bool> _chargselected = [];

  void clearText() {
    myController1.clear();
    myController2.clear();
    myController3.clear();
    myController4.clear();
    myController5.clear();
  }

  void initState() {
    //je display kravvu hoi ae always aani andr aavse
    super.initState();

    // getData();
    var addstored = _getCookie("data");
    if (addstored == null || addstored.isEmpty) {
      String encodedMap =
          json.encode(ChargDetails); //convert to string map data
      print("Ronak" + encodedMap); //print map data
      _addToCookie("data", encodedMap); //add to cookie
    }

    var getstorage = _getCookie("data"); //get to cookie
    chargdetail = json.decode(
        getstorage); //map (Details value)store in variable getstorage and decode
    print(chargdetail); //print data
    _chargselected =
        List<bool>.generate(chargdetail.length, (int index) => false);
  } //Data table

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: const [
                      Text("charger management",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 600),
                      Text("business management / charger management"),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 120,
                  color: Colors.black12,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              width: 150,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
//
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    setState(() {});
                                  },
                                  child: TextField(
                                    controller: StationController,
                                    style: TextStyle(
                                      color: Colors.black,
                                      height: 1,
                                    ),
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(fontSize: 15),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(),
                                      hintText: 'station name',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 40,
                              width: 150,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
//
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    setState(() {});
                                  },
                                  child: TextField(
                                    controller: SerialController,
                                    style: TextStyle(
                                      color: Colors.black,
                                      height: 1,
                                    ),
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(fontSize: 15),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(),
                                      hintText: 'Charger serial no',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                                height: 40,
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.black54,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    hint: Text(
                                      'Select Item',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).hintColor,
                                      ),
                                    ),
                                    items: items
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    value: dropdownvalue,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue = newValue!;
                                      });
                                    },
                                    scrollbarRadius: const Radius.circular(40),
                                    scrollbarThickness: 6,
                                    scrollbarAlwaysShow: true,
                                    buttonHeight: 20,
                                    buttonWidth: 140,
                                    itemHeight: 30,
                                    dropdownMaxHeight: 200,
                                    dropdownWidth: 150,
                                    offset: const Offset(-5, 0),
                                  ),
                                )),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 40,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.blue,
                              ),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      chargdetail = chargsearchList
                                          .where((e) => e['Station name']
                                              .contains(StationController.text))
                                          .toList();
                                      chargdetail = chargsearchList
                                          .where((e) => e['Charger serial no']
                                              .contains(SerialController.text))
                                          .toList();
                                    });
                                  },
                                  child: const Text("inquiry",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () async {
                                setState(() {
                                  chargdetail = chargsearchList;
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: const Center(
                                  child: Text("reset",
                                      style: TextStyle(color: Colors.black)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                clearText();
                                showDialog<void>(
                                    context: context,
                                    builder: (context) => SimpleDialog(
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.5,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text("add"),
                                                      SizedBox(
                                                        width: 180,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 8.0),
                                                        child: InkWell(
                                                            onTap: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Icon(
                                                                Icons.close)),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Wrap(
                                                    direction: Axis.horizontal,
                                                    spacing: 5.0,
                                                    runSpacing: 10.0,
                                                    children: [
                                                      WrapContainer(
                                                          "charger serial no",
                                                          "Input Numbers",
                                                          myController1),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 15),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                                'charge ammeter'),
                                                            SizedBox(width: 68),
                                                            Container(
                                                                height: 40,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            5.0),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5.0),
                                                                  color: Colors
                                                                      .white,
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .black54,
                                                                  ),
                                                                ),
                                                                child:
                                                                    DropdownButtonHideUnderline(
                                                                  child:
                                                                      DropdownButton2(
                                                                    hint: Text(
                                                                      'charge ammter',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Theme.of(context)
                                                                            .hintColor,
                                                                      ),
                                                                    ),
                                                                    items: choosedata
                                                                        .map((item) => DropdownMenuItem<String>(
                                                                              value: item,
                                                                              child: Text(
                                                                                item,
                                                                                style: const TextStyle(
                                                                                  fontSize: 14,
                                                                                ),
                                                                              ),
                                                                            ))
                                                                        .toList(),
                                                                    value: time,
                                                                    onChanged:
                                                                        (String?
                                                                            newValue) {
                                                                      setState(
                                                                          () {
                                                                        time =
                                                                            newValue!;
                                                                      });
                                                                    },
                                                                    scrollbarRadius:
                                                                        const Radius.circular(
                                                                            40),
                                                                    scrollbarThickness:
                                                                        6,
                                                                    scrollbarAlwaysShow:
                                                                        true,
                                                                    buttonHeight:
                                                                        20,
                                                                    buttonWidth:
                                                                        140,
                                                                    itemHeight:
                                                                        30,
                                                                    dropdownMaxHeight:
                                                                        200,
                                                                    dropdownWidth:
                                                                        150,
                                                                    offset:
                                                                        const Offset(
                                                                            -5,
                                                                            0),
                                                                  ),
                                                                )),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 15),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                                'choose time zone'),
                                                            SizedBox(width: 60),
                                                            Container(
                                                                height: 40,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            5.0),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5.0),
                                                                  color: Colors
                                                                      .white,
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .black54,
                                                                    style: BorderStyle
                                                                        .solid,
                                                                  ),
                                                                ),
                                                                child:
                                                                    DropdownButtonHideUnderline(
                                                                  child:
                                                                      DropdownButton2(
                                                                    hint: Text(
                                                                      'Select Item',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Theme.of(context)
                                                                            .hintColor,
                                                                      ),
                                                                    ),
                                                                    items: _chooseTime
                                                                        .map((time) => DropdownMenuItem<String>(
                                                                              value: time,
                                                                              child: Text(
                                                                                time,
                                                                                style: const TextStyle(
                                                                                  fontSize: 14,
                                                                                ),
                                                                              ),
                                                                            ))
                                                                        .toList(),
                                                                    value:
                                                                        choose1,
                                                                    onChanged:
                                                                        (String?
                                                                            newValue) {
                                                                      setState(
                                                                          () {
                                                                        choose1 =
                                                                            newValue!;
                                                                      });
                                                                    },
                                                                    scrollbarRadius:
                                                                        const Radius.circular(
                                                                            40),
                                                                    scrollbarThickness:
                                                                        6,
                                                                    scrollbarAlwaysShow:
                                                                        true,
                                                                    buttonHeight:
                                                                        20,
                                                                    buttonWidth:
                                                                        205,
                                                                    itemHeight:
                                                                        30,
                                                                    dropdownMaxHeight:
                                                                        200,
                                                                    dropdownWidth:
                                                                        215,
                                                                    offset:
                                                                        const Offset(
                                                                            -5,
                                                                            0),
                                                                  ),
                                                                )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(
                                                    height: 15,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            30.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          height: 40,
                                                          width: 70,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            color: Colors.blue,
                                                          ),
                                                          child: Center(
                                                            child: InkWell(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                setState(() {});
                                                              },
                                                              child: Text(
                                                                  "Cancel",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white)),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 30),
                                                        Container(
                                                          height: 40,
                                                          width: 70,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            color: Colors.blue,
                                                          ),
                                                          child: Center(
                                                            child: InkWell(
                                                              // stno.add(ctrol.text);
                                                              // Details.add(mycontroller.text)
                                                              onTap: () async {
                                                                final prefs =
                                                                    await SharedPreferences
                                                                        .getInstance();
                                                                // prefs.setString(
                                                                //     'timeData',
                                                                //     encodedMap);
                                                                await prefs.setString(
                                                                    'action',
                                                                    myController1
                                                                        .text);
                                                                // _addToCookie(
                                                                //     'Station no',
                                                                //     mywrapController1
                                                                //         .text);

                                                                chargdetail
                                                                    .add({
                                                                  'id': chargdetail
                                                                          .length +
                                                                      1,
                                                                  'Charger serial no':
                                                                      myController1
                                                                          .text,
                                                                  // 'Station name':
                                                                  //     myController2
                                                                  //         .text,
                                                                  'charge ammeter':
                                                                      myController3
                                                                          .text,
                                                                  // 'Dc':
                                                                  //     myController4
                                                                  //         .text,
                                                                  // 'metr firmware version':
                                                                  //     myController5
                                                                  //         .text,
                                                                });
                                                                String
                                                                    encodedMap =
                                                                    json.encode(
                                                                        chargdetail);
                                                                _addToCookie(
                                                                    "data",
                                                                    encodedMap);
                                                                _chargselected
                                                                    .add(false);
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: Text(
                                                                  "Submit",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white)),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // AddRequest(needToNavigate: true)
                                          ],
                                        )).then((val) {
                                  setState(() {});
                                });
                                // stno.add(ctrol.text);
                                //  setState(() {});
                              },
                              child: Container(
                                height: 40,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.blue,
                                ),
                                child: Center(
                                  child: Text("add",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {
                                showDialog<void>(
                                    context: context,
                                    builder: (context) =>
                                        SimpleDialog(children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.2,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Column(
                                              children: [
                                                const Text(
                                                  'Alert mesages',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const Text(
                                                  "Are you sure ?",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                        setState(
                                                          () {
                                                            setState(() {
                                                              for (int i = 0;
                                                                  i <=
                                                                      _chargselected
                                                                          .length;
                                                                  i++) {
                                                                if (_chargselected[
                                                                    i]) {
                                                                  chargdetail
                                                                      .removeAt(
                                                                          i);
                                                                  _chargselected
                                                                      .removeAt(
                                                                          i);
                                                                  // selecteditems.add(i);
                                                                }
                                                              }
                                                            });
                                                            String encodedMap =
                                                                json.encode(
                                                                    chargdetail);
                                                            _addToCookie("data",
                                                                encodedMap);
                                                            // _selected.add(false);
                                                            // Navigator.of(context)
                                                            //     .pop();
                                                          },
                                                        );
                                                      },
                                                      child: Container(
                                                        height: 40,
                                                        width: 70,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Colors.blue,
                                                        ),
                                                        child: const Center(
                                                          child: Text("Confirm",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white)),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                        setState(() {});
                                                      },
                                                      child: Container(
                                                        height: 40,
                                                        width: 70,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Colors.blue,
                                                        ),
                                                        child: const Center(
                                                          child: Text("Cancel",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ])).then((val) {
                                  setState(() {});
                                });

                                // _selected.add(true);
                                // Details.removeLast();
                                // Navigator.of(context).pop();
                              },
                              child: Container(
                                height: 40,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.red,
                                ),
                                child: const Center(
                                  child: Text("delete",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 40,
                              width: 230,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.green,
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text("profile managment upgrading",
                                        style: TextStyle(color: Colors.white)),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Icon(Icons.cloud_upload_sharp,
                                        color: Colors.white, size: 15),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 40,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.green,
                              ),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  child: const Text("export",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Scrollbar(
                    isAlwaysShown: true,
                    showTrackOnHover: true,
                    child: ListView(
                      children: [_createDataTable()],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 60,
                  color: Colors.black12,
                )
              ],
            )),
          ],
        ),
      ),
    );
  }

  Container WrapContainer(
    String title,
    String hinttext,
    TextEditingController mycontroller,
  ) {
    return Container(
      width: 400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 150,
              child: Text(title, style: TextStyle(color: Colors.black))),
          // SizedBox(
          //   width: 30,
          // ),
          SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () {
              setState(() {});
            },
            child: SizedBox(
              width: 200,
              child: TextField(
                controller: mycontroller,
                style: const TextStyle(
                  color: Colors.black,
                  height: 1,
                ),
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 15),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: hinttext,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataTable _createDataTable() {
    return DataTable(columns: _createColumns(), rows: _createRows());
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('ID')),
      DataColumn(label: Text('Charger serial no')),
      DataColumn(label: Text('Station name')),
      DataColumn(label: Text('charge ammeter')),
      DataColumn(label: Text('Whether to push')),
      DataColumn(label: Text('metr firmware version')),
    ];
  }

  List<DataRow> _createRows() {
    return chargdetail
        .mapIndexed((index, book) => DataRow(
                cells: [
                  DataCell(Text('' + book['id'].toString())),
                  DataCell(Text(book['Charger serial no'])),
                  DataCell(Text(book['Station name'])),
                  DataCell(Text(book['charge ammeter'])),
                  DataCell(Text(book['Whether to push'])),
                  DataCell(Text(book['metr firmware version']))
                ],
                selected: _chargselected[index],
                onSelectChanged: (bool? selected) {
                  setState(() {
                    _chargselected[index] = selected!;
                    data = index;
                  });
                }))
        .toList();
  }

  void getData() async {
    final get = await SharedPreferences.getInstance();
    setState(() {
      act = get.getString('action')!;
    });
  }

  void _addToCookie(String key, String value) {
    // 2592000 sec = 30 days.
    document.cookie = "$key=$value; max-age=2592000; path=/;";
  }

  String _getCookie(String key) {
    String cookies = document.cookie!;
    List<String> listValues =
        cookies.isNotEmpty ? cookies.split(";") : <String>[];
    String matchVal = "";
    for (int i = 0; i < listValues.length; i++) {
      List<String> map = listValues[i].split("=");
      String _key = map[0].trim();
      String _val = map[1].trim();
      if (key == _key) {
        matchVal = _val;
        break;
      }
    }
    return matchVal;
  }
}
//////////////////////////////////////////////////////////////////////////////////////

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:html';

class Smartcharging extends StatefulWidget {
  const Smartcharging({Key? key}) : super(key: key);

  @override
  _SmartchargingState createState() => _SmartchargingState();
}

class _SmartchargingState extends State<Smartcharging> {
  TextEditingController mytextController1 = TextEditingController();
  TextEditingController mytextController2 = TextEditingController();
  TextEditingController mytextController3 = TextEditingController();
  TextEditingController mytextController4 = TextEditingController();
  TextEditingController mytextController5 = TextEditingController();

  TextEditingController StationNameController = TextEditingController();

  var smartdatastore;
  List<dynamic> smartChargdetail = [];
  List<dynamic> searchList = [];

  List<Map> SmartchargDetails = [
    {
      'id': 1,
      ' Station name': 'rajkot',
      'transformer power(kW)': '10',
      'non charger power(kW)': '0',
      'ammeter power(kW)': '1',
      'limiting coefficient': 'normal card'
    },
  ];
  // bool? single;
  List<bool> _smartchargselected = [];

  void clearText() {
    mytextController1.clear();
    mytextController2.clear();
    mytextController3.clear();
    mytextController4.clear();
    mytextController5.clear();
  }

  void initState() {
    //je display kravvu hoi ae always aani andr aavse
    super.initState();
    var addstored = _getCookie("datastore");
    if (addstored == null || addstored.isEmpty) {
      String encodedMap =
          json.encode(SmartchargDetails); //convert to string map data
      print("Ronak" + encodedMap); //print map data
      _addToCookie("datastore", encodedMap); //add to cookie
    }

    var getstorage = _getCookie("datastore"); //get to cookie
    smartChargdetail = json.decode(
        getstorage); //map (Details value)store in variable getstorage and decode
    print(smartChargdetail); //print data
    searchList = smartChargdetail;
    _smartchargselected =
        List<bool>.generate(smartChargdetail.length, (int index) => false);
  } //Data table

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: const [
                      Text("charging station management",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 500),
                      Text(
                          "Business managment  /  charging station management"),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 60,
                  color: Colors.black12,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 150,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
//
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                                setState(() {});
                              },
                              child: TextField(
                                controller: StationNameController,
                                style: TextStyle(
                                  color: Colors.black,
                                  height: 1,
                                ),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 15),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(),
                                  hintText: 'station name',
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 40,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.blue,
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  smartChargdetail = searchList
                                      .where((e) => e['Charger serial no']
                                          .contains(StationNameController.text))
                                      .toList();
                                });
                              },
                              child: const Text("inquire",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () async {
                            clearText();

                            setState(() {
                              smartChargdetail = searchList;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: const Center(
                              child: Text("reset",
                                  style: TextStyle(color: Colors.black)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 420,
                        ),
                        InkWell(
                          onTap: () {
                            clearText();
                            showDialog<void>(
                                context: context,
                                builder: (context) => SimpleDialog(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.7,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text("add",
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                      )),
                                                  SizedBox(
                                                    width: 500,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 20),
                                                    child: InkWell(
                                                        onTap: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child:
                                                            Icon(Icons.close)),
                                                  ),
                                                ],
                                              ),
                                              Divider(
                                                height: 20,
                                              ),
                                              Wrap(
                                                direction: Axis.horizontal,
                                                spacing: 5.0,
                                                runSpacing: 10.0,
                                                children: [
                                                  WrapContainer(
                                                      "station name",
                                                      "Input Numbers",
                                                      mytextController1),
                                                  WrapContainer(
                                                      'transformer power(kW)',
                                                      "Input Numbers",
                                                      mytextController2),
                                                  WrapContainer(
                                                      'non charger power(kW)',
                                                      "Input Numbers",
                                                      mytextController3),
                                                  WrapContainer(
                                                      'ammeter power(kW)',
                                                      "Input Numbers",
                                                      mytextController4),
                                                  WrapContainer(
                                                      'limiting coefficient',
                                                      "Input Numbers",
                                                      mytextController5),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(30.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 40,
                                                      width: 70,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: Colors.blue,
                                                      ),
                                                      child: Center(
                                                        child: InkWell(
                                                          onTap: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            setState(() {});
                                                          },
                                                          child: Text("Cancel",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white)),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 30),
                                                    Container(
                                                      height: 40,
                                                      width: 70,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: Colors.blue,
                                                      ),
                                                      child: Center(
                                                        child: InkWell(
                                                          onTap: () async {
                                                            smartChargdetail
                                                                .add({
                                                              'id': smartChargdetail
                                                                      .length +
                                                                  1,
                                                              'Station name':
                                                                  mytextController1
                                                                      .text,
                                                              'transformer power(kW)':
                                                                  mytextController2
                                                                      .text,
                                                              'non charger power(kW)':
                                                                  mytextController3
                                                                      .text,
                                                              'ammeter power(kW)':
                                                                  mytextController4
                                                                      .text,
                                                              'limiting coefficient':
                                                                  mytextController5
                                                                      .text,
                                                            });
                                                            String encodedMap =
                                                                json.encode(
                                                                    smartChargdetail);
                                                            _addToCookie(
                                                                "datastore",
                                                                encodedMap);
                                                            _smartchargselected
                                                                .add(false);
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text("Submit",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // AddRequest(needToNavigate: true)
                                      ],
                                    )).then((val) {
                              setState(() {});
                            });
                            // stno.add(ctrol.text);
                            //  setState(() {});
                          },
                          child: Container(
                            height: 40,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.blue,
                            ),
                            child: Center(
                              child: Text("add",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            showDialog<void>(
                                context: context,
                                builder: (context) => SimpleDialog(children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Column(
                                          children: [
                                            const Text(
                                              'Alert mesages',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const Text(
                                              "Are you sure ?",
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.of(context).pop();
                                                    setState(
                                                      () {
                                                        setState(() {
                                                          for (int i = 0;
                                                              i <=
                                                                  _smartchargselected
                                                                      .length;
                                                              i++) {
                                                            if (_smartchargselected[
                                                                i]) {
                                                              smartChargdetail
                                                                  .removeAt(i);
                                                              _smartchargselected
                                                                  .removeAt(i);
                                                              // selecteditems.add(i);
                                                            }
                                                          }
                                                        });
                                                        String encodedMap =
                                                            json.encode(
                                                                smartChargdetail);
                                                        _addToCookie(
                                                            "datastore",
                                                            encodedMap);
                                                        // _selected.add(false);
                                                        // Navigator.of(context)
                                                        //     .pop();
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    height: 40,
                                                    width: 70,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors.blue,
                                                    ),
                                                    child: const Center(
                                                      child: Text("Confirm",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.of(context).pop();
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    height: 40,
                                                    width: 70,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors.blue,
                                                    ),
                                                    child: const Center(
                                                      child: Text("Cancel",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ])).then((val) {
                              setState(() {});
                            });

                            // _selected.add(true);
                            // Details.removeLast();
                            // Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 40,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.red,
                            ),
                            child: const Center(
                              child: Text("delete",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 40,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.blue,
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                setState(() {});
                              },
                              child: const Text("export",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Scrollbar(
                    isAlwaysShown: true,
                    showTrackOnHover: true,
                    child: searchList.isEmpty || smartChargdetail.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("No Data Found !"),
                            ],
                          )
                        : ListView(
                            children: [_createDataTable()],
                          ),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Container WrapContainer(
    String title,
    String hinttext,
    TextEditingController mycontroller,
  ) {
    return Container(
      width: 400,
      child: Row(
        children: [
          Container(
            width: 100,
            child: Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
          ),
          // SizedBox(
          //   width: 30,
          // ),
          InkWell(
            onTap: () {
              setState(() {});
            },
            child: SizedBox(
              width: 290,
              child: TextField(
                controller: mycontroller,
                style: const TextStyle(
                  color: Colors.black,
                  height: 1,
                ),
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 15),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: hinttext,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataTable _createDataTable() {
    return DataTable(columns: _createColumns(), rows: _createRows());
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('ID')),
      DataColumn(label: Text(' Station name')),
      DataColumn(label: Text('transformer power(kW)')),
      DataColumn(label: Text('non charger power(kW)')),
      DataColumn(label: Text('ammeter power(kW)')),
      DataColumn(label: Text('limiting coefficient')),
    ];
  }

  List<DataRow> _createRows() {
    return smartChargdetail
        .mapIndexed((index, book) => DataRow(
                cells: [
                  DataCell(Text('' + book['id'].toString())),
                  DataCell(Text(book['Station name'])),
                  DataCell(Text(book['transformer power(kW)'])),
                  DataCell(Text(book['non charger power(kW)'])),
                  DataCell(Text(book['ammeter power(kW)'])),
                  DataCell(Text(book['limiting coefficient']))
                ],
                selected: _smartchargselected[index],
                onSelectChanged: (bool? selected) {
                  setState(() {
                    _smartchargselected[index] = selected!;
                    smartdatastore = index;
                  });
                }))
        .toList();
  }

  void _addToCookie(String key, String value) {
    // 2592000 sec = 30 days.
    document.cookie = "$key=$value; max-age=2592000; path=/;";
  }

  String _getCookie(String key) {
    String cookies = document.cookie!;
    List<String> listValues =
        cookies.isNotEmpty ? cookies.split(";") : <String>[];
    String matchVal = "";
    for (int i = 0; i < listValues.length; i++) {
      List<String> map = listValues[i].split("=");
      String _key = map[0].trim();
      String _val = map[1].trim();
      if (key == _key) {
        matchVal = _val;
        break;
      }
    }
    return matchVal;
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////
