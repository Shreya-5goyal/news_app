

import 'package:news_app/news_channels_headlines_models.dart';
import 'package:news_app/news_repository.dart';

class NewsViewModel{
  final _rep=NewsRepository();


  Future<NewsChannelsHeadlinesModel>fetchNewsChannelHeadLinesApi()async{
  final response=await  _rep.fetchNewChannelHeadlinesApi();
  return response;
  }
}