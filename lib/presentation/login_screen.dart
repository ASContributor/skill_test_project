import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_test_project/business/authBloc/auth_bloc.dart';

import '../data/repo/login_repo.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController ApiTokenController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          color: Colors.green[500],
        ),
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.8,
            color: const Color.fromARGB(185, 255, 255, 255),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 5),
              child: Form(
                key: _FormKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                            fontStyle: FontStyle.normal),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          label: Text('Enter Email'),
                          border: OutlineInputBorder(gapPadding: 1),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email Required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: ApiTokenController,
                        decoration: const InputDecoration(
                          label: Text('Enter Auth Token'),
                          border: OutlineInputBorder(gapPadding: 1),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Token Required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_FormKey.currentState!.validate()) {
                            String Token = await LoginRepo().getToken(
                                emailController.text, ApiTokenController.text);

                            if (Token.isNotEmpty ||
                                Token != 'Unable to login') {
                              BlocProvider.of<AuthBloc>(context)
                                  .add(LoadToken(Token));
                              Navigator.pushNamed(context, 'landingpage/');
                            } else {
                              print('API NOT working');
                            }
                          }
                        },
                        child: const Text('login'),
                      )
                    ]),
              ),
            )),
          ),
        )
      ]),
    );
  }
}
