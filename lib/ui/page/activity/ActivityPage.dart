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
  List<ActivityModel> selectedActivities = [];

  void onSettingIconPressed() {
    Navigator.pushNamed(context, '/TrendsPage');
  }

  @override
  Widget build(BuildContext context) {
    final activities = Provider.of<ActivityState>(context).activitylist;

    return Scaffold(
      appBar: CustomAppBar(
        scaffoldKey: widget.scaffoldKey,
        icon: AppIcon.settings,
        onActionPressed: onSettingIconPressed,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height, // Make the container take up the full height of the screen
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Wrap(
                direction: Axis.horizontal,
                children: activities!
                    .map(
                      (activity) => _ActivityTile(
                        activity: activity,
                        selected: selectedActivities.contains(activity),
                        onSelected: () {
                          setState(() {
                            if (selectedActivities.contains(activity)) {
                              selectedActivities.remove(activity);
                            } else {
                              selectedActivities.add(activity);
                            }
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
            if (selectedActivities.isNotEmpty)
              Positioned(
                bottom: 15, // Adjust the bottom value to increase or decrease the distance from the bottom
                right: 5, // Adjust the right value to increase or decrease the distance from the right
                child: ElevatedButton(
                  onPressed: () {
                    // Perform action when "Let's Hangout" button is pressed
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Set the button background color
                    foregroundColor: Colors.white, // Set the button text color
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24), // Set the button padding
                  ),
                  child: Text(
                    "Let's Hangout",
                    style: TextStyle(
                      fontSize: 16, // Set the button text size
                      fontWeight: FontWeight.bold, // Set the button text weight
                    ),
                  ),
                ),
              ),
          ],
        ),
      )
    );
  }
}

class _ActivityTile extends StatelessWidget {
  const _ActivityTile({
    Key? key,
    required this.activity,
    required this.selected,
    required this.onSelected,
  }) : super(key: key);

  final ActivityModel activity;
  final bool selected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: IntrinsicHeight(
        child: Card(
          color: selected ? Colors.blue.shade400 : null,
          child: ListTile(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: TitleText(
                    activity.name!,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    color: selected ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            onTap: onSelected,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}