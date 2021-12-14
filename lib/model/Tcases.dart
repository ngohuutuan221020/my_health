class Tcases{

  var cases;
  var todayCases;
  var deaths;
  var todayDeaths;
  var recovered;
  var todayRecovered;

  Tcases({
    this.cases,
    this.todayCases,
    this.deaths,
    this.recovered,
    this.todayDeaths,
    this.todayRecovered}
    );

  factory Tcases.fromJson(final json)

  {  return Tcases(
      cases: json["cases"],
      deaths: json["deaths"],
      recovered: json["recovered"],
      todayCases: json["todayCases"],
      todayDeaths: json["todayDeaths"],
      todayRecovered: json["todayRecovered"]);
  }
}