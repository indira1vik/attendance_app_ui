import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  DateTime _selectedDate = DateTime.now();

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
          Text('Teacher Name', style: subTitleDesign()),
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
          Text('Husband/Fathers Name', style: subTitleDesign()),
          TextFormField(decoration: inputFormDesign()),
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
          Text('Bank Account Number', style: subTitleDesign()),
          TextFormField(decoration: inputFormDesign()),
          const SizedBox(height: 20),
          Text('Bank Name', style: subTitleDesign()),
          TextFormField(decoration: inputFormDesign()),
          const SizedBox(height: 20),
          Text('Bank Branch Name', style: subTitleDesign()),
          TextFormField(decoration: inputFormDesign()),
          const SizedBox(height: 20),
          Text('IFSC', style: subTitleDesign()),
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
