class Transaction {
  final int id;
  final double amount;
  final String description;
  final DateTime date;
  final String category;

  Transaction({
    required this.id,
    required this.amount,
    required this.description,
    required this.date,
    required this.category,
  });

  // Convert a Transaction into a Map.
  Map<String, dynamic> toJson() => {
        'id': id,
        'amount': amount,
        'description': description,
        'date': date.toIso8601String(),
        'category': category,
      };

  // Create a Transaction from a Map.
  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      amount: (json['amount'] as num).toDouble(),
      description: json['description'],
      date: DateTime.parse(json['date']),
      category: json['category'],
    );
  }
}
