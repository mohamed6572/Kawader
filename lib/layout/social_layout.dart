
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/layout/cubit/cubit.dart';
import 'package:souq/layout/cubit/states.dart';
import 'package:souq/modules/NewPost.dart';
import 'package:souq/shared/components/components.dart';

class SocialLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialCubit(),
      child: BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {
          if(state is SocialNewPostState){
            navigateTo(context, New_Post_Screan());
          }
        },
        builder: (context, state) {
          var cubit = SocialCubit.get(context);

          return Scaffold(

            appBar: AppBar(
              title: Text(cubit.titles[cubit.CurrentIndex]),

            ),
            body: cubit.Screans[cubit.CurrentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.CurrentIndex,
              backgroundColor: Colors.white,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              onTap: (index){
                cubit.ChangeIndex(index);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home),label: 'الرئيسية'),

                BottomNavigationBarItem(icon: Icon(Icons.upload_file),label: 'اضافه اعلان'),

                BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'الاعدادات'),
              ],
            ),
          );
        },
      ),
    );
  }
}
