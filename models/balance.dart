class Balance {
  final double amount;

  Balance({required this.amount});

  Balance copyWith({double? amount}) {
    return Balance(amount: amount ?? this.amount);
  }
}
