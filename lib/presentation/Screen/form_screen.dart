import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_test_project/business/authBloc/auth_bloc.dart';
import 'package:skill_test_project/data/model/countryModel.dart';
import 'package:skill_test_project/data/model/stateModel.dart';
import 'package:skill_test_project/data/repo/formRepo.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController textcontroller = TextEditingController();
  final TextEditingController text1controller = TextEditingController();
  final TextEditingController dropdowncontroller = TextEditingController();
  final FormRepo _formRepo = FormRepo();

  List<DropdownMenuItem<Country>> _ListOfCountry = [];
  Country? selectedCountry;
  StateModel? selectedState;
  List<DropdownMenuItem<StateModel>> _ListOfState = [];
  String Token = '';
  @override
  void initState() {
    callmathod();
    callCountryMethod();

    print('TOken IN Init${BlocProvider.of<AuthBloc>(context).Token}');
    // var data = await FormRepo()
    //     .getCountryRepo(BlocProvider.of<AuthBloc>(context).Token);
  }

  callmathod() {
    BlocProvider.of<AuthBloc>(context).add(GetToken());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Form', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40))),
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(child: Icon(Icons.abc)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) async {
                if (state is AuthLoaded) {
                  print('Listioner');
                  callCountryMethod();
                }
              },
              builder: (context, state) {
                if (state is AuthLoaded) {
                  Token = state.Token;
                }
                return Form(
                    key: _globalKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: textcontroller,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.abc)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'value required1';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: text1controller,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'value required2';
                                }
                                return null;
                              },
                            ),
                            DropdownButtonFormField2(
                              onMenuStateChange: (isOpen) {
                                setState(() {
                                  selectedState = null;
                                });
                              },
                              value: selectedCountry,
                              items: _ListOfCountry,
                              onChanged: (Country? value) {
                                print('OnChange');
                                setState(() {
                                  selectedCountry = value;
                                });

                                getState(selectedCountry as Country);
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'value required3';
                                }
                                return null;
                              },
                            ),
                            DropdownButtonFormField2(
                              value: selectedState,
                              items: _ListOfState,
                              onChanged: (StateModel? value) {
                                selectedState?.stateName = value?.stateName;

                                print(
                                    'Call on Change of state ${value!.stateName}');
                                setState(() {
                                  selectedState = value;
                                });

                                print(
                                    'Call on Change of state ${selectedState!.stateName}');
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'value required3';
                                }
                                return null;
                              },
                            ),
                            // DropdownButtonFormField(
                            //   items: [],
                            //   onChanged: (value) {},
                            //   validator: (value) {
                            //     if (value == null) {
                            //       return 'value required3';
                            //     }
                            //     return null;
                            //   },
                            // ),
                            ElevatedButton(
                                onPressed: () {
                                  if (_globalKey.currentState!.validate()) {
                                    // var token =
                                    //     BlocProvider.of<AuthBloc>(context)
                                    //         .add(GetToken());
                                  }
                                },
                                child: const Text('Submit'))
                          ]),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> callCountryMethod() async {
    print('mathord Call');

    List<Country> CountryList = await FormRepo()
        .getCountryRepo(BlocProvider.of<AuthBloc>(context).Token);
    setState(() {
      _ListOfCountry =
          CountryList.map((Country country) => DropdownMenuItem<Country>(
                value: country,
                child: Text("${country.countryName}"),
              )).toList();
    });

    // _ListOfCountry.forEach((element) {
    //   print(element.value!.countryName);
    // });
  }

  void getState(Country SelectedCountry) async {
    // data = [];
    List<StateModel> data = await FormRepo().getStateRepo(
        BlocProvider.of<AuthBloc>(context).Token,
        SelectedCountry.countryName as String);
    setState(() {
      _ListOfState = data
          .map((StateModel s) => DropdownMenuItem<StateModel>(
                value: s,
                child: Text(s.stateName as String),
              ))
          .toList();
    });
  }
}
