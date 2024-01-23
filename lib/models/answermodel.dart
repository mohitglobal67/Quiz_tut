class MonthModel {
  String? name;
  int? id;

  MonthModel({
    this.name,
    this.id,
  });
}

List<MonthModel> months = [
  MonthModel(
    id: 0,
    name: 'A',
  ),
  MonthModel(
    id: 1,
    name: 'B ',
  ),
  MonthModel(
    id: 2,
    name: 'C',
  ),
  MonthModel(
    id: 3,
    name: 'D',
  ),
];
