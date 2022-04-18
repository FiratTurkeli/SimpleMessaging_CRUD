import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/connectivity_provider.dart';

Widget pageUI(){
  return Consumer<ConnectivityProvider>(
    builder: (context, model, child){
      if (model.isOnline != null) {
        return Container(
            color: Colors.green,
            child: Center(child: const Text("Online"),));
      }  else {

        return Container(color: Colors.red ,child: Text("Internet connection not detected"));

        }
    },
  );
}