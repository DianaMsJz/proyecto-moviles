import 'package:flutter/material.dart';
import 'package:proyecto_moviles/src/models/response_api.dart';
import 'package:proyecto_moviles/src/models/user.dart';
import 'package:proyecto_moviles/src/provider/users_provider.dart';
import 'package:proyecto_moviles/src/utils/my_snackbar.dart';

class RegisterController {
  BuildContext context;

  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  UsersProvider usersProvider = new UsersProvider();

  Future init(BuildContext context) {
    //future para poder utilizar await
    this.context = context;
    usersProvider.init(context);
  }

  void register() async {
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastname = lastnameController.text;
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    //validar que no haya campos vacíos
    if (email.isEmpty ||
        name.isEmpty ||
        lastname.isEmpty ||
        phone.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      MySnackbar.show(context, 'Debes ingresar todos los campos');
      return;
    }
    //validar que el password coincida
    if (confirmPassword != password) {
      MySnackbar.show(context, 'Las contraseñas no coinciden');
      return;
    }
    if (password.length < 6) {
      MySnackbar.show(
          context, 'Las contraseña debe tener al menos 6 caracteres');
      return;
    }
    User user = new User(
        email: email,
        name: name,
        lastname: lastname,
        phone: phone,
        password: password);

    ResponseApi responseApi = await usersProvider.create(
        user); //se espera la respuesta al mandar la petición para crear un usuario

    MySnackbar.show(
        context,
        responseApi
            .message); //este mensaje de ok si se cumplen las validaciones

    if (responseApi.success) {
      Future.delayed(Duration(seconds: 3), () {
        //espera 3 segundos para ejecutar el método
        Navigator.pushReplacementNamed(context, 'login');
      });
    }

    print('RESPUESTA: ${responseApi.toJson()}');
  }

  void back() {
    Navigator.pop(context);
  }
}
