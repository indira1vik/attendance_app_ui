import 'package:flutter/material.dart';

class NewPassword extends StatefulWidget {
  final ValueChanged<String>? onUpdatePassword;

  const NewPassword({super.key, this.onUpdatePassword});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  bool isPasswordValid = false;

  String _getErrorMessage(String password) {
    List<String> errors = [];
    if (password.length < 8) {
      errors.add('Password must be at least 8 characters long.');
    }
    if (!password.contains(RegExp(r'[A-Z]'))) {
      errors.add('Password must contain at least one uppercase letter.');
    }
    if (!password.contains(RegExp(r'[a-z]'))) {
      errors.add('Password must contain at least one lowercase letter.');
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      errors.add('Password must contain at least one digit.');
    }
    if (!password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
      errors.add('Password must contain at least one special character.');
    }
    return errors.isNotEmpty ? errors.join('\n') : '';
  }

  @override
  void initState() {
    super.initState();
    _passwordFocusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      isPasswordValid = _passwordFocusNode.hasFocus &&
          _getErrorMessage(_newPasswordController.text).isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    String passwordError = _getErrorMessage(_newPasswordController.text);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Password'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (_passwordFocusNode.hasFocus)
                  Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      isPasswordValid
                          ? 'Password must be at least 8 characters long, contain at least one uppercase and lowercase letter, at least one digit, and at least one special character.'
                          : passwordError,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: isPasswordValid ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                TextFormField(
                  controller: _newPasswordController,
                  focusNode: _passwordFocusNode,
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      isPasswordValid = _getErrorMessage(value).isEmpty;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'New Password',
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration:
                      const InputDecoration(labelText: 'Confirm Password'),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    String errorMessage =
                        _getErrorMessage(_newPasswordController.text);
                    if (_newPasswordController.text ==
                            _confirmPasswordController.text &&
                        errorMessage.isEmpty) {
                      if (widget.onUpdatePassword != null) {
                        widget.onUpdatePassword!(_newPasswordController.text);
                      }
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Password changed successfully'),
                        ),
                      );
                      Navigator.pop(context);
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(errorMessage.isNotEmpty
                              ? errorMessage
                              : 'Passwords do not match. Please try again.'),
                        ),
                      );
                    }
                  },
                  child: const Text('Change Password'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
