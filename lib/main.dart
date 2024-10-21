import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuto/course/course_page.dart';

void main() {
  runApp(const MyApp());
}

class NavigationDestinationData {
  final String label;
  final IconData icon;
  final IconData? selectedIcon;
  NavigationDestinationData({
    required this.label,
    required this.icon,
    this.selectedIcon,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final destinations = [
    NavigationDestinationData(
        label: "Home",
        icon: Icons.home_outlined,
        selectedIcon: Icons.home_rounded),
    NavigationDestinationData(
        label: "Courses",
        icon: Icons.book_outlined,
        selectedIcon: Icons.book_rounded),
    NavigationDestinationData(
        label: "Community",
        icon: Icons.people_outline_rounded,
        selectedIcon: Icons.people_rounded),
  ];
  final courseCategory = CourseCategory("Sports", [
    CourseData("Cricket",
        "https://thegodofsports.com/wp-content/uploads/2023/04/istockphoto-621823884-612x612-1.jpg"),
  ]);
  @override
  Widget build(BuildContext context) {
    final courseCategories = [courseCategory, courseCategory, courseCategory];
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: constraints.maxWidth <= 600
              ? NavigationBar(
                  backgroundColor: Colors.white,
                  indicatorColor: Theme.of(context).colorScheme.primary,
                  destinations: destinations.map((e) {
                    return NavigationDestination(
                      label: e.label,
                      selectedIcon: IconButton(
                        color: Theme.of(context).colorScheme.onPrimary,
                        onPressed: () {},
                        icon: Icon(e.selectedIcon),
                      ),
                      icon: IconButton(
                        onPressed: () {},
                        icon: Icon(e.icon),
                      ),
                    );
                  }).toList())
              : null,
          body: Row(
            children: [
              constraints.maxWidth <= 1200 && constraints.maxWidth > 600
                  ? NavigationRail(
                      groupAlignment: 0,
                      backgroundColor: Colors.white,
                      destinations: destinations.map((e) {
                        return NavigationRailDestination(
                          label: Text(e.label),
                          icon: IconButton(
                            onPressed: () {},
                            icon: Icon(e.icon),
                          ),
                        );
                      }).toList(),
                      selectedIndex: 0)
                  : constraints.maxWidth > 1200
                      ? NavigationDrawer(
                          backgroundColor: Colors.white,
                          children: [
                              DrawerHeader(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Tuto",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                    ),
                                    Text(
                                      "Your path to learning new",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ],
                                ),
                              ),
                              ...(destinations.map((e) {
                                return NavigationDrawerDestination(
                                  label: Text(e.label),
                                  icon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(e.icon),
                                  ),
                                );
                              }))
                            ])
                      : const SizedBox(),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar.medium(
                      backgroundColor: Colors.white,
                      leading: const Icon(Icons.local_library),
                      title: Text(
                        "Welcome, User",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      bottom: PreferredSize(
                        preferredSize: Size(
                            constraints.maxWidth,
                            (Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.fontSize ??
                                    32) *
                                2),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0)
                              .copyWith(bottom: 12),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "What are we learning today?",
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                      ),
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.notifications),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.account_circle),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SliverToBoxAdapter(
                        child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: LearningCardView(
                          isCompact: constraints.maxWidth <= 800),
                    )),
                    SliverList.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CourseCategoryPager(
                              courseCategory: courseCategories[index]),
                        );
                      },
                      itemCount: courseCategories.length,
                    ),
                  ],
                ),
              ),
            ],
          ));
    });
  }
}

class CourseCategoryPager extends StatelessWidget {
  const CourseCategoryPager({
    super.key,
    required this.courseCategory,
  });

