import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:proyecto_moviles/src/pages/client/products/list/client_products_list_controller.dart';

class ClientProductsListPage extends StatefulWidget {
  ClientProductsListPage({Key key}) : super(key: key);

  @override
  _ClientProductsListPageState createState() => _ClientProductsListPageState();
}

class _ClientProductsListPageState extends State<ClientProductsListPage> {
  ClientProductsListController _con = new ClientProductsListController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _con.logout,
          child: Text('Cerrar sesión'),
        ),
      ),
    );
  }
}
