import 'package:flutter/material.dart';
import '../../widgets/custom_tag.dart';
import '../../widgets/image_container.dart';
// import 'package:get/get.dart';
// import '../../models/article_model.dart';
// import '../controllers/article_controller.dart';

class ArticleView extends StatefulWidget {
  final String title;
  final String description;
  final String publishedAt;
  final String author;
  final String imageUrl;
  final String content;
  const ArticleView(
      {super.key,
      required this.title,
      required this.description,
      required this.publishedAt,
      required this.author,
      required this.imageUrl,
      required this.content});

  @override
  State<ArticleView> createState() => _ArticleView();
}

class _ArticleView extends State<ArticleView> {
  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      width: double.infinity,
      // imageUrl: article.imageUrl,
      imageUrl: widget.imageUrl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: ListView(
          children: [
            // _NewsHeadLine(
            //   article: article,
            // ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  CustomTag(
                    backgroundColor: Colors.grey.withAlpha(150),
                    children: [
                      Text(
                        // article.category,
                        widget.author,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    // article.title,
                    widget.title,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.25,
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    // article.subtitle,
                    widget.description,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  )
                ],
              ),
            ),
            // _NewsBody(
            //   article: article,
            // ),
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomTag(backgroundColor: Colors.black, children: [
                        const CircleAvatar(
                          radius: 10,
                          backgroundImage: NetworkImage(
                              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                          // backgroundImage: NetworkImage(article.authorImageUrl),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          // article.category,
                          widget.author.length > 10
                              ? '${widget.author.substring(0, 10)}...'
                              : widget.author,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.white),
                        )
                      ]),
                      const SizedBox(
                        width: 10,
                      ),
                      CustomTag(
                          backgroundColor: Colors.grey.shade200,
                          children: [
                            const Icon(
                              Icons.date_range_outlined,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                                // '${DateTime.now().difference(article.createdAt).inHours} jam yang lalu',
                                widget.publishedAt.length > 5
                                    ? '${widget.publishedAt.substring(0, 10)}...'
                                    : widget.publishedAt,
                                style: Theme.of(context).textTheme.bodyMedium!)
                          ]),
                      const SizedBox(
                        width: 10,
                      ),
                      // CustomTag(
                      //     backgroundColor: Colors.grey.shade200,
                      //     children: [
                      //       const Icon(
                      //         Icons.remove_red_eye,
                      //         color: Colors.grey,
                      //       ),
                      //       const SizedBox(
                      //         width: 10,
                      //       ),
                      //       Text(
                      //           // '${article.views}',
                      //           widget.author,
                      //           style: Theme.of(context).textTheme.bodyMedium!)
                      //     ]),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                      // article.title,
                      widget.title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                      // article.body,
                      widget.content,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(height: 1.5)),
                  const SizedBox(
                    height: 20,
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      itemCount: 2,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1.25),
                      itemBuilder: (context, index) {
                        return ImageContainer(
                          width: MediaQuery.of(context).size.width * 0.42,
                          imageUrl:
                              // article.imageUrl,
                              widget.imageUrl,
                          margin:
                              const EdgeInsets.only(right: 5.0, bottom: 5.0),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class _NewsBody extends StatelessWidget {
//   const _NewsBody({
//     Key? key,
//     required this.article,
//   }) : super(key: key);

//   final Article article;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20.0),
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
//         color: Colors.white,
//       ),
//       child: Column(children: [
//         Row(
//           children: [
//             CustomTag(backgroundColor: Colors.black, children: [
//               CircleAvatar(
//                 radius: 10,
//                 // backgroundImage: NetworkImage(a),
//                 backgroundImage: NetworkImage(article.authorImageUrl),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               Text(
//                 article.category,
//                 style: Theme.of(context)
//                     .textTheme
//                     .bodyMedium!
//                     .copyWith(color: Colors.white),
//               )
//             ]),
//             const SizedBox(
//               width: 10,
//             ),
//             CustomTag(backgroundColor: Colors.grey.shade200, children: [
//               const Icon(
//                 Icons.timer,
//                 color: Colors.grey,
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               Text(
//                   '${DateTime.now().difference(article.createdAt).inHours} jam yang lalu',
//                   style: Theme.of(context).textTheme.bodyMedium!)
//             ]),
//             const SizedBox(
//               width: 10,
//             ),
//             CustomTag(backgroundColor: Colors.grey.shade200, children: [
//               const Icon(
//                 Icons.remove_red_eye,
//                 color: Colors.grey,
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               Text('${article.views}',
//                   style: Theme.of(context).textTheme.bodyMedium!)
//             ]),
//           ],
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         Text(article.title,
//             style: Theme.of(context)
//                 .textTheme
//                 .headlineSmall!
//                 .copyWith(fontWeight: FontWeight.bold)),
//         const SizedBox(
//           height: 20,
//         ),
//         Text(article.body,
//             textAlign: TextAlign.justify,
//             style:
//                 Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.5)),
//         const SizedBox(
//           height: 20,
//         ),
//         GridView.builder(
//             shrinkWrap: true,
//             itemCount: 2,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2, childAspectRatio: 1.25),
//             itemBuilder: (context, index) {
//               return ImageContainer(
//                 width: MediaQuery.of(context).size.width * 0.42,
//                 imageUrl: article.imageUrl,
//                 margin: const EdgeInsets.only(right: 5.0, bottom: 5.0),
//               );
//             }),
//       ]),
//     );
//   }
// }

// class _NewsHeadLine extends StatelessWidget {
//   const _NewsHeadLine({Key? key, required this.article}) : super(key: key);

//   final Article article;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.15,
//           ),
//           CustomTag(
//             backgroundColor: Colors.grey.withAlpha(150),
//             children: [
//               Text(
//                 article.category,
//                 style: Theme.of(context)
//                     .textTheme
//                     .bodyMedium!
//                     .copyWith(color: Colors.white),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Text(
//             article.title,
//             style: Theme.of(context).textTheme.headlineSmall!.copyWith(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                   height: 1.25,
//                 ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Text(
//             article.subtitle,
//             style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//           )
//         ],
//       ),
//     );
//   }
// }
