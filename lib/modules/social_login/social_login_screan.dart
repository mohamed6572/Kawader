import 'package:buildcondition/buildcondition.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/layout/social_layout.dart';
import 'package:souq/modules/social_Register/social_Register_Screan.dart';
import 'package:souq/modules/social_login/cubit/Cubit.dart';
import 'package:souq/modules/social_login/cubit/States.dart';
import 'package:souq/shared/components/components.dart';
import 'package:souq/shared/network/local/casheHelper.dart';

class SocialLoginScrean extends StatelessWidget {
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit, SocialLoginStates>(
        listener: (context, state) {
          if(state is SocialLoginSucsesState ){
            casheHelper.SavaData(
                key: 'uId', value: state.uId
            )
                .then((value) {

              navigateToAndFinish(context, SocialLayout());
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,

            appBar: AppBar(
              backgroundColor: Colors.white,
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
                          'Login'.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(color: Colors.black),
                        ),
                        Text(
                          'login now to browse our hot offers',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(children: [
                          Expanded(
                            flex: 1,
                            child: CountryCodePicker(
                              showFlagMain: true,
                              initialSelection: 'EG',
                              showCountryOnly: true,
                              alignLeft: true,
                              favorite: ['EG'],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child:
                            defultFormField(
                              type: TextInputType.phone,
                              controller: phoneController,
                              label: '+00000000',

                              validator: (text) {
                                if (text == null || text.trim().isEmpty) {
                                  return 'Please Enter phone number';
                                }
                                return null;
                              },
                            ),

                          )
                        ]),
                        SizedBox(
                          height: 15,
                        ),
                        defultFormField(
                            type: TextInputType.visiblePassword,
                            controller: passwordController,
                            label: 'Password',
                            suffix: SocialLoginCubit.get(context).suffix,
                            isPassword:
                                SocialLoginCubit.get(context).isPassword,
                            onSubmeted: (value) {
                              if (formkey.currentState!.validate()) {
                                SocialLoginCubit.get(context).userLogin(
                                    email: '${phoneController.text}@gmail.com',
                                    password: passwordController.text
                                );
                              }
                            },
                            passwordShow: () {
                              SocialLoginCubit.get(context)
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
                          condition: state is! SocialLoginLodingState,
                          builder: (context) => defultButton(
                            text: 'login',
                            isUpperCase: true,
                            function: () {
                              navigateTo(context, SocialLayout());
                              print(passwordController.text);
                              if (formkey.currentState!.validate()) {
                                SocialLoginCubit.get(context).userLogin(
                                    email:'${phoneController.text}@gmail.com',
                                    password: passwordController.text);
                              }
                            },
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Dont\'t have an account?'),
                            defultTextButtton(
                                text: 'register now',
                                function: () {
                                  navigateTo(context, SocialRegisterScrean());
                                }),
                          ],
                        )
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
