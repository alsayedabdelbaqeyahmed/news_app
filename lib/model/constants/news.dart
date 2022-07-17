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
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        constr.maxWidth * 0.02,
                      ),
                      child: newsData![index][conurlToImage] != null
                          ? Image.network(
                              newsData![index][conurlToImage]!,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              'http://www.nftitalia.com/wp-content/uploads/2017/07/news-1-1600x429.jpg',
                              fit: BoxFit.contain,
                            ),
                    ),
                  ),
                  SizedBox(width: constr.maxWidth * 0.04),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: constr.maxHeight * 0.21,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              newsData![index][contitle],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: Theme.of(context).textTheme.bodyText1,
                              // textDirection: TextDirection.rtl,
                            ),
                          ),
                          Text(
                            newsData![index][conPubloshedTime],
                            overflow: TextOverflow.ellipsis,
                            // textDirection: TextDirection.rtl,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
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
