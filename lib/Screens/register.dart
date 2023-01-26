import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_and_home_page/Screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/styles.dart';
import 'home_page.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phnController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String _selectedText = "Select Profession";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hoblist.com'),
          centerTitle: true,
          backgroundColor: trans,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              mainText(),
              loginForm(width, context),
            ],
          ),
        ),
      ),
    );
  }

  Form loginForm(double width, BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 15, left: 10, right: 20, bottom: 5),
                margin: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  'Please enter your Name',
                  style: TextStyle(color: Colors.grey.shade800),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: TextFormField(
                  controller: nameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  cursorHeight: 25.0,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Enter Name.',
                    hintStyle: GoogleFonts.lato(),
                  ),
                  validator: (value) {
                    if (value == '') {
                      return "enter a name";
                    } else {
                      // saveData(value);
                      return null;
                    }
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 20, bottom: 5),
                margin: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  'Please enter your email',
                  style: TextStyle(color: Colors.grey.shade800),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: TextFormField(
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  cursorHeight: 25.0,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Enter Email.',
                    hintStyle: GoogleFonts.lato(),
                  ),
                  validator: (value) {
                    if (value == '') {
                      return "enter a valid email";
                    } else {
                      // saveData(value);
                      return null;
                    }
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 20, bottom: 5),
                margin: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  'Please enter your Phone Number',
                  style: TextStyle(color: Colors.grey.shade800),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: TextFormField(
                  controller: phnController,
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  cursorHeight: 25.0,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Enter Phone Number.',
                    hintStyle: GoogleFonts.lato(),
                  ),
                  validator: (value) {
                    if (value == '') {
                      return "enter a valid Phone Number";
                    } else {
                      // saveData(value);
                      return null;
                    }
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 10, right: 20, bottom: 5, top: 10),
                margin: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  'Please enter your desired Password',
                  style: TextStyle(color: Colors.grey.shade800),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  cursorHeight: 25.0,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Enter Password.',
                    hintStyle: GoogleFonts.lato(),
                  ),
                  validator: (value) {
                    if (value == '') {
                      return "Enter a Strong Password";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: _selectedText,
                  hint: const Text('Select Profession'),
                  items: <String>[
                    'Select Profession',
                    'Doctor',
                    'Engineer',
                    'Accountant',
                    'Programmer',
                    'Driver',
                  ].map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      val != null ? _selectedText = val : _selectedText;
                      print(_selectedText);
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: black,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                width: width * .9,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      saveData(
                          email: emailController.text,
                          password: passwordController.text,
                          phnNumber: phnController.text,
                          profession: _selectedText);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Register',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column mainText() {
    return Column(
      children: const [
        Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Future<void> saveData(
      {required String email,
      required String password,
      required String phnNumber,
      required String profession,
      required}) async {
    // print(email);
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString('email', email);

    await sharedPref.setString('password', password);
    await sharedPref.setString('profession', profession);
    await sharedPref.setString('number', phnNumber);
  }
}
