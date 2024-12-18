import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:mess_management/services/size_config.dart';
import 'package:mess_management/services/theme_service.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mess_management/view_model/feedback_page_view_model.dart';
import 'package:mess_management/locator.dart';
import 'package:mess_management/widgets/star_ratebar.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  late final FeedbackPageViewModel _viewModel;
  @override
  void initState() {
    super.initState();
    _viewModel = locator<FeedbackPageViewModel>();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeService.primaryAccent,
      appBar: AppBar(
        backgroundColor: ThemeService.primaryColor,
        centerTitle: true,
        title: Text(
          "Feedback",
          style: TextStyle(
            fontSize: 24,
            color: ThemeService.secondaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Form(
            key: _viewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                TextFormField(
                  controller: _viewModel.startDateController,
                  readOnly: true,
                  style: TextStyle(color: ThemeService.secondaryColor),
                  decoration: const InputDecoration(
                    labelText: "Start Date",
                    labelStyle: TextStyle(color: ThemeService.secondaryBackgroundColor),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ThemeService
                            .secondaryBackgroundColor, // Border color when not focused
                        width: 1.5, // Border width
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ThemeService
                            .secondaryBackgroundColor, // Border color when focused
                        width: 2.0, // Border width
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _viewModel.endDateController,
                  readOnly: true,
                  style: TextStyle(color: ThemeService.secondaryColor),
                  decoration: const InputDecoration(
                    labelText: "End Date",
                    labelStyle: TextStyle(color: ThemeService.secondaryBackgroundColor),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ThemeService
                            .secondaryBackgroundColor, // Border color when not focused
                        width: 1.5, // Border width
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ThemeService
                            .secondaryBackgroundColor, // Border color when focused
                        width: 2.0, // Border width
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                DropdownButtonFormField2<String>(
                  // selectedItemBuilder:,

                  value: _viewModel.selectedMess,
                  items: _viewModel.messes
                      .map((category) => DropdownMenuItem<String>(
                    value: category,
                    child: IntrinsicWidth(
                      child: Container(
                        // height: double.infinity,
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Text(
                              category,
                              style: TextStyle(
                                color: ThemeService.primaryColor, // Set value text color
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))
                      .toList(),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 2,
                        color: ThemeService.secondaryBackgroundColor,
                      ),
                    ),
                    floatingLabelStyle: TextStyle(
                        color: ThemeService.secondaryBackgroundColor,
                        fontWeight: FontWeight.bold),
                    labelText: 'Category',
                    labelStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ThemeService.secondaryBackgroundColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // Set dropdown canvas border radius
                      color: Colors
                          .white, // Optional: Set dropdown background color
                    ),
                  ),
                  onChanged: (value) {
                    _viewModel.updateSelected(value);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a category';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                StarRatebar(
                    text: "Timeliness of service",
                    controller: _viewModel.timeliness),
                StarRatebar(
                    text: "Cleanliness of surroundings",
                    controller: _viewModel.cleanliness),
                StarRatebar(
                    text: "Quality of food", controller: _viewModel.quality),
                StarRatebar(
                    text: "Taste of Curries/Fried",
                    controller: _viewModel.taste),
                StarRatebar(
                    text: "Snacks,Tea and Coffee",
                    controller: _viewModel.snacks),
                StarRatebar(
                    text: "Quantity of food as per menu",
                    controller: _viewModel.quantity),
                StarRatebar(
                    text: "Courtesy of services from contractor employees",
                    controller: _viewModel.courtesy),
                StarRatebar(
                    text: "Appropriate attire of contractor employees",
                    controller: _viewModel.attire),
                StarRatebar(
                    text: "Cooking and Serving as per menu",
                    controller: _viewModel.serving),
                StarRatebar(
                    text: "Cleanliness of wash area",
                    controller: _viewModel.washArea),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _viewModel.submit();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(130, 50),
                      elevation: 0,
                      backgroundColor: ThemeService.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(18), // Rounded corners
                        side: BorderSide(
                          color: ThemeService
                              .secondaryBackgroundColor, // Border color
                          width: 0, // Border width
                        ),
                      ),
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: ThemeService.secondaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
