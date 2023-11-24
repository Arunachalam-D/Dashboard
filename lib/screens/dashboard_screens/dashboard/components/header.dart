import 'package:dashboard/constants/constant_colors.dart';
import 'package:dashboard/constants/constant_dimensions.dart';
import 'package:dashboard/constants/constant_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/constant_icons.dart';
import '../../../../controller/menu_controller.dart';
import '../../../../responsive/responsive.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.userName}) : super(key: key);

  final String userName;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _getSharedPreferenceValue(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Row(
            children: [
              if (!Responsive.isDesktop(context))
                IconButton(
                  onPressed: context.read<MenuAppController>().controlMenu,
                  icon: const Icon(Icons.menu, color: authPageRed),
                ),
              if (!Responsive.isMobile(context))
                const Padding(
                  padding:  EdgeInsets.only(left: 10),
                  child: Text(
                    StringConstants.nameBoard,
                    style:  TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textOrange,
                      fontSize: 25,
                    ),
                  ),
                ),
              if (!Responsive.isMobile(context)) Spacer(flex: Responsive.isDesktop(context) ? 3 : 1,),
              const Expanded(child: SearchField()),
              ProfileCard(name: snapshot.data ?? userName),
            ],
          );
        } else {
          // You can return a loading indicator or an empty widget while waiting for the data
          return SizedBox.shrink();
        }
      },
    );
  }

  Future<String> _getSharedPreferenceValue() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(StringConstants.typeEmail) ?? '';
    //var obtainedEmail = sharedPreferences.getString(StringConstants.typeEmail);
  }
}


class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key, required this.name,
  });

  final String name;



  @override
  Widget build(BuildContext context) {
    // final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // var obtainedEmail = sharedPreferences.getString(StringConstants.typeEmail);
    return Container(
      margin: const EdgeInsets.only(left: 25),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end:  Alignment.centerRight,
              colors: [
                textOrange,//(0xFF8A2387)
               authPageRed,//(0xFFE94057)
                // Color(0xFFF19921), //(0xFFF27121)
                // Color(0xFF9F0191),
              ]
          ),
          borderRadius: BorderRadius.circular(30)
      ),
      child: Text("Welcome ${capitalize(RegExp(r'(.+?)@').firstMatch(name)?.group(1))} !", style: const TextStyle(color: white),)
    );

  }

  String capitalize(String? s) {
    if (s == null || s.isEmpty) {
      return '';
    }
    return s[0].toUpperCase() + s.substring(1);
  }

}


class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: StringConstants.search,
          fillColor: black12,
          contentPadding: const EdgeInsets.only(left: 8),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: Cards.circularAllRadius,
          ),
          suffixIcon: InkWell(
            onTap: (){},
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(horizontal: 4,vertical: 3),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end:  Alignment.centerRight,
                    colors: [
                      textOrange,//(0xFF8A2387)
                      authPageRed,//(0xFFE94057)
                      // Color(0xFFF19921), //(0xFFF27121)
                      // Color(0xFF9F0191),
                    ]
                ),
                borderRadius: Cards.circularAllRadius,
              ),
              child: const Icon(searchIcon,color: Colors.white,),

            ),
          )
      ),
    );
  }
}

