import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class TeacherPage extends StatefulWidget {
  const TeacherPage({super.key});
  @override
  State<TeacherPage> createState() => _TeacherPageState();
}

TextStyle subTitleDesign() {
  return const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
}

InputDecoration inputFormDesign() {
  return InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFFF27121)),
      borderRadius: BorderRadius.circular(8),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(8),
    ),
  );
}

class _TeacherPageState extends State<TeacherPage> {
  String _selectedGender = 'Male';
  String _selectedStatus = 'Single';
  String _selectedcenter = 'Chennai';
  final String _status = 'AssistantProf';
  final String _selectedremarks = 'Resigned';

  DateTime _selectedDate = DateTime.now();
  final DateTime _selectedDateLeave = DateTime.now();
  final DateTime _selectedDateJoin = DateTime.now();

  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _aadharNumberController = TextEditingController();
  final TextEditingController _phoneno1Controller = TextEditingController();
  final TextEditingController _phoneno2Controller = TextEditingController();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _fatherEduController = TextEditingController();
  final TextEditingController _doorController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _villageController = TextEditingController();
  final TextEditingController _talukController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bankaccController = TextEditingController();
  final TextEditingController _banknameController = TextEditingController();
  final TextEditingController _bankbranchController = TextEditingController();
  final TextEditingController _ifscController = TextEditingController();

  Future<void> insertRecord() async {
    try {
      String uri = "http://10.0.2.2:92/attendance_api/insert_teacher.php";
      String formattedDate0 = DateFormat('yyyy-MM-dd').format(_selectedDate);
      String formattedDate1 =
          DateFormat('yyyy-MM-dd').format(_selectedDateJoin);
      String formattedDate2 =
          DateFormat('yyyy-MM-dd').format(_selectedDateLeave);
      if (_nameController.text != "") {
        var res = await http.post(Uri.parse(uri), body: {
          "tchr_name": _nameController.text,
          "tchr_gender": _selectedGender,
          "tchr_dob": formattedDate0,
          "tchr_marital": _selectedStatus,
          "tchr_father": _fatherNameController.text,
          "tchr_edu": _fatherEduController.text,
          "tchr_aadhaar": _aadharNumberController.text,
          "tchr_door": _doorController.text,
          "tchr_street": _streetController.text,
          "tchr_village": _villageController.text,
          "tchr_taluk": _talukController.text,
          "tchr_pin": _pincodeController.text,
          "tchr_dist": _districtController.text,
          "tchr_ph_one": _phoneno1Controller.text,
          "tchr_ph_two": _phoneno2Controller.text,
          "tchr_email": _emailController.text,
          "tchr_center": _selectedcenter,
          // "tchr_doj": formattedDate1,
          // "tchr_dol": formattedDate2,
          "tchr_bankacc": _bankaccController.text,
          "tchr_bankname": _banknameController.text,
          "tchr_branch": _bankbranchController.text,
          "tchr_ifsc": _ifscController.text,
          "tchr_status": _status,
          "tchr_remarks": _selectedremarks,
        });
        try {
          var response = jsonDecode(res.body);
          if (response["success"] == "true") {
            print("Recorded...");
          } else {
            print("Error: ${response['message']}");
          }
        } catch (e) {
          print("Error decoding response: $e");
        }
      }
    } catch (ex) {
      print(ex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // ---------------------------------------------
          Text('Teacher Name', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _nameController,
          ),
          const SizedBox(height: 20),
          // ---------------------------------------------

          Text('Gender', style: subTitleDesign()),
          DropdownButtonFormField<String>(
            decoration: inputFormDesign(),
            value: _selectedGender,
            items: <String>['Male', 'Female'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedGender = newValue;
                });
              }
            },
          ),
          const SizedBox(height: 20),
          // ---------------------------------------------

          Text('Date of Birth', style: subTitleDesign()),
          TextFormField(
            decoration: InputDecoration(
              hintText: "${_selectedDate.toLocal()}".split(' ')[0],
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFF27121)),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            readOnly: true,
            onTap: _pickDate,
          ),
          const SizedBox(height: 20),
          // ---------------------------------------------

          Text('Marital Staus', style: subTitleDesign()),
          DropdownButtonFormField<String>(
            decoration: inputFormDesign(),
            value: _selectedStatus,
            items: <String>['Single', 'Married', 'Divorced', 'Widow']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedStatus = newValue!;
              });
            },
          ),
          const SizedBox(height: 20),
          // ---------------------------------------------

          Text('Husband/Fathers Name', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _fatherNameController,
          ),
          const SizedBox(height: 20),
          
          // ---------------------------------------------
          Text('Education Qualification', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _fatherEduController,
          ),
          const SizedBox(height: 20),
          // ---------------------------------------------

          Text('Aadhaar Number', style: subTitleDesign()),
          TextField(
            decoration: inputFormDesign(),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d{0,10}$')),
            ],
            controller: _aadharNumberController,
          ),
          const SizedBox(height: 20),
          // ---------------------------------------------

          Text('Door No', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _doorController,
          ),
          const SizedBox(height: 20),
          // ---------------------------------------------

          Text('Street', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _streetController,
          ),
          const SizedBox(height: 20),
          // ---------------------------------------------

          Text('Village', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _villageController,
          ),
          const SizedBox(height: 20),
          // ---------------------------------------------

          Text('Taluk', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _talukController,
          ),
          const SizedBox(height: 20),
          // ---------------------------------------------

          Text('Pincode', style: subTitleDesign()),
          TextField(
            decoration: inputFormDesign(),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d{0,6}$')),
            ],
            controller: _pincodeController,
          ),
          const SizedBox(height: 20),
          // ---------------------------------------------

          Text('District', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _districtController,
          ),
          const SizedBox(height: 20),
          // ---------------------------------------------

          Text('Phone No1', style: subTitleDesign()),
          TextField(
            decoration: inputFormDesign(),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d{0,10}$')),
            ],
            controller: _phoneno1Controller,
          ),
          const SizedBox(height: 20),
          // ---------------------------------------------

          Text('Phone No2', style: subTitleDesign()),
          TextField(
            decoration: inputFormDesign(),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d{0,10}$')),
            ],
            controller: _phoneno2Controller,
          ),
          const SizedBox(height: 20),
          // ---------------------------------------------

          Text('Email (If Any)', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _emailController,
          ),
          const SizedBox(height: 20),
          // ---------------------------------------------

          Text('Center Name', style: subTitleDesign()),
          DropdownButtonFormField<String>(
            decoration: inputFormDesign(),
            value: _selectedcenter,
            items: <String>['Chennai', 'Coimbatore'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedcenter = newValue;
                });
              }
            },
          ),
          const SizedBox(height: 20),
          // ---------------------------------------------

          Text('Date of Joining', style: subTitleDesign()),
          TextFormField(
            decoration: InputDecoration(
              hintText: "${_selectedDate.toLocal()}".split(' ')[0],
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFF27121)),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            readOnly: true,
            onTap: _pickDate,
          ),
          const SizedBox(height: 20),
          // ---------------------------------------------

          Text('Bank Account Number', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _bankaccController,
          ),
          const SizedBox(height: 20),
          // ---------------------------------------------

          Text('Bank Name', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _banknameController,
          ),
          const SizedBox(height: 20),
          // ---------------------------------------------

          Text('Bank Branch Name', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _bankbranchController,
          ),
          const SizedBox(height: 20),
          // ---------------------------------------------

          Text('IFSC', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _ifscController,
          ),
          const SizedBox(height: 40),
          // ---------------------------------------------

          GestureDetector(
            onTap: () => {insertRecord()},
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFFF27121),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }
}
