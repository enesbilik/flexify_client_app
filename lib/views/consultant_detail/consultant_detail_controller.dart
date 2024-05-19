import 'package:flexify_client_app/models/consultant.dart';
import 'package:flexify_client_app/services/consultant_service.dart';
import 'package:get/get.dart';

class ConsultantDetailController extends GetxController {
  var isLoading = true.obs;
  var consultant = Consultant().obs;

  void initConsultantData(String consultantId) async {
    isLoading(true);
    var response = await ConsultantService().getConsultantById(consultantId);
    if (response != null && response.statusCode == 200) {
      var data = response.data as Map<String, dynamic>;
      consultant.value = Consultant.fromMap(data);
    }
    isLoading(false);
  }
}
