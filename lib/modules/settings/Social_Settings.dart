import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/layout/cubit/cubit.dart';
import 'package:souq/layout/cubit/states.dart';
import 'package:souq/modules/edit_Profile/Edit_Profile_Screan.dart';
import 'package:souq/shared/components/components.dart';
import 'package:souq/shared/components/constens.dart';

class Social_Settings extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialCubit()..getUserData(),
      child: BlocConsumer<SocialCubit,SocialStates>(
        listener: (context, state) {

        },
        builder: (context, state) {


          return Padding(
            padding: EdgeInsets.all(8),
            child:  Column(
              children: [

                Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                          ,
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
                      borderRadius: BorderRadius.circular(20)
                          ,
                      border: Border.all(color: Colors.grey)
                    ),
                    child: Text('${SocialCubit.get(context).userModel?.phone?.substring(0,11)}',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black),)),
                SizedBox(height: 20,),
                
                // Row(
                //   children: [
                //     Expanded(child: OutlinedButton(
                //       child: Text('Add Photo'), onPressed: () { },),
                //     ),
                //     SizedBox(width: 5,),
                //     OutlinedButton(
                //       child: Icon(Icons.edit,size: 16,), onPressed: () {
                //         navigateTo(context, Edit_Profile_Screan());
                //     },),
                //   ],
                // ),
                SizedBox(height: 20,),
                defultButton(text: 'Logout',
                  radius: 20,
                  width: MediaQuery.of(context).size.width*0.4,
                  Background: Colors.red,
                  function: (){
                    SignOut(context);
                  },),
              ],
            ),
          );
        },

      ),
    );
  }
}
