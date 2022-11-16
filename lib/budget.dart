class Budget {
  static List<Budget> budgetList = [];
  String judul;
  int nominal;
  String jenis;
  DateTime date;

  Budget(
      {required this.judul,
      required this.nominal,
      required this.jenis,
      required this.date});

  static void addBudget(Budget budget) {
    budgetList.add(budget);
  }
}
