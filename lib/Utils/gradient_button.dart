import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Constants/constants.dart';

Widget gradientbutton(
    {required VoidCallback onpressed,
    required IconData icon,
    required String label}) {
  return DecoratedBox(
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Colors.green,
            greencolor,
            // Color.fromARGB(255, 203, 230, 0)
            //add more colors
          ]),
          borderRadius: BorderRadius.circular(18),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                blurRadius: 5) //blur radius of shadow
          ]),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            // foregroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
        icon: Icon(icon),
        onPressed: onpressed,
        label: Text(
          label,
        ),
      ));
}
