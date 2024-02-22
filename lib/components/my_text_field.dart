import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;

  const MyTextField({
    super.key,
    required this.hintText,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: TextField(
        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        controller: textEditingController,
        decoration: InputDecoration(
          // focusColor: Theme.of(context).colorScheme.inversePrimary,
          // fillColor: Theme.of(context).colorScheme.inversePrimary,
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(12),
          //   borderSide:  BorderSide(color: Theme.of(context).colorScheme.onBackground),
          // ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:  BorderSide(color: Theme.of(context).colorScheme.onBackground),
          ),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.background),
        ),
      ),
    );
  }
}
