import 'package:flrousale/app/modules/account/controllers/account_controller.dart';
import 'package:flrousale/flr_main.dart';
import 'package:flrousale/values/flr_icons.dart';
import 'package:flrousale/values/flr_images.dart';

class AccountView {
  Widget renderView(
    BuildContext context,
    AccountController _controller,
  ) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        print("innerBoxIsScrolled=$innerBoxIsScrolled");
        return <Widget>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: _renderSliverAppBar(innerBoxIsScrolled),
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
                    if (index == 0) {
                      return _renderCardView(
                          () => _renderSectionView("我的商品", () {}),
                          _renderMyGoods);
                    } else if (index == 1) {
                      return _renderCardView(
                          () => _renderSectionView("我的报价", () {}),
                          _renderMyPrice);
                    } else if (index == 2) {
                      return _renderCardView(
                          () => _renderSectionView("我的订单", () {}),
                          _renderMyOrder);
                    }
                    return _renderItemView();
                  },
                  childCount: 20,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  _renderEmptyItem() {
    return Container(
      color: FLRColors.white,
      height: 60.rpx,
      child: const ListTile(),
    );
  }

  _renderItemView() {
    return Container(
      color: FLRColors.white,
      height: 94.rpx,
      child: ListTile(
        onTap: () {},
        style: ListTileStyle.list,
        selectedColor: FLRColors.black05,
        title: Text("我的"),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          // FLRIcons.bianji,
          color: FLRColors.color252C3250,
          size: 21.rpx,
        ),
      ),
    );
  }

  _renderSliverAppBar(bool innerBoxIsScrolled) {
    return SliverAppBar(
      title: innerBoxIsScrolled == false
          ? Text("")
          : Text('我的',
              style: TextStyle(
                color: FLRColors.black,
                fontSize: 44.rpx,
              )),
      centerTitle: true,
      pinned: true,
      floating: false,
      // snap: true,
      // expandedHeight: 410.rpx,
      expandedHeight: 210.rpx,
      // collapsedHeight: 300.rpx,
      stretchTriggerOffset: 200.rpx,
      forceElevated: innerBoxIsScrolled,

      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          padding: EdgeInsets.only(left: 40.rpx, top: 20.rpx, right: 40.rpx),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                FLRImages.account_background,
                package: kPackage,
              ),
            ),
          ),
          child: _renderSpaceBar(),
        ),
        // background: Image.asset(
        //   FLRImages.account_background,
        //   package: "flrousale",
        //   fit: BoxFit.fill,
        // ),
        collapseMode: CollapseMode.parallax,
        stretchModes: const [
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
          StretchMode.fadeTitle,
        ],
      ),
    );
  }

  Widget _renderSpaceBar() {
    return Container(
      height: 210.rpx,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: kToolbarHeight.rpx),
          _renderCompany(),
          // SizedBox(height: 42.rpx),
          // _renderMyGoods(),
        ],
      ),
    );
  }

  Widget _renderCompany() {
    return Container(
      child: Row(
        children: [
          _renderAvatar(),
          _renderUserView(),
        ],
      ),
    );
  }

  Widget _renderAvatar() {
    return ClipOval(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              FLRColors.colorC7E4FF,
              FLRColors.color98CBFF,
            ],
          ),
        ),
        child: Icon(
          Icons.account_circle,
          color: FLRColors.colorDEEEFF,
          size: 50.rpx,
        ),
        height: 104.rpx,
        width: 104.rpx,
      ),
    );
  }

  Widget _renderUserView() {
    return Container(
      padding: EdgeInsets.only(left: 21.rpx),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60.rpx,
            child: TextButton(
              onPressed: () {},
              style: _textButtonStyle(),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "XXXXXXXXXXXXXX",
                    style: TextStyle(
                      color: FLRColors.white,
                      fontSize: 38.rpx,
                    ),
                  ),
                  // Icon(icon)
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    // FLRIcons.bianji,
                    color: FLRColors.color63A7F2,
                    size: 31.rpx,
                  ),
                ],
              ),
            ),
          ),
          Text(
            "账号：138138138000",
            style: TextStyle(
              color: FLRColors.white40,
              fontSize: 25.rpx,
            ),
          )
        ],
      ),
    );
  }

  ButtonStyle _textButtonStyle() {
    return TextButton.styleFrom(
      primary: FLRColors.white,
      minimumSize: Size(88.rpx, 50.rpx),
      padding: EdgeInsets.symmetric(horizontal: 0.0.rpx),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0.rpx)),
      ),
    );
  }

  Widget _renderCardView(
      Widget Function() sectionChild, Widget Function() child) {
    return Container(
      padding: EdgeInsets.only(left: 32.rpx, right: 32.rpx),
      height: 220.rpx,
      width: double.infinity,
      color: FLRColors.colorFEFEFE,
      child: Card(
        color: FLRColors.white,
        child: Column(
          children: [
            sectionChild(),
            child(),
          ],
        ),
      ),
    );
  }

  Widget _renderSectionView(
    String? section,
    Function() onPressed,
  ) {
    return Container(
      margin: EdgeInsets.all(22.rpx),
      height: 38.rpx,
      child: Row(
        children: [
          Expanded(
              child: Container(
            child: Text(
              "$section",
              style: TextStyle(
                color: FLRColors.black,
                fontSize: 29.rpx,
                fontWeight: FontWeight.w500,
              ),
            ),
          )),
          Container(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: onPressed,
              style: _textMoreButtonStyle(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "更多",
                    style: TextStyle(
                      color: FLRColors.color252C3250,
                      fontSize: 25.rpx,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: FLRColors.color252C3250,
                    size: 20.rpx,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  ButtonStyle _textMoreButtonStyle() {
    return TextButton.styleFrom(
      primary: FLRColors.black05,
      alignment: Alignment.centerRight,
      minimumSize: Size(100.rpx, 38.rpx),
      padding: EdgeInsets.symmetric(horizontal: 0.0.rpx),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0.rpx)),
      ),
    );
  }

  Widget _renderMyGoods() {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: _renderGoodsItem("20", "待审核"),
          ),
          Expanded(
            child: _renderGoodsItem("3", "已发布"),
          ),
          Expanded(
            child: _renderGoodsItem("1", "已下架"),
          ),
        ],
      ),
    );
  }

  ///
  Widget _renderGoodsItem(String? main, String? sub) {
    return Container(
      child: IconButton(
        onPressed: () {},
        iconSize: 60.rpx,
        padding: EdgeInsets.zero,
        icon: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "$main",
              style: TextStyle(
                color: FLRColors.color252C32,
                fontSize: 44.rpx,
                fontWeight: FontWeight.w600,
                height: 1.2,
              ),
            ),
            Text(
              "$sub",
              style: TextStyle(
                color: FLRColors.color252C3250,
                fontSize: 25.rpx,
                height: 1.3,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _renderMyPrice() {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: _renderIconItem(FLRImages.flr_has_price_icon, "已报价", () {}),
          ),
          Expanded(
            child: _renderIconItem(FLRImages.flr_over_price, "已结束", () {}),
          )
        ],
      ),
    );
  }

  Widget _renderIconItem(
    String image,
    String? sub,
    Function() onPressed,
  ) {
    return Container(
      child: IconButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          iconSize: 60.rpx,
          icon: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 60.rpx,
                width: 60.rpx,
                child: Image.asset(
                  image,
                  package: kPackage,
                ),
              ),
              Text(
                "$sub",
                style: TextStyle(
                  color: FLRColors.color252C3250,
                  fontSize: 25.rpx,
                  height: 1.2,
                ),
              )
            ],
          )),
    );
  }

  Widget _renderMyOrder() {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: _renderIconItem(
              FLRImages.flr_order_confirm,
              "待确认",
              () {},
            ),
          ),
          Expanded(
            child: _renderIconItem(
              FLRImages.flr_order_pay,
              "待付款",
              () {},
            ),
          ),
          Expanded(
            child: _renderIconItem(
              FLRImages.flr_order_delivery,
              "待发货",
              () {},
            ),
          ),
          Expanded(
            child: _renderIconItem(
              FLRImages.flr_order_take,
              "待收货",
              () {},
            ),
          )
        ],
      ),
    );
  }
}
