import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/layout/social_layout.dart';
import 'package:souq/modules/social_Register/cubit/Cubit.dart';
import 'package:souq/modules/social_Register/cubit/States.dart';
import 'package:souq/shared/components/components.dart';
import 'package:souq/shared/network/local/casheHelper.dart';

import '../../shared/components/constens.dart';
import '../../shared/components/constens.dart';

class SocialRegisterScrean extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialRegisterCubit(),
      child: BlocConsumer<SocialRegisterCubit, SocialRegisterStates>(
        listener: (context, state) {
          if(state is SocialCreateUserSucseslState ){
            navigateTo(context, SocialLayout());
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,

            appBar: AppBar(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
              elevation: 0.0,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(image: AssetImage('assets/images/logo.jpeg')),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'انشاء مستخدم'.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(color: Colors.black),
                        ),
                        Text(
                          'سجل الان لترى العروض الخاصه بنا',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        defultFormField(
                          type: TextInputType.name,
                          controller: nameController,
                          label: 'الاسم',
                          prefix: Icons.person,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'name must not be empty';
                            }
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        defultFormField(
                          type: TextInputType.phone,
                          controller: phoneController,
                          label: 'رقم الهاتف',
                          prefix: Icons.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'phone must not be empty';
                            }
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        defultFormField(
                            type: TextInputType.visiblePassword,
                            controller: passwordController,
                            label: 'كلمه السر',
                            suffix: SocialRegisterCubit.get(context).suffix,
                            isPassword:
                                SocialRegisterCubit.get(context).isPassword,
                            passwordShow: () {
                              SocialRegisterCubit.get(context)
                                  .ChangePasswordVisibilty();
                            },
                            prefix: Icons.lock_outline,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password must not be empty';
                              }
                            }),
                        SizedBox(
                          height: 30,
                        ),
                        BuildCondition(
                          condition: state is! SocialRegisterLodingState,
                          builder: (context) => defultButton(
                            text: 'انشاء حساب',
                            isUpperCase: true,
                            function: () {

                              if (formkey.currentState!.validate()) {
                                SocialRegisterCubit.get(context).userRegister(
                                    password: passwordController.text,
                                    name: nameController.text,
                                    phone: '${phoneController.text}@gmail.com'
                                );

                              }
                            },
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
