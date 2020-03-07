class Area {
  final String county;
  final int infected;
  final int dead;
  final int recovered;

  Area({this.county, this.infected, this.dead, this.recovered});

  factory Area.fromJson(Map<String, dynamic> json) {
    return Area(
      county: json['county'],
      infected: json['infected'],
      dead: json['dead'],
      recovered: json['recovered']
    );
  }
}