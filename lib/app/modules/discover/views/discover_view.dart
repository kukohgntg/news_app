import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/news_model.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/image_container.dart';
import '../controllers/discover_controller.dart';

class DiscoverView extends GetView<NewsController> {
  // const DiscoverView({Key? key}) : super(key: key);
  final NewsController newsController = Get.put(NewsController());

  DiscoverView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: IconButton(
      //     onPressed: () {},
      //     icon: const Icon(
      //       Icons.menu,
      //       color: Colors.transparent,
      //     ),
      //   ),
      // ),

      bottomNavigationBar: const BottomNavBar(index: 1),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        minimum: const EdgeInsets.all(15),
        child: Column(
          children: [
            const _DiscoverNews(),
            _buildCategories(),
            Expanded(
              child: Obx(() => (newsController.future.isEmpty)
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : _buildNewsListView(newsController.future)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () {
                Get.find<NewsController>().changeCategory(
                    Get.find<NewsController>().categoryItems[index]);
              },
              style: ButtonStyle(
                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Get.find<NewsController>().selectedCategory.value ==
                          Get.find<NewsController>().categoryItems[index]
                      ? Colors.black
                      : Colors.grey,
                ),
              ),
              child: Text(Get.find<NewsController>().categoryItems[index]),
            ),
          );
        },
        itemCount: Get.find<NewsController>().categoryItems.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget _buildNewsListView(RxList<Article> articleList) {
    return ListView.builder(
      padding: EdgeInsets.all(8.0),
      itemBuilder: (context, index) {
        Article article = articleList[index];
        return _buildNewsItem(article);
      },
      itemCount: articleList.length,
    );
  }

  Widget _buildNewsItem(Article article) {
    return InkWell(
      onTap: () {
        // Get.to(NewsWebView(url: article.url!));
      },
      child: Row(
        children: [
          ImageContainer(
            width: 80,
            height: 80,
            margin: const EdgeInsets.all(5.0),
            borderRadius: 5,
            imageUrl: article.urlToImage.toString(),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  article.title.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  // style: Theme.of(context)
                  //     .textTheme
                  //     .bodyLarge!
                  //     .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.account_circle_outlined,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(article.author.toString()
                        // '${DateTime.now().difference(articles[index].createdAt).inHours} jam yang lalu',
                        // style: const TextStyle(fontSize: 12),
                        ),
                    const SizedBox(
                      width: 20,
                    ),
                    // const Icon(
                    //   Icons.visibility,
                    //   size: 18,
                    // ),
                    // const SizedBox(
                    //   width: 5,
                    // ),
                    // Text(
                    //   '${articles[index].views} dilihat',
                    //   style: const TextStyle(fontSize: 12),
                    // ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      // child: Card(
      //   elevation: 4,
      //   child: Padding(
      //     padding: const EdgeInsets.all(8),
      //     child: Row(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         SizedBox(
      //           height: 80,
      //           width: 80,
      //           child: Image.network(
      //             article.urlToImage ?? "",
      //             fit: BoxFit.fitHeight,
      //             errorBuilder: (context, error, stackTrace) {
      //               return const Icon(Icons.image_not_supported);
      //             },
      //           ),
      //         ),
      //         const SizedBox(width: 20),
      //         Expanded(
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Text(
      //                 article.title!,
      //                 maxLines: 2,
      //                 style: const TextStyle(
      //                   fontWeight: FontWeight.bold,
      //                   fontSize: 18,
      //                 ),
      //               ),
      //               Text(
      //                 article.source.name!,
      //                 style: const TextStyle(color: Colors.grey),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
    );
  }
}

class _DiscoverNews extends StatelessWidget {
  const _DiscoverNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Pencarian',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Colors.black, fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Semua berita bola',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Cari',
                fillColor: Colors.grey.shade200,
                filled: true,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const RotatedBox(
                  quarterTurns: 1,
                  child: Icon(
                    Icons.tune,
                    color: Colors.grey,
                  ),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none)),
          )
        ],
      ),
    );
  }
}
