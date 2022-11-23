import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:what_in_fridge/controllers/ingredient_riverpod.dart';
import 'package:what_in_fridge/models/ingredient.dart';
import 'package:what_in_fridge/views/screens/crud/list.dart';
import 'package:what_in_fridge/views/widgets/button.dart';
import 'package:what_in_fridge/views/widgets/text_form_field.dart';

class UpdateIngredient extends ConsumerWidget {
  UpdateIngredient({Key? key}) : super(key: key);

  final _updateKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    IngredientModel ingredient =
        ref.watch(ingredientsProvider).selectedIngredient!;

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
        title: const Text('Edit ingredient'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Form(
            key: _updateKey,
            child: Column(
              children: [
                iTextFormField(
                  context,
                  'ingredient Text',
                  'Enter ingredient Text',
                  Icons.title,
                  (val) => ref
                      .read(ingredientsProvider)
                      .selectIngredient(IngredientModel(
                        id: ingredient.id,
                        title: val,
                        dsc: ingredient.dsc,
                      )),
                  titleController,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                iTextFormField(
                  context,
                  'Ingredient Dsc',
                  'Enter ingredient Dsc',
                  Icons.description,
                  (val) => ref
                      .read(ingredientsProvider)
                      .selectIngredient(IngredientModel(
                        id: ingredient.id,
                        title: ingredient.title,
                        dsc: val,
                      )),
                  dscController,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                iOutlinedButton(context, _updateKey, 'Update ingredient', () {
                  ref
                      .read(ingredientsProvider)
                      .updateIngredient(IngredientModel(
                        id: ingredient.id,
                        title: ingredient.title,
                        dsc: ingredient.dsc,
                      ));
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const IngredientList()));
                }),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
