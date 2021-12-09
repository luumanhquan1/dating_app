import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Constant/shared_preferences_keys.dart';
import 'package:dating_app/common/BusinessLayer/DataAccess/Http/Core/Evn/env.dart';
import 'package:dating_app/common/helper/user_share_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

typedef dynamic EventHandler<T>(T data);

class SocketClient {
   IO.Socket? socket;

  Future<void> connect() async {
    final token= await UserDefault().getString(SharedPreferencesKeys.AUTH_TOKEN);
    socket = IO.io(
        Env.data.apiUrlSocket,
        OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
            .setExtraHeaders({'token': token}) // optional
            .build());
    socket?.connect();
  }
  void on(String event, EventHandler handler) {
    socket?.on(event, handler);
  }
  void emit(String event,dynamic data){
     socket?.emit(event,data);
  }
}
