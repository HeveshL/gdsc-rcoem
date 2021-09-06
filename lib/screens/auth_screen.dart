import 'package:flutter/material.dart';
import 'package:gdsc/screens/otp_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _phoneNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 3),
                      blurRadius: 6,
                      color: const Color(0xff000000).withOpacity(0.16),
                    ),
                  ],
                ),
                height: 60,
                child: TextField(
                  textInputAction: TextInputAction.done,
                  key: UniqueKey(),
                  controller: _phoneNoController,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(
                    // fontFamily: "Nunito",
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // hintText: "Eter your phone number",
                    labelText: "Phone number",
                    prefixText: "+91",
                    filled: true,
                    fillColor: Colors.transparent,
                    labelStyle: TextStyle(
                      // fontFamily: "Nunito",
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.58),
                    ),
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => OtpScreen(
                            phoneNo: int.parse(_phoneNoController.text),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 3),
                            blurRadius: 6,
                            color: const Color(0xff000000).withOpacity(0.16),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 15,
                            // fontFamily: "Nunito",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
