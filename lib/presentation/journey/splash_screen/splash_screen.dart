import 'package:dating_app/presentation/journey/login_screen.dart/login_screen.dart';
import 'package:dating_app/presentation/journey/splash_screen/view_model/app_state_viewmodel.dart';
import 'package:dating_app/presentation/journey/tabbar/tabbar_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AppStateViewModel stateViewModel = AppStateViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stateViewModel.getAccessToken();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    stateViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<String>(
          stream: stateViewModel.accessToken.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _view(context, snapshot.data ?? '');
            }
            return Container(
              color: Colors.white,
            );
          }),
    );
  }

  Widget _view(BuildContext context, String token) {
    if (token.isNotEmpty) {
      return TabbarScreen();
    } else {
      return LoginScreen(appStateViewModel: stateViewModel,);
    }
  }
}
