import 'package:flutter/material.dart';

class TermScreen extends StatefulWidget {
  final Function(int) onChangeStep;
  const TermScreen({Key? key, required this.onChangeStep}) : super(key: key);
    @override
  _TermScreenState createState() => _TermScreenState();
}
  class _TermScreenState extends State<TermScreen>{
  bool _termlu = false;
  late ScrollController _scrollController;


  @override
  void initState(){
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if(_scrollController.offset>=_scrollController.position.maxScrollExtent
          && !_scrollController.position.outOfRange)
      {
        setState(() {
          _termlu=true;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        elevation: 0,
        backgroundColor:Theme.of(context).scaffoldBackgroundColor,
        title: Text('Terms et Conditions',style: TextStyle(color: Colors.black),),
        leading:
        IconButton(
          icon: Icon(Icons.arrow_back),
        color: Colors.black,
        onPressed: ()=> widget.onChangeStep(0)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         Expanded(
           child: SingleChildScrollView(
             controller: _scrollController,
               child: 
               Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                   children: [Text('But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, \n \nand expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences,\n or one who avoids a pain that produces no resultant pleasure\n Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n \n Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n \n Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')])),
         ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: !_termlu ? null : ()=> widget.onChangeStep(2),
              child: Text('accepter et continuer'.toUpperCase()))
        ],
      )
    )
    );
  }
}
