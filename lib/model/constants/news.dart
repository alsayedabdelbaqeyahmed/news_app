import 'package:flutter/material.dart';
import 'package:news_app/model/constants/constants.dart';

class News extends StatelessWidget {
  final List<dynamic>? newsData;
  final int? index;

  const News({Key? key, this.newsData, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constr) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsetsDirectional.only(
                start: constr.maxWidth * 0.02,
                end: constr.maxWidth * 0.01,
                bottom: constr.maxHeight * 0.005,
                top: constr.maxHeight * 0.008,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: constr.maxHeight * 0.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(
                              newsData![index][contitle],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                              style: TextStyle(
                                fontSize: constr.maxHeight * 0.035,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                          Text(
                            newsData![index][conPubloshedTime],
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontSize: constr.maxHeight * 0.02,
                              color: Colors.grey,

                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: constr.maxWidth * 0.02),
                  Expanded(
                    child: SizedBox(
                      child: newsData![index][conurlToImage] != null
                          ? Image.network(
                              newsData![index][conurlToImage]!,
                              fit: BoxFit.fill,
                            )
                          : Image.network(
                              'http://www.nftitalia.com/wp-content/uploads/2017/07/news-1-1600x429.jpg',
                              fit: BoxFit.contain,
                            ),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Container(
              height: constr.maxHeight * 0.005,
              width: double.infinity,
              color: Colors.deepOrange.withOpacity(.2),
            );
          },
          itemCount: index!,
        );
      },
    );
  }
}
