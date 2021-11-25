//manejará la parte lógica de la pantalla
import 'package:flutter/material.dart';

class LoginController {
  BuildContext context; //
  TextEditingController emailController =
      new TextEditingController(); //Cuando el usuario escribe el textfield se actualiza y el controlador notifica a los listeners
  TextEditingController passwordController = new TextEditingController();

  Future init(context) {
    //constructor, inicializa la clase
    this.context = context;
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context, 'register');
  }

  void login() {
    String email = emailController.text
        .trim(); // se captura el email de lo escrito en el textfield
    //Trim elimina espacios en blanco
    String password = passwordController.text.trim();
  }
}
