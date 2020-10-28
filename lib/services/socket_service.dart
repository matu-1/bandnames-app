import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus {
  connecting,
  offline,
  online,
}

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.connecting;
  IO.Socket _socket;

  ServerStatus get serverStatus => _serverStatus;
  IO.Socket get socket => _socket;

  SocketService() {
    initConfig();
  }

  void initConfig() {
    _socket = IO.io('http://192.168.0.10:3000', {
      'transports': ['websocket'],
      'autoConnect': true,
    });
    _socket.on('connect', (_) {
      _serverStatus = ServerStatus.online;
      notifyListeners();
    });
    _socket.on('disconnect', (_) {
      notifyListeners();
      _serverStatus = ServerStatus.offline;
    });
    _socket.on('nuevo-mensaje', (payload) {
      print(payload);
    });
  }
}
