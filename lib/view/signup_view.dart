import 'package:flutter/material.dart';
import 'package:mvvm_structure/utils/routes/routes.dart';
import 'package:provider/provider.dart';

import '../res/components/round_button.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignupView extends StatefulWidget {
  const SignupView({ Key? key }) : super(key: key);

  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
ValueNotifier<bool> _obseurepassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailfocus = FocusNode();
  FocusNode passwordfocus = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    _obseurepassword.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailfocus.dispose();
    passwordfocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthViewModel authviewmodel = Provider.of<AuthViewModel>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _emailController,
            focusNode: emailfocus,
            keyboardType: TextInputType.emailAddress,
            onFieldSubmitted: (value) {
              Utils.fieldfocuschange(context, emailfocus, passwordfocus);
            },
            decoration: InputDecoration(
              hintText: 'Enter Email',
              prefixIcon: Icon(Icons.mail),
            ),
          ),
          ValueListenableBuilder(
              valueListenable: _obseurepassword,
              builder: ((context, value, child) {
                return TextFormField(
                  controller: _passwordController,
                  focusNode: passwordfocus,
                  obscureText: _obseurepassword.value,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    prefixIcon: Icon(Icons.key),
                    suffixIcon: InkWell(
                        onTap: () {
                          _obseurepassword.value = !_obseurepassword.value;
                          setState(() {});
                        },
                        child: _obseurepassword.value
                            ? Icon(Icons.visibility_off_outlined)
                            : Icon(Icons.visibility_outlined)),
                  ),
                );
              })),
          SizedBox(
            height: size.height * 0.03,
          ),
          RoundButton(
              title: 'Sign up',
              Loading: authviewmodel.signuploading,
              onPress: () {
                if (_emailController.text.isEmpty) {
                  Utils.flushbarmessage('Please Enter Email', context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushbarmessage('Please Enter Password', context);
                } else if (_passwordController.text.length < 6) {
                  Utils.flushbarmessage(
                      'Your Password is Less then 6 digits', context);
                } else {
                  Map data = {
                    'email': _emailController.text.toString(),
                    'password': _passwordController.text.toString(),
                  };
                  authviewmodel.signupapi(data, context);
                  print("Api hit");
                }
              }),
              SizedBox(height: size.height*0.02,),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child: Text("Already have an account? Login")),

        ],
      ),
    );
  }
}
