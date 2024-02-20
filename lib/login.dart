import 'package:attendance_app/home.dart';
import 'package:attendance_app/login_elements/forgot.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xFF8A2387), Color(0xFFE94057)],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Container(
                    width:  MediaQuery.of(context).size.width,
                    height: 472,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 320,
                              height: 120,
                              child: Center(
                                child: Image.asset('images/logo.png'),
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              child: Column(
                                children: [
                                  const Text(
                                    'Arunachala Evening School',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 280,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Username',
                                        suffixIcon: Icon(
                                          Icons.mail,
                                          size: 18,
                                        ),
                                      ),
                                      controller: _usernameController,
                                      validator: (value) {
                                        if (value?.isEmpty ?? true) {
                                          return 'Username Required';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 280,
                                    child: TextFormField(
                                      controller: _passwordController,
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                        labelText: 'Password',
                                        suffixIcon: Icon(
                                          Icons.remove_red_eye,
                                          size: 18,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value?.isEmpty ?? true) {
                                          return 'Password Required';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ForgotPassword(
                                                  onUpdatePassword:
                                                      (String value) {},
                                                ),
                                              ),
                                            );
                                          },
                                          child: const Text(
                                            'Forgot Password',
                                            style: TextStyle(
                                              color: Color(0xFFE94057),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomePage()),
                                      );
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 64,
                                      width: 290,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: const Color(0xFFF27121),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Text(
                                          'Login',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 21,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
