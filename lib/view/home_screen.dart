
import 'package:flutter/material.dart';
import 'package:mvvm_structure/utils/routes/routes.dart';
import 'package:provider/provider.dart';

import '../view_model/userview_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    final userPrefrences  = Provider.of<UserviewModel>(context);
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         InkWell(
          onTap: (){
            userPrefrences.remove().then((value) {
              Navigator.pushNamed(context, RoutesName.login);
            });
          },
          child: Center(child: Text('Logout',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)))
        ],
      ),
      
    );
  }
}