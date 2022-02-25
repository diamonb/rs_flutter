

import 'package:flutter/cupertino.dart';
import 'package:projetrs/screans/guest/Auth.dart';
import 'package:projetrs/screans/guest/Password.dart';
import 'package:projetrs/screans/guest/Term.dart';
import 'package:projetrs/services/UserService.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({Key? key}) : super(key: key);

  @override
  _GuestScreenState createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  UserService _userService = UserService();
  List<Widget> _widgets = [];
  int _indexSelected =0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _widgets.addAll([
      AuthScreen(onChangeStep: (index)=> setState(()=>_indexSelected=index)),
      TermScreen(onChangeStep: (index)=> setState(()=>_indexSelected=index)),
      PasswordScreen(onChangeStep: (index)=> setState(()=>_indexSelected=index)),
    ]);
    _userService.auth();
  }
  @override
  Widget build(BuildContext context) {
    return _widgets.elementAt(_indexSelected);
  }
}
