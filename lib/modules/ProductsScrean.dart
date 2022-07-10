import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/layout/cubit/cubit.dart';
import 'package:souq/layout/cubit/states.dart';

class ProductsScrean extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return
            productsBuilder(
           context);
        });
  }

  List<Widget> list = [
    ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image(
        image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdUOaC_-e6JiiolVbgqKoZbWYs8PilfBpaY6JjK_EgIWeiU1cqiPrzptougEotrkR1Yac&usqp=CAU'),
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image(
        image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdUOaC_-e6JiiolVbgqKoZbWYs8PilfBpaY6JjK_EgIWeiU1cqiPrzptougEotrkR1Yac&usqp=CAU'),
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image(
        image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdUOaC_-e6JiiolVbgqKoZbWYs8PilfBpaY6JjK_EgIWeiU1cqiPrzptougEotrkR1Yac&usqp=CAU'),
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image(
        image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdUOaC_-e6JiiolVbgqKoZbWYs8PilfBpaY6JjK_EgIWeiU1cqiPrzptougEotrkR1Yac&usqp=CAU'),
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    ),

  ];
  Widget productsBuilder(context) =>
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
                items: list,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    'New adds',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsetsDirectional.only(top: 3),
              color: Colors.grey[200],
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1 / 1.43,
                children: List.generate(list.length,
                    (index) => BuildGridProduct(context)),
              ),
            )
          ],
        ),
      );



  Widget BuildGridProduct(context) => Padding(
    padding: const EdgeInsets.all(2.0),
    child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdUOaC_-e6JiiolVbgqKoZbWYs8PilfBpaY6JjK_EgIWeiU1cqiPrzptougEotrkR1Yac&usqp=CAU'),
                  width: double.infinity,
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'souq',
                        maxLines: 2,
                        textAlign:TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14, height: 1.3),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        '100',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign:TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.blue),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
  );
}



