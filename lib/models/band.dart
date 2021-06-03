class Band {
  String? name;
  String? id;
  int? votes;

  Band({this.id, this.name, this.votes});

  factory Band.fromMap(Map<String, dynamic> obj) {
    return Band(
      id: obj['id'],
      name: obj['name'],
      votes: obj['votes'],
    );
  }
}
