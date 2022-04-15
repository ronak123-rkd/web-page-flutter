import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:html';

import 'models/dropdownmodel.dart';

class VehiclePriority extends StatefulWidget {
  const VehiclePriority({Key? key}) : super(key: key);

  @override
  _VehiclePriorityState createState() => _VehiclePriorityState();
}

class _VehiclePriorityState extends State<VehiclePriority> {
  TextEditingController StationNameController = TextEditingController();
  TextEditingController MACController = TextEditingController();
  TextEditingController MACController1 = TextEditingController();
  TextEditingController LicenseController = TextEditingController();
  TextEditingController LicenseController1 = TextEditingController();
  TextEditingController dateController = TextEditingController();
  String act = "";

  String name = "";

  String sationdata = '2';
  var choosesationdata = ['2', '25'];
  String? getDate;

  int value = 0;
  List<int> selecteditems = [];
  List<dynamic> searchList = [];
  List<bool> _selectevehicleddata = [];
  var store;
  List<dynamic> vehicledetail = [];
  List<dynamic> searchVehicleList = [];

  List<Map> vehicleDetails = [
    {
      'id': 1,
      'MAC address': '43526378',
      'license plate No': 'customer',
      'station name': '0',
      'vehicle name': '1',
      'departure time': 'normal card'
    },
  ];

  // List<bool> _selectedvehicle = [];

  void clearText() {
    MACController.clear();
    LicenseController.clear();
    dateController.clear();
    StationNameController.clear();
  }

