
class Filter {
  final String text;

  bool isChecked=false;


  Filter( {required this.text});

}

List<Filter> filter = [
  Filter
    (
    text: "All",
  ),
  Filter
    (
    text: "General",
  ),
  Filter
    (
    text: "Dentist",
  ),
  Filter
    (
    text: "Orthopedic",
  ),
];
