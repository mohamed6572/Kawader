import 'package:buildcondition/buildcondition.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/layout/cubit/cubit.dart';
import 'package:souq/layout/cubit/states.dart';
import 'package:souq/shared/components/components.dart';

class ProductsScrean extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>  SocialCubit()..getSilderImage()..getofficeposts()..getUserData()..getClientposts(),
      child: BlocConsumer<SocialCubit, SocialStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Material(
              child: SingleChildScrollView(
                child: BuildCondition(
                  condition: SocialCubit.get(context).posts.length >=0 &&
                      SocialCubit.get(context).clients.length>0,
                  fallback: (context) => Center(child: CircularProgressIndicator(),),
                  builder: (context) =>  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselSlider(
                          items: SocialCubit.get(context).slider
                              .map((e) => ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              image: NetworkImage('${e.image}'),
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ))
                              .toList(),
                          options: CarouselOptions(
                            scrollDirection: Axis.horizontal,
                            autoPlay: true,
                            height: 240.0,
                            initialPage: 0,
                            reverse: false,
                            viewportFraction: 1.0,
                            enableInfiniteScroll: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration: Duration(seconds: 1),
                            autoPlayCurve: Curves.fastOutSlowIn,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          width: double.infinity,
                          height: 1.0,
                          color: Colors.grey[400],
                        ),
                      ),
                      Text(
                        'مكاتب الشغالات',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 290,
                        padding: EdgeInsetsDirectional.only(top: 3),
                        color: Colors.grey[200],
                        child: ListView.separated(
                          itemCount:SocialCubit.get(context).posts.length ,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index) =>BuildGridProduct(context,SocialCubit.get(context).posts[index]),

                          separatorBuilder: (BuildContext context, int index) => SizedBox(width: 9,) ,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'الشغالات',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 290,
                        padding: EdgeInsetsDirectional.only(top: 3),
                        color: Colors.grey[200],
                        child: ListView.separated(
                          itemCount:SocialCubit.get(context).clients.length ,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index) =>BuildGridProduct(context,SocialCubit.get(context).clients[index]),

                          separatorBuilder: (BuildContext context, int index) => SizedBox(width: 9,) ,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }


}
