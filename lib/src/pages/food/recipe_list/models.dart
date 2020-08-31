class Recipe {
  final int id;
  final String title;
  final String image;
  final String category;
  final String calories;
  final String time;
  final String details;
  final String description;
  final List<String> steps;
  Recipe({
    this.id,
    this.title,
    this.image,
    this.category,
    this.calories,
    this.time,
    this.details,
    this.description,
    this.steps,
  });
}