  void initState() {
    //je display kravvu hoi ae always aani andr aavse
    super.initState();

    getData();
    var addstored = _getCookie("vehicledatastore");
    if (addstored == null || addstored.isEmpty) {
      String encodedMap =
          json.encode(vehicleDetails); //convert to string map data
      print("Ronak" + encodedMap); //print map data
      _addToCookie("vehicledatastore", encodedMap); //add to cookie
    }

    var getstorage = _getCookie("vehicledatastore"); //get to cookie
    vehicledetail = json.decode(
        getstorage); //map (Details value)store in variable getstorage and decode
    print(vehicledetail);
    searchVehicleList = vehicledetail; //print data
    _selectevehicleddata =
        List<bool>.generate(vehicledetail.length, (int index) => false);
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
//
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    setState(() {});
                                  },
                                  child: TextField(
                                    controller: MACController1,
                                    style: TextStyle(
                                      color: Colors.black,
                                      height: 1,
                                    ),
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(fontSize: 15),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(),
                                      hintText: 'MAC address',
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
                              width: 200,

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
                                    controller: LicenseController1,
                                    style: TextStyle(
                                      color: Colors.black,
                                      height: 1,
                                    ),
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(fontSize: 15),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(),
                                      hintText: 'license plate No.',
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
                                      // vehicledetail = searchList
                                      //     .where((e) => e['Station name']
                                      //         .contains(
                                      //             StationNameController.text))
                                      //     .toList();
                                      vehicledetail = searchVehicleList
                                          .where((e) => e['MAC address']
                                              .contains(MACController1.text))
                                          .toList();
                                      vehicledetail = searchVehicleList
                                          .where((e) => e['license plate No']
                                              .contains(
                                                  LicenseController1.text))
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
                              onTap: () {
                                clearText();
                                setState(() {
                                  vehicledetail = searchVehicleList;
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: const Text("reset",
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
                                  builder: (context) => StatefulBuilder(
                                      builder: (context, setState) {
                                    return SimpleDialog(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.6,
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
                                                        const EdgeInsets.only(
                                                            right: 8.0),
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
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Wrap(
                                                direction: Axis.horizontal,
                                                spacing: 5.0,
                                                runSpacing: 10.0,
                                                children: [
                                                  WrapContainer(
                                                      "MAC address",
                                                      "Input Numbers",
                                                      MACController),
                                                  WrapContainer(
                                                      "license plate No.",
                                                      "Input Numbers",
                                                      LicenseController),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 30),
                                                    child: Row(
                                                      children: [
                                                        Text('station name'),
                                                        SizedBox(width: 58),
                                                        Container(
                                                            height: 48,
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
                                                                items:
                                                                    choosesationdata
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
                                                                value:
                                                                    sationdata,
                                                                onChanged: (String?
                                                                    newValue) {
                                                                  setState(() {
                                                                    sationdata =
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
                                                  Container(
                                                    width: 400,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                            width: 120,
                                                            child: Text(
                                                                'Departure time',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black))),
                                                        // SizedBox(
                                                        //   width: 30,
                                                        // ),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        InkWell(
                                                          onTap: () async {
                                                            final choice =
                                                                await showDatePicker(
                                                              context: context,
                                                              firstDate:
                                                                  DateTime(
                                                                      2010),
                                                              lastDate:
                                                                  DateTime(
                                                                      2030),
                                                              initialDate:
                                                                  DateTime
                                                                      .now(),
                                                            );
                                                            getDate = choice
                                                                .toString();
                                                            print(choice);

                                                            dateController
                                                                    .text =
                                                                getDate!;
                                                          },
                                                          child: SizedBox(
                                                            width: 200,
                                                            child: TextField(
                                                                enabled: false,
                                                                controller:
                                                                    dateController,
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  height: 1,
                                                                ),
                                                                decoration: const InputDecoration(
                                                                    prefixIcon:
                                                                        Icon(Icons
                                                                            .watch_later_outlined),
                                                                    hintStyle: TextStyle(
                                                                        fontSize:
                                                                            15),
                                                                    filled:
                                                                        true,
                                                                    fillColor:
                                                                        Colors
                                                                            .white,
                                                                    border:
                                                                        OutlineInputBorder(),
                                                                    hintText:
                                                                        'MM/DD/YYYY')),
                                                          ),
                                                        ),
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
                                                          onTap: () {
                                                            vehicledetail.add({
                                                              'id': vehicledetail
                                                                      .length +
                                                                  1,
                                                              'MAC address':
                                                                  MACController
                                                                      .text,
                                                              'license plate No':
                                                                  LicenseController
                                                                      .text,
                                                              'station name':
                                                                  '',
                                                              'vehicle name':
                                                                  '',
                                                              'departure time':
                                                                  dateController
                                                                      .text,
                                                            });
                                                            String encodedMap =
                                                                json.encode(
                                                                    vehicledetail);
                                                            _addToCookie(
                                                                "vehicledatastore",
                                                                encodedMap);
                                                            _selectevehicleddata
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
                                    );
                                  }),
                                ).then((val) {
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
                                                                      _selectevehicleddata
                                                                          .length;
                                                                  i++) {
                                                                if (_selectevehicleddata[
                                                                    i]) {
                                                                  vehicledetail
                                                                      .removeAt(
                                                                          i);
                                                                  vehicledetail
                                                                      .removeAt(
                                                                          i);
                                                                  // selecteditems.add(i);
                                                                }
                                                              }
                                                            });
                                                            String encodedMap =
                                                                json.encode(
                                                                    vehicledetail);
                                                            _addToCookie(
                                                                "vehicledatastore",
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
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.green,
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Center(
                                  child: Text("download template",
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
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.blue,
                              ),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  child: const Text("import file",
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
              width: 120,
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
              child: searchVehicleList.isEmpty || vehicledetail.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("No Data Found !"),
                      ],
                    )
                  : TextField(
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
      DataColumn(label: Text('MAC address')),
      DataColumn(label: Text('license plate No')),
      DataColumn(label: Text('station name')),
      DataColumn(label: Text('vehicle name')),
      DataColumn(label: Text('departure time')),
    ];
  }

  List<DataRow> _createRows() {
    return vehicledetail
        .mapIndexed((index, book) => DataRow(
                cells: [
                  DataCell(Text('' + book['id'].toString())),
                  DataCell(Text(book['MAC address'])),
                  DataCell(Text(book['license plate No'])),
                  DataCell(Text(book['station name'])),
                  DataCell(Text(book['vehicle name'])),
                  DataCell(Text(book['departure time']))
                ],
                selected: _selectevehicleddata[index],
                onSelectChanged: (bool? selected) {
                  setState(() {
                    _selectevehicleddata[index] = selected!;
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
