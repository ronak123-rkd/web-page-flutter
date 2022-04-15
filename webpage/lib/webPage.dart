import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:html';

import 'models/dropdownmodel.dart';

class Webpage extends StatefulWidget {
  const Webpage({Key? key}) : super(key: key);

  @override
  _WebpageState createState() => _WebpageState();
}

class _WebpageState extends State<Webpage> {
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
  String _nameItemSelected = "Asia/Calcutta";
  var timezone = [
    "00:30",
    "01:00",
    "01:30",
    "02:00",
    "02:30",
    "03:00",
    "03:30",
    "04:00",
    "04:30",
    "05:00",
    "05:30",
    "06:00",
    "06:30",
    "07:00",
    "07:30",
    "08:00",
    "08:30",
    "09:00",
    "09:30",
    "10:00",
    "10:30",
    "11:00",
    "11:30",
    "12:00",
    "12:30",
    "13:00",
    "13:30",
    "14:00",
    "14:30",
    "15:00",
    "15:30",
    "16:00",
    "16:30",
    "17:00",
    "17:30",
    "18:00",
    "18:30",
    "19:00",
    "19:30",
    "20:00",
    "20:30",
    "21:00",
    "21:30",
    "22:00",
    "22:30",
    "23:00",
    "23:30"
  ];
  String time = "00:30";

  var setrate = 1;

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
      'Station no': '43526378',
      'Station name': 'customer',
      'Ac': '0',
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
  // bool? single;
  List<bool> _selected = [];

