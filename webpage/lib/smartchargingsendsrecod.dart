import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:html';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Sendrecod extends StatefulWidget {
  const Sendrecod({Key? key}) : super(key: key);

  @override
  _SendrecodState createState() => _SendrecodState();
}

class _SendrecodState extends State<Sendrecod> {
  // TextEditingController mywrapController1 = TextEditingController();
  // TextEditingController mywrapController2 = TextEditingController();
  // TextEditingController mywrapController3 = TextEditingController();
  // TextEditingController mywrapController4 = TextEditingController();
  // TextEditingController mywrapController5 = TextEditingController();
  TextEditingController smartchargerController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController time1Controller = TextEditingController();
  TextEditingController daterangeController = TextEditingController();
  String act = "";

  int value = 0;
  List<int> selecteditems = [];
  var storerecode;
  // List<dynamic> detail = [];
  List<dynamic> sendrecodedetail = [];
  String? getDate;
  List<dynamic> smartrecodeList = [];
  var timedate;

  List<Map> Details = [
    {
      'id': 1,
      'Station name': 'goa',
      'transformer power(kW)': '5kw',
      'non charger power(kW)': '0',
      'ammeter power(kW)': '1',
      'limiting coefficient': 'normal card'
    },
  ];
  // bool? single;
  // List<bool> _selected = [];
  List<bool> _recodeselected = [];

  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
  String? datastore;

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
        timedate = args.value.length.toString();
      }
    });
  }

  void clearText() {
    // mywrapController1.clear();
    // mywrapController2.clear();
    // mywrapController3.clear();
    // mywrapController4.clear();
    // mywrapController5.clear();
  }

  void initState() {
    //je display kravvu hoi ae always aani andr aavse
    super.initState();

    getData();
    var addstored = _getCookie("storerecode");
    if (addstored == null || addstored.isEmpty) {
      String encodedMap = json.encode(Details); //convert to string map data
      print("Ronak" + encodedMap); //print map data
      _addToCookie("storerecode", encodedMap); //add to cookie
    }

    var getstorage = _getCookie("store"); //get to cookie
    sendrecodedetail = json.decode(
        getstorage); //map (Details value)store in variable getstorage and decode
    print(sendrecodedetail); //print data
    _recodeselected =
        List<bool>.generate(sendrecodedetail.length, (int index) => false);
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
                Flexible(
                  child: Container(
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
                                  controller: smartchargerController,
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
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.7,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Column(
                                          children: [
                                            SfDateRangePicker(
                                              onSelectionChanged:
                                                  _onSelectionChanged,
                                              selectionMode:
                                                  DateRangePickerSelectionMode
                                                      .range,
                                              initialSelectedRange:
                                                  PickerDateRange(
                                                      DateTime.now()
                                                          .subtract(
                                                              const Duration(
                                                                  days: 4)),
                                                      DateTime.now().add(
                                                          const Duration(
                                                              days: 3))),
                                            ),
                                            Container(
                                              height: 40,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.blue,
                                              ),
                                              child: Center(
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.of(context).pop();
                                                    setState(() {
                                                      _onSelectionChanged;
                                                      daterangeController.text =
                                                          _range;
                                                    });

                                                    // dateController
                                                    //     .text =
                                                    // getDate!;
                                                  },
                                                  child: Text("Selected",
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      // AddRequest(needToNavigate: true)
                                    ],
                                  );
                                }),
                              ).then((val) {
                                setState(() {});
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 300,
                              child: TextField(
                                  enabled: false,
                                  controller: daterangeController,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    height: 1,
                                  ),
                                  decoration: const InputDecoration(
                                      prefixIcon:
                                          Icon(Icons.calendar_today_rounded),
                                      hintStyle: TextStyle(fontSize: 15),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(),
                                      hintText: 'MM/DD/YYYY - MM/DD/YYYY ')),
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
                                    sendrecodedetail = smartrecodeList
                                        .where((e) => e['Station name']
                                            .contains(
                                                smartchargerController.text))
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
                              setState(() {
                                sendrecodedetail = smartrecodeList;
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
                            width: 380,
                          ),
                        ],
                      ),
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
                    child: ListView(
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

  DataTable _createDataTable() {
    return DataTable(columns: _createColumns(), rows: _createRows());
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('ID')),
      DataColumn(label: Text('Station name')),
      DataColumn(label: Text('transformer power(kW)')),
      DataColumn(label: Text('non charger power(kW)')),
      DataColumn(label: Text('ammeter power(kW)')),
      DataColumn(label: Text('limiting coefficient')),
    ];
  }

  List<DataRow> _createRows() {
    return sendrecodedetail
        .mapIndexed((index, book) => DataRow(
                cells: [
                  DataCell(Text('' + book['id'].toString())),
                  DataCell(Text(book['Station no'])),
                  DataCell(Text(book['Station name'])),
                  DataCell(Text(book['Ac'])),
                  DataCell(Text(book['Dc'])),
                  DataCell(Text(book['offline oprating on mode']))
                ],
                selected: _recodeselected[index],
                onSelectChanged: (bool? selected) {
                  setState(() {
                    _recodeselected[index] = selected!;
                    storerecode = index;
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
