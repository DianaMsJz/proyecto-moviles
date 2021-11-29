//manejará la parte lógica de la pantalla
import 'package:flutter/material.dart';
import 'package:proyecto_moviles/src/provider/users_provider.dart';
import 'package:proyecto_moviles/src/models/response_api.dart';
import 'package:proyecto_moviles/src/utils/my_snackbar.dart';

class LoginController {
  BuildContext context; //
  TextEditingController emailController = new TextEditingController(); //Cuando el usuario escribe el textfield se actualiza y el controlador notifica a los listeners
  TextEditingController passwordController = new TextEditingController();

  UsersProvider  usersProvider = new UsersProvider();
  

  Future init(BuildContext context) async {
    //constructor, inicializa la clase
    this.context = context;
    await usersProvider.init(context);
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context, 'register');
  }

  void login() async {
    String email = emailController.text.trim(); // se captura el email de lo escrito en el textfield
    //Trim elimina espacios en blanco
    String password = passwordController.text.trim();
    ResponseApi responseApi = await usersProvider.login(email, password);
    MySnackbar.show(context, responseApi.message);

  }

}
