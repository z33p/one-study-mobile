import 'package:flutter/material.dart';
import 'package:one_study_mobile/screens/shared/custom_providers/state_provider.dart';

class CreateDeckState extends MyState {
  final formKey = GlobalKey<FormState>();

  final inputTitleController = TextEditingController();
  final inputDescriptionController = TextEditingController();

  @override
  CreateDeckState createInstance() {
    var instance = new CreateDeckState();

    return instance;
  }
}
