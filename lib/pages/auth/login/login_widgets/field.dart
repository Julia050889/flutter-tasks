import 'package:flutter/material.dart';
import 'package:flutter_app/pages/auth/login/login_provider.dart';
import 'package:provider/provider.dart';

Widget field() {
  return Consumer<LoginProvider>(
      builder: ((context, value, child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextField(
                focusNode: value.node,
                //autofocus: true,
                controller: value.usernameCtrl,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  //icon: Icon(Icons.email),
                  suffixIcon: value.usernameCtrl.text.isEmpty
                      ? Container(
                          width: 0,
                        )
                      : IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            value.onClearEmail();
                          },
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
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              )
            ],
          ))));
}
