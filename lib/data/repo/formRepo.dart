import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_test_project/business/authBloc/auth_bloc.dart';
import 'package:skill_test_project/data/model/countryModel.dart';
import 'package:skill_test_project/data/model/stateModel.dart';
import 'package:skill_test_project/data/service/formService.dart';

class FormRepo {
  FormService _formService = FormService();
  Future<List<Country>> getCountryRepo(String token) async {
    return await _formService.getCountry(token);
  }

  Future<List<StateModel>> getStateRepo(String token, String country) async {
    return await _formService.getState(token, country);
  }
}
