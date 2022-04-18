import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/provider/connectivity_provider.dart';
import 'package:social_media_app/screens/home_screen.dart';
import 'package:social_media_app/screens/new_post_screen.dart';
import '../constant/color.dart';
import '../constant/text_style.dart';
import '../widgets/connection_container.dart';
import '../widgets/tab_bar.dart';

class TabsScreen extends StatefulWidget {


  const TabsScreen({Key? key, }) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  @override
  void initState() {
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();

  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: primary,
          appBar: AppBar(
            toolbarHeight: 80,
            elevation: 0,
            backgroundColor: primary,
            automaticallyImplyLeading: true,
            centerTitle: true,

            title: Column(
              children: [
                PreferredSize(child: pageUI(), preferredSize: const Size(double.maxFinite, 2.0)),
                 const TabBar(
                    isScrollable: true,
                    physics: PageScrollPhysics(),
                    indicatorWeight: 4,
                    indicatorColor: myGreen,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelStyle: style1,
                    labelColor: white,
                    unselectedLabelColor: white,
                    tabs: [
                      BuildTabBar(title: " Posts "),
                      BuildTabBar(title: "Create post")
                    ]
                ),
              ],
            ),
          ),
          body:  const TabBarView(
            children: [
              HomeScreen(),
              NewPostScreen(),
            ],
          ),
        )
    );
  }

}
