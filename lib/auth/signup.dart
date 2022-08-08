import 'package:bike/auth/login.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
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
      obscureText: true,
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
      obscureText: true,
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

    final registrationButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.indigoAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {

          },
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            "Accepter et continue",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.white,),
          )),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text("Inscription", style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
                SizedBox(height: 20,),
                Text("Rejoignez bike dès aujourd'hui.",style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[700],
                ),),
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30,),
                  nameField,
                  SizedBox(height: 30,),
                  emailField,
                  SizedBox(height: 30,),
                  passwordField,
                  SizedBox(height: 30,),
                  confirmPasswordField,
                  SizedBox(height: 30,),
                  CheckboxListTile(
                    title: Text("J'accepte les condition d'utilisation et la politique de confidentialité",style: TextStyle(
                      fontSize: 11,
                    ),),
                    value: checked, onChanged: (bool? value) {  },
                  ),
                  SizedBox(height: 30,),
                  registrationButton,
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Vous avez déjà un compte ? "),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                        },
                        child: Text(
                          "Se connecter",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15,color: Colors.indigoAccent
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),

            ),
            SizedBox(height: 10,),
            OrDivider(),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(border: Border.all(
                    width: 2,
                    color: Colors.white
                  ),shape: BoxShape.circle),
                  child: Image.asset('assets/images/facebook.png'),
                ),
                Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(border: Border.all(
                      width: 2,
                      color: Colors.white
                  ),shape: BoxShape.circle),
                  child: Image.asset('assets/images/gmail.png'),
                ),

                Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(border: Border.all(
                      width: 2,
                      color: Colors.white
                  ),shape: BoxShape.circle),
                  child: Image.asset('assets/images/phone.png'),
                ),

              ],
            )
            /*Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/login.png')
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
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

