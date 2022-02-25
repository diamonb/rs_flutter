import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  final Function(int) onChangeStep;
  const AuthScreen({Key? key,
    required this.onChangeStep,
  }) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final emailController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
              child:SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: (
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RichText(text:
                      TextSpan(
                          text: 'Everyone has\n'.toUpperCase(),
                            style: TextStyle(color: Colors.black, fontSize: 30.0),
                            children: [
                            TextSpan( text: 'knowlege\n'.toUpperCase(),
                            style:
                            TextStyle(
                                color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                            ),
                            TextSpan( text: 'to share\n'.toUpperCase()),
                          ],
                        )
                      ),
                      Text('It all start here',style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                      SizedBox(height: 50.0),
                      Form(
                          key: _formKey,
                          child: Column(
                          children: [
                          Text('Entrez votre email'),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: emailController,
                            validator: (value){
                              if((value == null || value.isEmpty) || !emailRegex.hasMatch(value) ){
                                return 'Email non valide';
                              }else{
                                return null;
                              }
                              },
                            decoration: InputDecoration(
                              hintText: 'Ex: sasukewilli@gmail.com',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                                borderSide: BorderSide(color: Colors.grey)
                              ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                                borderSide: BorderSide(color: Colors.grey)
                            )
                          ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                              onPressed: () {
                              if(_formKey.currentState!.validate()){
                                widget.onChangeStep(1);
                              }
                              },
                              child: Text('continuer'.toUpperCase()))
                        ],
                      ))
                    ],
                  )
                ),
              ),
          ),
        ),
    );
  }
}
