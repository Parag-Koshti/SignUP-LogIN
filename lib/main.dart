import 'package:flutter/material.dart';
import 'package:signup/signup.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: const CircleAvatar(
                      radius: 75,
                      backgroundImage: AssetImage('assets/images/flutter.jpeg'),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    ' Welcome ',
                    style: TextStyle(
                      height: 1,
                      fontFamily: 'GreatVibes-Regular',
                      color: Colors.black38,
                      fontSize: 50,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        maxLength: 10,
                        validator: (value){
                        if(value!.length != 10)
                        {
                            return "number is not valide";
                        }
                        else
                        {
                          return null;
                        }
                        },
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide()),
                            hintText: "Enter 10-digit mobile number",
                            labelText: 'Mobile number '),
                      )),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      child:  TextFormField(
                        validator: (value) {
                          if(value!.isEmpty)
                          {
                            return "Password can't be empty";
                          }
                          else if(value.length<3)
                          {
                            return "password length should be atleast 3 charcter";
                          }
                          else null;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide()),
                          hintText: "Enter password",
                          labelText: 'Password ',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () => {
                                  if (_formkey.currentState!.validate())
                                    {print("Successfull")}
                                  else
                                    {print("not validate")}
                                },
                            child: const Text(
                              'LOGIN',
                              style: TextStyle(color: Colors.orange),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MySignup()),
                                  )
                                },
                            child: const Text(
                              'SIGN-UP',
                              style: TextStyle(color: Colors.orange),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
