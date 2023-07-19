class Plan
{
  int number;
  int price;
  List<int> options;

  Plan({
    required this.number,
    required this.price,
    required this.options
  });
}

List<Plan> plans =
[
  Plan(number: 1, price: 49, options: [1,2,3,4,5]),
  Plan(number: 2, price: 39, options: [3,4,5]),
  Plan(number: 3, price: 19, options: [5]),
  Plan(number: 4, price: 0, options: [5]),
];

List<String> planOptions=
[
  "استلام أي عدد من الطلبات",
  "الرجوع في استلام أي طلب",
  "اشعارات عند الطلبات الجديدة",
  "استلام أي عدد من الطلبات",
  "الرجوع في استلام أي طلب",

];