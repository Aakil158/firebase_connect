import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

//controllers
final _emailController = TextEditingController();
final _passwordController = TextEditingController();

//Sign in

Future signIn() async{
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _emailController.text.trim(), 
    password: _passwordController.text.trim(),
    );
}

@override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 245, 229),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 219, 181),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5,
                )
              ]
            ),
            child: Column(
              children: [
                Icon(Icons.account_circle_rounded,
                color: const Color.fromARGB(255, 96, 63, 38),
                size: 140,
                ),
              Text('HEY! THERE',style: TextStyle(
                color:  const Color.fromARGB(255, 96, 63, 38),
                fontSize: 36,
                fontWeight: FontWeight.w700,
                ),),
                SizedBox(height: 15,),
                Text('Welcome Again to the Login',style: TextStyle(
                color:  const Color.fromARGB(255, 108, 78, 49),
                fontSize: 18,
                fontWeight: FontWeight.w300,
                ),),
            
                // E-Mail
                
                 Padding(
                   padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                   child: TextFormField(
                    controller: _emailController,
                    cursorColor: Color.fromARGB(255, 96, 63, 38),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 245, 229),
                        labelText: 'E-Mail',
                        labelStyle: TextStyle(
                          color: const Color.fromARGB(255, 96, 63, 38),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: const Color.fromARGB(255, 108, 78, 49)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: const Color.fromARGB(255, 108, 78, 49)),
                        ),
                      ),
                    ),
                 ),
            
                SizedBox(height: 10,),
                 
                //Password
            
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextFormField(
                    controller: _passwordController,
                    cursorColor: Color.fromARGB(255, 101, 69, 32),
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 245, 229),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: const Color.fromARGB(255, 96, 63, 38),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: const Color.fromARGB(255, 108, 78, 49)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: const Color.fromARGB(255, 108, 78, 49)),
                        ),
                      ),
                    ),
                ),
      
                //login button 
      
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      height: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 101, 69, 32),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        'Login',style: TextStyle(
                          color: Color.fromARGB(255, 255, 245, 229),
                          fontSize: 20
                        ),
                      ),
                    ),
                  )
                  ),
      
                  //Register button 
                  SizedBox(height: 5,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Not a User? '),
                      Text('Register Now!',style: TextStyle(
                        color: Colors.blue
                      ),),
                    ],
                  )
            ],),          
      
          ),
      
        ),
      ),
    );
  }
}