import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
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
  TextEditingController mywrapController1 = TextEditingController();
  TextEditingController mywrapController2 = TextEditingController();
  TextEditingController mywrapController3 = TextEditingController();
  TextEditingController mywrapController4 = TextEditingController();
  TextEditingController mywrapController5 = TextEditingController();
  String act = "";
  TextEditingController searchStationController = TextEditingController();

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
  String _nameItemSelected = "Asia/Calcutta";

  var setrate = 1;

  int value = 0;
  List<int> selecteditems = [];
  // var store;
  var datastore;
  // List<dynamic> detail = [];
  List<dynamic> smartdetail = [];
  // List<dynamic> searchList = [];
  List<dynamic> smartsearchList = [];

  List<Map> Details = [
    {
      'id': 1,
      'Station name': 'rajkot',
      'transformer power(kW)': '5kw',
      'non charger power(kW)': '0',
      'ammeter power(kW)': '1',
      'limiting coefficient': 'normal card'
    },
  ];

  // bool? single;
  // List<bool> _selected = [];
  List<bool> _selectedcharg = [];

  void clearText() {
    mywrapController1.clear();
    mywrapController2.clear();
    mywrapController3.clear();
    mywrapController4.clear();
    mywrapController5.clear();
    searchStationController.clear();
  }

  void initState() {
    //je display kravvu hoi ae always aani andr aavse
    super.initState();

    getData();
    var addstored = _getCookie("datastore");
    if (addstored == null || addstored.isEmpty) {
      String encodedMap = json.encode(Details); //convert to string map data
      print("Ronak" + encodedMap); //print map data
      _addToCookie("datastore", encodedMap); //add to cookie
    }

    var getstorage = _getCookie("datastore"); //get to cookie
    smartdetail = json.decode(
        getstorage); //map (Details value)store in variable getstorage and decode
    print(smartdetail);
    smartsearchList = smartdetail; //print data
    _selectedcharg =
        List<bool>.generate(smartdetail.length, (int index) => false);
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
                          "business management  /  charging station management"),
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
                                controller: searchStationController,
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
                                  smartdetail = smartsearchList
                                      .where((e) => e['Station name'].contains(
                                          searchStationController.text))
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
                              smartdetail = smartsearchList;
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
                          width: 330,
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
                                                      "Station name",
                                                      "Input Numbers",
                                                      mywrapController1),
                                                  WrapContainer(
                                                      "transformer power(kW)",
                                                      "Input Numbers",
                                                      mywrapController2),
                                                  WrapContainer(
                                                      "non charger power(kW)",
                                                      "Input Numbers",
                                                      mywrapController3),
                                                  WrapContainer(
                                                      "ammeter power(kW)",
                                                      "Input Numbers",
                                                      mywrapController4),
                                                  WrapContainer(
                                                      "limiting coefficient",
                                                      "Input Numbers",
                                                      mywrapController5),
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
                                                          // stno.add(ctrol.text);
                                                          // Details.add(mycontroller.text)
                                                          onTap: () async {
                                                            smartdetail.add({
                                                              'id': smartdetail
                                                                      .length +
                                                                  1,
                                                              'Station name':
                                                                  mywrapController1
                                                                      .text,
                                                              'transformer power(kW)':
                                                                  mywrapController2
                                                                      .text,
                                                              'non charger power(kW)':
                                                                  mywrapController3
                                                                      .text,
                                                              'ammeter power(kW)':
                                                                  mywrapController4
                                                                      .text,
                                                              'limiting coefficient':
                                                                  mywrapController5
                                                                      .text,
                                                            });

                                                            String encodedMap =
                                                                json.encode(
                                                                    smartdetail);
                                                            _addToCookie(
                                                                "datastore",
                                                                encodedMap);
                                                            _selectedcharg
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
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
                                                                  _selectedcharg
                                                                      .length;
                                                              i++) {
                                                            if (_selectedcharg[
                                                                i]) {
                                                              smartdetail
                                                                  .removeAt(i);
                                                              _selectedcharg
                                                                  .removeAt(i);
                                                              // selecteditems.add(i);
                                                            }
                                                          }
                                                        });
                                                        String encodedMap =
                                                            json.encode(
                                                                smartdetail);
                                                        _addToCookie(
                                                            "datastore",
                                                            encodedMap);
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
                        InkWell(
                          onTap: () {
                            mywrapController1.text =
                                smartdetail[datastore]['Station name'];
                            mywrapController2.text =
                                smartdetail[datastore]['transformer power(kW)'];
                            mywrapController3.text =
                                smartdetail[datastore]['non charger power(kW)'];
                            mywrapController4.text =
                                smartdetail[datastore]['ammeter power(kW)'];
                            mywrapController5.text =
                                smartdetail[datastore]['limiting coefficient'];

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
                                              Wrap(
                                                direction: Axis.horizontal,
                                                spacing: 5.0,
                                                runSpacing: 10.0,
                                                children: [
                                                  WrapContainer(
                                                      "Station name",
                                                      "Input Numbers",
                                                      mywrapController1),
                                                  WrapContainer(
                                                      "transformer power(kW)",
                                                      "Input Numbers",
                                                      mywrapController2),
                                                  WrapContainer(
                                                      "non charger power(kW)",
                                                      "Input Numbers",
                                                      mywrapController3),
                                                  WrapContainer(
                                                      "ammeter power(kW)",
                                                      "Input Numbers",
                                                      mywrapController4),
                                                  WrapContainer(
                                                      "limiting coefficient",
                                                      "Input Numbers",
                                                      mywrapController5),
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
                                                          child: const Text(
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
                                                      decoration: BoxDecoration(
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
                                                            final prefs =
                                                                await SharedPreferences
                                                                    .getInstance();
                                                            await prefs.setString(
                                                                'action',
                                                                mywrapController1
                                                                    .text);

                                                            setState(() {
                                                              smartdetail[
                                                                  datastore] = {
                                                                'id': smartdetail[
                                                                        datastore]
                                                                    ['id'],
                                                                'Station name':
                                                                    mywrapController1
                                                                        .text,
                                                                'transformer power(kW)':
                                                                    mywrapController2
                                                                        .text,
                                                                'non charger power(kW)':
                                                                    mywrapController3
                                                                        .text,
                                                                'ammeter power(kW)':
                                                                    mywrapController4
                                                                        .text,
                                                                'limiting coefficient':
                                                                    mywrapController5
                                                                        .text,
                                                              };
                                                            });
                                                            String encodedMap =
                                                                json.encode(
                                                                    smartdetail);
                                                            _addToCookie(
                                                                "datastore",
                                                                encodedMap);
                                                            _selectedcharg
                                                                .add(false);
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: const Text(
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
                                      ],
                                    )).then((val) {
                              setState(() {
                                // for (int i = 0; i <= _selected.length; i++) {
                                //   if (_selected[i]) {
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
                              color: Colors.deepOrangeAccent,
                            ),
                            child: const Center(
                              child: Text("Edit",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
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
                    child: smartsearchList.isEmpty || smartdetail.isEmpty
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

  Container WrapContainer(
    String title,
    String hinttext,
    TextEditingController mycontroller,
  ) {
    return Container(
      width: 550,
      child: Row(
        children: [
          Container(
            width: 150,
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
              width: 270,
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
    return smartdetail
        .mapIndexed((index, book) => DataRow(
                cells: [
                  DataCell(Text('' + book['id'].toString())),
                  DataCell(Text(book['Station name'])),
                  DataCell(Text(book['transformer power(kW)'])),
                  DataCell(Text(book['non charger power(kW)'])),
                  DataCell(Text(book['ammeter power(kW)'])),
                  DataCell(Text(book['limiting coefficient']))
                ],
                selected: _selectedcharg[index],
                onSelectChanged: (bool? selected) {
                  setState(() {
                    _selectedcharg[index] = selected!;
                    datastore = index;
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
