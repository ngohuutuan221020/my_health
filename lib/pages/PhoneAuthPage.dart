import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:suc_khoe_app/Service/Auth_Service.dart';
class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({Key? key}) : super(key: key);

  @override
  _PhoneAuthPageState createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  int start = 30;
  bool wait = false;
  String buttonName = "Gửi";
  TextEditingController phoneController = TextEditingController();
  AuthClass authClass = AuthClass();
  String verificationIdFinal = "";
  String smsCode = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100,),
              textField(),
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width -34,
                child: Row(
                  children: [
                    Expanded(child: Container(
                      height: 1,
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(horizontal: 12),)
                    ),
                    Text("Nhập mã OTP",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                      ),
                    ),
                    Expanded(child: Container(
                      height: 1,
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(horizontal: 12),)
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              otpField(),
              SizedBox(height: 40,),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Gửi lại mã OTP trong ",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: "00:$start",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.red,
                      ),
                    ),
                  ]
                ),
              ),
              SizedBox(height: 40,),
              InkWell(
                onTap: (){
                  authClass.signInwithPhoneNumber(verificationIdFinal, smsCode, context);
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width -100,
                  decoration: BoxDecoration(
                    color: Color(0xffff9601),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "Đăng nhập",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void startTimer(){
    const onsec = Duration(seconds: 1);
    Timer timer = Timer.periodic(onsec, (timer) {
      if(start==0){
        setState(() {
          timer.cancel();
          wait = false;
        });
      }
      else {
        setState(() {
          start--;
        });
      }
    });
  }
  Widget otpField(){
    return OTPTextField(
      length: 6,
      width: MediaQuery.of(context).size.width ,
      fieldWidth: 58,
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: Colors.white,
        borderColor: Colors.white
      ),
      style: TextStyle(
          fontSize: 17,
      ),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.underline,
      onCompleted: (pin) {
        print("Completed: " + pin);
        setState(() {
          smsCode=pin;
        });
      },
    );
  }
  Widget textField(){
    return Container(
      width: MediaQuery.of(context).size.width-40,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: phoneController,
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Nhập số điện thoại",
          hintStyle: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 19, horizontal: 8),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
            child: Text(
              "(+84)",
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
          ),
          suffixIcon: InkWell(
            onTap: wait
                ? null
                : () async {
              startTimer();
              setState(() {
                start = 30;
                wait = true;
                buttonName = "Đã gửi";
              });
              await authClass.verifyPhoneNumber(
                  "+84 ${phoneController.text}", context, setData);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Text(
                buttonName,
                style: TextStyle(
                  color: wait? Colors.grey :  Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void setData(String verificationId) {
    setState(() {
      verificationIdFinal = verificationId;
    });
    startTimer();
  }
}
