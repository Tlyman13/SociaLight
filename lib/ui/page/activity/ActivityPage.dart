// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_twitter_clone/helper/utility.dart';
import 'package:flutter_twitter_clone/model/activity.dart';
import 'package:flutter_twitter_clone/state/activityState.dart';
// import 'package:flutter_twitter_clone/ui/page/profile/widgets/circular_image.dart';
import 'package:flutter_twitter_clone/ui/theme/theme.dart';
import 'package:flutter_twitter_clone/widgets/customAppBar.dart';
// import 'package:flutter_twitter_clone/widgets/customWidgets.dart';
import 'package:flutter_twitter_clone/widgets/newWidget/title_text.dart';
import 'package:provider/provider.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key, this.scaffoldKey}) : super(key: key);

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  State<StatefulWidget> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     final state = Provider.of<ActivityState>(context, listen: false);
  //     state.resetFilterList();
  //   });
  //   super.initState();
  // }

  void onSettingIconPressed() {
    Navigator.pushNamed(context, '/TrendsPage');
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ActivityState>(context);
    final list = state.activitylist;
    return Scaffold(
      appBar: CustomAppBar(
        scaffoldKey: widget.scaffoldKey,
        icon: AppIcon.settings,
        onActionPressed: onSettingIconPressed,
        // onSearchChanged: (text) {
        //   state.filterByUsername(text);
        // },
      ),
      body: SingleChildScrollView(
        child: Wrap(
          direction: Axis.horizontal,
          // display list using activityTile
          children: list!.map((activity) => _ActivityTile(activity: activity)).toList(),
        ),
      )
    );
  }
}

class _ActivityTile extends StatelessWidget {
  const _ActivityTile({Key? key, required this.activity}) : super(key: key);
  final ActivityModel activity;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: IntrinsicHeight(
        child: Card(
          child: ListTile(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: TitleText(activity.name!,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}