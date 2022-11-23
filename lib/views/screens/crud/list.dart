import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:what_in_fridge/controllers/ingredient_riverpod.dart';
import 'package:what_in_fridge/models/ingredient.dart';
import 'package:what_in_fridge/views/screens/crud/create.dart';
import 'package:what_in_fridge/views/screens/crud/show.dart';
import 'package:what_in_fridge/views/screens/crud/update.dart';

// Todo: extend consumer widget
class IngredientList extends ConsumerWidget {
  const IngredientList({Key? key}) : super(key: key);

  //todo shared_preferences: ^2.0.15
  initSate() async {
//     // Obtain shared preferences.
//     final prefs = await SharedPreferences.getInstance();
//
// // Save an integer value to 'counter' key.
//     await prefs.setInt('Lemon', 3);
  }

  @override
  // Todo: add widget ref in build parameters
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: if you need listen always you can use watch
    List<IngredientModel?> ingredients =
        ref.watch(ingredientsProvider).ingredients;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Ingredient\' List'),
        centerTitle: true,
      ),
      body: SizedBox(
        // height: MediaQuery.of(context).size.height * 0.8,
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: ingredients.isNotEmpty ? ingredients.length : 0,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(ingredients[index]!.title!),
              subtitle: Text(ingredients[index]!.dsc!),
              trailing: SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // TODO: if you do not need listen always you can use read
                          ref
                              .read(ingredientsProvider.notifier)
                              .selectIngredient(ingredients[index]!);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateIngredient()));
                          //todo Go router
                          // GoRouter.of(context).go('/update');
                        },
                        child: const Icon(
                          Icons.edit,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                    Expanded(
                      child: InkWell(
                          onTap: () {
                            // TODO: if you do not need listen always you can use read
                            ref
                                .read(ingredientsProvider.notifier)
                                .selectIngredient(ingredients[index]!);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShowIngredient()));
                          },
                          child: const Icon(
                            Icons.remove_red_eye,
                            color: Colors.blue,
                          )),
                    ),
                  ],
                ),
              ),
              leading: InkWell(
                  onTap: () {
                    // TODO: if you do not need listen always you can use read
                    ref
                        .read(ingredientsProvider.notifier)
                        .removeIngredient(ingredients[index]!.id!);
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => CreateIngredient()));
        },
        child: const Icon(Icons.add),
      ),
    ));
  }
}
