class BandModel {
  String id;
  String name;
  int votes;

  BandModel({this.id, this.name, this.votes = 0});

  factory BandModel.fromMap(Map obj) =>
      BandModel(id: obj['id'], name: obj['name'], votes: obj['votes']);

  String initialName() => this.name.substring(0, 1).toUpperCase();

  static List<BandModel> bandFromMapList(List mapList) =>
      mapList.map((e) => BandModel.fromMap(e)).toList();
}
