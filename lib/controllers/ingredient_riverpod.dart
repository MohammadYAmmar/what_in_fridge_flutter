import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:what_in_fridge/models/ingredient.dart';

class IngredientsNotifier extends ChangeNotifier {
  // TODO: add program to your app as you want
  // initialize data
  IngredientModel? selectedIngredient;
  final ingredients = <IngredientModel?>[];
  String title = '';
  String dsc = '';

  // functions
  void setTitle(String val) {
    title = val;
    notifyListeners();
  }

  void setDsc(String val) {
    dsc = val;
    notifyListeners();
  }

  void selectIngredient(IngredientModel ingredient) {
    selectedIngredient = ingredient;
    notifyListeners();
  }

  void addIngredient(IngredientModel ingredient) {
    ingredients.add(ingredient);
    notifyListeners();
  }

  void removeIngredient(int ingredientId) {
    ingredients.remove(
        ingredients.firstWhere((element) => element!.id == ingredientId));
    notifyListeners();
  }

  void updateIngredient(IngredientModel ingredient) {
    ingredients[ingredients
        .indexWhere((element) => element!.id == ingredient.id)] = ingredient;
    notifyListeners();
  }
}

final ingredientsProvider = ChangeNotifierProvider<IngredientsNotifier>((ref) {
  return IngredientsNotifier();
});
