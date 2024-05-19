import 'package:flexify_client_app/models/consultant.dart';
import 'package:flexify_client_app/views/consultant_detail/consultant_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<Consultant> consultants;

  CustomSearchDelegate(this.consultants);

  @override
  String get searchFieldLabel => 'Ara';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_ios_outlined),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Consultant> matchQuery = [];

    for (var consultant in consultants) {
      if (consultant.name != null &&
          consultant.name!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(consultant);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (BuildContext context, int index) {
        var consultant = matchQuery[index];
        return ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: CircleAvatar(
            child: Text(consultant.name?[0] ?? ""),
          ),
          title: Text(consultant.name ?? "No Name"),
          onTap: () {
            Get.to(
              () => ConsultantDetailView(
                consultantId: consultant.id!,
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Consultant> matchQuery = [];

    for (var consultant in consultants) {
      if (consultant.name != null &&
          consultant.name!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(consultant);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (BuildContext context, int index) {
        var consultant = matchQuery[index];
        return ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: CircleAvatar(
            child: Text(consultant.name?[0] ?? ""),
          ),
          title: Text(consultant.name ?? "No Name"),
          onTap: () {
            Get.to(
              () => ConsultantDetailView(
                consultantId: consultant.id!,
              ),
            );
          },
        );
      },
    );
  }
}
