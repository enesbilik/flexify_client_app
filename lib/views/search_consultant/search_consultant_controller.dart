import 'package:flexify_client_app/models/consultant.dart';
import 'package:flexify_client_app/services/consultant_service.dart';
import 'package:get/get.dart';

class SearchConsultantController extends GetxController {
  List<Consultant> consultants = <Consultant>[].obs;
  List<Consultant> filteredConsultants = <Consultant>[].obs;

  var isLoading = true.obs;

  void initConsultantData() async {
    isLoading(true);
    var response = await ConsultantService().getAllConsultants();

    if (response != null && response.statusCode == 200) {
      var data = response.data as Map<String, dynamic>;
      var items = data["items"] as List;

      var newData = (items).map((e) => Consultant.fromMap(e)).toList();

      consultants.clear();
      consultants.addAll(newData);

      filteredConsultants.clear();
      filteredConsultants.addAll(consultants);
    }
    isLoading(false);
  }

  void searchConsultant(String query) {
    filteredConsultants.clear();

    for (var consultant in consultants) {
      if ((consultant.name != null &&
              consultant.name!.toLowerCase().contains(query.toLowerCase())) ||
          (consultant.surName != null &&
              consultant.surName!
                  .toLowerCase()
                  .contains(query.toLowerCase()))) {
        filteredConsultants.add(consultant);
      }
    }
  }

  void clearSearch() {
    filteredConsultants.clear();
    filteredConsultants.addAll(consultants);
  }
}
