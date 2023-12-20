import 'package:erp/screens/home/components/photos_tile.dart';
import 'package:erp/screens/home/home_provider.dart';
import 'package:erp/screens/home_details/home_details_screen.dart';
import 'package:erp/utils/nav_utail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Photos'),
        ),
        body: Consumer<HomeProvider>(
          builder: (BuildContext context, provider, _) {
            return SmartRefresher(
              controller: provider.refreshController,
              enablePullDown: true,
              enablePullUp: true,
              onRefresh: provider.loadItems,
              onLoading: provider.loadMoreItems,
              header: const WaterDropHeader(),
              footer: CustomFooter(
                builder: (BuildContext context, LoadStatus? mode) {
                  Widget body;
                  if (mode == LoadStatus.idle) {
                    body = const Text('Pull up load');
                  } else if (mode == LoadStatus.loading) {
                    body = const CupertinoActivityIndicator();
                  } else if (mode == LoadStatus.failed) {
                    body = const Text("Load Failed!Click retry!");
                  } else if (mode == LoadStatus.canLoading) {
                    body = const Text("release to load more");
                  } else {
                    body = const Text("No more Data");
                  }
                  return SizedBox(
                    height: 55.0,
                    child: Center(child: body),
                  );
                },
              ),
              child: ListView.separated(
                itemCount: provider.photosList.length,
                itemBuilder: (context, int index) {
                  final photos = provider.photosList[index];
                  return PhotosTile(
                    photos: photos,
                    onTap: () {
                      NavUtil.navigateScreen(
                          context, HomeDetailsScreen(photos: photos));
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
