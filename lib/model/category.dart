
class Category {
  final String text;

  bool isChecked=false;


  Category( {required this.text});

}

List<Category> category = [
  Category
    (
    text: "All",
  ), 
  Category
    (
    text: "Dentist",
  ),
  Category
    (
    text: "Cardiologist",
  ),
  Category
    (
    text: "Neurologist",
  ),
  Category
    (
    text: "Skin Care",
  ),
];
