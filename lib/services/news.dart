import 'networking.dart';

const urlApi = 'https://hacker-news.firebaseio.com/v0/';
int title1 = 27818667;
const item = 'item/';
const user = 'user/';

class NewsModel {
  Future getNews() async {
    NetworkHelper networkHelper =
        NetworkHelper('$urlApi$item$title1.json?print=pretty');

    var newsData = await networkHelper.getData();
    print(newsData);
    return newsData;
  }
}
