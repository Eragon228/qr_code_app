import 'package:flutter/material.dart';

import '../features/Widgets/Widgets.dart';
import '/features/view/view.dart';


final routes={
  "/" : (context) => LoginScreen(),
  "/profile" : (context)=>ProfileScreen(),
  "/new_pos" : (context)=>NewLocationScreen(),
  "/new_thing" : (context)=>NewItemScreen(),
  "/uploading_thing" : (context)=>DataExportScreen(),
  "/main_screen": (context)=>HomePage(),
  //"/generator": (context) {}
  "/choose":(context) =>ChooseLocationScreen(),
};