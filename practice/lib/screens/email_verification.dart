import 'package:flutter/material.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your Email Address",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                "A 6 digit verification pin will send your email address",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Email",
                  contentPadding: EdgeInsets.symmetric(horizontal: 25),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Have account? ",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Sign in"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
