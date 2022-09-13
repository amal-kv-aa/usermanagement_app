import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_mgt/services/firebase_auth_methods.dart';

class SignupEmail extends StatelessWidget {
  SignupEmail({Key? key,required this.title}) : super(key: key);
 final String title;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: AppBar(backgroundColor: Colors.transparent,),
        body: Center(
          child: Container(
             decoration:const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/0472bbf118d91e3660bbbf905089a124.jpg'),fit: BoxFit.cover)),
            //height: size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // loggedIn == false
                //?
                Text(title,style:const TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize: 30),),
                Form(
                    child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(children: <Widget>[
                    TextFormField(
                      style:const TextStyle(color: Colors.white),
                      autocorrect: false,
                      controller: emailController,
                      decoration: InputDecoration(
                          labelText: "Email:",
                          fillColor:const Color.fromARGB(255, 92, 41, 45).withOpacity(0.4),
                          filled: true,
                          labelStyle:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                          
                          border: OutlineInputBorder(
                            
                              borderRadius: BorderRadius.circular(20)),),
                      validator: (str) =>
                          str!.contains('@.com') ? "Not a Valid Email!" : null,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    TextFormField(
                      style:const TextStyle(color: Colors.white),
                      autocorrect: false,
                      controller: passwordController,
                      decoration: InputDecoration(
                        fillColor:const Color.fromARGB(255, 92, 41, 45).withOpacity(0.4),
                        filled: true,
                          labelText: "Password:",
                            labelStyle:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      validator: (str) {
                        return null;
                      },
                    ),
                  ]),
                )),
                ElevatedButton(
                  onPressed: () {
                    if(title == 'Login'){
                       validateUser(context);
                    }
                    else{
                      signUpUser(context);
                    }
                    
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ));
  }

  void signUpUser(BuildContext context)  async{
    FirebaseAuthMethodes(FirebaseAuth.instance).signupUsingEmail(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        context: context);
  }
  void validateUser(BuildContext context)async{
 await   FirebaseAuthMethodes(FirebaseAuth.instance).loginWithEmail(email: emailController.text.trim(), password: passwordController.text.trim(), context: context);
  }
}
