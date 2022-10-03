import 'package:flutter/material.dart';
import 'package:flutter_app/pages/auth/login/login_provider.dart';
import 'package:provider/provider.dart';

Widget field() {
  return ChangeNotifierProvider<LoginProvider>(
      create: (context) => LoginProvider(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Consumer<LoginProvider>(
          builder: ((context, value, child) => Column(
                children: [
                  TextField(
                    controller: value.usernameCtrl,
                    decoration: InputDecoration(
                      //icon: Icon(Icons.email),
                      suffixIcon: value.usernameCtrl.text.isEmpty
                          ? Container(
                              width: 3,
                            )
                          : IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {},
                            ),
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ));
}
