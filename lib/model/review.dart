
class Review {
  final String text;

  bool isChecked=false;


  Review( {required this.text});

}

List<Review> review = [
  Review
    (
    text: "Filter",
  ),
  Review
    (
    text: "Verified",
  ),
  Review
    (
    text: "Latest",
  ),
  Review
    (
    text: "With Photos",
  ),
  Review
    (
    text: "Details",
  ),
];
