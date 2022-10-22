// ignore_for_file: camel_case_types, file_names, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../SignIn/sign_in.dart';
import '../../bottom.dart';
import 'Model/user_model.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({Key? key}) : super(key: key);

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController bloodgroupController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  String? _blood;
  String? _gender;
  String? countryValue;
  String? stateValue;
  String? cityValue;
  @override
  Widget build(BuildContext context) {
    //--------------------------------First Name
    final fullnamefeild = TextFormField(
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Please Enter full Name");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Name");
        }
        return null;
      },
      keyboardType: TextInputType.text,
      autofocus: false,
      controller: firstnameController,
      onSaved: (value) {
        firstnameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "First name",
      ),
    );
    //--------------------------------Last Name
    final usernamefeild = TextFormField(
      autofocus: false,
      controller: lastnameController,
      onSaved: (value) {
        lastnameController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Last Name");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Last Name",
      ),
    );
    //--------------------------------Email
    final emailfeild = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Email");
        }
        String pattern = r'\w+@\w+\.\w+';
        if (!RegExp(pattern).hasMatch(value)) {
          return 'Invalid Email format';
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "E-mail",
      ),
    );
    //--------------------------------Password
    final passwordfeild = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController,
      onSaved: (value) {
        passwordController.text = value!;
      },
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Please Enter Password");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Password(Min 6 character)");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
      ),
    );
    //--------------------------------Confirm Password
    final confirmpassword = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: confirmpasswordController,
      onSaved: (value) {
        confirmpasswordController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
      ),
      validator: (value) {
        if (confirmpasswordController.text != passwordController.text) {
          return "Password dont Match";
        }
        return null;
      },
    );
    //--------------------------------Phone Number
    final phonenumber = Row(
      children: [
        CountryCodePicker(
          closeIcon: Icon(Icons.arrow_drop_down),
          initialSelection: 'PK',
          favorite: const ['PK', '+92'],
          showCountryOnly: true,
        ),
        Expanded(
          child: TextFormField(
            validator: (value) {
              RegExp regex = RegExp(r'^.{10,}$');
              if (value!.isEmpty) {
                return ("Please Enter your number");
              }
              if (!regex.hasMatch(value)) {
                return ("Please Enter a valid number");
              }
              return null;
            },
            autofocus: false,
            controller: numberController,
            onSaved: (value) {
              numberController.text = value!;
            },
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Phone number',
            ),
          ),
        ),
      ],
    );
    //--------------------------------Province
    final countryProvinceCity = SelectState(
      onCountryChanged: (value) {
        setState(() {
          countryValue = value;
        });
      },
      onStateChanged: (value) {
        setState(() {
          stateValue = value;
        });
      },
      onCityChanged: (value) {
        setState(() {
          cityValue = value;
        });
      },
    );
    //--------------------------------Button
    final signinbutton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.purple,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          // Get.to(BottomBar());
          signUp(emailController.text, passwordController.text);
        },
        child: const Text(
          "Sign Up",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    //--------------------------------Blood Group
    final bloodgroup = DropdownButtonFormField<String>(
      value: _blood,
      isExpanded: true,
      items: <String>[
        "A RhD positive (A+)",
        'A RhD negative (A-)',
        'B RhD positive (B+)',
        'B RhD negative (B-)',
        'O RhD positive (O+)',
        'O RhD negative (O-)',
        'AB RhD positive (AB+)',
        'AB RhD negative (AB-)',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      hint: Text(
        'Select your blood group',
      ),
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() => _blood = newValue);
        }
      },
      validator: (value) =>
          value == null ? 'Please select your Blood Group' : null,
    );
    //--------------------------------Gender
    final gender = DropdownButtonFormField<String>(
      isExpanded: true,
      value: _gender,
      items: <String>[
        'Male',
        'Female',
        'Prefer not to say',
      ].map<DropdownMenuItem<String>>((String caseOf) {
        return DropdownMenuItem<String>(
          value: caseOf,
          child: Text(caseOf),
        );
      }).toList(),
      hint: const Text(
        "Select your Gender",
      ),
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() => _gender = newValue);
        }
      },
      validator: (value) => value == null ? 'Please select your Gender' : null,
    );
    // --------------------------------Already have an account
    final alreadyhaveaccount = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an account?'),
        GestureDetector(
          onTap: () => Get.to(
            Sign_In(),
          ),
          child: const Text(
            " Login",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30),
                Text(
                  'Your Credentials',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  'Please fill the following fields',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                fullnamefeild,
                SizedBox(height: 5),
                usernamefeild,
                SizedBox(height: 5),
                emailfeild,
                SizedBox(height: 5),
                passwordfeild,
                SizedBox(height: 5),
                confirmpassword,
                // SizedBox(height: 5),
                // phonenumber,
                SizedBox(height: 5),
                countryProvinceCity,
                // SizedBox(height: 15),
                bloodgroup,
                gender,
                const SizedBox(height: 20),
                signinbutton,
                const SizedBox(height: 15),
                alreadyhaveaccount,
              ],
            ),
          ),
        ),
      ),
    );
  }

  signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((uid) => {postDetailsToFirebase()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  //postDetailsToFirebase
  postDetailsToFirebase() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    userModel.firstName = firstnameController.text;
    userModel.lastName = lastnameController.text;
    userModel.email = user!.email;
    userModel.uid = user.uid;

    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(userModel.tomap());
    Fluttertoast.showToast(
      msg: "Account created successfully :)",
    );
    Get.to(() => Sign_In());
  }

  String validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return validateMobile(value);
  }
}
