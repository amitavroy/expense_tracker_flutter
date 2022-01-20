class Expense {
  final int id;
  final String description;
  final int userId;
  final int amount;
  final String createdAt;

  Expense({
    required this.id,
    required this.description,
    required this.userId,
    required this.amount,
    required this.createdAt,
  });

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
        id: json['id'],
        description: json['description'],
        userId: json['user_id'],
        amount: json['amount'],
        createdAt: json['created_at']);
  }
}
