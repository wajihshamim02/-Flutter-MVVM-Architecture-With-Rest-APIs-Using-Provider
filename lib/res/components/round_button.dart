

import 'package:flutter/material.dart';
import 'package:mvvm_structure/res/color.dart';

class RoundButton extends StatelessWidget {

 final String title;
 final bool Loading ;
 final VoidCallback onPress;


const RoundButton({ Key? key, required this.title, required this.onPress, this.Loading =  false }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.greencolor,
          borderRadius: BorderRadius.circular(10)
        ),
        child:  Loading ? CircularProgressIndicator(color: Colors.white,): Center(child: Text(title,style: TextStyle(color: Colors.white,fontSize: 25),)),
      ),
    );
  }
}