class Part {

  String label;
  String image;

  Part({
    required this.label, required this.image
  });
}

List<Part> parts =
[
  Part(label: "أجهزة منزلية", image: "assets/images/اجهزة منزلية.svg"),
  Part(label: "غرف تبريد و تجميد", image: "assets/images/Group 1272.svg"),
  Part(label: "ثلاجات العرض", image: "assets/images/003-counter.svg"),
  Part(label: "تكييف مركزي", image: "assets/images/Group 1277.svg"),
  Part(label: "تبريد صناعي", image: "assets/images/تبريد صناعي.svg"),
  Part(label: "كنترول", image: "assets/images/كونترول.svg"),
];