
import 'package:flutter/material.dart';

Widget myDivider()=> Padding(
  padding: const EdgeInsetsDirectional.only(
      start: 20),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[400],
  ),
);


Widget defultFormField ({
  required TextInputType type,
  required TextEditingController controller,
  required String label,
   IconData? prefix,
  IconData? suffix,
  bool isPassword = false,
  required String? Function(String? val)? validator,
  void Function(String val)? onChanged,
  VoidCallback? passwordShow,
  VoidCallback? onTap,
  void Function (String)? onSubmeted,


})=> TextFormField(
  onTap: onTap,
  onFieldSubmitted: onSubmeted,
  onChanged: onChanged,
  obscureText: isPassword,
  validator: validator,
  keyboardType: type,
  controller: controller,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(prefix),
    border: OutlineInputBorder(),
    suffixIcon:  suffix != null ? IconButton(icon: Icon(suffix) , onPressed: passwordShow,) : null,




  ),

);



//////////////////////////////////////facebook Screan

Widget defultIcon (
    {
      required IconData icon,
      Color? color = Colors.blue ,
    }
    )=>Icon(
  icon,
  size: 40,
  color: color,
);

Widget defultTextButtton({
  required String text,
  required void  Function()? function
}) => TextButton(onPressed: function, child: Text(text.toUpperCase()));

void navigateTo(context , widget)=> Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => widget
    ));

void navigateToAndFinish(context , widget)=> Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (route)=> false
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

Widget defultButton({
  double width = double.infinity,
  Color Background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required String text,
  required VoidCallback function,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: Background,
      ),
    );

PreferredSizeWidget defultAppBar ({required BuildContext context , String? title , List<Widget>? actions})=>  AppBar(
  title: Text(title!,style: TextStyle(color: Colors.blue),),
  actions: actions,
  backgroundColor: Colors.white,
  elevation: 0.0,
  titleSpacing: 5.0,
  leading: IconButton(
    onPressed: (){
      Navigator.pop(context);
    },
    icon:Icon(Icons.arrow_back_ios),

  ),

);