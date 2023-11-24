// import 'package:dashboard/responsive/responsive.dart';
// // import 'package:dashboard/screens/auth_screens/profile_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'dart:html' as html;
//
// //import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';
// import '../../../bloc/screens_bloc/switch_screen_bloc.dart';
// import '../../../constants/constant_dimensions.dart';
// import '../../../controller/menu_controller.dart';
// // import '../../side_menu_screens/certificate/certificates.dart';
// // import '../dashboard/dashboard_screen.dart';
// import 'components/side_menu.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key, required this.name});
//
//   final String name;
//
//   //const HomeScreen({super.key, required this.name});
//   @override
//   Widget build(BuildContext context) {
//     // var currentPage = "certificates";
//     return
//       MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => MenuAppController()),
//       ],
//       child:
//       Builder(builder: (context) {
//         print("building");
//         var currentPage = context.read<SwitchScreenBloc>().state.currentPage;
//         return Scaffold(
//           key: context.read<MenuAppController>().scaffoldKey,
//           drawer: SideMenu(
//             userName: name,
//           ),
//           body: SafeArea(
//               child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               if (Responsive.isDesktop(context))
//                 Expanded(
//                     child: SideMenu(
//                       userName: name,
//                     )),
//         Consumer<SwitchScreenBloc>(
//         builder: (context, switchScreenBloc, child) {
//         var currentPage = switchScreenBloc.state.currentPage;
//         return Expanded(
//         flex: DashBoard.flexValue,
//         child: getPage(currentPage, name: name),
//         );
//         },
//         ),
//             ],
//           )),
//         );
//       }
//       ),
//     );
//   }
// }
//

import 'package:dashboard/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../bloc/screens_bloc/switch_screen_bloc.dart';
import '../../../constants/constant_dimensions.dart';
import '../../../controller/menu_controller.dart';
import '../../side_menu_screens/profile/profile_screen.dart';
import 'components/side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MenuAppController()),
      ],
      child: Builder(
        builder: (context) {
          print("building");
          return Scaffold(
            key: context.read<MenuAppController>().scaffoldKey,
            drawer: SideMenu(
              userName: name,
            ),
            body: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (Responsive.isDesktop(context))
                    Expanded(
                      child: SideMenu(
                        userName: name,
                      ),
                    ),
                  Consumer<SwitchScreenBloc>(
                    builder: (context, switchScreenBloc, child) {
                      var currentPage = switchScreenBloc.state.currentPage;
                      print('In Main $currentPage');
                      return  Expanded(
                        flex: DashBoard.flexValue,
                        child: getPage(currentPage, name: name),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
