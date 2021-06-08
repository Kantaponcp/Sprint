import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String timeCountingDisplay = '00:00:00';
  String timeText = 'TIME';
  String distanceDisplay = '0.0';
  String distanceText = 'DISTANCE (km)';
  String currentSpeedDisplay = '0.0';
  String currentSpeedText = 'SPEED (km/h)';
  String avgSpeedDisplay = '0.0';
  String avgSpeedText = 'AVG.SPEED (km/h)';

  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = true;

  @override
  void dispose() {
    // TODO: implement dispose
    _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 600,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Text(timeCountingDisplay, style: Theme.of(context).textTheme.headline1,),
                          SizedBox(height: 20,),
                          StreamBuilder<int> (
                            stream: _stopWatchTimer.rawTime,
                              initialData: _stopWatchTimer.rawTime.value,
                              builder: (context, snapshot) {
                            final value = snapshot.data;
                            final displayTime = StopWatchTimer.getDisplayTime(value!, hours: _isHours);
                            return Text(displayTime, style: Theme.of(context).textTheme.headline1,);
                          }),
                          Text(timeText, style: Theme.of(context).textTheme.bodyText1,),
                          Divider(thickness: 3,),
                          Text(distanceDisplay, style: Theme.of(context).textTheme.headline2,),
                          Text(distanceText, style: Theme.of(context).textTheme.bodyText1,),
                          Divider(thickness: 3,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(currentSpeedDisplay, style: Theme.of(context).textTheme.headline2,),
                                    Text(currentSpeedText, style: Theme.of(context).textTheme.bodyText1,),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(currentSpeedDisplay, style: Theme.of(context).textTheme.headline2,),
                                    Text(currentSpeedText, style: Theme.of(context).textTheme.bodyText1,),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: RaisedButton(
                          onPressed: () {
                            _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                          },
                          shape: circleShape,
                          color: Theme.of(context).primaryColor,
                          child: Text('GO', style: Theme.of(context).textTheme.button,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }

  final circleShape = CircleBorder(
    side: BorderSide(color: Colors.white),
  );

}
