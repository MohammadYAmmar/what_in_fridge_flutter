import 'package:flutter/material.dart';

TextFormField iTextFormField(BuildContext context, String label, String hint,
        IconData iconData, Function func, TextEditingController? iController) =>
    TextFormField(
      controller: iController!,
      decoration: InputDecoration(
        labelStyle: Theme.of(context).textTheme.headline5,
        errorStyle: Theme.of(context).textTheme.headline6,
        hintText: hint,
        labelText: label,
        suffixIcon: Icon(
          iconData,
          color: Theme.of(context).primaryColor,
        ),
        hintStyle: Theme.of(context).textTheme.headline5,
        fillColor: Colors.white,
        filled: true,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1.0,
          ),
        ),
      ),
      validator: (String? val) {
        if (val!.isEmpty) {
          return 'Required Field!';
        } else {
          return null;
        }
      },
      onChanged: (val) => func(val),
    );

TextFormField iTextFormFieldReadOnly(
        BuildContext context,
        String label,
        String hint,
        IconData iconData,
        Function func,
        TextEditingController? iController) =>
    TextFormField(
      readOnly: true,
      controller: iController!,
      decoration: InputDecoration(
        labelStyle: Theme.of(context).textTheme.headline5,
        errorStyle: Theme.of(context).textTheme.headline6,
        hintText: hint,
        labelText: label,
        suffixIcon: Icon(
          iconData,
          color: Theme.of(context).primaryColor,
        ),
        hintStyle: Theme.of(context).textTheme.headline5,
        fillColor: Colors.white,
        filled: true,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1.0,
          ),
        ),
      ),
      validator: (String? val) {
        if (val!.isEmpty) {
          return 'Required Field!';
        } else {
          return null;
        }
      },
      onChanged: (val) => func(val),
    );