  final CourseCategory courseCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
              courseCategory.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            // SizedBox(
            //   width: 8,
            // ),
            Spacer(),
            Text("View All"),
            SizedBox(
              width: 12,
            ),
            Icon(
              Icons.arrow_forward,
              size: 16,
            ),
          ],
        ),
        SizedBox(
          height: 24,
        ),
        SizedBox(
          height: 144,
          child: ListView.separated(
            itemBuilder: (context, index) {
              final course = courseCategory.courses[index];
              return Column(
                children: [
                  ClipOval(
                    child: Image.network(
                      course.imageUrl,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    course.title,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              );
            },
            separatorBuilder: (context, _) {
              return const SizedBox(
                width: 48,
              );
            },
            itemCount: courseCategory.courses.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}

class CourseCategory {
  final String title;
  final List<CourseData> courses;
  const CourseCategory(this.title, this.courses);
}

class LearningCardView extends StatelessWidget {
  final bool isCompact;
  const LearningCardView({
    super.key,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    var titles = ["Guitar", "Cricket", "Acting", "Swimming", "Singing"];
    var listImages = [
      "https://wpriders.com/wp-content/uploads/2020/05/How-to-overcome-2-of-the-hardest-moments-in-working-with-a-WordPress-agency-and-get-better-results-1536x1025.webp",
      "https://thegodofsports.com/wp-content/uploads/2023/04/istockphoto-621823884-612x612-1.jpg",
      "https://sparksarts.co.uk/wp-content/uploads/2021/06/Acting-for-Camera-1.jpg",
      "https://clearcomfort.com/wp-content/uploads/2019/05/AdobeStock_34148619-1024x683.jpeg",
      "https://i.ytimg.com/vi/H5VuK3gFsOg/hq720.jpg?sqp=-oaymwE7CK4FEIIDSFryq4qpAy0IARUAAAAAGAElAADIQj0AgKJD8AEB-AH-CYAC0AWKAgwIABABGB0gWSh_MA8=&rs=AOn4CLC8iW_X9wUsEeRWgrhEgmt0UyzzQw",
      // "https://i.ytimg.com/vi/vulLAFfmXu0/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLA5xV5YihuPNtkpNPxj4l9wSidwyQ"
    ];
    var itemList = List.generate(
        titles.length, (index) => CourseData(titles[index], listImages[index]));
    return LayoutBuilder(builder: (context, constraints) {
      return StaggeredGrid.count(
        crossAxisCount: 12,
        children: [
          StaggeredGridTile.count(
            crossAxisCellCount: isCompact ? 12 : 7,
            mainAxisCellCount: 6,
            child: LearningCard(data: itemList[0], dense: isCompact),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: isCompact ? 3 : 2,
            mainAxisCellCount: 3,
            child: LearningCard(data: itemList[1], dense: isCompact),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 3,
            mainAxisCellCount: 3,
            child: LearningCard(data: itemList[2], dense: isCompact),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 3,
            mainAxisCellCount: 3,
            child: LearningCard(data: itemList[3], dense: isCompact),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: isCompact ? 3 : 2,
            mainAxisCellCount: 3,
            child: LearningCard(
              data: itemList[4],
              dense: isCompact,
            ),
          ),
        ],
      );
    });
  }
}

class CourseData {
  final String title;
  final String imageUrl;
  CourseData(this.title, this.imageUrl);
}

class LearningCard extends StatelessWidget {
  final CourseData data;
  final bool dense;
  const LearningCard({super.key, required this.data, this.dense = false});

  Future<ColorScheme> getBrightness(NetworkImage networkImage) async {
    final cs = await ColorScheme.fromImageProvider(provider: networkImage);
    return cs;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getBrightness(NetworkImage(data.imageUrl)),
        builder: (context, snapshot) {
          var cS = snapshot.hasData
              ? (snapshot.data ?? Theme.of(context).colorScheme)
              : Theme.of(context).colorScheme;
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CoursePage(
                    courseData: data,
                  ),
                ),
              );
            },
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.network(
                    data.imageUrl,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: EdgeInsets.all(dense ? 8 : 16.0),
                    child: ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(40),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: cS.onSurface.withValues(alpha: 0.4),
                                borderRadius: BorderRadius.circular(40)),
                            child: Padding(
                              padding: dense
                                  ? const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 10)
                                  : const EdgeInsets.symmetric(
                                      horizontal: 24.0, vertical: 12),
                              child: Text(
                                data.title,
                                style: dense
                                    ? Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(color: cS.surface)
                                    : Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(color: cS.surface),
                              ),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
