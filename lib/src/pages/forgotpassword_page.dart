import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/login_bloc.dart';

class ForgotPage extends StatefulWidget {
  ForgotPage({Key key}) : super(key: key);

  @override
  _ForgotPageState createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = new LoginBloc();
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Forgotten password', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            children: <Widget>[
              Text(
                  'Para iniciar el proceso de restablecimiento de'
                  'contraseña para su cuenta, por favor '
                  'ingrese su correo electronico',
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              StreamBuilder(
                stream: bloc.emailStream,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              icon: Icon(Icons.alternate_email,
                                  color: Colors.grey[700]),
                              hintText: 'ejemplo@correo.com',
                              labelText: 'Correo electrónico',
                              counterText: snapshot.data,
                              errorText: snapshot.error),
                          onChanged: bloc.changeEmail,
                        ),
                        SizedBox(height: 15),
                        RaisedButton(
                          color: Colors.grey[700],
                          onPressed: () => _resetPassword(),
                          child: Text('Reset password',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _resetPassword() {}
}
