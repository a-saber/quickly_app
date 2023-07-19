class Package {
  int price;
  String label;
  String hint;
  String desc;

  Package(
      {required this.price, required this.hint, required this.label, required this.desc});
}

List<Package> packages =
[
  Package(
      price: 75,
      hint: "",
      label: 'مراكز خدمة متخصصة',
      desc:  'مركز خدمة متخصص في كل اعطال الصيانة من أجهزة منزلية وغيرها . مركز خدمة متخصص موثوق فيه '),

  Package(
      price: 100,
      hint: "",
      label: 'مراكز خدمة معتمدة',
      desc: 'مركز خدمة معتمد  في كل اعطال الصيانة من أجهزة منزلية وغيرها . مركز خدمة متخصص موثوق فيه '),

  Package(
      price: 150,
      label: 'مراكز خدمة وكلاء تجاريين ',
      hint: '( أجهزة مستوردة )',
      desc: 'مركز خدمة للأجهزة المستوردة في كل اعطال الصيانة من أجهزة منزلية وغيرها . مركز خدمة متخصص موثوق فيه '),
  Package(
      price: 125,
      label: 'مراكز خدمة وكلاء تجاريين ',
      hint: '( صناعة مصرية )',
      desc: 'مركز خدمة للصناعة المصرية في كل اعطال الصيانة من أجهزة منزلية وغيرها . مركز خدمة متخصص موثوق فيه '),
];