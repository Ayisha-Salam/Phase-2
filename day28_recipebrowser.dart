import 'package:flutter/material.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Browser',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const RecipeListScreen(),
    );
  }
}

class Recipe {
  final String name;
  final String image;
  final List<String> ingredients;
  final List<String> steps;

  Recipe({
    required this.name,
    required this.image,
    required this.ingredients,
    required this.steps,
  });
}

final List<Recipe> recipes = [
  Recipe(
    name: "Chicken Biriyani",
    image:
        "https://images.unsplash.com/photo-1563379091339-03246963d29a",
    ingredients: [
      "Chicken",
      "Rice",
      "Onion",
      "Tomato",
      "Yogurt",
      "Spices"
    ],
    steps: [
      "Marinate chicken with yogurt and spices.",
      "Cook rice until partially done.",
      "Fry onions until golden brown.",
      "Layer rice and chicken.",
      "Cook on low flame for 20 minutes.",
      "Serve hot."
    ],
  ),
  Recipe(
    name: "Pasta",
    image:
        "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9",
    ingredients: [
      "Pasta",
      "Milk",
      "Cheese",
      "Garlic",
      "Butter"
    ],
    steps: [
      "Boil pasta.",
      "Prepare white sauce.",
      "Add cheese and garlic.",
      "Mix with pasta.",
      "Serve hot."
    ],
  ),
  Recipe(
    name: "Burger",
    image:
        "https://images.unsplash.com/photo-1568901346375-23c9450c58cd",
    ingredients: [
      "Burger Bun",
      "Patty",
      "Cheese",
      "Lettuce",
      "Tomato"
    ],
    steps: [
      "Cook the patty.",
      "Toast the buns.",
      "Add vegetables.",
      "Place cheese and patty.",
      "Serve."
    ],
  ),
  Recipe(
    name: "Pizza",
    image:
        "https://images.unsplash.com/photo-1513104890138-7c749659a591",
    ingredients: [
      "Pizza Dough",
      "Cheese",
      "Tomato Sauce",
      "Vegetables"
    ],
    steps: [
      "Prepare pizza base.",
      "Spread tomato sauce.",
      "Add toppings.",
      "Sprinkle cheese.",
      "Bake for 15 minutes."
    ],
  ),
  Recipe(
    name: "Fried Rice",
    image:
        "https://images.unsplash.com/photo-1603133872878-684f208fb84b",
    ingredients: [
      "Rice",
      "Carrot",
      "Beans",
      "Egg",
      "Soy Sauce"
    ],
    steps: [
      "Cook rice and cool.",
      "Saute vegetables.",
      "Add egg and scramble.",
      "Mix rice and soy sauce.",
      "Serve hot."
    ],
  ),
  Recipe(
    name: "Shawarma",
    image:
        "https://images.unsplash.com/photo-1529006557810-274b9b2fc783",
    ingredients: [
      "Chicken",
      "Pita Bread",
      "Mayonnaise",
      "Cabbage"
    ],
    steps: [
      "Grill chicken.",
      "Slice vegetables.",
      "Spread mayonnaise.",
      "Wrap in pita bread.",
      "Serve."
    ],
  ),
  Recipe(
    name: "Dosa",
    image:
        "https://images.unsplash.com/photo-1668236543090-82eba5ee5976",
    ingredients: [
      "Rice Batter",
      "Oil",
      "Potato Masala"
    ],
    steps: [
      "Heat dosa pan.",
      "Spread batter.",
      "Add oil.",
      "Cook until crispy.",
      "Serve with chutney."
    ],
  ),
  Recipe(
    name: "Idli",
    image:
        "https://images.unsplash.com/photo-1589302168068-964664d93dc0",
    ingredients: [
      "Rice Batter",
      "Sambar",
      "Coconut Chutney"
    ],
    steps: [
      "Pour batter into moulds.",
      "Steam for 10 minutes.",
      "Remove carefully.",
      "Serve with chutney and sambar."
    ],
  ),
  Recipe(
    name: "Chocolate Cake",
    image:
        "https://images.unsplash.com/photo-1578985545062-69928b1d9587",
    ingredients: [
      "Flour",
      "Sugar",
      "Eggs",
      "Cocoa Powder"
    ],
    steps: [
      "Mix ingredients.",
      "Prepare cake batter.",
      "Pour into baking tray.",
      "Bake for 35 minutes.",
      "Cool and serve."
    ],
  ),
  Recipe(
    name: "Ice Cream",
    image:
        "https://images.unsplash.com/photo-1563805042-7684c019e1cb",
    ingredients: [
      "Milk",
      "Cream",
      "Sugar",
      "Vanilla"
    ],
    steps: [
      "Mix all ingredients.",
      "Chill mixture.",
      "Freeze for several hours.",
      "Serve cold."
    ],
  ),
];

class RecipeListScreen extends StatelessWidget {
  const RecipeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe Browser"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];

          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            elevation: 4,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(recipe.image),
              ),
              title: Text(recipe.name),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        RecipeDetailScreen(recipe: recipe),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailScreen({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              recipe.image,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Ingredients",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  ...recipe.ingredients.map(
                    (ingredient) => ListTile(
                      leading: const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      title: Text(ingredient),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Preparation Steps",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  ...List.generate(
                    recipe.steps.length,
                    (index) => ListTile(
                      leading: CircleAvatar(
                        child: Text("${index + 1}"),
                      ),
                      title: Text(
                        recipe.steps[index],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}