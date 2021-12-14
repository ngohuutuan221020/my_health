import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:suc_khoe_app/components/bottom_button.dart';
import 'package:suc_khoe_app/icons/app_icons.dart';
import 'package:suc_khoe_app/navigation_home_screen.dart';
import 'package:suc_khoe_app/screens/result_screen.dart';
import 'package:suc_khoe_app/utils/calculate_bmi.dart';

class formBmi extends StatelessWidget {
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin cá nhân"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container(
              //     height: 100,
              //     padding: const EdgeInsets.symmetric(vertical: 20),
              //     child: StreamBuilder<QuerySnapshot>(
              //         stream: users,
              //         builder: (
              //           BuildContext context,
              //           AsyncSnapshot<QuerySnapshot> snapshot,
              //         ) {
              //           if (snapshot.hasError) {
              //             return Text("Thông thể nhận dữ liệu");
              //           }
              //           if (snapshot.connectionState == ConnectionState.waiting) {
              //             return Text("Loading");
              //           }
              //           final data = snapshot.requireData;
              //           return ListView.builder(
              //               itemCount: data.size,
              //               itemBuilder: (context, index) {
              //                 return Text(
              //                     "Ten ${data.docs[index]['name']} tuoi ${data.docs[index]['age']}");
              //               });
              //         })),
              Text(
                "THÔNG TIN CÁ NHÂN",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              MyCustomForm()
            ],
          ),
        ]
      ),
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
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: "Nhập tên của bạn",
                  labelText: "Tên"),
              onChanged: (value) {
                name = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Mục này không thể trống";
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(AppIcons.transgender_alt),
                  hintText: "Nhập giới tính của bạn (Nam/Nữ)",
                  labelText: "Giới tính"),
              onChanged: (value) {
                gender = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Mục này không thể trống";
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.date_range),
                  hintText: "Nhập tuổi của bạn",
                  labelText: "Tuổi"),
              onChanged: (value) {
                age = int.parse(value);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Mục này không thể trống";
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(AppIcons.accessibility),
                  hintText: "Nhập cân nặng của bạn(Kg)",
                  labelText: "Cân nặng"),
              onChanged: (value) {
                weight = int.parse(value);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Mục này không thể trống";
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(AppIcons.up_circled2),
                  hintText: "Nhập chiều cao của bạn(Cm)",
                  labelText: "Chiều cao"),
              onChanged: (value) {
                height = int.parse(value);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Mục này không thể trống";
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            // Center(
            //   child: ElevatedButton(
            //     onPressed: () {
            //       if (_formKey.currentState!.validate()) {
            //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //           content: Text("Đã lưu thông tin của bạn"),
            //         ));users
            //             .add({'name': name, 'gender': gender ,'age': age , 'weight': weight, 'height': height})
            //             .then((value) => print('User Added'))
            //             .catchError(
            //                 (error) => print("Failed to add user: $error"));
            //       }
            //       BmiLogic calc =
            //       BmiLogic(height: height, weight: weight);
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => ResultsPage(
            //             bmiResult: calc.calculateBMI(),
            //             resultText: calc.getResult(),
            //             interpretation: calc.getInterpretation(),
            //           ),
            //         ),
            //       );
            //     },
            //     child: Text("Cập nhật"),
            //   ),
            // ),
            Center(
              child: BottomButton(
                buttonTitle: 'OK',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Đã lưu thông tin của bạn"),
                    ));users
                        .add({'name': name, 'gender': gender ,'age': age , 'weight': weight, 'height': height})
                        .then((value) => print('Đã lưu'))
                        .catchError(
                            (error) => print("Lưu thông tin thất bại: $error"));
                  }
                  BmiLogic calc =
                  BmiLogic(height: height, weight: weight);
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
