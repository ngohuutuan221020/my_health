import 'package:flutter/material.dart';
import 'package:suc_khoe_app/Service/Auth_Service.dart';
import 'package:suc_khoe_app/pages/SignIn.dart';

import 'SignupPage.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthClass authClass = AuthClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Health"
        ),
        actions: [
          IconButton(
              onPressed: () async {
            await authClass.logout();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (builder) => SignInPage()),
                    (route) => false);}, icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
