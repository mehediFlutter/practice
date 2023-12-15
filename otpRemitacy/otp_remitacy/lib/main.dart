import 'package:flutter/material.dart';
import 'package:otp_remitacy/myCardApp.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OtpRemitacy(),
    );
  }
}


class OtpRemitacy extends StatefulWidget {
  const OtpRemitacy({super.key});

  @override
  State<OtpRemitacy> createState() => _OtpRemitacyState();
}

class _OtpRemitacyState extends State<OtpRemitacy> {
  Color cardBorderColor = Colors.black26; 
  FocusNode cardFocusNode = FocusNode();
  void changeBorderColorOnFocus(bool hasFocus) {
    setState(() {
      cardBorderColor = hasFocus
          ? Colors.black87
          : Colors.black26; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                const SizedBox(
                  height: 100,
                ),
                TextField(
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Axiforma',
                      fontWeight: FontWeight.w500),
                  // decoration: InputDecoration(
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(15),
                  //       borderSide: const BorderSide(color: Colors.black),
                  //     ),
                  //     enabledBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(15),
                  //         borderSide: const BorderSide(color: Colors.black26))),
                ),
                const SizedBox(
                  height: 20,
                ),
                Focus(
                  onFocusChange:changeBorderColorOnFocus,
                  child: ActiveBorderPinCode(),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyCardApp()));
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        fontFamily: 'Axiforma', fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF104153),
                      minimumSize: const Size(200, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ActiveBorderPinCode extends StatelessWidget {
   ActiveBorderPinCode({
    super.key,
  });

   Color cardBorderColor = Colors.black26; 
 // Initial border color
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(width: 1, color: cardBorderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
        child: PinCodeTextField(
          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),

          keyboardType: TextInputType.number,
          length: 6,

          obscureText: false,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            fieldOuterPadding: const EdgeInsets.only(top: 8),
            shape: PinCodeFieldShape.circle,
            // borderRadius: BorderRadius.circular(5),
            // borderRadius: BorderRadius.circular(200),
            fieldHeight: 22,
            fieldWidth: 20,

            activeFillColor: const Color(0xFFD9D9D9),
            activeBorderWidth: 0,
            activeColor: Colors.white,
            inactiveFillColor: const Color(0xFFD9D9D9),
            inactiveColor: const Color(0xFFD9D9D9),
            //inactiveColor: Colors.red,
            selectedColor: const Color(0xFFD9D9D9),
            selectedFillColor: const Color(0xFFD9D9D9),
          ),
          animationDuration: const Duration(milliseconds: 300),
          // backgroundColor: Colors.blue.shade50,
          enableActiveFill: true,
          cursorColor: Colors.grey,

          appContext: context,
        ),
      ),
    );
  }
}
