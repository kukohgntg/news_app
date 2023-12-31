// import 'package:berita_bola_app_bismilah/app/data/models/news_model.dart';
// import 'package:berita_bola_app_bismilah/app/modules/home/views/home_page.dart';
// import 'package:berita_bola_app_bismilah/app/data/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../article/views/article_view.dart';
import '../../models/article_model.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/custom_tag.dart';
import '../../widgets/image_container.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    Article article = Article.articles[0];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(index: 0),
      extendBodyBehindAppBar: true,
      body: Obx(() => homeController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              padding: EdgeInsets.zero,
              children: [
                _NewsOfTheDay(article: article),
                _BreakingNews(),
              ],
            )),
    );
  }
}

class _BreakingNews extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  // const _BreakingNews({
  //   Key? key,
  //   required this.articles,
  // }) : super(key: key);

  // final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Berita Hari Ini',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text('Lihat Semua', style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              // itemCount: articles.length,
              itemCount: homeController.newsArticles.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  margin: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {
                      // Navigator.pushNamed(
                      //   context,
                      //   ArticleView.routeName,
                      //   arguments: homeController,
                      // );
                      Get.to(
                        () => ArticleView(
                          title: homeController.newsArticles[index].title,
                          description:
                              homeController.newsArticles[index].description,
                          imageUrl:
                              homeController.newsArticles[index].urlToImage ??
                                  "",
                          author:
                              homeController.newsArticles[index].author ?? "",
                          publishedAt: homeController
                              .newsArticles[index].publishedAt
                              .toString(),
                          content: homeController.newsArticles[index].content,
                        ),
                      );
                    },
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImageContainer(
                            width: MediaQuery.of(context).size.width * 0.5,
                            // imageUrl: articles[index].imageUrl,
                            imageUrl:
                                homeController.newsArticles[index].urlToImage ??
                                    "",
                          ),
                          const SizedBox(height: 10),
                          Text(
                            // articles[index].title,
                            homeController.newsArticles[index].title,
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontWeight: FontWeight.bold, height: 1.5),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                              // '${DateTime.now().difference(articles[index].createdAt).inHours} jam yang lalu',
                              homeController.newsArticles[index].publishedAt
                                  .toString(),
                              style: Theme.of(context).textTheme.bodySmall),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                              // 'by ${articles[index].author}',
                              homeController.newsArticles[index].author ?? "",
                              style: Theme.of(context).textTheme.bodySmall),
                        ]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _NewsOfTheDay extends StatelessWidget {
  const _NewsOfTheDay(
      {
      // required this.newsArticle,
      required this.article});
  // final NewsArticle newsArticle;
  final Article article;

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      imageUrl: article.imageUrl,
      // newsArticle.urlToImage ?? "",
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTag(
              backgroundColor: Colors.grey.withAlpha(150),
              children: [
                Text(
                  'Berita Hari Ini',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              article.title,
              // newsArticle.title,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  height: 1.25,
                  color: Colors.white),
            ),
            TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: Row(
                  children: [
                    Text(
                      'Baca Semua',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.arrow_right_alt,
                      color: Colors.white,
                    )
                  ],
                )),
          ]),
    );
  }
}
