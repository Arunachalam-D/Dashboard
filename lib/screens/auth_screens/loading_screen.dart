// import 'package:flutter/material.dart';
//
// class LoadingBar extends StatelessWidget {
//   const LoadingBar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Loading"),
//       ),
//       body:const Column(
//         children: [
//           CircularProgressIndicator(
//             backgroundColor: Colors.redAccent,
//             valueColor: AlwaysStoppedAnimation(Colors.green),
//             strokeWidth: 10,
//           ),
//         ],
//       )
//     );
//   }
// }

import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
