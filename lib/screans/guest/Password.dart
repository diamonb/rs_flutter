import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {
  final Function(int) onChangeStep;
  const PasswordScreen({Key? key, required this.onChangeStep}) : super(key: key);

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

  class _PasswordScreenState extends State<PasswordScreen>{
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isSecret = true;

  @override
  void dispose(){
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        elevation: 0,
        backgroundColor:Theme.of(context).scaffoldBackgroundColor,
        leading:
        IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: (){
            return widget.onChangeStep(0);
          }),
      ),
      body: Center(child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Text('password'.toUpperCase(), style: TextStyle(fontSize: 20)),
            SizedBox(height: 50),

            Form(
                key: _formKey,
                child: Column(children: [
                Text('saisir le mot de passe'),
                SizedBox(height: 10),
                TextFormField(
                controller: passwordController,
                obscureText: _isSecret,
                validator: (value){
                  if(value ==null || value.isEmpty){
                    return 'Entrer un mot de passe';
                  } else if(value.length<6)
                  {
                    return 'Le mot de passse doit avoir plus de 5 caractères';
                  }
                    return null;

                },
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap:()=>setState(() {
                      _isSecret = !_isSecret;
                    }),
                    child: Icon(!_isSecret?Icons.visibility: Icons.visibility_off),
                  ),
                hintText: 'Ex: xy22lom!!',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)
                ),
              ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    print(passwordController.value.text);
                  }
                },
                  child: Text('continuer'.toUpperCase())),
            ],))
          ],
        ),
      )),

    ));
  }
}
