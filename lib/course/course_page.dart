import 'package:flutter/material.dart';
import 'package:tuto/main.dart';

class CoursePage extends StatelessWidget {
  final CourseData courseData;
  const CoursePage({super.key, required this.courseData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverResizingHeader(
            minExtentPrototype: Image.network(
              "https://github.com/SampathBalivada.png",
              height: 168,
            ),
            maxExtentPrototype: Image.network(
              "https://github.com/SampathBalivada.png",
              height: 356,
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Stack(
                children: [
                  Image.network(
                    courseData.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          courseData.title,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: Colors.white,
                              ),
                        ),
                        Text(
                          "Subtitle",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        Chip(
                          label: Text("Add to my wishlist"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Column(
                children: [
                  Text(
                    "Section Title",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                      "Supporting line text lorem ipsum dolor sit amet, consectetur."),
                ],
                mainAxisSize: MainAxisSize.min,
              ),
            ),
          ),
          SliverList.separated(
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Scaffold(
                            body: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    "https://lh3.googleusercontent.com/QbTk_9UjQZGFd_DBTzC5CCcnGaUXlkpAVW0RLPr5gODeY4NpTkzJScHb122tpk0dJSDlcYLUac_vCyVo9wIuWkk9dnBczbPGIlQg=w1064-v0",
                                    height: 96,
                                    width: 96,
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text("Lorem ipsum dolor amet"),
                                  Text(
                                      "${courseData.title} • ₹₹ • 1.2 miles away  "),
                                  Text(
                                    "Supporting line text lorem ipsum dolor sit amet, consectetur.",
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  Divider(),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    "Instructor notes",
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  SizedBox(
                                    height: 24,
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris consectetur leo id odio egestas gravida.\n\nMorbi felis odio, tincidunt id enim quis, posuere laoreet dolor. Maecenas sagittis feugiat sem, sed porta diam blandit at.\n\nVestibulum auctor et ex non tempus.\n\nNunc finibus, ex vel tempor lobortis, lorem dui iaculis lacus, vel ullamcorper libero risus a ante. In elementum lectus congue nunc bibendum consectetur sed eu justo. Ut vehicula euismod mauris, nec mollis nisl vestibulum dapibus. Nulla porta eros id dolor vestibulum porttitor.",
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  Divider(),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    "Course content",
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  SizedBox(
                                    height: 24,
                                  ),
                                  Flexible(
                                    child: ListView.builder(
                                      itemBuilder: (context, index) {
                                        return Text(
                                          "${index}. Lorem ipsum dolor sit amet",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        );
                                      },
                                      shrinkWrap: true,
                                      primary: false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )));
                },
                title: Row(
                  children: [
                    Text("Lorem ipsum dolor amet"),
                    Spacer(),
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star_outline),
                    SizedBox(width: 8),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.favorite_border)),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Category • ₹₹ • 1.2 miles away  "),
                    Text(
                      "Supporting line text lorem ipsum dolor sit amet, consectetur.",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
                leading: Image.network(
                  "https://lh3.googleusercontent.com/QbTk_9UjQZGFd_DBTzC5CCcnGaUXlkpAVW0RLPr5gODeY4NpTkzJScHb122tpk0dJSDlcYLUac_vCyVo9wIuWkk9dnBczbPGIlQg=w1064-v0",
                  height: 48,
                  width: 48,
                ),
              );
            },
            separatorBuilder: (context, _) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(),
              );
            },
            itemCount: 15,
          )
        ],
      ),
    );
  }
}
