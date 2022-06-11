import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart'; 

void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login UI with fadeout animation',
      home: MyLoginWidget()));
  SystemChrome.setSystemUIOverlayStyle(
      // ignore: prefer_const_constructors
      SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}

class MyLoginWidget extends StatefulWidget {
  const MyLoginWidget({Key? key}) : super(key: key);

  @override
  State<MyLoginWidget> createState() => _MyLoginWidgetState();
}

class _MyLoginWidgetState extends State<MyLoginWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _transform; 


  @override
  void initState() {
     _controller = AnimationController(
      vsync: this, 
      duration: const Duration(milliseconds: 300));

    _opacity = Tween<double>(begin: 0,
     end: 1).animate(
        CurvedAnimation(
          parent: _controller, 
          curve: Curves.ease,
         ), 
         )..addListener(() {
          setState(() {
           
         }); 

         _transform = Tween<double>(begin: 2, end: 1).animate(
          CurvedAnimation(
            parent: _controller, 
            curve: Curves.fastLinearToSlowEaseIn,
            )); 
         _controller.forward();
         super.initState(); 
         }

          );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        
        backgroundColor: Colors.transparent, 
        elevation: 0,
    ), 
    body: ScrollConfiguration(
      behavior: MyBehavior(),
      child: SizedBox(
        height: size.height,
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft, 
              end: Alignment.bottomRight, 
              colors:  [
                Color(0xffFEC37B), 
                Color(0xffFF4184), 
              ], 
            ), 
          ),
          child: Opacity(
            opacity: _opacity.value, 
            child: Transform.scale(
              scale: _transform.value, 
              child: Container(width: size.width *.9,
              height: size.width * 1.1, 
              decoration: BoxDecoration(
                color: Colors.white, 
                borderRadius: BorderRadius.circular(15), boxShadow: [
                  BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 90, 
              ), 
                ], 
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(), 
                  Text('Sign In', 
                  style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w600, 
                    color: Colors.black.withOpacity(.7), 
                    ),),
                  const SizedBox(),
                  component1(Icons.account_circle_outlined, 'Username...',false, false),
                  component1(Icons.email_outlined, 'Email...', false, false),
                  component1(Icons.lock_outline, 'Password...', true, false), 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      component2('LOGIN', 
                      2.6, 
                      {}{
                        HapticFeedback.lightImpact();
                        Fluttertoast.showToast(
                          msg: 'Login button pressed'
                        ); 
                      ), 
                      SizedBox(width: size.width/25), 
                      Container(width: size.width / 2.6, alignment: Alignment.center,
                      child: RichText(text: TextSpan(text: 'Forgotten Password?', style: const TextStyle(color:Colors.blueAccent), 
                      recognizer:
                       TapGestureRecognizer()
                      ..onTap = (){
                        Fluttertoast.showToast(
                          msg:'Forgotten Password button pressed', 
                        );
                      }))
                      ), 
                    ], 
                      ), 
                     const  SizedBox(), 
                     RichText(text: TextSpan(text: 'Create a new Account', 
                     style: const TextStyle(color: Colors.blueAccent, fontSize: 15),
                      recognizer:
                      TapGestureRecognizer()
                     ..onTap = (){
                       Fluttertoast.showToast(
                         msg: 'Create a new Account button pressed', 
                       );
                     })), 
                    const SizedBox(), 
                    ], 
                  ),
                  )
            )             
              )
            )
          )
        )
           );
  }

Widget component1(
  IconData icon, String hintText, bool isPassword, bool isEmail) {
    Size size = MediaQuery.of(context).size;
    return Container (
      height: size.width/8, 
      width: size.width/1.22,
      alignment: Alignment.center, 
      padding: const EdgeInsets.only(right: size.width / 30), 
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.05), 
        borderRadius: BorderRadius.circular(10), 
        
        
      ),
      child: TextField(
        style: TextStyle(color: Colors.black.withOpacity(.8)
      ),
      obscureText: isPassword,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black.withOpacity(.5), fontSize: 14),
        prefixIcon: Icon(icon, color: Colors.black.withOpacity(.7),),
        border: InputBorder.none,
      ),
      )
    ); 
  }
  

Widget component2(String string, double width, VoidCallback voidCallback) {
  Size size = MediaQuery.of(context).size;
  return InkWell(
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    onTap: voidCallback,
    child: Container(
      height: size.width / 8, 
      width: size.width / width,
      alignment: Alignment.center,
    decoration: BoxDecoration(
      color: const Color(0xff4796ff), 
      borderRadius: BorderRadius.circular(10), 
    ),
    
      child: Text(
        string, 
        style: const TextStyle(color: Colors.white, 
        fontWeight: FontWeight.w600),
        ),
    ),
  ); 
}
  }

// ignore: non_constant_identifier_names
class MyBehavior extends ScrollBehavior {
  @override
  // ignore: unused_element
  Widget buildViewportChrome(
      BuildContext context,
       Widget child,
        AxisDirection axisDirection, 
        ) {
    return child;
  }
}
  