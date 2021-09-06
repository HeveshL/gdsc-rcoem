import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';

class OtpScreen extends StatefulWidget {
  final int phoneNo;
  const OtpScreen({Key? key, required this.phoneNo}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _vId = '';

  Future _sendCode() async {
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91${widget.phoneNo}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        // ANDROID ONLY!

        // Sign the user in (or link) with the auto-generated credential
        await FirebaseAuth.instance.signInWithCredential(credential).then(
          (value) {
            if (value.user != null) Navigator.of(context).pop();
          },
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          //TODO: Add toast
        }
        // Handle other errors
      },
      codeSent: (String verificationId, int? resendToken) async {
        _vId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out...
      },
    );
  }

  @override
  void initState() {
    _sendCode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OTPTextField(
                  length: 6,
                  width: double.infinity,
                  style: const TextStyle(fontSize: 17),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  onCompleted: (value) async {
                    final PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                      verificationId: _vId,
                      smsCode: value,
                    );
                    await FirebaseAuth.instance
                        .signInWithCredential(credential)
                        .then(
                      (value) {
                        if (value.user != null) Navigator.of(context).pop();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
