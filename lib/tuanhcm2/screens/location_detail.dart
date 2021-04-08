import 'package:flutter/material.dart';
import 'package:resu_mo/tuanhcm2/components/banner_image.dart';
import 'package:resu_mo/tuanhcm2/components/default_app_bar.dart';
import 'package:resu_mo/tuanhcm2/components/location_tile.dart';
import 'package:resu_mo/tuanhcm2/models/location.dart';
import 'package:resu_mo/tuanhcm2/models/location_fact.dart';
import 'package:resu_mo/tuanhcm2/styles.dart';
import 'package:url_launcher/url_launcher.dart';

const BannerImageHeight = 300.0;
const BodyVerticalPadding = 20.0;
const FooterHeight = 100.0;

class LocationDetail extends StatefulWidget {
  final int locationId;

  LocationDetail(this.locationId);

  @override
  createState() => _LocationDetailState(this.locationId);
}

class _LocationDetailState extends State<LocationDetail> {
  final int locationID;
  Location location = Location.blank();

  _LocationDetailState(this.locationID);

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final location = await Location.fetchByID(this.locationID);

    if (mounted) {
      setState(() {
        this.location = location;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(),
        body: Stack(children: [
          _renderBody(context, location),
          _renderFooter(context, location)
        ]));
  }

  Widget _renderBody(BuildContext context, Location location) {
    var res = <Widget>[
      BannerImage(url: location.url, height: BannerImageHeight),
      _renderHeader()
    ];
    for (LocationFact locfact in location.facts) {
      res.addAll([_secTitle(locfact.title), _secText(locfact.text)]);
    }
    res.add(_renderBottomSpacer());
    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: res));
  }

  Widget _renderHeader() {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: BodyVerticalPadding,
            horizontal: Styles.horizontalPaddingDefault),
        child: LocationTile(location: this.location, darkTheme: false));
  }

  Widget _renderFooter(BuildContext context, Location location) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
            height: FooterHeight,
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                child: _renderBookButton()),
          )
        ]);
  }

  Widget _renderBookButton() {
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: Styles.accentColor,
          textStyle: TextStyle(
            color: Styles.textColorBright,
          )),
      onPressed: _handleBookPress,
      child: Text('Book'.toUpperCase(), style: Styles.textCTAButton),
      autofocus: true,
    );
  }

  void _handleBookPress() async {
    const url = 'mailto:hello@tourism.co?subject=inquiry';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _secTitle(String text) {
    return Container(
        padding: EdgeInsets.fromLTRB(Styles.horizontalPaddingDefault, 25,
            Styles.horizontalPaddingDefault, 10),
        child: Text(text.toUpperCase(),
            textAlign: TextAlign.left, style: Styles.headerLarge));
  }

  Widget _secText(String text) {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: 10, horizontal: Styles.horizontalPaddingDefault),
        child: Text(
          text,
          style: Styles.textDefault,
        ));
  }

  Widget _renderBottomSpacer() {
    return Container(height: FooterHeight);
  }
}
