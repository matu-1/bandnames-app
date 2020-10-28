import 'package:bandnames/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {
  static final routeName = 'status';

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      body: Center(
        child: Text('status: ${socketService.serverStatus}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          socketService.socket.emit('nuevo-mensaje',
              {'nombre': 'FLutter', 'message': 'Desde flutter app'});
        },
        child: Icon(Icons.message_sharp),
      ),
    );
  }
}
