// import 'package:flutter/material.dart';

// import 'package:iconify_flutter/iconify_flutter.dart'; // For Iconify Widget

// import 'package:iconify_flutter/icons/carbon.dart';

// import 'package:music_player/screens/menu/screen_main.dart';

// import 'package:music_player/widgets/home_song_list_tile.dart';

// class ScreenSearch extends StatefulWidget {
//   const ScreenSearch({Key? key}) : super(key: key);

//   @override
//   State<ScreenSearch> createState() => ScreenSearchstate();
// }

// class ScreenSearchstate extends State<ScreenSearch> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.amber,
//       child: Scaffold(
//         body: Column(
//           children: [
//             Expanded(
//               child: Container(
//                 decoration: const BoxDecoration(
//                     // image: DecorationImage(
//                     //   alignment: Alignment.topCenter,
//                     //   image: AssetImage('assets/images/background2.jpg'),
//                     //   fit: BoxFit.fill,
//                     // ),
//                     color: Color.fromARGB(255, 1, 64, 64)),
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                       stops: [
//                         0.00,
//                         0.00,
//                         0.7,
//                       ],
//                       colors: [
//                         Color.fromARGB(255, 1, 64, 64),
//                         Color.fromARGB(255, 1, 64, 64),
//                         Color.fromARGB(182, 0, 0, 0),
//                       ],
//                     ),
//                   ),
//                   child: SafeArea(
//                     child: ListView(
//                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             IconButton(
//                               icon: const Iconify(
//                                 Carbon.arrow_up_left,
//                                 color: Color.fromARGB(75, 255, 255, 255),
//                                 size: 25,
//                               ),
//                               onPressed: () {
//                                 Navigator.of(context).pushReplacement(
//                                   MaterialPageRoute(
//                                     builder: (ctx1) => const ScreenMain(),
//                                   ),
//                                 );
//                               },
//                             ),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.only(top: 8.0, bottom: 8),
//                               child: Container(
//                                 decoration: const BoxDecoration(
//                                     color: Color.fromARGB(255, 219, 242, 39),
//                                     borderRadius: const BorderRadius.only(
//                                       topLeft: Radius.circular(40),
//                                       bottomLeft: Radius.circular(40),
//                                     )),
//                                 child: Row(
//                                   children: [
//                                     IconButton(
//                                         onPressed: () {
//                                           Navigator.of(context).pushReplacement(
//                                             MaterialPageRoute(
//                                               builder: (ctx1) =>
//                                                   const ScreenSearch(),
//                                             ),
//                                           );
//                                         },
//                                         icon: const Iconify(
//                                           Carbon.search,
//                                           color:
//                                               Color.fromARGB(255, 27, 82, 72),
//                                           size: 25,
//                                         )),
//                                     const SizedBox(
//                                         width: 264, child: TextField()),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             //===================================================================
//                             HomeSongListTile(
//                               songTitle: 'LongNights',
//                               songSub: 'appukuttan',
//                               songImg: const AssetImage(
//                                   'assets/covers/LongNights.jpg'),
//                             ),

//                             HomeSongListTile(
//                               songTitle:
//                                   'There For You - Martin Garrix feat. Troye Sivan -',
//                               songSub: 'MTV Top 100 Single Charts ',
//                               songImg: const AssetImage(
//                                   'assets/covers/ThereForYou.jpg'),
//                             ),

//                             //=========================================================================
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
