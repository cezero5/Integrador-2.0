import 'package:flutter/material.dart';

import 'package:formvalidation/src/bloc/provider.dart';
import 'package:formvalidation/src/pages/cart_page.dart';
import 'package:formvalidation/src/pages/detalle_page.dart';
import 'package:formvalidation/src/pages/forgotpassword_page.dart';
import 'package:formvalidation/src/pages/garage_page.dart';
import 'package:formvalidation/src/pages/hoja_vida_vehic_page.dart';

import 'package:formvalidation/src/pages/home_page.dart';
import 'package:formvalidation/src/pages/login_page.dart';
import 'package:formvalidation/src/pages/mis_vehiculos_page.dart';
import 'package:formvalidation/src/pages/producto_page.dart';
import 'package:formvalidation/src/pages/registro_page.dart';
import 'package:formvalidation/src/pages/tab_control_page.dart';
import 'package:formvalidation/src/preferencias_usuario/preferencias_usuario.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    print(prefs.token);

    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'registro': (BuildContext context) => RegistroPage(),
          'home': (BuildContext context) => HomePage(),
          'producto': (BuildContext context) => ProductoPage(),
          'detalle': (BuildContext context) => PageDetalle(),
          'cart': (BuildContext context) => CartPage(),
          'forgotpassword': (BuildContext context) => ForgotPage(),
          'garagepage': (BuildContext context) => GaragePage(),
          'tabcontrol': (BuildContext context) => TableroControl(),
          'misvehiculos': (BuildContext context) => MisVehiculos(),
          'hojavidavehi': (BuildContext context) => HojavidaVehi(),
        },
        theme: ThemeData(
          primaryColor: Colors.grey[700],
        ),
      ),
    );
  }
}
