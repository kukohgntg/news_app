import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/models/news_model.dart';
// import '../../article/views/article_view.dart';
// import '../../models/article_model.dart';
import '../../widgets/bottom_nav_bar.dart';
// import '../../widgets/image_container.dart';
import '../controllers/discover_controller.dart';

class DiscoverView extends GetView<NewsController> {
  // const DiscoverView({Key? key}) : super(key: key);
  final NewsController newsController = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(index: 0),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Column(
          children: [
            _DiscoverNews(),
            _buildCategories(),
            Expanded(
              child: Obx(() {
                if (newsController.future.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return _buildNewsListView(newsController.future);
                }
              }),
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
                backgroundColor: MaterialStateProperty.all<Color>(
                  Get.find<NewsController>().selectedCategory.value ==
                          Get.find<NewsController>().categoryItems[index]
                      ? Colors.green.withOpacity(0.5)
                      : Colors.green,
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
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: Image.network(
                  article.urlToImage ?? "",
                  fit: BoxFit.fitHeight,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.image_not_supported);
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title!,
                      maxLines: 2,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      article.source.name!,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget build(BuildContext context) {
  //   List<String> tabs = [
  //     'Liga 1',
  //     'Indonesia',
  //     'Piala Dunia',
  //     'Inggris',
  //     'Spanyol',
  //     'Dunia'
  //   ];
  //   return DefaultTabController(
  //     initialIndex: 0,
  //     length: tabs.length,
  //     child: Scaffold(
  // appBar: AppBar(
  //   backgroundColor: Colors.transparent,
  //   elevation: 0,
  //   leading: IconButton(
  //     onPressed: () {},
  //     icon: const Icon(
  //       Icons.menu,
  //       color: Colors.black,
  //     ),
  //   ),
  // ),
  //       bottomNavigationBar: const BottomNavBar(index: 1),
  //       body: ListView(
  //         padding: const EdgeInsets.all(20.0),
  //         children: [
  //           const _DiscoverNews(),
  //           // _CategoryNews(tabs: tabs),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

// class _CategoryNews extends StatelessWidget {
//   const _CategoryNews({
//     Key? key,
//     required this.tabs,
//   }) : super(key: key);

//   final List<String> tabs;
//   @override
//   Widget build(BuildContext context) {
//     final articles = Article.articles;
//     return Column(
//       children: [
//         TabBar(
//           isScrollable: true,
//           indicatorColor: Colors.black,
//           tabs: tabs
//               .map((tab) => Tab(
//                     icon: Text(
//                       tab,
//                       style: Theme.of(context)
//                           .textTheme
//                           .headlineSmall!
//                           .copyWith(fontWeight: FontWeight.bold),
//                     ),
//                   ))
//               .toList(),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height,
//           child: TabBarView(
//             children: tabs
//                 .map(
//                   (tab) => ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: articles.length,
//                     itemBuilder: ((context, index) {
//                       return InkWell(
//                         onTap: () {
//                           // Navigator.pushNamed(
//                           //   context,
//                           //   ArticleScreen.routeName,
//                           //   arguments: articles[index],
//                           // );
//                           // Navigator.pushNamed(
//                           //   context,
//                           //   ArticleView.routeName,
//                           //   arguments: articles[index],
//                           // );
//                         },
//                         child: Row(
//                           children: [
//                             ImageContainer(
//                               width: 80,
//                               height: 80,
//                               margin: const EdgeInsets.all(10.0),
//                               borderRadius: 5,
//                               imageUrl: articles[index].imageUrl,
//                             ),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     articles[index].title,
//                                     maxLines: 2,
//                                     overflow: TextOverflow.clip,
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodyLarge!
//                                         .copyWith(fontWeight: FontWeight.bold),
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   Row(
//                                     children: [
//                                       const Icon(
//                                         Icons.schedule,
//                                         size: 18,
//                                       ),
//                                       const SizedBox(
//                                         width: 5,
//                                       ),
//                                       Text(
//                                         '${DateTime.now().difference(articles[index].createdAt).inHours} jam yang lalu',
//                                         style: const TextStyle(fontSize: 12),
//                                       ),
//                                       const SizedBox(
//                                         width: 20,
//                                       ),
//                                       const Icon(
//                                         Icons.visibility,
//                                         size: 18,
//                                       ),
//                                       const SizedBox(
//                                         width: 5,
//                                       ),
//                                       Text(
//                                         '${articles[index].views} dilihat',
//                                         style: const TextStyle(fontSize: 12),
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     }),
//                   ),
//                 )
//                 .toList(),
//           ),
//         )
//       ],
//     );
//   }
// }

class _DiscoverNews extends StatelessWidget {
  const _DiscoverNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
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
