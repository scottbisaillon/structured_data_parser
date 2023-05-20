// ignore_for_file: lines_longer_than_80_chars

import 'package:structured_data_parser/src/schemas/schema_type.dart';
import 'package:structured_data_parser/src/schemas/schemas.dart';
import 'package:test/test.dart';

import '../../../test_inputs/recipe_schema_input.dart';

extension RecipeSchemaX on RecipeSchema {
  void shouldHaveProperties({
    String? name,
    String? description,
    Duration? performTime,
    Duration? prepTime,
    Duration? totalTime,
    List<String> keywords = const [],
    Duration? cookTime,
    String? cookingMethod,
    List<String> recipeCategory = const [],
    List<String> recipeCuisine = const [],
    List<String> recipeIngredient = const [],
    List<HowTo> recipeInstructions = const [],
    List<String> recipeYield = const [],
  }) {
    expect(type, equals(SchemaType.recipe));
    expect(this.name, equals(name));
    expect(this.description, equals(description));
    expect(this.performTime, equals(performTime));
    expect(this.prepTime, equals(prepTime));
    expect(this.totalTime, equals(totalTime));
    expect(this.keywords, equals(keywords));
    expect(this.cookTime, equals(cookTime));
    expect(this.cookingMethod, equals(cookingMethod));
    expect(this.recipeCategory, equals(recipeCategory));
    expect(this.recipeCuisine, equals(recipeCuisine));
    expect(this.recipeIngredient, equals(recipeIngredient));
    expect(this.recipeInstructions, equals(recipeInstructions));
    expect(this.recipeYield, equals(recipeYield));
  }
}

