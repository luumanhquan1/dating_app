import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Constant/shared_preferences_keys.dart';
import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Di/di.dart';
import 'package:dating_app/common/BusinessLayer/DataAccess/Http/socket_client.dart';
import 'package:dating_app/common/helper/user_share_preferences.dart';
import 'package:dating_app/presentation/journey/splash_screen/view_model/app_state_viewmodel.dart';
import 'package:flutter/material.dart';
class AccountScreen extends StatefulWidget {
  final AppStateViewModel appStateViewModel;
  const AccountScreen({Key? key,required this.appStateViewModel}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final socketClient=getIt<SocketClient>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: GestureDetector(
          onTap: () async {
           await UserDefault().setString(SharedPreferencesKeys.AUTH_TOKEN, '');
           socketClient.disconnect();

           getIt.resetLazySingleton<SocketClient>();
            widget.appStateViewModel.accessToken.sink.add('');
          },
          child: Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
