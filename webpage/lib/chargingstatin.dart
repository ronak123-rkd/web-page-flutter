// import 'dart:convert';
// import 'dart:html';
//
// import 'package:flutter/material.dart';
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:collection/collection.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class Charging extends StatefulWidget {
//   const Charging({Key? key}) : super(key: key);
//
//   @override
//   _ChargingState createState() => _ChargingState();
// }
//
// class _ChargingState extends State<Charging> {
//   TextEditingController mywrapController1 = TextEditingController();
//   TextEditingController mywrapController2 = TextEditingController();
//   TextEditingController mywrapController3 = TextEditingController();
//   TextEditingController mywrapController4 = TextEditingController();
//   TextEditingController mywrapController5 = TextEditingController();
//
//   List<bool> _selected = [];
//   List<dynamic> detail = [];
//
//   void clearText() {
//     mywrapController1.clear();
//     mywrapController2.clear();
//     mywrapController3.clear();
//     mywrapController4.clear();
//     mywrapController5.clear();
//   }
//
//   void initState() {
//     //je display kravvu hoi ae always aani andr aavse
//     super.initState();
//
//     var addstored = _getCookie("store");
//     if (addstored == null || addstored.isEmpty) {
//       String encodedMap = json.encode(detail); //convert to string map data
//       print("Ronak" + encodedMap); //print map data
//       _addToCookie("store", encodedMap); //add to cookie
//     }
//
//     var getstorage = _getCookie("store"); //get to cookie
//     detail = json.decode(
//         getstorage); //map (Details value)store in variable getstorage and decode
//     print(detail); //print data
//     _selected = List<bool>.generate(detail.length, (int index) => false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Row(
//             children: const [
//               Text("charging station management",
//                   style: TextStyle(fontWeight: FontWeight.bold)),
//               SizedBox(width: 500),
//               Text("Business managment  /  charging station management"),
//             ],
//           ),
//         ),
//         Container(
//           width: MediaQuery.of(context).size.width * 0.75,
//           height: 120,
//           color: Colors.black12,
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: 40,
//                       width: 150,
//
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: Colors.white,
//                       ),
// //
//                       child: Center(
//                         child: InkWell(
//                           onTap: () {
//                             Navigator.of(context).pop();
//                             setState(() {});
//                           },
//                           child: TextField(
//                             style: TextStyle(
//                               color: Colors.black,
//                               height: 1,
//                             ),
//                             decoration: InputDecoration(
//                               hintStyle: TextStyle(fontSize: 15),
//                               filled: true,
//                               fillColor: Colors.white,
//                               border: OutlineInputBorder(),
//                               hintText: 'station name',
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     Container(
//                       height: 40,
//                       width: 150,
//
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: Colors.white,
//                       ),
// //
//                       child: Center(
//                         child: InkWell(
//                           onTap: () {
//                             Navigator.of(context).pop();
//                             setState(() {});
//                           },
//                           child: TextField(
//                             style: TextStyle(
//                               color: Colors.black,
//                               height: 1,
//                             ),
//                             decoration: InputDecoration(
//                               hintStyle: TextStyle(fontSize: 15),
//                               filled: true,
//                               fillColor: Colors.white,
//                               border: OutlineInputBorder(),
//                               hintText: 'Charger serial no',
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     Container(
//                       height: 40,
//                       width: 200,
//
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: Colors.white,
//                       ),
// //
//                       child: Center(
//                         child: InkWell(
//                           onTap: () {
//                             Navigator.of(context).pop();
//                             setState(() {});
//                           },
//                           child: TextField(
//                             style: TextStyle(
//                               color: Colors.black,
//                               height: 1,
//                             ),
//                             decoration: InputDecoration(
//                               hintStyle: TextStyle(fontSize: 15),
//                               filled: true,
//                               fillColor: Colors.white,
//                               border: OutlineInputBorder(),
//                               hintText: 'Connector charging state',
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     Container(
//                       height: 40,
//                       width: 70,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: Colors.blue,
//                       ),
//                       child: Center(
//                         child: InkWell(
//                           onTap: () {
//                             setState(() {});
//                           },
//                           child: const Text("inquire",
//                               style: TextStyle(color: Colors.white)),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     InkWell(
//                       onTap: () async {
//                         final choice = await showDatePicker(
//                           context: context,
//                           firstDate: DateTime(2010),
//                           lastDate: DateTime(2030),
//                           initialDate: DateTime.now(),
//                         );
//                         print(choice);
//
//                         setState(() {});
//                       },
//                       child: Container(
//                         height: 40,
//                         width: 70,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           color: Colors.white,
//                         ),
//                         child: const Center(
//                           child: Text("reset",
//                               style: TextStyle(color: Colors.black)),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 20,
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         clearText();
//                         showDialog<void>(
//                             context: context,
//                             builder: (context) => SimpleDialog(
//                                   children: [
//                                     Container(
//                                       height:
//                                           MediaQuery.of(context).size.height *
//                                               0.7,
//                                       width: MediaQuery.of(context).size.width *
//                                           0.7,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(5),
//                                       ),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Wrap(
//                                             direction: Axis.horizontal,
//                                             spacing: 5.0,
//                                             runSpacing: 10.0,
//                                             children: [
//                                               WrapContainer(
//                                                   "station no",
//                                                   "Input Numbers",
//                                                   mywrapController1),
//                                               WrapContainer(
//                                                   "station name",
//                                                   "Input Numbers",
//                                                   mywrapController2),
//                                               WrapContainer(
//                                                   "DC           ",
//                                                   "Input Numbers",
//                                                   mywrapController3),
//                                               WrapContainer(
//                                                   "Ac           ",
//                                                   "Input Numbers",
//                                                   mywrapController4),
//                                               WrapContainer(
//                                                   "offline oprating",
//                                                   "Input Numbers",
//                                                   mywrapController5),
//                                               // WrapContainer(
//                                               //     "admin telphone",
//                                               //     "Input Numbers",
//                                               //     mywrapController6),
//                                               // WrapContainer(
//                                               //     "longitude      ",
//                                               //     "Input Numbers",
//                                               //     mywrapController7),
//                                               // WrapContainer(
//                                               //     "latitude       ",
//                                               //     "Input Numbers",
//                                               //     mywrapController8),
//                                             ],
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.all(30.0),
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 Container(
//                                                   height: 40,
//                                                   width: 70,
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             5),
//                                                     color: Colors.blue,
//                                                   ),
//                                                   child: Center(
//                                                     child: InkWell(
//                                                       onTap: () {
//                                                         Navigator.of(context)
//                                                             .pop();
//                                                         setState(() {});
//                                                       },
//                                                       child: Text("Cancel",
//                                                           style: TextStyle(
//                                                               color: Colors
//                                                                   .white)),
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 SizedBox(width: 30),
//                                                 Container(
//                                                   height: 40,
//                                                   width: 70,
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             5),
//                                                     color: Colors.blue,
//                                                   ),
//                                                   child: Center(
//                                                     child: InkWell(
//                                                       // stno.add(ctrol.text);
//                                                       // Details.add(mycontroller.text)
//                                                       onTap: () {
//                                                         detail.add({
//                                                           'id': detail.length,
//                                                           'Charger serial no':
//                                                               mywrapController1
//                                                                   .text,
//                                                           'Station name':
//                                                               mywrapController2
//                                                                   .text,
//                                                           'charge ammeter':
//                                                               mywrapController3
//                                                                   .text,
//                                                           'Whether to push':
//                                                               mywrapController4
//                                                                   .text,
//                                                           'metr firmware version':
//                                                               mywrapController5
//                                                                   .text,
//                                                         });
//                                                         String encodedMap =
//                                                             json.encode(detail);
//                                                         _addToCookie("store",
//                                                             encodedMap);
//                                                         _selected.add(false);
//                                                         Navigator.of(context)
//                                                             .pop();
//                                                       },
//                                                       child: Text("Submit",
//                                                           style: TextStyle(
//                                                               color: Colors
//                                                                   .white)),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     // AddRequest(needToNavigate: true)
//                                   ],
//                                 )).then((val) {
//                           setState(() {});
//                         });
//                         // stno.add(ctrol.text);
//                         //  setState(() {});
//                       },
//                       child: Container(
//                         height: 40,
//                         width: 70,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           color: Colors.blue,
//                         ),
//                         child: Center(
//                           child: Text("add",
//                               style: TextStyle(color: Colors.white)),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         showDialog<void>(
//                             context: context,
//                             builder: (context) => SimpleDialog(children: [
//                                   Container(
//                                     height: MediaQuery.of(context).size.height *
//                                         0.2,
//                                     width:
//                                         MediaQuery.of(context).size.width * 0.2,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(5),
//                                     ),
//                                     child: Column(
//                                       children: [
//                                         const Text(
//                                           'Alert mesages',
//                                           style: TextStyle(
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         const Text(
//                                           "Are you sure ?",
//                                           style: TextStyle(
//                                             fontSize: 15,
//                                           ),
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             InkWell(
//                                               onTap: () {
//                                                 Navigator.of(context).pop();
//                                                 setState(
//                                                   () {
//                                                     setState(() {
//                                                       for (int i = 0;
//                                                           i <= _selected.length;
//                                                           i++) {
//                                                         if (_selected[i]) {
//                                                           detail.removeAt(i);
//                                                           _selected.removeAt(i);
//                                                           // selecteditems.add(i);
//                                                         }
//                                                       }
//                                                     });
//                                                     String encodedMap =
//                                                         json.encode(detail);
//                                                     _addToCookie(
//                                                         "store", encodedMap);
//                                                     // _selected.add(false);
//                                                     // Navigator.of(context)
//                                                     //     .pop();
//                                                   },
//                                                 );
//                                               },
//                                               child: Container(
//                                                 height: 40,
//                                                 width: 70,
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(5),
//                                                   color: Colors.blue,
//                                                 ),
//                                                 child: const Center(
//                                                   child: Text("Confirm",
//                                                       style: TextStyle(
//                                                           color: Colors.white)),
//                                                 ),
//                                               ),
//                                             ),
//                                             const SizedBox(
//                                               width: 20,
//                                             ),
//                                             InkWell(
//                                               onTap: () {
//                                                 Navigator.of(context).pop();
//                                                 setState(() {});
//                                               },
//                                               child: Container(
//                                                 height: 40,
//                                                 width: 70,
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(5),
//                                                   color: Colors.blue,
//                                                 ),
//                                                 child: const Center(
//                                                   child: Text("Cancel",
//                                                       style: TextStyle(
//                                                           color: Colors.white)),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 ])).then((val) {
//                           setState(() {
//                             // for (int i = 0; i <= _selected.length; i++) {
//                             //   if (_selected[i]) {
//                             //     Details.removeAt(i);
//                             //     _selected.removeAt(i);
//                             //     // selecteditems.add(i);
//                             //   }
//                             // }
//                           });
//                         });
//
//                         // _selected.add(true);
//                         // Details.removeLast();
//                         // Navigator.of(context).pop();
//                       },
//                       child: Container(
//                         height: 40,
//                         width: 70,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           color: Colors.red,
//                         ),
//                         child: const Center(
//                           child: Text("delete",
//                               style: TextStyle(color: Colors.white)),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     Container(
//                       height: 40,
//                       width: 200,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: Colors.green,
//                       ),
//                       child: Center(
//                         child: InkWell(
//                           onTap: () {
//                             setState(() {});
//                           },
//                           child: const Text("profile managment upgrading",
//                               style: TextStyle(color: Colors.white)),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     Container(
//                       height: 40,
//                       width: 70,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: Colors.green,
//                       ),
//                       child: Center(
//                         child: InkWell(
//                           onTap: () {
//                             setState(() {});
//                           },
//                           child: const Text("export",
//                               style: TextStyle(color: Colors.white)),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: 50),
//         Container(
//           height: 200,
//           width: MediaQuery.of(context).size.width * 0.75,
//           child: Scrollbar(
//             isAlwaysShown: true,
//             showTrackOnHover: true,
//             child: ListView(
//               children: [_createDataTable()],
//             ),
//           ),
//         ),
//       ],
//     ));
//   }
//
//   Container WrapContainer(
//     String title,
//     String hinttext,
//     TextEditingController mycontroller,
//   ) {
//     return Container(
//       width: 400,
//       child: Row(
//         children: [
//           Text(title,
//               style:
//                   TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
//           // SizedBox(
//           //   width: 30,
//           // ),
//           InkWell(
//             onTap: () {
//               setState(() {});
//             },
//             child: SizedBox(
//               width: 290,
//               child: TextField(
//                 controller: mycontroller,
//                 style: const TextStyle(
//                   color: Colors.black,
//                   height: 1,
//                 ),
//                 decoration: InputDecoration(
//                   hintStyle: TextStyle(fontSize: 15),
//                   filled: true,
//                   fillColor: Colors.white,
//                   border: OutlineInputBorder(),
//                   hintText: hinttext,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   DataTable _createDataTable() {
//     return DataTable(columns: _createColumns(), rows: _createRows());
//   }
//
//   List<DataColumn> _createColumns() {
//     return [
//       DataColumn(label: Text('ID')),
//       DataColumn(label: Text('Charger serial no')),
//       DataColumn(label: Text('Station name')),
//       DataColumn(label: Text('charge ammeter')),
//       DataColumn(label: Text('Whether to push')),
//       DataColumn(label: Text('metr firmware version')),
//     ];
//   }
//
//   // List<DataRow> _createRows() {
//   //   return detail
//   //       .mapIndexed((index, book) => DataRow(
//   //               cells: [
//   //                 DataCell(Text('' + book['id'].toString())),
//   //                 DataCell(Text(book['Charger serial no'])),
//   //                 DataCell(Text(book['Station name'])),
//   //                 DataCell(Text(book['charge ammeter'])),
//   //                 DataCell(Text(book['Whether to push'])),
//   //                 DataCell(Text(book['metr firmware version']))
//   //               ],
//   //               selected: _selected[index],
//   //               onSelectChanged: (bool? selected) {
//   //                 setState(() {
//   //                   _selected[index] = selected!;
//   //                   store = index;
//   //                 });
//   //               }))
//   //       .toList();
//   // }
//
//   void _addToCookie(String key, String value) {
//     // 2592000 sec = 30 days.
//     document.cookie = "$key=$value; max-age=2592000; path=/;";
//   }
//
//   String _getCookie(String key) {
//     String cookies = document.cookie!;
//     List<String> listValues =
//         cookies.isNotEmpty ? cookies.split(";") : <String>[];
//     String matchVal = "";
//     for (int i = 0; i < listValues.length; i++) {
//       List<String> map = listValues[i].split("=");
//       String _key = map[0].trim();
//       String _val = map[1].trim();
//       if (key == _key) {
//         matchVal = _val;
//         break;
//       }
//     }
//     return matchVal;
//   }
// }
