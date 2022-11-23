import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:what_in_fridge/controllers/ingredient_riverpod.dart';
import 'package:what_in_fridge/models/ingredient.dart';
import 'package:what_in_fridge/views/screens/crud/list.dart';
import 'package:what_in_fridge/views/widgets/button.dart';
import 'package:what_in_fridge/views/widgets/text_form_field.dart';

// Todo: extend consumer widget
class CreateIngredient extends ConsumerWidget {
  CreateIngredient({Key? key}) : super(key: key);

  final _createKey = GlobalKey<FormState>();

  @override
  // Todo: add widget ref in build parameters
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: if you do not need listen always you can use read
    String title = ref.read(ingredientsProvider).title;
    String dsc = ref.read(ingredientsProvider).dsc;

    final TextEditingController titleController =
        TextEditingController(text: title);
    titleController.value = titleController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(
          offset: title.length,
        ),
      ),
    );

    final TextEditingController dscController =
        TextEditingController(text: dsc);
    dscController.value = dscController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(
          offset: dsc.length,
        ),
      ),
    );

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Create Ingredient'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Form(
            key: _createKey,
            child: Column(
              children: [
                iTextFormField(
                    context,
                    'Ingredient Text',
                    'Enter Ingredient Text',
                    Icons.title,
                    // TODO: if you do not need listen always you can use read
                    (val) =>
                        ref.read(ingredientsProvider.notifier).setTitle(val),
                    titleController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                iTextFormField(
                    context,
                    'Ingredient Dsc',
                    'Enter Ingredient Dsc',
                    Icons.description,
                    // TODO: if you do not need listen always you can use read
                    (val) => ref.read(ingredientsProvider.notifier).setDsc(val),
                    dscController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                iOutlinedButton(context, _createKey, 'Add Ingredient', () {
                  // TODO: if you do not need listen always you can use read
                  // TODO: if you need listen always you can use watch
                  ref.read(ingredientsProvider.notifier).addIngredient(
                      IngredientModel(
                          id: DateTime.now().microsecond,
                          title: ref.watch(ingredientsProvider).title,
                          dsc: ref.watch(ingredientsProvider).dsc));
                  ref.read(ingredientsProvider.notifier).setTitle('');
                  ref.read(ingredientsProvider.notifier).setDsc('');
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
