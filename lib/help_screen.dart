import 'package:suc_khoe_app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                    left: 16,
                    right: 16),
                child: Image.asset('assets/images/helpImage.png'),
              ),
              Container(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'Có vẻ bạn đang gặp sự cố?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 16),
                child: const Text(
                  'Liên hệ với chúng tôi qua \n Hotline: 0888606347 \n Email: nguyenquan113@gmail.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: buidButton(),
                    // child: Container(
                    //   width: 140,
                    //   height: 40,
                    //   decoration: BoxDecoration(
                    //     color: Colors.blue,
                    //     borderRadius:
                    //         const BorderRadius.all(Radius.circular(4.0)),
                    //     boxShadow: <BoxShadow>[
                    //       BoxShadow(
                    //           color: Colors.grey.withOpacity(0.6),
                    //           offset: const Offset(4, 4),
                    //           blurRadius: 8.0),
                    //     ],
                    //   ),
                    //   child: Material(
                    //     color: Colors.transparent,
                    //     child: InkWell(
                    //       onTap: () {
                    //       },
                    //       child: const Center(
                    //         child: Padding(
                    //           padding: EdgeInsets.all(4.0),
                    //           child: Text(
                    //             'Liên hệ ngay',
                    //             style: TextStyle(
                    //               fontWeight: FontWeight.w500,
                    //               color: Colors.white,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget buidButton(){
    final number = '0888606347';
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 48, vertical: 12),
        textStyle: TextStyle(fontSize: 24)
      ),
        child: Text('Liên hệ ngay'),
        onPressed: (){
        launch('tel://$number');
        },
    );
  }
}
