import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:suc_khoe_app/components/bottom_button.dart';
import 'package:suc_khoe_app/icons/app_icons.dart';
import 'package:suc_khoe_app/navigation_home_screen.dart';
import 'package:suc_khoe_app/screens/dmc.dart';
import 'package:suc_khoe_app/screens/result_screen.dart';
import 'package:suc_khoe_app/utils/calculate_bmi.dart';

class InviteFriend extends StatelessWidget {
  final Stream<QuerySnapshot> users =
  FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Sức khỏe của tôi"),),
        automaticallyImplyLeading: false,
      ),
      body: ListView(padding: const EdgeInsets.all(20.0), children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "THÔNG TIN CÁ NHÂN",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            Container(
                height: 500,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: StreamBuilder<QuerySnapshot>(
                    stream: users,
                    builder: (
                        BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot,
                        ) {
                      if (snapshot.hasError) {
                        return Text("Thông thể nhận dữ liệu");
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading");
                      }
                      final data = snapshot.requireData;
                      return ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.person),
                                    SizedBox(width: 10,),
                                    Text("Tên: ${data.docs[index]['name']} ",
                                      style: TextStyle(fontSize: 18),),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Icon(AppIcons.transgender_alt),
                                    SizedBox(width: 10,),
                                    Text("Giới tính:  ${data.docs[index]['gender']} ",
                                      style: TextStyle(fontSize: 18),),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Icon(Icons.date_range),
                                    SizedBox(width: 10,),
                                    Text("Tuổi:  ${data.docs[index]['age']} ",
                                      style: TextStyle(fontSize: 18),),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Icon(AppIcons.accessibility),
                                    SizedBox(width: 10,),
                                    Text("Cân nặng ${data.docs[index]['weight']} ",
                                      style: TextStyle(fontSize: 18),),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Icon(AppIcons.up_circled2),
                                    SizedBox(width: 10,),
                                    Text("Chiều cao ${data.docs[index]['height']} ",
                                      style: TextStyle(fontSize: 18),),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Icon(AppIcons.street_view),
                                    SizedBox(width: 10,),
                                    Text("Chỉ số BMI ${(data.docs[index]['weight'] / pow(data.docs[index]['height'] / 100, 2))} ",
                                      style: TextStyle(fontSize: 18),),
                                  ],
                                ),
                                SizedBox(height: 30,),

                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    side: BorderSide(width: 2, color: Colors.white),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  onPressed: () {
                                    BmiLogic calc = BmiLogic(
                                        height: data.docs[index]['height'],
                                        weight: data.docs[index]['weight']);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => loikhuyen(
                                          bmiResult: calc.calculateBMI(),
                                          resultText: calc.getResult(),
                                          interpretation:
                                          calc.getInterpretation(),
                                        ),
                                      ),
                                    );
                                  }, child: Center(
                                    child: Column(
                                      children: [
                                        Text('    Một số lời khuyên\nvề chế độ dinh dưỡng',
                                            style: TextStyle(
                                                fontSize: 28)),
                                      ]
                                    ),
                                  ),
                                ),
                              ],
                            );
                          });
                    })),
          ],
        ),
      ]),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  var name = '';
  var gender = '';
  var age = 0;
  var weight = 0;
  var height = 0;

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: BottomButton(
                buttonTitle: 'OK',
                onTap: () {
                  BmiLogic calc = BmiLogic(height: height, weight: weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavigationHomeScreen(),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
