import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suc_khoe_app/widgets/my_header.dart';
import 'package:suc_khoe_app/widgets/counter.dart';
import 'package:suc_khoe_app/widgets/webview_byt.dart';
import 'Craping.dart';
import 'constant.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

class covidScreen extends StatefulWidget {
  @override
  _covidScreenState createState() => _covidScreenState();
}

class _covidScreenState extends State<covidScreen> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: <Widget>[
            MyHeader(
              image: "assets/icons/Drcorona.svg",
              textTop: "Hãy ở nhà",
              textBottom: "nếu bạn cảm thấy \n không được khỏe",
              offset: offset,
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Column(
            //     children: <Widget>[
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: <Widget>[
            //           RichText(
            //             text: TextSpan(
            //               text: "By: Ngô Hữu Tuấn",
            //               style: TextStyle(
            //                 color: Colors.grey,
            //                 fontSize: 12,
            //                 fontWeight: FontWeight.bold
            //               ),
            //                 ),
            //             ),
            //         ],
            //       ),
            //     ]
            //   ),
            // ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  "Tổng số ca mắc COVID-19 \ntrong nước từ 27/04/2021",
                              style: kTitleTextstyle,
                            ),
                          ],
                        ),
                      ),
                      MaterialButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          final response = await extractData();
                          setState(() {
                            result1 = response[0];
                            result2 = response[1];
                            result3 = response[2];
                            result4 = response[3];
                            //0
                            result00 = response[4];
                            result01 = response[5];
                            result02 = response[6];
                            result03 = response[7];
                            result04 = response[8];
                            //0
                            result10 = response[9];
                            result11 = response[10];
                            result12 = response[11];
                            result13 = response[12];
                            result14 = response[13];
                            //0
                            result20 = response[14];
                            result21 = response[15];
                            result22 = response[16];
                            result23 = response[17];
                            result24 = response[18];
                            //0
                            result30 = response[19];
                            result31 = response[20];
                            result32 = response[21];
                            result33 = response[22];
                            result34 = response[23];
                            //0
                            result40 = response[24];
                            result41 = response[25];
                            result42 = response[26];
                            result43 = response[27];
                            result44 = response[28];
                            //0
                            result50 = response[29];
                            result51 = response[30];
                            result52 = response[31];
                            result53 = response[32];
                            result54 = response[33];
                            isLoading = false;
                          });
                        },
                        child: Text(
                          'Cập nhật',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.green,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    result4,
                    style: TextStyle(
                      color: kTextLightColor,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: isLoading
                        ? CircularProgressIndicator()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Counter(
                                color: kInfectedColor,
                                number: result1,
                                title: "Tổng",
                              ),
                              Counter(
                                color: kDeathColor,
                                number: result2,
                                title: "Tử vong",
                              ),
                              Counter(
                                color: kRecovercolor,
                                number: result3,
                                title: "Mới",
                              ),
                            ],
                          ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Ca mắc COVID-19 trong tỉnh",
                              style: kTitleTextstyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:<Widget> [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tỉnh",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),),
                          SizedBox(height: 10,),
                          Text(result01,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),),
                          SizedBox(height: 10,),
                          Text(result11,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),),
                          SizedBox(height: 10,),
                          Text(result21,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),),
                          SizedBox(height: 10,),
                          Text(result31,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),),
                          SizedBox(height: 10,),
                          Text(result41,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),),
                          SizedBox(height: 10,),
                          Text(result51,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Tổng",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.orange,
                            ),),
                          SizedBox(height: 10,),
                          Text(result02,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.orange,
                            ),),
                          SizedBox(height: 10,),
                          Text(result12,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.orange,
                            ),),
                          SizedBox(height: 10,),
                          Text(result22,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.orange,
                            ),),
                          SizedBox(height: 10,),
                          Text(result32,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.orange,
                            ),),
                          SizedBox(height: 10,),
                          Text(result42,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.orange,
                            ),),
                          SizedBox(height: 10,),
                          Text(result52,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.orange,
                            ),),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Tử vong",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                            ),),
                          SizedBox(height: 10,),
                          Text(result03,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.red,
                            ),),
                          SizedBox(height: 10,),
                          Text(result13,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.red,
                            ),),
                          SizedBox(height: 10,),
                          Text(result23,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.red,
                            ),),
                          SizedBox(height: 10,),
                          Text(result33,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.red,
                            ),),
                          SizedBox(height: 10,),
                          Text(result43,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.red,
                            ),),
                          SizedBox(height: 10,),
                          Text(result53,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.red,
                            ),),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Ca mới",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                            ),),
                          SizedBox(height: 10,),
                          Text(result04,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.green,
                            ),),
                          SizedBox(height: 10,),
                          Text(result14,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.green,
                            ),),
                          SizedBox(height: 10,),
                          Text(result24,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.green,
                            ),),
                          SizedBox(height: 10,),
                          Text(result34,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.green,
                            ),),
                          SizedBox(height: 10,),
                          Text(result44,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.green,
                            ),),
                          SizedBox(height: 10,),
                          Text(result54,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.green,
                            ),),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return WebViewYTe();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Khai báo y tế',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.green,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
