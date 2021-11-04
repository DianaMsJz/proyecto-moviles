//manejará la parte lógica de la pantalla
import 'package:flutter/material.dart';

class LoginController {
  BuildContext context; //

  Future init(context) {
    //constructor, inicializa la clase
    this.context = context;
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context, 'register');
  }
}
