import 'package:dating_app/presentation/journey/login_screen.dart/view_model.dart/login_viewmodel.dart';
import 'package:dating_app/presentation/journey/splash_screen/view_model/app_state_viewmodel.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final AppStateViewModel appStateViewModel;
  const LoginScreen({Key? key,required this.appStateViewModel}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 late LoginViewModel viewModel ;
  TextEditingController userName = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel=LoginViewModel(widget.appStateViewModel);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: userName,
          ),
          TextFormField(
            controller: pass,
          ),
          GestureDetector(
            onTap: (){
              viewModel.login(userName.text, pass.text);
            },
            child: Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
