import 'package:flutter/material.dart';

class MySignup extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[10],
        body: SafeArea(
          child: Center(
            child: Form(
              key: _formkey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 65,
                      backgroundImage:
                          AssetImage('assets/images/flutter.jpeg'),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      '  Sign-up ',
                      style: TextStyle(
                        height: 2,
                        fontFamily: 'GreatVibes-Regular',
                        color: Colors.black38,
                        fontSize: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            bool emailValid = RegExp(
                                    r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                .hasMatch(value!);
                            if (value.isEmpty) {
                              return "Email Address can't be empty";
                            } else if (!emailValid) {
                              return "Email is not valid";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide()),
                              hintText: "Enter your email address",
                              labelText: 'E-mail'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Value can't be empty";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide()),
                                hintText: "Enter your name",
                                labelText: 'Name'),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
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
                                border: OutlineInputBorder(
                                    borderSide: BorderSide()),
                                hintText: "Enter 10-digit mobile number",
                                labelText: 'Mobile number'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
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
                    ),
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
                                'SUBMIT',
                                style: TextStyle(color: Colors.orange),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
