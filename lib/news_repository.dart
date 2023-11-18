import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:news_app/news_channels_headlines_models.dart';
class NewsRepository{
  Future<NewsChannelsHeadlinesModel>fetchNewChannelHeadlinesApi()async
  {
    String url='https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=b214543fd5d34c7284340dacc5e04492';
    final response= await http.get(Uri.parse(url));

    if(response.statusCode==200){
      final body =jsonDecode(response.body);
      return NewsChannelsHeadlinesModel.fromJson(body);
    }
    throw Exception('Error');
  }
}