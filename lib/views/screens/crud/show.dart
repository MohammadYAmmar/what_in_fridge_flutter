import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:what_in_fridge/controllers/ingredient_riverpod.dart';
import 'package:what_in_fridge/models/ingredient.dart';
import 'package:what_in_fridge/views/screens/crud/list.dart';
import 'package:what_in_fridge/views/widgets/button.dart';
import 'package:what_in_fridge/views/widgets/text_form_field.dart';

class ShowIngredient extends ConsumerWidget {
  const ShowIngredient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    IngredientModel ingredient =
        ref.read(ingredientsProvider).selectedIngredient!;

    final TextEditingController titleController =
        TextEditingController(text: ingredient.title);
    titleController.value = titleController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(
          offset: ingredient.title!.length,
        ),
      ),
    );

    final TextEditingController dscController =
        TextEditingController(text: ingredient.dsc);
    dscController.value = dscController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(
          offset: ingredient.dsc!.length,
        ),
      ),
    );

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(ingredient.title!),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              iTextFormFieldReadOnly(
                context,
                'Ingredient Text',
                'Enter Ingredient Text',
                Icons.title,
                (val) => null,
                titleController,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              iTextFormFieldReadOnly(
                context,
                'Ingredient Dsc',
                'Enter Ingredient Dsc',
                Icons.description,
                (val) => null,
                dscController,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              iOutlinedButtonNoKey(context, 'Return To List', () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const IngredientList()));
              }),
            ],
          ),
        ),
      ),
    ));
  }
}
