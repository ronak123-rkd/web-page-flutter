// import 'dart:convert';
//
// import 'package:flutter/material.dart';
//
// class Vtp extends StatefulWidget {
//   const Vtp(String s, {Key? key}) : super(key: key);
//
//   @override
//   _VtpState createState() => _VtpState();
// }
//
// class _VtpState extends State<Vtp> {
//   int _page = 0;
//   int _limit = 20;
//   bool _hasNextPage = true;
//   bool _isFirstLoadRunning = false;
//   bool _isLoadMoreRunning = false;
//   List _posts = [];
//
//   void _firstLoad() async {
//     setState(() {
//       _isFirstLoadRunning = true;
//     });
//     try {
//       setState(() {});
//     } catch (err) {
//       print('Something went wrong');
//     }
//
//     setState(() {
//       _isFirstLoadRunning = false;
//     });
//   }
//
//   late ScrollController _controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Vtp('Kindacode.com'),
//       ),
//       body: _isFirstLoadRunning
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : Column(
// //               children: [
// //                 Expanded(
// //                   child: ListView.builder(
// //                     controller: _controller,
// //                     itemCount: _posts.length,
// //                     itemBuilder: (_, index) => Card(
// //                       margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
// //                       child: ListTile(
// //                         title: Vtp(_posts[index]['title']),
// //                         subtitle: Vtp(_posts[index]['body']),
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //
// //                 // when the _loadMore function is running
// //                 if (_isLoadMoreRunning == true)
// //                   Padding(
// //                     padding: const EdgeInsets.only(top: 10, bottom: 40),
// //                     child: Center(
// //                       child: CircularProgressIndicator(),
// //                     ),
// //                   ),
// //
// //                 // When nothing else to load
// //                 if (_hasNextPage == false)
// //                   Container(
// //                     padding: const EdgeInsets.only(top: 30, bottom: 40),
// //                     color: Colors.amber,
// //                     child: Center(
// //                       child: Vtp('You have fetched all of the content'),
// //                     ),
// //                   ),
// //               ],
// //             ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
//
// class UseApp extends StatefulWidget {
//   const UseApp({Key? key}) : super(key: key);
//
//   @override
//   _UseAppState createState() => _UseAppState();
// }
//
// class _UseAppState extends State<UseApp> {
//   TextEditingController editingController = TextEditingController();
//   final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
//   var items = List<String>();
//   void initState() {
//     items.addAll(duplicateItems);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text("xyz"),
//       ),
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 onChanged: (value) {
//                   filterSearchResults(value);
//                 },
//                 controller: editingController,
//                 decoration: InputDecoration(
//                     labelText: "Search",
//                     hintText: "Search",
//                     prefixIcon: Icon(Icons.search),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(25.0)))),
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: items.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text('${items[index]}'),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void filterSearchResults(String query) {
//     List<String> dummySearchList = List<String>();
//     dummySearchList.addAll(duplicateItems);
//     if (query.isNotEmpty) {
//       List<String> dummyListData = List<String>();
//       dummySearchList.forEach((item) {
//         if (item.contains(query)) {
//           dummyListData.add(item);
//         }
//       });
//       setState(() {
//         items.clear();
//         items.addAll(dummyListData);
//       });
//       return;
//     } else {
//       setState(() {
//         items.clear();
//         items.addAll(duplicateItems);
//       });
//     }
//   }
// }
