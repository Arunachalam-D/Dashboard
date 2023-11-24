// import 'package:dashboard/constants/constant_dimensions.dart';
// import 'package:dashboard/constants/constant_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:go_router/go_router.dart';
// import '../../../../bloc/logout_bloc/logout_bloc.dart';
// import '../../../../bloc/screens_bloc/switch_screen_bloc.dart';
// import '../../../../constants/constant_colors.dart';
// import '../../../../constants/constant_paths.dart';
// import '../../../../constants/constant_strings.dart';
// import '../../../../reusable_widgets/reusable_widget.dart';
// // import '../../../auth_screens/profile_screen.dart';
// // import '../../../side_menu_screens/certificate/certificates.dart';
// // import '../../dashboard/dashboard_screen.dart';
// // import '../main_screen.dart';
//
// class SideMenu extends StatelessWidget {
//   const SideMenu({
//     super.key,
//     required this.userName,
//   });
//
//   final String userName;
//
//   @override
//   Widget build(BuildContext context) {
//     // var currentIndex = 1;
//     return BlocListener<LogoutBloc, LogoutState>(
//       listener: (context, state) {
//         if (state is LogoutUserState) {
//           FToast fToast = FToast();
//           fToast.init(context);
//           Widget toast = Container(
//             margin: const EdgeInsets.only(bottom: 160),
//             padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
//             // margin: const EdgeInsets.only(bottom: 22),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30), color: transparent),
//             child: iconButton(green, white, transparent, white, "logged out",
//                 () {}, Icons.home_filled),
//           );
//           fToast.showToast(
//               child: toast,
//               toastDuration: const Duration(seconds: 1),
//               gravity: ToastGravity.CENTER);
//
//           context.go(ConstantPaths.signInPath);
//         }
//       },
//       child: Drawer(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               const DrawerHeader(
//                   child:
//                       //Image.asset("assets/images/dashboard1.png")
//                       CircleAvatar(
//                 radius: DashBoard.circleImageRadius, // Image radius
//                 backgroundImage: AssetImage(ConstantPaths.sideMenuImage),
//               )),
//               DrawerListTile(
//                 text: StringConstants.nameBoard,
//                 icon: leaderboard,
//                 press: () {
//                   context.read<SwitchScreenBloc>().add(NavigateToDashboardEvent());
//                 },
//               ),
//               DrawerListTile(
//                 text: DrawerStrings.profile,
//                 icon: account,
//                 press: () {
//
//                   context.read<SwitchScreenBloc>().add(NavigateToProfileEvent());
//                 },
//               ),
//               DrawerListTile(
//                 text: DrawerStrings.courses,
//                 icon: notebook,
//                 press: () {},
//               ),
//               DrawerListTile(
//                 text: DrawerStrings.certificates,
//                 icon: badgeBook,
//                 press: () {
//                   context.read<SwitchScreenBloc>().add(NavigateToCertificatesEvent());
//                 },
//               ),
//               DrawerListTile(
//                 text: DrawerStrings.setting,
//                 icon: settings,
//                 press: () {},
//               ),
//               DrawerListTile(
//                   text: DrawerStrings.logout,
//                   icon: layout,
//                   press: () {
//                     context.read<LogoutBloc>().add(LogoutUserEvent());
//                   })
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class DrawerListTile extends StatelessWidget {
//
//    const DrawerListTile({
//     super.key,
//     required this.text,
//     required this.icon,
//     required this.press,
//
//   });
//
//   final String text;
//   final IconData icon;
//   final VoidCallback press;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       tileColor:  transparent,
//       horizontalTitleGap: 0.0,
//       onTap: press,
//       leading: Icon(
//         icon,
//         color: textOrange,
//       ),
//       title: Text(text),
//     );
//   }//(text == "profile") ?
// }
//

import 'dart:typed_data';

import 'package:dashboard/constants/constant_dimensions.dart';
import 'package:dashboard/constants/constant_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../bloc/logout_bloc/logout_bloc.dart';
import '../../../../bloc/screens_bloc/switch_screen_bloc.dart';
import '../../../../constants/constant_colors.dart';
import '../../../../constants/constant_paths.dart';
import '../../../../constants/constant_strings.dart';
import '../../../../reusable_widgets/reusable_widget.dart';
import '../../../side_menu_screens/profile/profile_screen.dart';
import '../../../side_menu_screens/certificate/certificates.dart';
import '../../../side_menu_screens/courses/courses.dart';
import '../../dashboard/dashboard_screen.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    super.key,
    required this.userName,
  });

  final String userName;

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  String activeTile = StringConstants.nameBoard;
  Uint8List? _image;

  @override
  Widget build(BuildContext context) {
    var currentPage = "dashboard";
    final List<DrawerListTile> drawerTiles = [
      DrawerListTile(
        text: StringConstants.nameBoard,
        icon: leaderboard,
        press: () {
          _handleTilePress(StringConstants.nameBoard);
          context.read<SwitchScreenBloc>().add(NavigateToDashboardEvent());
        },
        isActive: activeTile == StringConstants.nameBoard,
      ),
      DrawerListTile(
        text: DrawerStrings.profile,
        icon: account,
        press: () {
          _handleTilePress(DrawerStrings.profile);
          context.read<SwitchScreenBloc>().add(NavigateToProfileEvent());
        },
        isActive: activeTile == DrawerStrings.profile,
      ),
      DrawerListTile(
        text: DrawerStrings.courses,
        icon: notebook,
        press: () {
          _handleTilePress(DrawerStrings.courses);
          context.read<SwitchScreenBloc>().add(NavigateToCoursesEvent());
        },
        isActive: activeTile == DrawerStrings.courses,
      ),
      DrawerListTile(
        text: DrawerStrings.certificates,
        icon: badgeBook,
        press: () {
          _handleTilePress(DrawerStrings.certificates);
          context.read<SwitchScreenBloc>().add(NavigateToCertificatesEvent());
        },
        isActive: activeTile == DrawerStrings.certificates,
      ),

      DrawerListTile(
        text: DrawerStrings.logout,
        icon: layout,
        press: () {
          _handleTilePress(DrawerStrings.logout);
          _showAlertDialog(context);
        },
        isActive: activeTile == DrawerStrings.logout,
      ),
    ];

    return MultiBlocListener(
      listeners: [
        BlocListener<LogoutBloc, LogoutState>(
          listener: (context, state) {
            if (state is LogoutUserState) {
              FToast fToast = FToast();
              fToast.init(context);
              Widget toast = Container(
                margin: const EdgeInsets.only(bottom: 160),
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: transparent,
                ),
                child: iconButton(
                  green,
                  white,
                  transparent,
                  white,
                  "logged out",
                      () {},
                  Icons.home_filled,
                ),
              );
              fToast.showToast(
                child: toast,
                toastDuration: const Duration(seconds: 1),
                gravity: ToastGravity.CENTER,
              );

              context.go(ConstantPaths.signInPath);
            }
          },
        ),
        BlocListener<SwitchScreenBloc, SwitchScreenState>(
          listener: (context, state) async {
            if (state is NavigateToProfileState) {
              print(currentPage);
              setState(() {
                currentPage = "profile";
             });
              //context.go("/dashboard");
              print(currentPage);
              //context.go("/profile");
            } else if (state is NavigateToCertificatesState) {
              //context.go("/profile");
              print(currentPage);
              setState(() {
                currentPage = "certificates";
              });
              //context.go("/dashboard");
              print(currentPage);

              //context.go("/profile");
            }
            else if (state is NavigateToCertificatesState) {


                print("obtainedEmail");


              print(currentPage);
              setState(() {
                currentPage = "certificates";
              });
              //context.go("/dashboard");
              print(currentPage);


              //context.go("/profile");
            }
            else if (state is NavigateToCoursesState) {


              print("obtainedEmail");


              print(currentPage);
              setState(() {
                currentPage = "courses";
              });
              //context.go("/dashboard");
              print(currentPage);


              //context.go("/profile");
            }
            else if (state is NavigateToDashboardState) {
              //context.go("/profile");
              print(currentPage);
              setState(() {
                currentPage = "dashboard";
              });
              //context.go("/dashboard");
              print(currentPage);

              //context.go("/profile");
            }
          },
        ),
      ],
      child: Container(
        decoration: BoxDecoration(

          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Drawer(
        backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(0),
                bottomRight: Radius.circular(0)),
          ),
            child: Column(
              children: [
                 DrawerHeader(

                  child: _image != null ?
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: MemoryImage(_image!), // Replace with your avatar image URL
                  ) :
                  const CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage(
                        "images/user.png"
                      //ConstantPaths.profileImage
                    ), // Replace with your avatar image URL
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: drawerTiles.length,
                  itemBuilder: (context, index) => drawerTiles[index],
                ),
              ],
            ),
          ),
        ),
      );

  }

  void _handleTilePress(String tileText) {

      activeTile = tileText;

  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.text,
    required this.icon,
    required this.press,
    required this.isActive,
  });

  final String text;
  final IconData icon;
  final VoidCallback press;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: isActive ? textOrange :  transparent,
      horizontalTitleGap: 10.0,
      onTap: press,
      leading: Icon(
        icon,
        color: isActive ? white : textOrange,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: isActive ? white : Colors.black,
        ),
      ),
    );
  }
}
Widget getPage(String currentPage, {required String name})  {
  switch (currentPage) {
    case "dashboard":
    // html.window.history.pushState(null, 'dashboard', '#/dashboard');
      return DashboardScreen(name: name);
    case "profile":
      print("profile screen");
      //html.window.history.pushState(null, 'home', '#/profile');
      return const ProfileScreen();
    case "certificates":
      print("obtainedEmail");
      print("certificates screen");
      //html.window.history.pushState(null, 'certificates', '#/certificates');
      return const CertificateScreen();

    case "courses":
      print("obtainedEmail");
      print("courses screen");
      //html.window.history.pushState(null, 'certificates', '#/certificates');
      return const CourseScreen();

  // Add more cases as needed
    default:
      return DashboardScreen(name: name); // Default widget when no case matches
  }
}
void _showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Logout'),
        content: const Text('Do you really want to logout'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel',style: TextStyle(color: textOrange),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Confirm'),
            onPressed: () {
              // Handle the confirm action
              context.read<LogoutBloc>().add(LogoutUserEvent());
            },
          ),
        ],
      );
    },
  );
}
void _showSettingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Oops Sorry !!!'),
        content: const Text('This page is currently under construction'),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok',style: TextStyle(color: textOrange),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),

        ],
      );
    },
  );
}