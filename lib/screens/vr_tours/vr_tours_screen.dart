import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wego_clone/models/vr_place_model.dart';
import 'package:wego_clone/screens/vr_tours/web_view/vr_web_view_screen.dart';

import '../../app_colors.dart';
import '../../translations/locale_keys.g.dart';

class VRToursScreen extends StatelessWidget {
  VRToursScreen({Key? key}) : super(key: key);
  List<VRPlaceModel> locations = [
    VRPlaceModel(
      placeTitle: LocaleKeys.mohamedAliMosque.tr(),
      placeLocation: LocaleKeys.cairo.tr(),
      url: 'https://www.roundme.com/tour/143779/view/363458/',
      image: 'assets/images/mohamed_ali_mosque.jpg',
    ),
    VRPlaceModel(
      placeTitle: LocaleKeys.gizaPyramids.tr(),
      placeLocation: LocaleKeys.giza.tr(),
      url: 'https://www.roundme.com/tour/144608/view/365784/',
      image: 'assets/images/giza_pyramids.jpg',
    ),
    VRPlaceModel(
      placeTitle: LocaleKeys.burjKhalifa.tr(),
      placeLocation: LocaleKeys.dubai.tr(),
      url: 'https://www.roundme.com/tour/335159/view/1113694/',
      image: 'assets/images/burj_khalifa.JPG',
    ),
    VRPlaceModel(
      placeTitle: LocaleKeys.eiffelTower.tr(),
      placeLocation: LocaleKeys.paris.tr(),
      url: 'https://www.roundme.com/tour/1528/view/3940/',
      image: 'assets/images/eiffel_tower.jpg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: AppColors.defaultThemeColor,
        elevation: 0.4,
        title: Text(LocaleKeys.vrtours.tr()),
        centerTitle: true,
      ),
      body: ListView.separated(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VRWebViewScreen(
                            url: locations[index].url,
                            title: locations[index].placeTitle,
                          )),
                );
              },
              child: Container(
                height: 130.0,
                padding: const EdgeInsets.all(15.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: double.infinity,
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(7.0)),
                        child: Image.asset(
                          locations[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locations[index].placeTitle,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          locations[index].placeLocation,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            color: AppColors.defaultThemeColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 20.0,
            );
          },
          itemCount: locations.length),
    );
  }
}
