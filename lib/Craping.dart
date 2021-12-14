import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

String result1 = '-';
String result2 = '-';
String result3 = '-';
String result4 = '-';

String result00 = '-';
String result01 = '-';
String result02 = '-';
String result03 = '-';
String result04 = '-';
//1
String result10 = '-';
String result11 = '-';
String result12 = '-';
String result13 = '-';
String result14 = '-';
//2
String result20 = '-';
String result21 = '-';
String result22 = '-';
String result23 = '-';
String result24 = '-';
//3
String result30 = '-';
String result31 = '-';
String result32 = '-';
String result33 = '-';
String result34 = '-';
//4
String result40 = '-';
String result41 = '-';
String result42 = '-';
String result43 = '-';
String result44 = '-';
//5
String result50 = '-';
String result51 = '-';
String result52 = '-';
String result53 = '-';
String result54 = '-';
bool isLoading = false;

Future<List<String>> extractData() async {
  final response =
  await http.Client().get(Uri.parse('https://www.24h.com.vn/tong-hop-so-lieu-dich-covid-19-c972.html'));
  if (response.statusCode == 200) {
    var document = parser.parse(response.body);
    try {
      var responseString1 = document.getElementsByClassName('fixed-2 active')[0].getElementsByTagName("th")[3].text;
      print(responseString1.toString());
      var responseString2 = document.getElementsByClassName('fixed-2 active')[0].getElementsByTagName("th")[4].text;
      print(responseString2.toString());
      var responseString3 = document.getElementsByClassName('fixed-2 active')[0].getElementsByTagName("th")[2].text;
      print(responseString3.toString());
      var responseString4 = document.getElementsByClassName('page-cv19-cap__chart margin-bottom-20')[0].text;
      print(responseString4.toString());
      //0
      var responseString00 = document.getElementsByClassName('table_covid')[0].children[0].children[0].text;
      print(responseString00.toString());
      var responseString01 = document.getElementsByClassName('table_covid')[0].children[0].children[1].text;
      print(responseString01.toString());
      var responseString02 = document.getElementsByClassName('table_covid')[0].children[0].children[3].text;
      print(responseString02.toString());
      var responseString03 = document.getElementsByClassName('table_covid')[0].children[0].children[4].text;
      print(responseString03.toString());
      var responseString04 = document.getElementsByClassName('table_covid')[0].children[0].children[2].text;
      print(responseString04.toString());
      //1
      var responseString10 = document.getElementsByClassName('table_covid')[0].children[1].children[0].text;
      print(responseString10.toString());
      var responseString11 = document.getElementsByClassName('table_covid')[0].children[1].children[1].text;
      print(responseString11.toString());
      var responseString12 = document.getElementsByClassName('table_covid')[0].children[1].children[3].text;
      print(responseString12.toString());
      var responseString13 = document.getElementsByClassName('table_covid')[0].children[1].children[4].text;
      print(responseString13.toString());
      var responseString14 = document.getElementsByClassName('table_covid')[0].children[1].children[2].text;
      print(responseString14.toString());
      //2
      var responseString20 = document.getElementsByClassName('table_covid')[0].children[2].children[0].text;
      print(responseString20.toString());
      var responseString21 = document.getElementsByClassName('table_covid')[0].children[2].children[1].text;
      print(responseString21.toString());
      var responseString22 = document.getElementsByClassName('table_covid')[0].children[2].children[3].text;
      print(responseString22.toString());
      var responseString23 = document.getElementsByClassName('table_covid')[0].children[2].children[4].text;
      print(responseString23.toString());
      var responseString24 = document.getElementsByClassName('table_covid')[0].children[2].children[2].text;
      print(responseString24.toString());
      //3
      var responseString30 = document.getElementsByClassName('table_covid')[0].children[3].children[0].text;
      print(responseString30.toString());
      var responseString31 = document.getElementsByClassName('table_covid')[0].children[3].children[1].text;
      print(responseString31.toString());
      var responseString32 = document.getElementsByClassName('table_covid')[0].children[3].children[3].text;
      print(responseString32.toString());
      var responseString33 = document.getElementsByClassName('table_covid')[0].children[3].children[4].text;
      print(responseString33.toString());
      var responseString34 = document.getElementsByClassName('table_covid')[0].children[0].children[2].text;
      print(responseString34.toString());
      //4
      var responseString40 = document.getElementsByClassName('table_covid')[0].children[4].children[0].text;
      print(responseString40.toString());
      var responseString41 = document.getElementsByClassName('table_covid')[0].children[4].children[1].text;
      print(responseString41.toString());
      var responseString42 = document.getElementsByClassName('table_covid')[0].children[4].children[3].text;
      print(responseString42.toString());
      var responseString43 = document.getElementsByClassName('table_covid')[0].children[4].children[4].text;
      print(responseString43.toString());
      var responseString44 = document.getElementsByClassName('table_covid')[0].children[4].children[2].text;
      print(responseString44.toString());
      //5
      var responseString50 = document.getElementsByClassName('table_covid')[0].children[5].children[0].text;
      print(responseString50.toString());
      var responseString51 = document.getElementsByClassName('table_covid')[0].children[5].children[1].text;
      print(responseString51.toString());
      var responseString52 = document.getElementsByClassName('table_covid')[0].children[5].children[3].text;
      print(responseString52.toString());
      var responseString53 = document.getElementsByClassName('table_covid')[0].children[5].children[4].text;
      print(responseString53.toString());
      var responseString54 = document.getElementsByClassName('table_covid')[0].children[5].children[2].text;
      print(responseString54.toString());


      return [
        responseString1.toString(),
        responseString2.toString(),
        responseString3.toString(),
        responseString4.toString(),
        //0
        responseString00.toString(),
        responseString01.toString(),
        responseString02.toString(),
        responseString03.toString(),
        responseString04.toString(),
        //1
        responseString10.toString(),
        responseString11.toString(),
        responseString12.toString(),
        responseString13.toString(),
        responseString14.toString(),
        //2
        responseString20.toString(),
        responseString21.toString(),
        responseString22.toString(),
        responseString23.toString(),
        responseString24.toString(),
        //3
        responseString30.toString(),
        responseString31.toString(),
        responseString32.toString(),
        responseString33.toString(),
        responseString34.toString(),
        //4
        responseString40.toString(),
        responseString41.toString(),
        responseString42.toString(),
        responseString43.toString(),
        responseString44.toString(),
        //5
        responseString50.toString(),
        responseString51.toString(),
        responseString52.toString(),
        responseString53.toString(),
        responseString54.toString(),
      ];
    } catch (e) {
      return ['', '', '!'];
    }
  } else {
    return ['', '', ': ${response.statusCode}.'];
  }
}
