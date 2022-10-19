import 'package:flrousale/app/modules/account/controllers/account_controller.dart';
import 'package:flrousale/flr_main.dart';
import 'package:flrousale/values/flr_images.dart';
import 'package:flutter/scheduler.dart';

class AccountView {
  Widget renderView(
    BuildContext context,
    AccountController _controller,
  ) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: _renderSliverAppBar(),
          ),
        ];
      },
      body: Builder(
        builder: (context) {
          return CustomScrollView(
            slivers: [
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return _renderItem(index);
                  },
                  childCount: 15,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  _renderItem(int index) {
    return Container(
      color: Colors.yellow,
      child: ListTile(
        title: Text('List $index'),
      ),
    );
  }

  Future _onStretchTrigger() async {
    print("_onStretchTrigger...");
  }

  _renderSliverAppBar() {
    return SliverAppBar(
      title: Text('Me'),
      pinned: true,
      floating: false,
      // snap: true,
      expandedHeight: 460.rpx,
      // collapsedHeight: 300.rpx,
      stretchTriggerOffset: 300.rpx,
      onStretchTrigger: () async {
        // _onStretchTrigger();
        SchedulerBinding.instance?.addPostFrameCallback((_) {
          print("_onStretchTrigger...");
        });
      },
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          FLRImages.account_background,
          package: "flrousale",
          fit: BoxFit.fill,
        ),
        collapseMode: CollapseMode.parallax,
      ),
    );
  }
}
