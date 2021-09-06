import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 130,
                width: 130,
                child: SvgPicture.asset("assets/images/error.svg"),
              ),
              const Text(
                                "OOPS something went wrong!",
                                style: TextStyle(
                                  fontSize: 20,
                                  // fontFamily: "Nunito",
                                  color: Colors.black,
                                ),
                              ),
            ],
          ),
        ),
      ),
    );
  }
}
