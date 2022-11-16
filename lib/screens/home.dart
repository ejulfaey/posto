import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posto_app/models/category-model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Category> _categories = [
    Category(id: '1', name: 'Politics', description: 'Politics'),
    Category(id: '2', name: 'History', description: 'Politics'),
    Category(id: '3', name: 'Business', description: 'Politics'),
    Category(id: '4', name: 'Future', description: 'Politics'),
    Category(id: '5', name: 'Work', description: 'Politics'),
    Category(id: '6', name: 'Tech', description: 'Politics'),
    Category(id: '7', name: 'Galaxy', description: 'Politics'),
    Category(id: '8', name: 'Apple', description: 'Politics'),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext ctx, BoxConstraints box) {
        if (box.maxWidth >= 1024) {
          return mobileScreen();
          // return desktopScreen();
        } else {
          return mobileScreen();
        }
      },
    );
  }

  Widget desktopScreen() {
    return Container();
  }

  Widget mobileScreen() {
    return DefaultTabController(
      length: _categories.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: AppBar(
            centerTitle: false,
            title: const Text('Home', style: TextStyle(fontSize: 20)),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person_outlined),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  isScrollable: true,
                  unselectedLabelColor: Colors.white.withOpacity(0.3),
                  indicatorColor: Colors.black87,
                  tabs: _categories
                      .map(
                        (category) => Tab(
                            child: Text(
                          category.name,
                          style: const TextStyle(color: Colors.black),
                        )),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: _categories
              .map(
                (category) => ListView(
                  children: [
                    postCard(false),
                    postCard(false),
                    postCard(true),
                    postCard(true),
                    postCard(false),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget postCard(bool isPremium) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 1,
          ),
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '20 Nov 2022',
                style: TextStyle(fontSize: 12, color: Colors.black45),
              ),
              isPremium ? Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 2.5,
                ),
                color: Colors.blue[100],
                child: Text(
                  'Premium',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue[600],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ) : const SizedBox(),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'How to increase your views in 3 days',
            style: GoogleFonts.raleway(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            style: GoogleFonts.lato(
              color: Colors.black54,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
