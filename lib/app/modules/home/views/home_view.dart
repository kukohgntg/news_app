import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../article/views/article_view.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/custom_tag.dart';
import '../../widgets/image_container.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
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
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(index: 0),
      extendBodyBehindAppBar: true,
      body: Obx(() => Get.put(HomeController()).isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              padding: EdgeInsets.zero,
              children: [
                _NewsOfTheDay(),
                _BreakingNews(),
              ],
            )),
    );
  }
}

class _BreakingNews extends StatelessWidget {
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
              itemCount: Get.put(HomeController()).newsArticles.length,
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
                          title: Get.put(HomeController())
                              .newsArticles[index]
                              .title,
                          description: Get.put(HomeController())
                              .newsArticles[index]
                              .description,
                          imageUrl: Get.put(HomeController())
                                  .newsArticles[index]
                                  .urlToImage ??
                              "",
                          author: Get.put(HomeController())
                                  .newsArticles[index]
                                  .author ??
                              "",
                          publishedAt: Get.put(HomeController())
                              .newsArticles[index]
                              .publishedAt
                              .toString(),
                          content: Get.put(HomeController())
                              .newsArticles[index]
                              .content,
                        ),
                      );
                    },
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImageContainer(
                            width: MediaQuery.of(context).size.width * 0.5,
                            imageUrl: Get.put(HomeController())
                                    .newsArticles[index]
                                    .urlToImage ??
                                "",
                          ),
                          const SizedBox(height: 10),
                          Text(
                            Get.put(HomeController()).newsArticles[index].title,
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
                              Get.put(HomeController())
                                  .newsArticles[index]
                                  .publishedAt
                                  .toString(),
                              style: Theme.of(context).textTheme.bodySmall),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                              Get.put(HomeController())
                                      .newsArticles[index]
                                      .author ??
                                  "",
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
  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      imageUrl: Get.put(HomeController()).newsArticles[0].urlToImage.toString(),
      // article.imageUrl,
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
              Get.put(HomeController()).newsArticles[0].title,
              // article.title,
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
