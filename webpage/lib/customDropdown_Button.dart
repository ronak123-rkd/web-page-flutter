// DropdownButton<String>(
// value: dropdownValue,
// icon: Icon(Icons.arrow_downward),
// iconSize: 24,
// elevation: 16,
// style: TextStyle(color: Colors.deepPurple),
// underline: Container(
// height: 2,
// color: Colors.deepPurpleAccent,
// ),
// onChanged: (String newValue) {
// setState(() {
// dropdownValue = newValue;
// });
// },
// items: <String>['One', 'Two', 'Free', 'Four']
// .map<DropdownMenuItem<String>>((String value) {
// return DropdownMenuItem<String>(
// value: value,
// child: Text(value),
// );
// }).toList(),
// );
// white_check_mark
// eyes
// raised_hands
//
//
//
//
//
//
// ronak kathrotiya  1:00 PM
// DropdownButton<String>(
// value: DropDownvalue,
// icon: Icon(Icons.arrow_downward),
// iconSize: 24,
// elevation: 16,
// style: TextStyle(color: Colors.deepPurple),
// underline: Container(
// height: 2,
// color: Colors.deepPurpleAccent,
// ),
// onChanged: (newValue) {
// setState(() {
// DropDownvalue = newValue!;
// });
// },
// items: <String>[
// 'One',
// 'Two',
// 'Free',
// 'Four'
// ].map<DropdownMenuItem<String>>((String value) {
// return DropdownMenuItem<String>(
// value: value,
// child: Text(value),
// );
// }).toList(),
// ),
// 1:00
// String DropDownvalue = "one";
//
// Sanket  1:44 PM
// Container(
// padding: EdgeInsets.all(10.0),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text("DropDownButton"),
// Container(
// height: 40,
// padding: EdgeInsets.all(5.0),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(30.0),
// border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.80),
// ),
// child: DropdownButtonHideUnderline(
// child: DropdownButton2(
// hint: Text(
// 'Select Item',
// style: TextStyle(
// fontSize: 14,
// color: Theme.of(context).hintColor,
// ),
// ),
// items: items
//     .map((item) => DropdownMenuItem<String>(
// value: item,
// child: Text(
// item,
// style: const TextStyle(
// fontSize: 14,
// ),
// ),
// ))
// .toList(),
// value: dropdownvalue,
// onChanged: (String? newValue) {
// setState(() {
// dropdownvalue = newValue!;
// });
// },
// buttonHeight: 40,
// buttonWidth: 140,
// itemHeight: 40,
// ),
// )),
// ],
// ),
// ],
// ),
// ),
