import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:testapp/constants.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email='',_password='';
  GoogleSignInAccount? _currentUser;
  String _contactText='';

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState((){
        print(account);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                ),
                TextField(
                  decoration: InputDecoration(
                    fillColor: secondaryColor,
                    filled: true,
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    )
                  ),
                ),
                SizedBox(height: defaultPadding,),
                TextField(
                  decoration: InputDecoration(
                    fillColor: secondaryColor,
                      filled: true,
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      )
                  ),
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                ElevatedButton(
                  onPressed: (){
                    _handleSignIn();
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