  void clearText() {
    mywrapController1.clear();
    mywrapController2.clear();
    mywrapController3.clear();
    mywrapController4.clear();
    mywrapController5.clear();
    searchStationNameController.clear();
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
    print(detail);
    searchList = detail; //print data
    _selected = List<bool>.generate(detail.length, (int index) => false);
  } //Data table

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Padding(
      //     padding: const EdgeInsets.fromLTRB(0, 15, 20, 0),
      //     child: Image.asset(
      //       "assets/tata power logo.jpg",
      //       fit: BoxFit.cover,
      //       height: 50,
      //     ),
      //   ),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 10),
      //       child: DropdownButtonHideUnderline(
      //         child: DropdownButton<String>(
      //           items: _name.map((String dropDownStringItem) {
      //             return DropdownMenuItem(
      //               value: dropDownStringItem,
      //               child: Text(
      //                 dropDownStringItem,
      //                 style: TextStyle(fontSize: 15, color: Colors.black),
      //               ),
      //             );
      //           }).toList(),
      //           onChanged: (newValueSelected) {
      //             setState(() {
      //               this._nameItemSelected = newValueSelected.toString();
      //             });
      //           },
      //           value: _nameItemSelected,
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.only(right: 10),
      //       child: DropdownButtonHideUnderline(
      //         child: DropdownButton<String>(
      //           style: TextStyle(fontSize: 15, color: Colors.black),
      //           items: _bar.map((String dropDownStringItem) {
      //             return DropdownMenuItem(
      //               value: dropDownStringItem,
      //               child: Text(dropDownStringItem),
      //             );
      //           }).toList(),
      //           onChanged: (newValueSelected) {
      //             setState(() {
      //               this._barItemSelected = newValueSelected.toString();
      //             });
      //           },
      //           value: _barItemSelected,
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.only(right: 25),
      //       child: DropdownButtonHideUnderline(
      //         child: DropdownButton<String>(
      //           style: TextStyle(fontSize: 15, color: Colors.black),
      //           items: _car.map((String dropDownStringItem) {
      //             return DropdownMenuItem(
      //               value: dropDownStringItem,
      //               child: Text(dropDownStringItem),
      //             );
      //           }).toList(),
      //           onChanged: (newValueSelected) {
      //             setState(() {
      //               this._carItemSelected = newValueSelected.toString();
      //             });
      //           },
      //           value: _carItemSelected,
      //         ),
      //       ),
      //     ),
      //   ],
      //   backgroundColor: Color(0xFF20a0ff),
      // ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            // Container(
            //   width: MediaQuery.of(context).size.width * 0.20,
            //   height: MediaQuery.of(context).size.height,
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 25, left: 20),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         SizedBox(
            //           height: MediaQuery.of(context).size.height * 0.80,
            //           child: ListView.builder(
            //               physics: NeverScrollableScrollPhysics(),
            //               itemCount: homes.length,
            //               itemBuilder: (context, index) {
            //                 return Column(
            //                   children: [
            //                     index == 0
            //                         ? Theme(
            //                             data: Theme.of(context).copyWith(
            //                                 dividerColor: Colors.transparent),
            //                             child: ExpansionTile(
            //                               tilePadding: EdgeInsets.zero,
            //                               leading: Icon(
            //                                 Icons.home,
            //                                 size: 20,
            //                                 color: Color(0xFF909399),
            //                               ),
            //                               title: Row(
            //                                 children: [
            //                                   Text("home",
            //                                       style: TextStyle(
            //                                         fontSize: 12,
            //                                       )),
            //                                 ],
            //                               ),
            //                               trailing: SizedBox.shrink(),
            //                             ),
            //                           )
            //                         : SizedBox.shrink(),
            //                     Theme(
            //                       data: Theme.of(context).copyWith(
            //                           dividerColor: Colors.transparent),
            //                       child: ExpansionTile(
            //                           tilePadding: EdgeInsets.zero,
            //                           textColor: Colors.black,
            //                           iconColor: Colors.black38,
            //                           leading: Icon(
            //                             icon[index],
            //                             size: 20,
            //                             color: Color(0xFF909399),
            //                           ),
            //                           title: Row(
            //                             children: [
            //                               Text(homes[index],
            //                                   textAlign: TextAlign.start,
            //                                   style: TextStyle(
            //                                     fontSize: 12,
            //                                   )),
            //                             ],
            //                           ),
            //                           children: [
            //                             Padding(
            //                               padding: const EdgeInsets.only(
            //                                   left: 50, top: 15),
            //                               child: Container(
            //                                 height: 100,
            //                                 child: Expanded(
            //                                   child: ListView.separated(
            //                                       separatorBuilder:
            //                                           (BuildContext context,
            //                                               int index) {
            //                                         return SizedBox(
            //                                           height: 10,
            //                                         );
            //                                       },
            //                                       physics:
            //                                           NeverScrollableScrollPhysics(),
            //                                       itemCount: textList.length,
            //                                       itemBuilder:
            //                                           (context, index) {
            //                                         return InkWell(
            //                                           onTap: () {
            //                                             setState(() {
            //                                               // var webscreen = index;
            //                                             });
            //                                           },
            //                                           child: Container(
            //                                               height: 20,
            //                                               child: Text(
            //                                                   textList[index],
            //                                                   textAlign:
            //                                                       TextAlign
            //                                                           .start,
            //                                                   style: TextStyle(
            //                                                     fontSize: 12,
            //                                                   ))),
            //                                         );
            //                                       }),
            //                                 ),
            //                               ),
            //                             ),
            //                           ]),
            //                     ),
            //                   ],
            //                 );
            //               }),
            //         ),
            //         // SizedBox(
            //         //   height: 20,
            //         // ),
            //         // Row(
            //         //   children: [
            //         //     Icon(
            //         //       Icons.settings,
            //         //       size: 20,
            //         //       color: Color(0xFF909399),
            //         //     ),
            //         //     TextButton(
            //         //         onPressed: () {},
            //         //         child: Text(
            //         //           "smart charging management",
            //         //           style: TextStyle(color: Colors.black),
            //         //         )),
            //         //   ],
            //         // ),
            //         // SizedBox(
            //         //   height: 20,
            //         // ),
            //         // Row(
            //         //   children: [
            //         //     Icon(
            //         //       Icons.account_circle,
            //         //       size: 20,
            //         //       color: Color(0xFF909399),
            //         //     ),
            //         //     TextButton(
            //         //         onPressed: () {},
            //         //         child: Text(
            //         //           "card business management",
            //         //           style: TextStyle(color: Colors.black),
            //         //         )),
            //         //   ],
            //         // ),
            //         // SizedBox(
            //         //   height: 20,
            //         // ),
            //         // Row(
            //         //   children: [
            //         //     Icon(
            //         //       Icons.receipt_long_outlined,
            //         //       size: 20,
            //         //       color: Color(0xFF909399),
            //         //     ),
            //         //     TextButton(
            //         //         onPressed: () {},
            //         //         child: Text(
            //         //           "transaction record",
            //         //           style: TextStyle(color: Colors.black),
            //         //         )),
            //         //   ],
            //         // ),
            //         // SizedBox(
            //         //   height: 20,
            //         // ),
            //         // Row(
            //         //   children: [
            //         //     Icon(
            //         //       Icons.receipt_long_outlined,
            //         //       size: 20,
            //         //       color: Color(0xFF909399),
            //         //     ),
            //         //     TextButton(
            //         //         onPressed: () {},
            //         //         child: Text(
            //         //           "pile fault record",
            //         //           style: TextStyle(color: Colors.black),
            //         //         )),
            //         //   ],
            //         // ),
            //         // SizedBox(
            //         //   height: 20,
            //         // ),
            //         // Row(
            //         //   children: [
            //         //     Icon(
            //         //       Icons.addchart,
            //         //       size: 20,
            //         //       color: Color(0xFF909399),
            //         //     ),
            //         //     TextButton(
            //         //         onPressed: () {},
            //         //         child: Text(
            //         //           "real time monitoring",
            //         //           style: TextStyle(color: Colors.black),
            //         //         )),
            //         //   ],
            //         // ),
            //         // Dropmenu(title: 'home[index]', myicon: 'mjkjkj[index]'),
            //       ],
            //     ),
            //   ),
            // ),
            // VerticalDivider(thickness: 0.1, color: Colors.black),
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
                                      .where((e) => e['Station name'].contains(
                                          searchStationNameController.text))
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
                            // final choice = await showDatePicker(
                            //   context: context,
                            //   firstDate: DateTime(2010),
                            //   lastDate: DateTime(2030),
                            //   initialDate: DateTime.now(),
                            // );
                            // print(choice);

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
                                                      "station no",
                                                      "Input Numbers",
                                                      mywrapController1),
                                                  WrapContainer(
                                                      "station name",
                                                      "Input Numbers",
                                                      mywrapController2),
                                                  WrapContainer(
                                                      "DC           ",
                                                      "Input Numbers",
                                                      mywrapController3),
                                                  WrapContainer(
                                                      "Ac           ",
                                                      "Input Numbers",
                                                      mywrapController4),
                                                  WrapContainer(
                                                      "offline oprating",
                                                      "Input Numbers",
                                                      mywrapController5),
                                                  // WrapContainer(
                                                  //     "admin telphone",
                                                  //     "Input Numbers",
                                                  //     mywrapController6),
                                                  // WrapContainer(
                                                  //     "longitude      ",
                                                  //     "Input Numbers",
                                                  //     mywrapController7),
                                                  // WrapContainer(
                                                  //     "latitude       ",
                                                  //     "Input Numbers",
                                                  //     mywrapController8),
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
                                                            String encodedMap =
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
                        // Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: TextButton(
                        //       style: TextButton.styleFrom(
                        //           textStyle: getTextStyle(
                        //               AppColors.BaseColor, FontWeight.w400, 12),
                        //           primary: AppColors.BaseColor),
                        //       onPressed: () async {
                        //         if (!Responsive.isDesktop(context)) {
                        //           var data = await NavigatorUtils
                        //               .navigatorUtilsInstance
                        //               .navigatorPushedNameResult(context,
                        //                   Routes.DISPATCHER_ADD_REQUEST);
                        //
                        //           getData();
                        //         } else {
                        //           showDialog<void>(
                        //               context: context,
                        //               builder: (context) => SimpleDialog(
                        //                     children: [
                        //                       AddRequest(needToNavigate: true)
                        //                     ],
                        //                   )).then((val) {
                        //             getData();
                        //           });
                        //           ;
                        //         }
                        //       },
                        //       child: const Text(AppTexts.add_request),
                        //     )),
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
                                                                  _selected
                                                                      .length;
                                                              i++) {
                                                            if (_selected[i]) {
                                                              detail
                                                                  .removeAt(i);
                                                              _selected
                                                                  .removeAt(i);
                                                              // selecteditems.add(i);
                                                            }
                                                          }
                                                        });
                                                        String encodedMap =
                                                            json.encode(detail);
                                                        _addToCookie("store",
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
                        InkWell(
                          onTap: () {
                            mywrapController1.text =
                                detail[store]['Station no'];
                            mywrapController2.text =
                                detail[store]['Station name'];
                            mywrapController3.text = detail[store]['Ac'];
                            mywrapController4.text = detail[store]['Dc'];
                            mywrapController5.text =
                                detail[store]['offline oprating on mode'];

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
                                                      "station no",
                                                      "Input Numbers",
                                                      mywrapController1),
                                                  WrapContainer(
                                                      "station name",
                                                      "Input Numbers",
                                                      mywrapController2),
                                                  WrapContainer(
                                                      "DC           ",
                                                      "Input Numbers",
                                                      mywrapController3),
                                                  WrapContainer(
                                                      "Ac           ",
                                                      "Input Numbers",
                                                      mywrapController4),
                                                  WrapContainer(
                                                      "offline oprating",
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
                                                              detail[store] = {
                                                                'id': detail[
                                                                        store]
                                                                    ['id'],
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
                                                              };
                                                            });
                                                            String encodedMap =
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
                                                0.9,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text("set rate",
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
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Icon(
                                                              Icons.close)),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20),
                                                  child: Row(
                                                    children: [
                                                      Text("choose time zone"),
                                                      SizedBox(
                                                        width: 30,
                                                      ),
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
                                                            color: Colors.white,
                                                            border: Border.all(
                                                              color:
                                                                  Colors.black,
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
                                                                  fontSize: 14,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .hintColor,
                                                                ),
                                                              ),
                                                              items: _name
                                                                  .map((item) =>
                                                                      DropdownMenuItem<
                                                                          String>(
                                                                        value:
                                                                            item,
                                                                        child:
                                                                            Text(
                                                                          item,
                                                                          style:
                                                                              const TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                          ),
                                                                        ),
                                                                      ))
                                                                  .toList(),
                                                              value:
                                                                  _nameItemSelected,
                                                              onChanged: (String?
                                                                  newValue) {
                                                                setState(() {
                                                                  _nameItemSelected =
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
                                                              buttonHeight: 20,
                                                              buttonWidth: 140,
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
                                                Divider(
                                                  height: 20,
                                                ),
                                                Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text('Time'),
                                                        Text('electric price'),
                                                        Text('Service price'),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 200,
                                                      child: ListView.builder(
                                                        itemCount: setrate,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Container(
                                                                      height:
                                                                          40,
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              5.0),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5.0),
                                                                        color: Colors
                                                                            .white,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              Colors.black,
                                                                          style:
                                                                              BorderStyle.solid,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          DropdownButtonHideUnderline(
                                                                        child:
                                                                            DropdownButton2(
                                                                          hint:
                                                                              Text(
                                                                            'Select Item',
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 14,
                                                                              color: Theme.of(context).hintColor,
                                                                            ),
                                                                          ),
                                                                          items: timezone
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
                                                                          value:
                                                                              time,
                                                                          onChanged:
                                                                              (String? newValue) {
                                                                            setState(() {
                                                                              time = newValue!;
                                                                            });
                                                                          },
                                                                          scrollbarRadius:
                                                                              const Radius.circular(40),
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
                                                                          offset: const Offset(
                                                                              -5,
                                                                              0),
                                                                        ),
                                                                      )),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          200,
                                                                      child:
                                                                          const TextField(
                                                                        // controller:
                                                                        //     searchStationNameController,
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                          height:
                                                                              1,
                                                                        ),
                                                                        decoration:
                                                                            InputDecoration(
                                                                          hintStyle:
                                                                              TextStyle(fontSize: 15),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              Colors.white,
                                                                          hintText:
                                                                              "search rate",
                                                                          border:
                                                                              OutlineInputBorder(),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          200,
                                                                      child:
                                                                          const TextField(
                                                                        // controller:
                                                                        //     searchStationNameController,
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                          height:
                                                                              1,
                                                                        ),
                                                                        decoration:
                                                                            InputDecoration(
                                                                          hintStyle:
                                                                              TextStyle(fontSize: 15),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              Colors.white,
                                                                          hintText:
                                                                              "search rate",
                                                                          border:
                                                                              OutlineInputBorder(),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ]),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: Colors.green,
                                                      ),
                                                      child: Center(
                                                        child: InkWell(
                                                            onTap: () {
                                                              if (setrate < 3) {
                                                                setrate++;
                                                                setState(() {});
                                                              }

                                                              // Navigator.of(
                                                              //         context)
                                                              //     .pop();
                                                            },
                                                            child: const Icon(
                                                                Icons.add)),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: Colors.orange,
                                                      ),
                                                      child: Center(
                                                        child: InkWell(
                                                            onTap: () {
                                                              if (setrate > 1) {
                                                                setrate--;
                                                                setState(() {});
                                                              }
                                                            },
                                                            child: Icon(
                                                                Icons.remove)),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {});
                                                      },
                                                      child: Container(
                                                        height: 30,
                                                        width: 80,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Colors.black45,
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                              "reset rate",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
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
                                      );
                                    })).then((val) {
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
                              child: Text("Set rate",
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
                    child: searchList.isEmpty || detail.isEmpty
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

  // Widget CustomRadioButton(String text, String index) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Padding(
  //         padding: EdgeInsets.only(top: 1, left: 6),
  //         child: Text(
  //           text,
  //           style: (value == index)
  //               ? TextStyle(
  //                   color: Colors.black,
  //                   fontWeight: FontWeight.w800,
  //                   fontSize: 12)
  //               : TextStyle(color: Colors.black, fontSize: 12),
  //         ),
  //       ),
  //       // Padding(
  //       //   padding: EdgeInsets.only(right: 3),
  //       //   child: Container(
  //       //     height: 4.h,
  //       //     width: 4.h,
  //       //     decoration: BoxDecoration(
  //       //         border: (value == index)
  //       //             ? null
  //       //             : Border.all(color: Colors.grey, width: 0.2.w),
  //       //         color: Colors.grey[900],
  //       //         borderRadius: BorderRadius.circular(2.h)),
  //       //     child: Container(
  //       //       height: (2.h),
  //       //       width: (2.h),
  //       //       decoration: BoxDecoration(
  //       //           color: (value == index) ? Colors.lightGreen : Colors.white,
  //       //           borderRadius: BorderRadius.circular(3.h)),
  //       //       child: Icon(
  //       //         Icons.check,
  //       //         color: Colors.white,
  //       //       ),
  //       //     ),
  //       //   ),
  //       // ),
  //     ],
  //   );
  // }

  DataTable _createDataTable() {
    return DataTable(columns: _createColumns(), rows: _createRows());
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('ID')),
      DataColumn(label: Text('Station no')),
      DataColumn(label: Text('Station name')),
      DataColumn(label: Text('Ac')),
      DataColumn(label: Text('Dc')),
      DataColumn(label: Text('offline oprating on mode')),
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
