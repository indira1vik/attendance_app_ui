import 'package:attendance_app/login_elements/new_pass.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  final ValueChanged<String> onUpdatePassword;

  const ForgotPassword({super.key, required this.onUpdatePassword});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _verificationCodeController =
      TextEditingController();
  bool _codeSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: 'Username'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Username is required';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Email is required';
                    }
                    return null;
                  },
                ),
                if (_codeSent)
                  Column(
                    children: [
                      TextFormField(
                        controller: _verificationCodeController,
                        decoration: const InputDecoration(labelText: 'Verification Code'),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Verification code is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              if (_verificationCodeController.text == '12345') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NewPassword(onUpdatePassword: widget.onUpdatePassword),
                                  ),
                                );
                              } else {
                                // Show an error message or allow the user to try again
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Incorrect verification code'),
                                  ),
                                );
                              }
                            }
                          },
                          child: const Text('Verify Code'),
                        ),
                      ),
                    ],
                  )
                else
                  const SizedBox(height: 20,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Generate a code and Set the _codeSent flag
                          setState(() {
                            _codeSent = true;
                          });
                        }
                      },
                      child: const Text('Send Code'),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
