import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flexify_client_app/constants/app_color.dart';
import 'package:flexify_client_app/constants/app_padding.dart';
import 'package:flexify_client_app/views/consultant_detail/consultant_detail_view.dart';
import 'package:flexify_client_app/views/search_consultant/search_consultant_controller.dart';
import 'package:flexify_client_app/widgets/custom_appbar.dart';
import 'package:flexify_client_app/widgets/custom_text_field.dart';

class SearchConsultantView extends StatefulWidget {
  const SearchConsultantView({super.key, Key? customKey});

  @override
  State<SearchConsultantView> createState() => _SearchConsultantViewState();
}

class _SearchConsultantViewState extends State<SearchConsultantView> {
  final SearchConsultantController searchConsultantController =
      Get.put(SearchConsultantController());

  @override
  void initState() {
    searchConsultantController.initConsultantData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Danışman Ara',
      ),
      body: Obx(
        () => searchConsultantController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Padding(
                  padding: AppPadding().pA15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 10),
                      buildSearchField(context),
                      const SizedBox(height: 20),
                      const Text(
                        "Danışmanlar",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primary,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Expanded(
                        child: ListView.builder(
                          itemCount: searchConsultantController
                              .filteredConsultants.length,
                          itemBuilder: (BuildContext context, int index) {
                            var consultant = searchConsultantController
                                .filteredConsultants[index];
                            var name = consultant.name ?? "Empty";
                            var surName = consultant.surName ?? "Empty";

                            return ListTile(
                              contentPadding: const EdgeInsets.all(5),
                              leading: CircleAvatar(
                                child: Text(name[0]),
                              ),
                              title: Text("$name $surName"),
                              onTap: () {
                                Get.to(
                                  () => ConsultantDetailView(
                                    consultantId: consultant.id!,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget buildSearchField(BuildContext context) {
    return CustomTextField(
      onChanged: (value) {
        searchConsultantController.searchConsultant(value);
      },
      readOnly: false,
      autofocus: false,
      hintText: 'Danışman Ara',
      icon: const Icon(
        Icons.search_outlined,
        color: AppColor.primary,
      ),
    );
  }
}
