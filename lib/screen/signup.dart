
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgetss/button.dart';
import '../widgetss/textform.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String dropdownValue = 'Users';
  TextEditingController Name =  TextEditingController();
  TextEditingController email =  TextEditingController();
  TextEditingController Pass =  TextEditingController();
  TextEditingController Address =  TextEditingController();
  TextEditingController Contact =  TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value ==  null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email is Required"),
        ),
      );
      //return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid Email"),
        ),
      );
      //  return "Invalid Email";
    } else {
      return null;
    }
  }
  String? validatePasswordLength(String value){
    if(value.length==0){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password can't be empty"),
        ),
      );
      //   return "Password can't be empty";
    } else if (value.length < 10){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password must be longer than 10 characters"),
        ),
      );
      //  return "Password must be longer than 10 characters";
    }
    return null;
  }
  String? validateName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Name is Required"),
        ),
      );
     // return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Name must be a-z and A-Z"),
        ),
      );
     // return "Name must be a-z and A-Z";
    }
    return null;
  }
  String? validateAddress(String value) {
    if (value.length == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Address is Required"),
        ),
      );
      // return "Name is Required";
    }
    return null;
  }
  String? validateMobile(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Mobile is Required"),
        ),
      );
   //   return "Mobile is Required";
    } else if (value.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Mobile number must 10 digits"),
        ),
      );
   //   return "Mobile number must 10 digits";
    } else if (!regExp.hasMatch(value)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text( "Mobile Number must be digits"),
        ),
      );
      //return "Mobile Number must be digits";
    }
    return null;
  }
  SignupFunc() {
    validateName(Name.text);
    validateEmail(email.text);
    validatePasswordLength(Pass.text);
    validateAddress(Address.text);
    validateMobile(Contact.text);
    // if (_formKey.currentState!.validate()) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text('Processing Data'),
    //     ),
    //   );
    // }
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.network('https://easysalon.in/img/logo.png'),
                ),

                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    textform('Name',Name),
                    SizedBox(
                      height: 10,
                    ),
                    textform('Email',email),
                    SizedBox(
                      height: 10,
                    ),
                    textform('Password',Pass),
                    SizedBox(
                      height: 10,
                    ),
                    textform('Address',Address),
                    SizedBox(
                      height: 10,
                    ),
                    textform('Contact',Contact),
                    SizedBox(
                      height: 10,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 100.w,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white))),
                            value: dropdownValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>['Users', 'Parlor', 'Salone']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        // Spacer(),

                        // Text('Forget password ?'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Textform(),
                    InkWell(
                        onTap: (){
                          SignupFunc();
                        },

                        child: Container(child: butoon('Signup'))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
