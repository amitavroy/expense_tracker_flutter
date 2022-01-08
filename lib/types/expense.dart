class Expense {
  final int id;
  final String name;

  Expense({
    required this.id,
    required this.name,
  });

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(id: json['id'], name: json['name']);
  }
}
