import 'package:flutter/material.dart';

class MenuAppController extends ChangeNotifier{
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu(){
    if(!scaffoldKey.currentState!.isDrawerOpen){
      _scaffoldKey.currentState!.openDrawer();
    }
  }
}
