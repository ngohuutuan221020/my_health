import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:suc_khoe_app/model/Tcases.dart';
import '../model/Tcases.dart';

class Covid19 extends StatefulWidget {
  @override
  _Covid19State createState() => _Covid19State();
}

class _Covid19State extends State<Covid19> {
  final String url = "https://corona.lmao.ninja/v2/countries/Vietnam";
  Future <Tcases> getJsonData() async{
    var reponse = await http.get(
        Uri.parse(url)
    );
    if (reponse.statusCode==200){
      final convertDataJSON = jsonDecode(reponse.body);
      return Tcases.fromJson(convertDataJSON);
    }
    else{
      throw Exception('Thu lai');
    }
  }
  @override
  void initState(){
    super.initState();
    this.getJsonData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TÌNH HÌNH DỊCH BỆNH COVID-19'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top : 20)),
              Center(
                child: Row( mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Cả nước',style: TextStyle(color :Colors.black,fontSize :25.0,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              FutureBuilder <Tcases>(
                  future: getJsonData(),
                  builder: (BuildContext context, SnapShot){
                    if(SnapShot.hasData){
                      final covid = SnapShot.data;
                      return Column(
                        children: <Widget>[
                          Card(
                            color: Colors.black,
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget> [
                                  Text(
                                    "${covid!.cases} ",
                                    style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),),
                                  Text(
                                    "${covid.deaths}",
                                    style: TextStyle(color: Colors.red, fontSize: 23, fontWeight: FontWeight.bold),),
                                  Text(
                                      "${covid.recovered}",
                                      style: TextStyle(color: Colors.green, fontSize: 23, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            color: Colors.black,
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget> [
                                  Text(
                                    "Tổng ca mắc",
                                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                                  Text(
                                    "Tử vong",
                                    style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),),
                                  Text(
                                      "Hồi phục ",
                                      style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: Row( mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Hôm nay',style: TextStyle(color :Colors.black,fontSize :25.0,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          Card(
                            color: Colors.black,
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget> [
                                  Text(
                                    "${covid.todayCases} ",
                                    style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),),
                                  Text(
                                    "${covid.todayDeaths}",
                                    style: TextStyle(color: Colors.red, fontSize: 23, fontWeight: FontWeight.bold),),
                                  Text(
                                      "${covid.todayRecovered}",
                                      style: TextStyle(color: Colors.green, fontSize: 23, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            color: Colors.black,
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget> [
                                  Text(
                                    "Ca mắc mới",
                                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                                  Text(
                                    "Tử vong",
                                    style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),),
                                  Text(
                                      "Hồi phục",
                                      style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/2a.png',width: 300, height: 250)
                              ],
                            ),
                          )
                        ],
                      );
                    }
                    else if(SnapShot.hasError)
                    {
                      return Text(SnapShot.error.toString());
                    }

                    return CircularProgressIndicator();

                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
