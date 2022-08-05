import 'package:bike/auth/login.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              //
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Bienvenue",style: TextStyle(
                        fontWeight: FontWeight.bold,
                      fontSize: 30
                    ),),
                    SizedBox(height: 20,),
                    Text("Trouvez votre vélo idéal et découvrez la plus grande collection de pistes cyclables au monde.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15,
                    ),),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bike.png')
                    ),
                  ),
                ),
                SizedBox(height: 150,),
                Column(
                  children: <Widget>[
                    MaterialButton(
                      minWidth: double.infinity,
                        onPressed:  () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                        },
                      height: 60,
                      color: Colors.indigoAccent,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text("Démarrer",style: TextStyle(
                        fontWeight: FontWeight.w600,
                          fontSize: 18,
                        color: Colors.white,
                      ),),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Column(
                  children: <Widget>[
                    Text("www.bike.com")
                  ],
                )
              ],
            ),
          )),
    );
  }
}
