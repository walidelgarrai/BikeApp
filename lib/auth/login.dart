import 'package:bike/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:bike/auth/signup.dart';
import 'package:bike/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();


  // firebase
  final _auth = FirebaseAuth.instance;

  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  final RoundedLoadingButtonController googleController =
  RoundedLoadingButtonController();
  final RoundedLoadingButtonController facebookController =
  RoundedLoadingButtonController();
  final RoundedLoadingButtonController twitterController =
  RoundedLoadingButtonController();
  final RoundedLoadingButtonController phoneController =
  RoundedLoadingButtonController();


  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
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
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      // decoration
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
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
    //password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
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
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
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
    final loginButton = Material(
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
            signIn(emailController.text, passwordController.text);
          },
          child: Text(
            "Se connecter",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),

          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
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
                        child: Image.asset(
                          "assets/images/login.png",
                          fit: BoxFit.contain,
                        )),
                    SizedBox(height: 15),
                    emailField,
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 35),
                    loginButton,
                    SizedBox(height: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Rejoignez dès aujourd'hui! "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RegistrationPage()));
                            },
                            child: Text(
                              "Créer un compte",
                              style: TextStyle(
                                  color: Colors.indigoAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ]),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedLoadingButton(
                          width: MediaQuery.of(context).size.width * 0.80,
                          elevation: 0,
                          borderRadius: 25,
                          color: Colors.red,
                          onPressed: (){},
                            controller: googleController,
                            successColor: Colors.red,
                          child: Wrap(
                            children: const[
                              Icon(
                                FontAwesomeIcons.google,
                                size: 20,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text("Sign in with Google",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                            ),
                        SizedBox(
                          height: 10,
                        ),
                        // facebook login button
                        RoundedLoadingButton(
                          onPressed: () {
                          },
                          controller: facebookController,
                          successColor: Colors.blue,
                          width: MediaQuery.of(context).size.width * 0.80,
                          elevation: 0,
                          borderRadius: 25,
                          color: Colors.blue,
                          child: Wrap(
                            children: const [
                              Icon(
                                FontAwesomeIcons.facebook,
                                size: 20,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text("Sign in with Facebook",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],

                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // login function
  void signIn(String email, String password) async
  {
    if (_formKey.currentState!.validate())
      {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
          Fluttertoast.showToast(msg: "Bienvenue"),
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage())),
        }).catchError((e){
          Fluttertoast.showToast(msg: e!.message);
        });
      }
  }
}

