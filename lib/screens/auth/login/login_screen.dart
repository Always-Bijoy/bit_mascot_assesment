import 'package:erp/custom_widgets/custom_buttom.dart';
import 'package:erp/screens/auth/login/login_provider.dart';
import 'package:erp/screens/home/home_screen.dart';
import 'package:erp/utils/nav_utail.dart';
import 'package:erp/utils/res.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: Scaffold(
        body: Consumer<LoginProvider>(builder: (context, loginProvider, _) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: loginProvider.formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //szH30(),
                          SizedBox(
                            width: double.infinity,
                            height: 200,
                            // color: Colors.red,
                            child: Image.asset(
                              "assets/bit.jpeg",
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Hey, good to see you again",
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 20,
                                color: AppColors.colorPrimary),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (val) =>
                                val!.isEmpty ? "Email can't be empty" : null,
                            controller:
                                loginProvider.emailOrPhoneTextController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (val) =>
                            val!.isEmpty ? "Password can't be empty" : null,
                            controller: loginProvider.passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText:
                                !context.read<LoginProvider>().passwordVisible,
                            decoration: InputDecoration(
                              labelText: "Password",
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              // Here is key idea
                              suffixIcon: IconButton(
                                icon: Icon(
                                  context.watch<LoginProvider>().passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: AppColors.colorPrimary,
                                ),
                                onPressed: () {
                                  context
                                      .read<LoginProvider>()
                                      .passwordVisibility();
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            title: "Login",
                            clickButton: () {
                              if (loginProvider.formKey.currentState!
                                  .validate()) {
                                NavUtil.navigateScreen(
                                    context, const HomeScreen());
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
