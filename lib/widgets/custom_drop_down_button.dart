// import 'package:flutter/material.dart';

// class CustomDropDownButton extends StatelessWidget {
//   final List<String> items;
//   final String value;
//   final String hintName;
//   final String newValue;
//   Function onChanged;
//   CustomDropDownButton(
//       {required this.items,
//       required this.value,
//       required this.hintName,
//       required this.newValue
//       required this.onChanged});
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       isExpanded: true,
//       value: value,
//       underline: const SizedBox(),
//       items: items.map<DropdownMenuItem<String>>((String value) => return DropdownMenuItem(
//         value: value, 
//         child: Text(value),),).toList(),
//         hint: hintName,
//       onChanged: (String newValue){
//       },
//     );
//   }
// }
