import 'package:flutter_bloc/flutter_bloc.dart';
import "package:latlong2/latlong.dart" as latLng;
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/components/components.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/app_text_styles.dart';
import '../../../../logic/donation_map_cubit/donation_map_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MapController mapController = MapController();
  List<Marker> markers = [];
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DonationMapCubit>(context).loadCampaigns();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Text(
            "Home",
            style: AppTextStyles.h1Light,
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.lightElv0,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(6.w),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: textD("Donation Map", 14, bold: true)),
                SizedBox(
                  height: 2.h,
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(6.w)),
                    child: BlocListener<DonationMapCubit, DonationMapState>(
                      listener: (context, state) {
                        if (state is DonationMapFailed) {
                          showSnackBar(context, state.errorMsg);
                        }
                        if (state is DonationMapLoaded) {
                          setState(() {
                            markers = state.markers;
                          });
                        }
                      },
                      child: FlutterMap(
                        mapController: mapController,
                        options: MapOptions(
                          center: latLng.LatLng(6.9271, 79.8612),
                          zoom: 15.0,
                        ),
                        layers: [
                          TileLayerOptions(
                            urlTemplate:
                                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                            subdomains: ['a', 'b', 'c'],
                            attributionBuilder: (_) =>
                                const Text("© OpenStreetMap contributors"),
                          ),
                          MarkerLayerOptions(
                            markers: markers,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
