import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:clipboard/clipboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Copy Icon Inside PinCodeTextField'),
        ),
        body: MyPinCodeFormWidget(),
      ),
    );
  }
}

class MyPinCodeFormWidget extends StatefulWidget {
  @override
  _MyPinCodeFormWidgetState createState() => _MyPinCodeFormWidgetState();
}

class _MyPinCodeFormWidgetState extends State<MyPinCodeFormWidget> {
  final TextEditingController pinController = TextEditingController();
  bool isCopied = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPinCodeTextField(
            controller: pinController,
            pinTextStyle: TextStyle(fontSize: 24),
            length: 4,
            onChanged: (pin) {
              // You can handle the pin code input here
            },
            onCopy: () {
              Clipboard.setData(ClipboardData(text: pinController.text));
              setState(() {
                isCopied = true;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Pin code copied to clipboard')),
              );
            },
          ),
          if (isCopied)
            Text(
              'Copied!',
              style: TextStyle(color: Colors.green, fontSize: 16),
            ),
        ],
      ),
    );
  }
}

class CustomPinCodeTextField extends PinCodeTextField {
  final VoidCallback? onCopy;

  CustomPinCodeTextField({
    Key? key,
    required TextEditingController controller,
    required TextStyle pinTextStyle,
    int length = 4,
    void Function(String text)? onChanged,
    this.onCopy,
  }) : super(
          key: key,
          controller: controller,
          pinTextStyle: pinTextStyle,
          maxLength: length,
          onTextChanged: onChanged,
        );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        build(context),
        Positioned(
          right: 16,
          child: GestureDetector(
            onTap: onCopy,
            child: Icon(Icons.content_copy),
          ),
        ),
      ],
    );
  }
}
