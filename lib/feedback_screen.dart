import 'package:suc_khoe_app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:suc_khoe_app/text_fields.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _enableBtn = false;

  TextEditingController subjectController = TextEditingController();
  String emailController = "ngohuutuan221020@gmail.com";
  TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    subjectController.dispose();

    messageController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 1000,
        child: Column(
          children: <Widget>[

            Container(

              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                  left: 16,
                  right: 16),
              child: Image.asset('assets/images/feedbackImage.png'),
            ),
            Form(
              key: _formKey,
              onChanged: (() {
                setState(() {
                  _enableBtn = _formKey.currentState!.validate();
                });
              }),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFields(
                        controller: subjectController,
                        name: "Tiêu đề",
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'Không được bỏ trống';
                          }
                          return null;
                        })),
                    TextFields(
                        controller: messageController,
                        name: "Tin nhắn",
                        validator: ((value) {
                          if (value!.isEmpty) {
                            setState(() {
                              _enableBtn = true;
                            });
                            return 'Không được bỏ trống';
                          }
                          return null;
                        }),
                        maxLines: null,
                        type: TextInputType.multiline),
                    Padding(
                        padding: EdgeInsets.all(20.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty
                                  .resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                  if (states
                                      .contains(MaterialState.pressed))
                                    return Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.5);
                                  else if (states
                                      .contains(MaterialState.disabled))
                                    return Colors.grey;
                                  return Colors
                                      .blue; // Use the component's default.
                                },
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                  ))),
                          onPressed: _enableBtn ? (() async {
                            final Email email = Email(
                              body: messageController.text,
                              subject: subjectController.text,
                              recipients: [emailController],
                              isHTML: false,
                            );
                            await FlutterEmailSender.send(email);
                          })
                              : null,
                          child: Text('Gửi'),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
