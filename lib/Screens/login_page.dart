import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_and_home_page/Screens/register.dart';
import 'package:login_and_home_page/Services/movie_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/styles.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    final sharedPref = await SharedPreferences.getInstance();
    email = sharedPref.getString('email');
    password = sharedPref.getString('password');
    print(password);
  }

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
          automaticallyImplyLeading: false,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            mainText(),
            const SizedBox(
              height: 50,
            ),
            loginForm(width, context),
          ],
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
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: TextFormField(
                    cursorHeight: 25.0,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Enter Email.',
                      hintStyle: GoogleFonts.lato(),
                    ),
                    validator: (value) {
                      if (value != email) {
                        return "enter a valid email";
                      } else {
                        saveData(value);
                        return null;
                      }
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: TextFormField(
                    obscureText: true,
                    cursorHeight: 25.0,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Enter Password.',
                      hintStyle: GoogleFonts.lato(),
                    ),
                    validator: (value) {
                      if (value != password) {
                        return "incorrect Password";
                      } else {
                        return null;
                      }
                    }),
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: black,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                width: width * .9,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      MovieServices.getMovies();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    } else {
                      const snackbar =
                          SnackBar(content: Text('Invalid Credentials'));

                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Sign In',
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
          const SizedBox(
            height: 72,
          ),
          Container(
            child: TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Register()));
              },
              child: const Text(
                'New User? Register Now',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ),
          )
        ],
      ),
    );
  }

  Column mainText() {
    return Column(
      children: const [
        Text(
          'Login',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Future<void> saveData(email) async {
    // print(email);
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setBool('loggedin', true);
  }
}
