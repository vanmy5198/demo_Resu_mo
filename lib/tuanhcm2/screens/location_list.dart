import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resu_mo/tuanhcm2/components/banner_image.dart';
import 'package:resu_mo/tuanhcm2/components/default_app_bar.dart';
import 'package:resu_mo/tuanhcm2/components/location_tile.dart';
import 'package:resu_mo/tuanhcm2/models/location.dart';
import 'package:resu_mo/tuanhcm2/screens/location_detail.dart';
import 'package:resu_mo/tuanhcm2/styles.dart';

const ListItemHeight = 245.0;

class LocationList extends StatefulWidget {
  @override
  createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  List<Location> locations = [];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    if (this.mounted) {
      setState(() {
        this.loading = true;
      });
      Timer(Duration(microseconds: 3000), () async {
        final locations = await Location.fetchAll();
        setState(() {
          this.locations = locations;
          this.loading = false;
        });
      });
      // check is mounted

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(),
        body: RefreshIndicator(
            onRefresh: loadData,
            child: Column(
              children: [
                renderProgressBar(context),
                Expanded(child: renderListView(context))
              ],
            )));
  }

  Widget renderListView(BuildContext context) {
    return ListView.builder(
      itemCount: this.locations.length,
      itemBuilder: _listViewItemBuilder,
    );
  }

  Widget renderProgressBar(BuildContext context) {
    return (this.loading
        ? LinearProgressIndicator(
            value: 0.1,
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
          )
        : Container());
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    final location = this.locations[index];
    return InkWell(
      child: Ink(
        child: Stack(
          children: [
            BannerImage(url: location.url, height: ListItemHeight),
            _tileFooter(location),
          ],
        ),
        height: ListItemHeight,
      ),
      onTap: () => _navigateToLocationDetail(context, locations[index].id),
    );
  }

  Widget _tileFooter(Location location) {
    final info = LocationTile(
      location: location,
      darkTheme: true,
    );
    final overlay = Flexible(
        child: Container(
      padding: EdgeInsets.symmetric(
          vertical: 5, horizontal: Styles.horizontalPaddingDefault),
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
      child: info,
    ));
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [overlay],
    );
  }

  void _navigateToLocationDetail(BuildContext context, int locationIdx) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => LocationDetail(locationIdx)));
  }
}
