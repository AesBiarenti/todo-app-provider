class Todo {
  Todo({
    required this.id,
    required this.text,
    this.isChecked = false,
  });
  final String id;
  final String text;
  final bool isChecked;
  @override
  String toString() {
    return "$id $text $isChecked";
  }
}
