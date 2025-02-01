// ignore_for_file: unused_element, unused_field, camel_case_types, annotate_overrides, prefer_single_quotes
// GENERATED FILE, do not edit!
import 'package:i69n/i69n.dart' as i69n;

String get _languageCode => 'en';
String get _localeName => 'en';

String _plural(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.plural(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _ordinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.ordinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _cardinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.cardinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);

class Translations implements i69n.I69nMessageBundle {
  const Translations();
  HomePageTranslations get homePage => HomePageTranslations(this);
  WeeklyMenuPageTranslations get weeklyMenuPage =>
      WeeklyMenuPageTranslations(this);
  SelectRecipesPageTranslations get selectRecipesPage =>
      SelectRecipesPageTranslations(this);
  RecipesOverviewPageTranslations get recipesOverviewPage =>
      RecipesOverviewPageTranslations(this);
  AddRecipePageTranslations get addRecipePage =>
      AddRecipePageTranslations(this);
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'homePage':
        return homePage;
      case 'weeklyMenuPage':
        return weeklyMenuPage;
      case 'selectRecipesPage':
        return selectRecipesPage;
      case 'recipesOverviewPage':
        return recipesOverviewPage;
      case 'addRecipePage':
        return addRecipePage;
      default:
        return key;
    }
  }
}

class HomePageTranslations implements i69n.I69nMessageBundle {
  final Translations _parent;
  const HomePageTranslations(this._parent);
  String get seeAllButton => "View all";
  String get weeksMenuButton => "This weeks menu";
  String get recipesButton => "Recipes";
  String get newShoppingListButton => "New shopping list";
  String get yourRecentListsText => "Your recent lists";
  String get welcome => "Welcome";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'seeAllButton':
        return seeAllButton;
      case 'weeksMenuButton':
        return weeksMenuButton;
      case 'recipesButton':
        return recipesButton;
      case 'newShoppingListButton':
        return newShoppingListButton;
      case 'yourRecentListsText':
        return yourRecentListsText;
      case 'welcome':
        return welcome;
      default:
        return key;
    }
  }
}

class WeeklyMenuPageTranslations implements i69n.I69nMessageBundle {
  final Translations _parent;
  const WeeklyMenuPageTranslations(this._parent);
  String get title => "My menu";
  String get monday => "Monday";
  String get tuesday => "Tuesday";
  String get wednesday => "Wednesday";
  String get thursday => "Thursday";
  String get friday => "Friday";
  String get saturday => "Saturday";
  String get sunday => "Sunday";
  String get breakfast => "Breakfast";
  String get lunch => "Lunch";
  String get dinner => "Dinner";
  String get buildShoppingListButton => "Build shopping list";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'title':
        return title;
      case 'monday':
        return monday;
      case 'tuesday':
        return tuesday;
      case 'wednesday':
        return wednesday;
      case 'thursday':
        return thursday;
      case 'friday':
        return friday;
      case 'saturday':
        return saturday;
      case 'sunday':
        return sunday;
      case 'breakfast':
        return breakfast;
      case 'lunch':
        return lunch;
      case 'dinner':
        return dinner;
      case 'buildShoppingListButton':
        return buildShoppingListButton;
      default:
        return key;
    }
  }
}

class SelectRecipesPageTranslations implements i69n.I69nMessageBundle {
  final Translations _parent;
  const SelectRecipesPageTranslations(this._parent);
  String get title => "Select a recipe";
  String get noRecipes => "No recipes found - create some recipes first";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'title':
        return title;
      case 'noRecipes':
        return noRecipes;
      default:
        return key;
    }
  }
}

class RecipesOverviewPageTranslations implements i69n.I69nMessageBundle {
  final Translations _parent;
  const RecipesOverviewPageTranslations(this._parent);
  String get title => "Recipes";
  String get createRecipeButton => "Create a recipe";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'title':
        return title;
      case 'createRecipeButton':
        return createRecipeButton;
      default:
        return key;
    }
  }
}

class AddRecipePageTranslations implements i69n.I69nMessageBundle {
  final Translations _parent;
  const AddRecipePageTranslations(this._parent);
  String get title => "Add a recipe";
  String get instructions => "Instructions";
  String get ingredients => "Ingredients";
  String get recipeName => "Recipe name";
  String get saveRecipeButton => "Save recipe";
  String get ingredientName => "Name";
  String get ingredientAmount => "Quantity";
  String get ingredientUnit => "Unit";
  String get ingredientUnitHint => "g, ml, ...";
  String get ingredientQuantityHint => "e.g. 1";
  String get ingredientNameHint => "flour, eggs, ...";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'title':
        return title;
      case 'instructions':
        return instructions;
      case 'ingredients':
        return ingredients;
      case 'recipeName':
        return recipeName;
      case 'saveRecipeButton':
        return saveRecipeButton;
      case 'ingredientName':
        return ingredientName;
      case 'ingredientAmount':
        return ingredientAmount;
      case 'ingredientUnit':
        return ingredientUnit;
      case 'ingredientUnitHint':
        return ingredientUnitHint;
      case 'ingredientQuantityHint':
        return ingredientQuantityHint;
      case 'ingredientNameHint':
        return ingredientNameHint;
      default:
        return key;
    }
  }
}
