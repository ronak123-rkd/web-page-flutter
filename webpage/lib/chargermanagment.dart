import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  TextEditingController mychargeController1 = TextEditingController();
  TextEditingController StationNameController = TextEditingController();
  TextEditingController ChargerController = TextEditingController();
  TextEditingController ChargerserialController = TextEditingController();

  String dropdownvalue = 'Available';
  var chargitems = [
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
  String chargameter = 'Not';
  var choosedata = ['Is', 'Not'];

  String choosetimezone = "Africa/Accra";
  var chooseTimedata = [
    "Asia/Calcutta",
    "Africa/Accra",
    "Africa/Algiers",
    "Africa/Asmara",
    "Africa/Bamako",
    "Africa/Lagos",
  ];

  List<dynamic> searchdataList = [];
  List<dynamic> chargedetail = [];
  var datastore = [];

  List<bool> _selecteddata = [];

  var storevalue;
  List<Map> ChargeDetails = [
    {
      'id': 1,
      'Charger serial no': '43526378',
      'Station name': 'delhi',
      'charge ammeter': '0',
      'Whether to push': '1',
      'metr firmware version': '9.1',
    }
  ];

  void clearText() {
    mychargeController1.clear();
    StationNameController.clear();
    ChargerController.clear();
    ChargerserialController.clear();
  }

  void initState() {
    super.initState();

    var addstored = _getCookie("chargdata");
    if (addstored == null || addstored.isEmpty) {
      String encodedMap =
          json.encode(ChargeDetails); //convert to string map data
      print("Ronak" + encodedMap); //print map data
      _addToCookie("chargdata", encodedMap); //add to cookie
    }

    var getstorage = _getCookie("chargdata"); //get to cookie
    chargedetail = json.decode(
        getstorage); //map (Details value)store in variable getstorage and decode
    print(chargedetail);
    searchdataList = chargedetail; //print data
    _selecteddata =
        List<bool>.generate(chargedetail.length, (int index) => false);
  }

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
                    child: Column(children: [
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
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      setState(() {});
                                    },
                                    child: TextField(
                                      controller: ChargerController,
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
                                      items: chargitems
                                          .map((item) =>
                                              DropdownMenuItem<String>(
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
                                      scrollbarRadius:
                                          const Radius.circular(40),
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
                                        // chargedetail = searchdataList
                                        //     .where((e) => e['Station name']
                                        //         .contains(
                                        //             StationNameController.text))
                                        //     .toList();
                                        chargedetail = searchdataList
                                            .where((e) => e['Charger serial no']
                                                .contains(
                                                    ChargerController.text))
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
                              Container(
                                height: 40,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      clearText();
                                      setState(() {
                                        chargedetail = searchdataList;
                                      });
                                    },
                                    child: const Text("reset",
                                        style: TextStyle(color: Colors.black)),
                                  ),
                                ),
                              ),
                            ]),
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
                                    builder: (context) => StatefulBuilder(
                                        builder: (context, setState) {
                                      return SimpleDialog(
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
                                                    height: 40,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 17, top: 8),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                            "Charger serial no"),
                                                        SizedBox(
                                                          width: 60,
                                                        ),
                                                        Container(
                                                          height: 40,
                                                          width: 150,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            color: Colors.white,
                                                          ),
                                                          child: Center(
                                                            child: InkWell(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                setState(() {});
                                                              },
                                                              child: TextField(
                                                                controller:
                                                                    ChargerserialController,
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  height: 1,
                                                                ),
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintStyle:
                                                                      TextStyle(
                                                                          fontSize:
                                                                              15),
                                                                  filled: true,
                                                                  fillColor:
                                                                      Colors
                                                                          .white,
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                  hintText:
                                                                      'Charger serial no',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15),
                                                    child: Row(
                                                      children: [
                                                        Text('charge ammeter'),
                                                        SizedBox(width: 68),
                                                        Container(
                                                            height: 40,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5.0),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                              color:
                                                                  Colors.white,
                                                              border:
                                                                  Border.all(
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
                                                                    color: Theme.of(
                                                                            context)
                                                                        .hintColor,
                                                                  ),
                                                                ),
                                                                items: choosedata
                                                                    .map((item) => DropdownMenuItem<String>(
                                                                          value:
                                                                              item,
                                                                          child:
                                                                              Text(
                                                                            item,
                                                                            style:
                                                                                const TextStyle(
                                                                              fontSize: 14,
                                                                            ),
                                                                          ),
                                                                        ))
                                                                    .toList(),
                                                                value:
                                                                    chargameter,
                                                                onChanged: (String?
                                                                    newValue) {
                                                                  setState(() {
                                                                    chargameter =
                                                                        newValue!;
                                                                  });
                                                                },
                                                                scrollbarRadius:
                                                                    const Radius
                                                                        .circular(40),
                                                                scrollbarThickness:
                                                                    6,
                                                                scrollbarAlwaysShow:
                                                                    true,
                                                                buttonHeight:
                                                                    20,
                                                                buttonWidth:
                                                                    140,
                                                                itemHeight: 30,
                                                                dropdownMaxHeight:
                                                                    200,
                                                                dropdownWidth:
                                                                    150,
                                                                offset:
                                                                    const Offset(
                                                                        -5, 0),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                            'choose time zone'),
                                                        SizedBox(width: 60),
                                                        Container(
                                                            height: 40,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5.0),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                              color:
                                                                  Colors.white,
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black54,
                                                                style:
                                                                    BorderStyle
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
                                                                    color: Theme.of(
                                                                            context)
                                                                        .hintColor,
                                                                  ),
                                                                ),
                                                                items:
                                                                    chooseTimedata
                                                                        .map((time) =>
                                                                            DropdownMenuItem<String>(
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
                                                                    choosetimezone,
                                                                onChanged: (String?
                                                                    newValue) {
                                                                  setState(() {
                                                                    choosetimezone =
                                                                        newValue!;
                                                                  });
                                                                },
                                                                scrollbarRadius:
                                                                    const Radius
                                                                        .circular(40),
                                                                scrollbarThickness:
                                                                    6,
                                                                scrollbarAlwaysShow:
                                                                    true,
                                                                buttonHeight:
                                                                    20,
                                                                buttonWidth:
                                                                    205,
                                                                itemHeight: 30,
                                                                dropdownMaxHeight:
                                                                    200,
                                                                dropdownWidth:
                                                                    215,
                                                                offset:
                                                                    const Offset(
                                                                        -5, 0),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
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
                                                                  .circular(5),
                                                          color: Colors.blue,
                                                        ),
                                                        child: Center(
                                                          child: InkWell(
                                                            // stno.add(ctrol.text);
                                                            // Details.add(mycontroller.text)
                                                            onTap: () async {
                                                              await FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      "charger management data")
                                                                  .doc()
                                                                  .set({
                                                                'id': chargedetail
                                                                        .length +
                                                                    1,
                                                                'Charger serial no':
                                                                    ChargerserialController
                                                                        .text,
                                                                'Station name':
                                                                    '',
                                                                'charge ammeter':
                                                                    chargameter,
                                                                'Whether to push':
                                                                    '',
                                                                'metr firmware version':
                                                                    '',
                                                              });
                                                              // chargedetail.add({
                                                              //   'id': chargedetail
                                                              //           .length +
                                                              //       1,
                                                              //   'Charger serial no':
                                                              //       ChargerserialController
                                                              //           .text,
                                                              //   'Station name':
                                                              //       '',
                                                              //   'charge ammeter':
                                                              //       chargameter,
                                                              //   'Whether to push':
                                                              //       '',
                                                              //   'metr firmware version':
                                                              //       '',
                                                              // });
                                                              print(choosedata);
                                                              String
                                                                  encodedMap =
                                                                  json.encode(
                                                                      chargedetail);
                                                              _addToCookie(
                                                                  "chargdata",
                                                                  encodedMap);
                                                              _selecteddata
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
                                                      SizedBox(width: 30),
                                                      Container(
                                                        height: 40,
                                                        width: 70,
                                                        decoration:
                                                            BoxDecoration(
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
                                                            child: Text(
                                                                "Cancel",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white)),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ]),
                                          ),
                                        ],
                                      );
                                    }),
                                  ).then((val) {
                                    setState(() {});
                                  });
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  const Text(
                                                    'Alert mesages',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                        MainAxisAlignment
                                                            .center,
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
                                                                        _selecteddata
                                                                            .length;
                                                                    i++) {
                                                                  if (_selecteddata[
                                                                      i]) {
                                                                    chargedetail
                                                                        .removeAt(
                                                                            i);
                                                                    _selecteddata
                                                                        .removeAt(
                                                                            i);
                                                                    // selecteditems.add(i);
                                                                  }
                                                                }
                                                              });
                                                              String
                                                                  encodedMap =
                                                                  json.encode(
                                                                      chargedetail);
                                                              _addToCookie(
                                                                  "chargdata",
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
                                                                    .circular(
                                                                        5),
                                                            color: Colors.blue,
                                                          ),
                                                          child: const Center(
                                                            child: Text(
                                                                "Confirm",
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
                                                                    .circular(
                                                                        5),
                                                            color: Colors.blue,
                                                          ),
                                                          child: const Center(
                                                            child: Text(
                                                                "Cancel",
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
                                    setState(() {
                                      // for (int i = 0; i <= _selected.length; i++) {
                                      //   if (_selected[i]) {
                                      //     Details.removeAt(i);
                                      //     _selected.removeAt(i);
                                      //     // selecteditems.add(i);
                                      //   }
                                      // }
                                    });
                                  });
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
                                          style:
                                              TextStyle(color: Colors.white)),
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
                            ]),
                      ),
                    ])),
                SizedBox(height: 20),
                StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection('charger management data')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error = ${snapshot.error}');
                      }
                      if (snapshot.hasData) {
                        final docs = snapshot.data!.docs;
                        return Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Scrollbar(
                            isAlwaysShown: true,
                            showTrackOnHover: true,
                            child: searchdataList.isEmpty ||
                                    chargedetail.isEmpty
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("No Data Found !"),
                                    ],
                                  )
                                : ListView(
                                    children: [_chargDataTable(docs)],
                                  ),
                          ),
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    }),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 60,
                  color: Colors.black12,
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Container ChargContainer(
    String title,
    String hinttext,
    TextEditingController mydatacontroller,
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
                controller: mydatacontroller,
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

  DataTable _chargDataTable(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> data) {
    return DataTable(columns: _chargColumns(), rows: _chargRows(data));
  }

  List<DataColumn> _chargColumns() {
    return [
      DataColumn(label: Text('ID')),
      DataColumn(label: Text('Charger serial no')),
      DataColumn(label: Text('Station name')),
      DataColumn(label: Text('charge ammeter')),
      DataColumn(label: Text('Whether to push')),
      DataColumn(label: Text('metr firmware version')),
    ];
  }

  List<DataRow> _chargRows(data) {
    datastore.clear();
    for (var i = 0; i < docs.length; i++) {
      datastore.add(docs[i]);
    }
    return chargedetail
        .mapIndexed((index, data) => DataRow(
                cells: [
                  DataCell(Text('' + data['id'].toString())),
                  DataCell(Text(data['Charger serial no'])),
                  DataCell(Text(data['Station name'])),
                  DataCell(Text(data['charge ammeter'])),
                  DataCell(Text(data['Whether to push'])),
                  DataCell(Text(data['metr firmware version']))
                ],
                selected: _selecteddata[index],
                onSelectChanged: (bool? selected) {
                  setState(() {
                    _selecteddata[index] = selected!;
                    storevalue = index;
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
