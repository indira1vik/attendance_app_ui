import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});
  @override
  State<StudentPage> createState() => _StudentPageState();
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

class _StudentPageState extends State<StudentPage> {
  String _selectedGender = 'Male';
  String _selectedClass = 'LKG';
  String _selectedMedium = 'Tamil';
  String _selectedSchoolCategory = 'Private';
  String _selectedSchoolType = 'Primary';
  String _selectedStudentstatus = 'Single Parent';
  String _selectedcenter = 'Chennai';
  DateTime _selectedDate = DateTime.now();

  final TextEditingController _studyingController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _aadharNumberController = TextEditingController();
  final TextEditingController _phoneno1Controller = TextEditingController();
  final TextEditingController _phoneno2Controller = TextEditingController();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _fatherEduController = TextEditingController();
  final TextEditingController _fatherProfController = TextEditingController();
  final TextEditingController _fatherAgeController = TextEditingController();
  final TextEditingController _motherNameController = TextEditingController();
  final TextEditingController _motherEduController = TextEditingController();
  final TextEditingController _motherProfController = TextEditingController();
  final TextEditingController _motherAgeController = TextEditingController();

  final TextEditingController _schoolNameController = TextEditingController();
  final TextEditingController _siblingController = TextEditingController();
  final TextEditingController _healthController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();
  final TextEditingController _doorController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _villageController = TextEditingController();
  final TextEditingController _talukController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _remarksController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  Future<void> insertRecord() async {
    try {
      String uri = "http://10.0.2.2:92/attendance_api/insert_student.php";
      String formattedDate = DateFormat('yyyy-MM-dd').format(_selectedDate);
      var res = await http.post(Uri.parse(uri), body: {
        "std_name": _nameController.text,
        "std_gender": _selectedGender,
        "std_dob": formattedDate,
        "std_class": _selectedClass,
        "std_medium": _selectedMedium,
        "std_school": _schoolNameController.text,
        "std_school_ad": _addressController.text,
        "std_school_cat": _selectedSchoolCategory,
        "std_school_type": _selectedSchoolType,
        "std_aadhaar": _aadharNumberController.text,
        "std_father_name": _fatherNameController.text,
        "std_father_age": _fatherAgeController.text,
        "std_father_edu": _fatherEduController.text,
        "std_father_prof": _fatherProfController.text,
        "std_mother_name": _motherNameController.text,
        "std_mother_age": _motherAgeController.text,
        "std_mother_edu": _motherEduController.text,
        "std_mother_prof": _motherProfController.text,
        "std_sib_name": _siblingController.text,
        "std_health": _healthController.text,
        "std_status": _selectedStudentstatus,
        "std_skill": _skillsController.text,
        "std_door": _doorController.text,
        "std_street": _streetController.text,
        "std_village": _villageController.text,
        "std_taluk": _talukController.text,
        "std_pin": _pincodeController.text,
        "std_dist": _districtController.text,
        "std_ph_one": _phoneno1Controller.text,
        "std_ph_two": _phoneno2Controller.text,
        "std_email": _emailController.text,
        "std_center": _selectedcenter,
        "std_since": _studyingController.text,
        "std_remarks": _remarksController.text,
      });
      var response = jsonDecode(res.body);
      if (response["success"] == "true") {
        print("Recorded...");
      } else {
        print("Error");
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
          // ------------------------------------------
          Text('Student Name', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _nameController,
          ),
          const SizedBox(height: 20),
          // ------------------------------------------
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
          // ------------------------------------------
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
          // ------------------------------------------
          Text('Class', style: subTitleDesign()),
          DropdownButtonFormField<String>(
            decoration: inputFormDesign(),
            value: _selectedClass,
            items: <String>[
              'LKG',
              'UKG',
              '1',
              '2',
              '3',
              '4',
              '5',
              '6',
              '7',
              '8',
              '9',
              '10',
              '11',
              '12'
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedClass = newValue!;
              });
            },
          ),
          const SizedBox(height: 20),
          // ------------------------------------------
          Text('Medium', style: subTitleDesign()),
          DropdownButtonFormField<String>(
            decoration: inputFormDesign(),
            value: _selectedMedium,
            items: <String>['Tamil', 'English'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedMedium = newValue;
                });
              }
            },
          ),
          const SizedBox(height: 20),
          // ------------------------------------------
          Text('School Name', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _schoolNameController,
          ),
          const SizedBox(height: 20),
          // ------------------------------------------
          Text('School Address', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _addressController,
          ),
          const SizedBox(height: 20),
          // ------------------------------------------
          Text('School Category', style: subTitleDesign()),
          DropdownButtonFormField<String>(
            decoration: inputFormDesign(),
            value: _selectedSchoolCategory,
            items: <String>['Private', 'Government'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedSchoolCategory = newValue;
                });
              }
            },
          ),
          const SizedBox(height: 20),
          // ------------------------------------------
          Text('School Type', style: subTitleDesign()),
          DropdownButtonFormField<String>(
            decoration: inputFormDesign(),
            value: _selectedSchoolType,
            items: <String>['Primary', 'Middle', 'Higher', 'Higher Secondary']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedSchoolType = newValue;
                });
              }
            },
          ),
          const SizedBox(height: 20),
          // ------------------------------------------
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
          // ------------------------------------------
          Text('Father Name', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _fatherNameController,
          ),
          const SizedBox(height: 20),
          // ------------------------------------------
          Text('Father Age', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _fatherAgeController,
          ),
          const SizedBox(height: 20),
          // ------------------------------------------
          Text('Father Educational Qualification', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _fatherEduController,
          ),
          const SizedBox(height: 20),
          // ------------------------------------------
          Text('Father Profession', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _fatherProfController,
          ),
          const SizedBox(height: 20),
          // ------------------------------------------
          Text('Mother Name', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _motherNameController,
          ),
          const SizedBox(height: 20),
          // ------------------------------------------
          Text('Mother Age', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _motherAgeController,
          ),
          const SizedBox(height: 20),
          // ------------------------------------------
          Text('Mothers Education Qualification', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _motherEduController,
          ),
          const SizedBox(height: 20),
          // ------------------------------------------
          Text('Mother Profession', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _motherProfController,
          ),
          const SizedBox(height: 20),
          // ------------------------------------------
          Text('Siblings Name with Class', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _siblingController,
          ),
          const SizedBox(height: 20),
          // ------------------------------------------
          Text('Health Issues (If any)', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _healthController,
          ),
          const SizedBox(height: 20),
          // ------------------------------------------
          Text('Student Status', style: subTitleDesign()),
          DropdownButtonFormField<String>(
            decoration: inputFormDesign(),
            value: _selectedStudentstatus,
            items:
                <String>['Single Parent', 'Orphan', 'Poor'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedStudentstatus = newValue;
                });
              }
            },
          ),
          const SizedBox(height: 20),
          // ------------------------------------------
          Text('Special Skills (If any)', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _skillsController,
          ),
          const SizedBox(height: 20),
          // ------------------------------------------
          Text('Door No', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _doorController,
          ),
          const SizedBox(height: 20),
          // ------------------------------------------
          Text('Street', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _streetController,
          ),
          const SizedBox(height: 20),
          // ------------------------------------------
          Text('Village', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _villageController,
          ),
          const SizedBox(height: 20),
          // ------------------------------------------
          Text('Taluk', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _talukController,
          ),
          const SizedBox(height: 20),
          // ------------------------------------------
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
          // ------------------------------------------
          Text('District', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _districtController,
          ),
          const SizedBox(height: 20),
          // ------------------------------------------
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
          // ------------------------------------------
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
          // ------------------------------------------
          Text('Email (If Any)', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _emailController,
          ),
          const SizedBox(height: 20),
          // ------------------------------------------
          Text('Center Name', style: subTitleDesign()),
          DropdownButtonFormField<String>(
            decoration: inputFormDesign(),
            value: _selectedcenter,
            items: <String>['Chennai', 'Trichy'].map((String value) {
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
          // ------------------------------------------
          Text('Studying Since', style: subTitleDesign()),
          TextField(
            decoration: inputFormDesign(),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d{0,4}$')),
            ],
            controller: _studyingController,
          ),
          const SizedBox(height: 20),
          // ------------------------------------------
          Text('Remarks', style: subTitleDesign()),
          TextFormField(
            decoration: inputFormDesign(),
            controller: _remarksController,
          ),
          const SizedBox(height: 40),
          // ------------------------------------------
          GestureDetector(
            onTap: () {
              insertRecord();
            },
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