void main() {
  group('RecipeSchema', () {
    test('should support value equality', () {
      expect(
        RecipeSchema.fromJson(bakedLemonHerbCodRecipe),
        equals(RecipeSchema.fromJson(bakedLemonHerbCodRecipe)),
      );
    });

    group('fromJson', () {
      test('should deserialize [bakedLemonHerbCodRecipe]', () {
        RecipeSchema.fromJson(bakedLemonHerbCodRecipe).shouldHaveProperties(
          name: 'Baked Lemon Herb Cod Recipe',
          performTime: const Duration(minutes: 17),
          prepTime: const Duration(minutes: 5),
          totalTime: const Duration(minutes: 22),
          cookTime: const Duration(minutes: 17),
          recipeIngredient: [
            '1 lb cod fillets',
            '1 1/2 tbsp lemon juice',
            '1 tbsp extra virgin olive oil',
            '2 cloves garlic, , crushed and minced',
            '1 tsp fresh thyme, , lightly chopped',
            'sea salt',
            'pepper',
            'Sweet Hungarian Paprika'
          ],
          recipeInstructions: [
            HowToStep(
              position: 1,
              text:
                  'Preheat the oven to 400 degrees. Get out a 9×13 glass baking dish.',
            ),
            HowToStep(
              position: 2,
              text:
                  'Rinse the cod fillets under cool water and place in the baking dish. Drizzle with lemon juice and olive oil. Then sprinkle with garlic, thyme, salt, pepper and paprika. Try to divide the seasonings as equally as possible between the fish.',
            ),
            HowToStep(
              position: 3,
              text:
                  'Bake for 13-17 minutes until the flesh is opaque in color. Serve with rice, spooning the juices from the pan over the fish and rice.',
            ),
            HowToStep(position: 4, text: 'Devour.')
          ],
          recipeYield: ['4'],
        );
      });

      test('should deserialize [appleCrispRecipe]', () {
        RecipeSchema.fromJson(appleCrispRecipe).shouldHaveProperties(
          name: 'Apple Crisp Recipe',
          description:
              'Apple Crisp Recipe - This old fashioned apple crisp is the BEST! Flavorful apples are covered with a delicious crunchy topping to make an easy dessert that’s always a favorite! A perfect dessert for the apple lover!',
          prepTime: const Duration(minutes: 10),
          totalTime: const Duration(minutes: 55),
          keywords: ['apple crisp', 'apple crisp recipe'],
          cookTime: const Duration(minutes: 45),
          recipeCategory: ['dessert'],
          recipeCuisine: ['american'],
          recipeIngredient: [
            '10 medium apples  (peeled, cored, and sliced)',
            '1/4 cup lemon juice',
            '1/2 cup brown sugar',
            '3 tablespoons all-purpose flour',
            '1 teaspoon cinnamon',
            '4  tablespoons  butter (melted)',
            '1/4 teaspoon  salt',
            '1  cup all-purpose flour',
            '1  cup brown sugar',
            '1 cup quick-cooking oats',
            '1 teaspoon cinnamon',
            '1/2 teaspoon baking powder',
            '1/2 teaspoon salt',
            '1/2 cup butter  (softened)'
          ],
          recipeInstructions: [
            HowToStep(text: 'Preheat oven to 350º F.'),
            HowToStep(
              text:
                  'Spray 9x13 casserole dish with non-stick cooking spray and set aside. ',
            ),
            HowToSection(
              name: 'Apple Crisp Topping:',
              itemListElement: [
                HowToStep(
                  text:
                      'Add flour, brown sugar, oats, cinnamon, baking powder, and salt to a large bowl. Whisk together to combine. Using clean fingers, work the softened butter into the flour mixture until well combined. Chill in the refrigerator until apple filling is prepared. ',
                )
              ],
            ),
            HowToSection(
              name: 'Apple Crisp Filling:',
              itemListElement: [
                HowToStep(
                  text:
                      'Combine apples, lemon juice, brown sugar, flour, ground cinnamon, butter, and salt in a large bowl, tossing to make sure apples are well coated. Pour into prepared casserole dish.',
                ),
                HowToStep(
                  text:
                      'Top apples with Apple Crisp Topping and bake until the apples are tender and top of apple crisp has turned golden brown, about 45 minutes.',
                )
              ],
            )
          ],
          recipeYield: ['12'],
        );
      });

      test('should deserialize [roastedVegetableCouscousMealPrep]', () {
        RecipeSchema.fromJson(roastedVegetableCouscousMealPrep)
            .shouldHaveProperties(
          name: 'Roasted Vegetable Couscous Meal Prep',
          description:
              'Roasted Vegetable Couscous Meal Prep is a super filling, veggie-packed meal that can be made with chicken or vegetarian with chickpeas.',
          prepTime: const Duration(minutes: 15),
          totalTime: const Duration(minutes: 70),
          keywords: ['couscous', 'meal prep'],
          cookTime: const Duration(minutes: 55),
          recipeCategory: ['lunch', 'main course'],
          recipeCuisine: ['american'],
          recipeIngredient: [
            r'4  Roma tomatoes ($1.35)',
            r'2  zucchini (about 20 oz.) ($1.69)',
            r'1  bell pepper ($1.00)',
            r'1  red onion ($0.42)',
            r'4 cloves garlic, peeled ($0.32)',
            r'2 Tbsp olive oil ($0.32)',
            r'2  pinches salt and pepper ($0.05)',
            r'1 cup couscous ($0.79)',
            r'1.5 cups vegetable broth ($0.20)',
            r'1/2 bunch  parsley (about 1 cup chopped) ($0.40)',
            r'2  boneless, skinless chicken breasts (about 1/2 lb. each) OR two 15 oz. cans chickpeas ($4.23)',
            r'2 Tbsp butter, room temperature ($0.36)',
            r'1 tsp dried parsley ($0.10)',
            r'1/2 tsp dried oregano ($0.05)',
            r'1/2 tsp  dried basil ($0.05)',
            r'1/4 tsp garlic powder ($0.03)',
            r'1/4 tsp onion powder ($0.03)',
            r'1/4 tsp salt ($0.02)',
            r'pepper ($0.02)',
            r'1/2 cup ranch dressing ($0.70)'
          ],
          recipeInstructions: [
            HowToSection(
              name: 'Roasted Vegetable Couscous',
              itemListElement: [
                HowToStep(
                  text:
                      'Prepare the Roasted Vegetable Couscous first. Preheat the oven to 400ºF. Chop the Roma tomatoes, zucchini, and bell pepper into 1-inch pieces. Slice the red onion into 1/2-inch thick strips. Place the tomatoes, zucchini, bell pepper, onion, and peeled garlic on a large baking sheet.',
                ),
                HowToStep(
                  text:
                      'Drizzle the olive oil over the chopped vegetables, toss to coat, then season with a couple pinches of salt and pepper. Roast the vegetables for about 45 minutes, stirring every 15 minutes or so.',
                ),
                HowToStep(
                  text:
                      'While the vegetables are roasting, begin the couscous. Bring the vegetable broth to a boil in a small sauce pot. Once boiling, stir in the couscous. Place a lid on top, remove the pot from the heat, and let the couscous sit for five minutes, or until all of the broth is absorbed. Fluff the couscous with a fork, then place in the refrigerator to begin cooling as you prepare the rest of the meal.',
                )
              ],
            ),
            HowToSection(
              name: 'For Garlic Herb Baked Chicken',
              itemListElement: [
                HowToStep(
                  text:
                      'While the couscous is chilling, begin the garlic herb baked chicken. Combine the room temperature butter with the parsley, oregano, basil, garlic powder, onion powder, salt, and pepper in a bowl. Stir until it forms a paste.',
                ),
                HowToStep(
                  text:
                      'If the chicken breasts are thick, gently pound them with a mallet or rolling pin until they are an even thickness, no more than 3/4-inch thick (I cover the chicken with plastic to prevent splatter when pounding). Pat the chicken dry, then smear the butter herb mixture over the entire surface.',
                ),
                HowToStep(
                  text:
                      'Place the seasoned chicken in a baking dish and bake for 20 minutes at 400ºF, or until the internal temperature reaches 165ºF. Let the chicken rest for 5 minutes, then slice into strips.',
                )
              ],
            ),
            HowToSection(
              name: 'For Garlic Herb Chickpeas',
              itemListElement: [
                HowToStep(
                  text:
                      'To make Garlic Herb Chickpeas instead, rinse and drain 2 15oz. cans of chickpeas. Heat 1 Tbsp oil in a large skillet over medium. Once hot, add the chickpeas, and sauté for about 5 minutes, or until the chickpeas are golden and the skins are blistered. Remove them from heat and then season with the same garlic herb spices used for the chicken (no butter). Stir until the chickpeas are coated in the herbs and spices.',
                )
              ],
            ),
            HowToSection(
              name: 'Assemble the Meal Prep',
              itemListElement: [
                HowToStep(
                  text:
                      'When the vegetables are finally finished roasting, pull out the whole garlic cloves from the baking sheet and mince them. Combine the partially cooled couscous, the roasted vegetables, garlic, and chopped parsley in a large bowl. Stir to combine.',
                ),
                HowToStep(
                  text:
                      'Divide the Roasted Vegetable Couscous between four containers and top with sliced chicken or 1/4 of the Garlic Herb Chickpeas. Serve each portion with 2 Tbsp ranch dressing.',
                )
              ],
            )
          ],
          recipeYield: ['4'],
        );
      });

      test('should deserialize [chocolateChipCookieDoughTrufflesRecipe]', () {
        RecipeSchema.fromJson(chocolateChipCookieDoughTrufflesRecipe)
            .shouldHaveProperties(
          name: 'Chocolate Chip Cookie Dough Truffles',
          description:
              "These truffles have been declared the best thing I've ever baked, even though there is technically no baking involved. They are easy to prepare and even easier to eat; as a result, it's best to serve them in the company of others so you aren't tempted--or forced--to eat them all yourself.",
          keywords: ['candy', 'chocolate', 'dessert'],
          recipeCategory: ['dessert'],
          recipeCuisine: [],
          recipeIngredient: [
            '1/2 cup (1 stick) unsalted butter, room temperature',
            '1/4 cup granulated sugar',
            '1/2 cup light brown sugar, packed',
            '2 tablespoons milk or cream',
            '1/2 teaspoon vanilla extract',
            '1 1/4 cups all-purpose flour',
            '1/2 teaspoon salt',
            '1/2 cup mini semisweet chocolate chips',
            '8 ounces dark-chocolate candy coating'
          ],
          recipeYield: ['30 to 40 truffles'],
          recipeInstructions: [
            HowToStep(
              text:
                  'In a large bowl, beat butter and sugars with an electric mixer on medium speed until light and fluffy, 2 to 3 minutes. Mix in milk and vanilla. Stir in flour and salt and mix on low speed (or by hand) until incorporated. Stir in chocolate chips. Cover and chill dough for 30 minutes or until firm enough to handle.',
            ),
            HowToStep(
              text:
                  'Form dough into 1-inch balls and arrange them on baking sheets lined with parchment paper. Place sheets in the freezer for at least 15 minutes. Meanwhile, melt chocolate candy coating in a double boiler or microwave according to package directions, being careful not to overheat it. Using a fork or dipping tool, dip truffles one at a time in candy coating to cover. Tap fork on the edge of the bowl to shake off excess coating, and return truffles to baking sheets to set. If you have any leftover coating, transfer it to a piping bag or squeeze bottle fitted with a small round tip and pipe decorative lines over top of truffles-or simply drizzle coating with a fork for an abstract finish.',
            ),
            HowToStep(
              text:
                  'Refrigerated in an airtight container, truffles will keep for up to 1 week, though I dare you to make them last that long.',
            )
          ],
        );
      });
    });
  });
}
