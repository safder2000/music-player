// import 'package:flutter/material.dart';

// class ScreenTest extends StatefulWidget {
//   @override
//   _ScreenTestState createState() => _ScreenTestState();
// }

// class _ScreenTestState extends State<ScreenTest> {
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Flutter"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     content: Stack(
//                       clipBehavior: Clip.none,
//                       children: <Widget>[
//                         Positioned(
//                           right: -40.0,
//                           top: -40.0,
//                           child: InkResponse(
//                             onTap: () {
//                               Navigator.of(context).pop();
//                             },
//                             child: CircleAvatar(
//                               child: Icon(Icons.close),
//                               backgroundColor: Colors.red,
//                             ),
//                           ),
//                         ),
//                         Form(
//                           key: _formKey,
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 child: TextFormField(),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 child: TextFormField(),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: ElevatedButton(
//                                   child: const Text("Submitß"),
//                                   onPressed: () {
//                                     if (_formKey.currentState!.validate()) {
//                                       _formKey.currentState!.save();
//                                     }
//                                   },
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 });
//           },
//           child: Text("Open Popup"),
//         ),
//       ),
//     );
//   }
// }
