class Balance {
  final double amount;

  const Balance({required this.amount});

  Balance copyWith({double? amount}) {
    return Balance(
      amount: amount ?? this.amount,
    );
  }
}
