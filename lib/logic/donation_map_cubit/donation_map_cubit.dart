import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:blood_donation_system_user/data/firebase/database/fire_campaign.dart';
import 'package:blood_donation_system_user/data/models/bds_campaign.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong2/latlong.dart" as latLng;

import '../../presentation/screens/user_screen/widgets/marker_view.dart';

part 'donation_map_state.dart';

class DonationMapCubit extends Cubit<DonationMapState> {
  DonationMapCubit() : super(DonationMapInitial());

  List<Marker> markers = [];
  List<String> campaignIds = [];

  Future loadCampaigns() async {
    try {
      emit(DonationMapLoading());
      final List<BDSCampaign> campaigns = await FireCampaign.getCampaigns();
      for (BDSCampaign campaign in campaigns) {
        if (!campaignIds.contains(campaign.id)) {
          Marker marker = Marker(
            width: 200,
            height: 200,
            point: latLng.LatLng(campaign.lat, campaign.long),
            builder: (context) => MarkerView(campaign: campaign),
          );
          campaignIds.add(campaign.id);
          markers.add(marker);
        }
        emit(DonationMapLoaded(markers: markers));
      }
    } catch (e) {
      emit(DonationMapFailed(errorMsg: e.toString()));
    }
  }
}
