//manejará la parte lógica de la pantalla
import 'package:flutter/material.dart';
import 'package:proyecto_moviles/src/models/user.dart';
import 'package:proyecto_moviles/src/provider/users_provider.dart';
import 'package:proyecto_moviles/src/models/response_api.dart';
import 'package:proyecto_moviles/src/utils/my_snackbar.dart';
import 'package:proyecto_moviles/src/utils/shared_pref.dart';

class LoginController {
  BuildContext context; //
  //Cuando el usuario escribe el textfield se actualiza y el controlador notifica a los listeners
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  UsersProvider usersProvider = new UsersProvider();
  SharedPref _sharedPref = new SharedPref();

  Future init(BuildContext context) async {
    //constructor, inicializa la clase
    this.context = context;
    await usersProvider.init(context);
    User user = User.fromJson(await _sharedPref.read('user') ?? {});

    if (user?.sessionToken != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, 'client/products/list', (route) => false);
    }
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context, 'register');
  }

  void login() async {
    // se captura el email de lo escrito en el textfield
    String email = emailController.text.trim();
    //Trim elimina espacios en blanco
    String password = passwordController.text.trim();
    ResponseApi responseApi = await usersProvider.login(email, password);

    print('Respuesta object: ${responseApi}');
    print('Respuesta: ${responseApi.toJson()}');
    //si no hubo fallos en el login

    if (responseApi.success) {
      User user = User.fromJson(responseApi.data); //obteniendo el usuario
      // se almacena el usuario, 'user' = key
      _sharedPref.save('user', user.toJson());
      //pushNamedAndRemoveUntil: viaja a la pantalla y elimina el historial de pantallas
      Navigator.pushNamedAndRemoveUntil(
          context, 'client/products/list', (route) => false);
    } else {
      MySnackbar.show(context, responseApi.message);
    }
  }
}
