import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/layout/cubit/cubit.dart';
import 'package:souq/layout/cubit/states.dart';
import 'package:souq/shared/components/components.dart';
import 'package:souq/shared/components/constens.dart';

class Social_Settings extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>  SocialCubit()..getUserData()..getofficeposts()..getClientposts(),
      child: BlocConsumer<SocialCubit,SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return BuildCondition(
            condition: SocialCubit.get(context).userModel?.name!=null ,
            fallback: (context) => CircularProgressIndicator(),
            builder: (context) => Padding(
              padding: EdgeInsets.all(8),
              child:  SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey)
                        ),
                        child: Text('${SocialCubit.get(context).userModel?.name}',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.black),)),
                    SizedBox(height: 20,),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey)
                        ),
                        child: Text('${SocialCubit.get(context).userModel?.phone?.substring(0,11)}',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.black),)),
                    SizedBox(height: 20,),

                    SizedBox(height: 20,),
                    defultButton(text: 'تسجيل خروج',
                      radius: 20,
                      width: MediaQuery.of(context).size.width*0.4,
                      Background: Colors.red,
                      function: (){
                        SignOut(context);
                      },),
                    SizedBox(height: 15,),
                    Text('اعلاناتك',
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 20,
                    ),
                    ),
                    SizedBox(height: 15,),
                    if(SocialCubit.get(context).postsUser.length>0)
                    Container(
                      padding: EdgeInsetsDirectional.only(top: 3),
                      color: Colors.grey[200],
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        childAspectRatio: 1 / 1.5,
                        children: List.generate(SocialCubit.get(context).postsUser.length,
                                (index) => BuildGridProduct(context,SocialCubit.get(context).postsUser[index])),
                      ),
                    ),
                    SizedBox(height: 15,),
                    if(SocialCubit.get(context).clientsUser.length>0)
                      Container(
                        padding: EdgeInsetsDirectional.only(top: 3),
                        color: Colors.grey[200],
                        child: GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 1.0,
                          crossAxisSpacing: 1.0,
                          childAspectRatio: 1 / 1.5,
                          children: List.generate(SocialCubit.get(context).clientsUser.length,
                                  (index) => BuildGridProduct(context,SocialCubit.get(context).clientsUser[index])),
                        ),
                      )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
