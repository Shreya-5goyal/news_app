import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/news_channels_headlines_models.dart';
import 'package:news_app/news_view_model.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsViewModel newsViewModel = NewsViewModel();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .sizeOf(context)
        .width * 1;
    final height = MediaQuery
        .sizeOf(context)
        .height * 1;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {

          },
              icon: Image.asset('assets/category_icon.png',
                height: 30,
                width: 30,)),
          title: Text('News',
            style: GoogleFonts.poppins(
                fontSize: 24, fontWeight: FontWeight.bold),),
        ),
        body: ListView(
          children: [
            SizedBox(height: height * 0.55,
              width: width,
              child: FutureBuilder<NewsChannelsHeadlinesModel>(
                  future: newsViewModel.fetchNewsChannelHeadLinesApi(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: SpinKitCircle(
                          size: 40,
                          color: Colors.blue,
                        ),
                      );
                    }
                    else {
                      return ListView.builder(
                          itemCount: snapshot.data!.articles!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              child: Stack(
                                alignment: Alignment.center,
                                children:[
                                Container(
                                  height:height*0.6,
                                  width: width*0.9,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: height*0.02,
                                  ),
                                  child:ClipRRect(
                                    borderRadius: BorderRadius.circular(15),

                                  child: CachedNetworkImage(
                                      imageUrl: snapshot.data!.articles![index]
                                          .urlToImage.toString(),
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          Container(child: spinKit2,),
                                      errorWidget: (context, url, error) =>
                                          Icon(
                                            Icons.error_outline,
                                            color: Colors.red,)
                                  ),
                                ),
                                ),
                                    Positioned(
                                      bottom: 20,
                                      child: Card(
                                        elevation: 5,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),

                                        ),
                                        child: Container(
                                          alignment: Alignment.bottomCenter,
                                          height: height*0.22,
                                          
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: width*0.7,
                                                child: Text(snapshot.data!.articles![index].title.toString(),
                                                           overflow:TextOverflow.ellipsis,style:
                                                            GoogleFonts.poppins(fontSize: 17,fontWeight: FontWeight.w700),),
                                              ) ,
                                              Spacer(),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Text(snapshot.data!.articles![index].source.toString(),
                                                        overflow:TextOverflow.ellipsis,style:

                                                        GoogleFonts.poppins(fontSize: 17,fontWeight: FontWeight.w700),),
                                                    Text(snapshot.data!.articles![index].source.toString(),
                                                    overflow:TextOverflow.ellipsis,style:
                                                  GoogleFonts.poppins(fontSize: 17,fontWeight: FontWeight.w700),),
                                        ],
                                      ),
                                      ),
                                             ],
                                          ),
                                        ),
                                      ),
                                    )
                                ],
                              ),
                            );
                          }
                      );
                    }
                  }
              ),
            ),
          ],
        )
    );
  }
}
    const spinKit2=SpinKitFadingCircle(
      color: Colors.amber,
      size: 50,
    );


