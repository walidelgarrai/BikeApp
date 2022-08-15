import 'package:bike/auth/login.dart';
import 'package:bike/model/user_model.dart';
import 'package:bike/screens/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';  

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _auth = FirebaseAuth.instance;
  bool checked = false;
  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final nameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
      keyboardType: TextInputType.name,
      autofocus: false,
      controller: nameEditingController,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Veuillez saisir un nom");
        }
        if (!regex.hasMatch(value)) {
          return ("Veuillez saisir un nom valide > 3");
        }
      },
      onSaved: (value) {
        nameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle_sharp),
        hintText: "Nom complet",
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
        ),
      ),
    );

    final emailField  = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: emailEditingController,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Veuillez saisir votre email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
            .hasMatch(value)) {
          return ("Adresse email non valide");
        }
        return null;
      },
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        hintText: "Email",
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
        ),
      ),
    );

    final passwordField  = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Veuillez saisir un mot de passe");
        }
        if (!regex.hasMatch(value)) {
          return ("Veuillez saisir un mot de passe valide");
        }
      },
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key_rounded),
        hintText: "Mot de passe",
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
        ),
      ),
    );

    final confirmPasswordField  = TextFormField(
      autofocus: false,
      controller: confirmPasswordEditingController,
      obscureText: true,
      validator: (value) {
        if (confirmPasswordEditingController.text !=
            passwordEditingController.text) {
          return "Password don't match";
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key_rounded),
        hintText: "Confirmer le mot de passe",
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
        ),
      ),
    );

    final signUpButton = Material(
      elevation: 5,
      color: Colors.indigoAccent,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signUp(emailEditingController.text, passwordEditingController.text);
          },
          child: Text(
            "SignUp",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.indigoAccent),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        child: Lottie.network('https://assets5.lottiefiles.com/packages/lf20_1qsofnf5.json'),

                        /*child: Image.asset(
                          "assets/logo.png",
                          fit: BoxFit.contain,
                        ),*/),
                    SizedBox(height: 45),
                    nameField,
                    SizedBox(height: 20),
                    emailField,
                    SizedBox(height: 20),
                    passwordField,
                    SizedBox(height: 20),
                    confirmPasswordField,
                    SizedBox(height: 20),
                    signUpButton,
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  void signUp(String email, String password) async
  {
    if (_formKey.currentState!.validate())
      {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {
              postDetailsToFirestore()
            }).catchError((e){
          Fluttertoast.showToast(msg: e!.message);
        });

      }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = nameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());

    Fluttertoast.showToast(msg: "Account created successfully :) ");
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false);

  }

}

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(width:  size.width *0.8,
        child: Row(
          children: const <Widget>[
            Expanded(
              child: Divider(
              color: Colors.indigoAccent,
            ),),
          ],
        ),
    );
  }
}

