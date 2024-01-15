import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  TextEditingController _studyingController = TextEditingController();
  TextEditingController _pincodeController = TextEditingController();
  TextEditingController _aadharNumberController = TextEditingController();
  TextEditingController _phoneno1Controller = TextEditingController();
  TextEditingController _phoneno2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text('Student Name', style: subTitleDesign()),
          TextFormField(decoration: inputFormDesign()),
          const SizedBox(height: 20),
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
          Text('School Name', style: subTitleDesign()),
          TextFormField(decoration: inputFormDesign()),
          const SizedBox(height: 20),
          Text('School Address', style: subTitleDesign()),
          TextFormField(decoration: inputFormDesign()),
          const SizedBox(height: 20),
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
          Text('Father Name', style: subTitleDesign()),
          TextFormField(decoration: inputFormDesign()),
          const SizedBox(height: 20),
          Text('Father Age', style: subTitleDesign()),
          TextFormField(decoration: inputFormDesign()),
          const SizedBox(height: 20),
          Text('Father Educational Qualification', style: subTitleDesign()),
          TextFormField(decoration: inputFormDesign()),
          const SizedBox(height: 20),
          Text('Father Profession', style: subTitleDesign()),
          TextFormField(decoration: inputFormDesign()),
          const SizedBox(height: 20),
          Text('Mother Name', style: subTitleDesign()),
          TextFormField(decoration: inputFormDesign()),
          const SizedBox(height: 20),
          Text('Mother Age', style: subTitleDesign()),
          TextFormField(decoration: inputFormDesign()),
          const SizedBox(height: 20),
          Text('Mothers Education Qualification', style: subTitleDesign()),
          TextFormField(decoration: inputFormDesign()),
          const SizedBox(height: 20),
          Text('Mother Profession', style: subTitleDesign()),
          TextFormField(decoration: inputFormDesign()),
          const SizedBox(height: 20),
          Text('Siblings Name with Class', style: subTitleDesign()),
          TextFormField(decoration: inputFormDesign()),
          const SizedBox(height: 20),
          Text('Health Issues (If any)', style: subTitleDesign()),
          TextFormField(decoration: inputFormDesign()),
          const SizedBox(height: 20),
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
          Text('Special Skills (If any)', style: subTitleDesign()),
          TextFormField(decoration: inputFormDesign()),
          const SizedBox(height: 20),
          Text('Door No', style: subTitleDesign()),
          TextFormField(decoration: inputFormDesign()),
          const SizedBox(height: 20),
          Text('Street', style: subTitleDesign()),
          TextFormField(decoration: inputFormDesign()),
          const SizedBox(height: 20),
          Text('Village', style: subTitleDesign()),
          TextFormField(decoration: inputFormDesign()),
          const SizedBox(height: 20),
          Text('Taluk', style: subTitleDesign()),
          TextFormField(decoration: inputFormDesign()),
          const SizedBox(height: 20),
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
          Text('District', style: subTitleDesign()),
          TextFormField(decoration: inputFormDesign()),
          const SizedBox(height: 20),
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
          Text('Email (If Any)', style: subTitleDesign()),
          TextFormField(decoration: inputFormDesign()),
          const SizedBox(height: 20),
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
          Text('Remarks', style: subTitleDesign()),
          TextFormField(decoration: inputFormDesign()),
          const SizedBox(height: 40),
          Container(
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
