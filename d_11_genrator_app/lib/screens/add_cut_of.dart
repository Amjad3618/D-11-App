import 'package:flutter/material.dart';
import '../Utils/colors.dart';
import '../Widgets/date_picker.dart';
import '../Widgets/text_widget.dart';
import '../Widgets/time_picker.dart';

class AddAnotherCutOff extends StatefulWidget {
  const AddAnotherCutOff({Key? key}) : super(key: key);

  @override
  State<AddAnotherCutOff> createState() => _AddAnotherCutOffState();
}

class _AddAnotherCutOffState extends State<AddAnotherCutOff> {
  double _fuelLevel = 0.5; // Initial fuel level (50%)
  final TextEditingController _cutOffTimeController = TextEditingController();
  final TextEditingController _cutOffDateController = TextEditingController();
  final TextEditingController _turnOnTimeController = TextEditingController();
  final TextEditingController _turnOnDateController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to free resources
    _cutOffTimeController.dispose();
    _cutOffDateController.dispose();
    _turnOnTimeController.dispose();
    _turnOnDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarcolor,
        title: const CustomTextWidget(
          text: "Add Cut off",
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          ElevatedButton(
            
            onPressed: (){}, child: const Text("Submit",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              // Cut-Off Section
              _buildSection(
                TimePickerFormField(
                  controller: _cutOffTimeController,
                  labelText: 'Select Cut off Time',
                ),
                DatePickerFormField(
                  controller: _cutOffDateController,
                  labelText: 'Select Cut off Date',
                ),
              ),
              const SizedBox(height: 20),
              // Turn-On Section
              _buildSection(
                TimePickerFormField(
                  controller: _turnOnTimeController,
                  labelText: 'Select Turn On Time',
                ),
                DatePickerFormField(
                  controller: _turnOnDateController,
                  labelText: 'Select Turn On Date',
                ),
              ),
              const SizedBox(height: 20),
              // Fuel Level Circular Selector
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomTextWidget(
                      text: "Fuel Level Selector",
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onPanUpdate: (details) {
                        // Interactive sliding by calculating angle
                        setState(() {
                          _fuelLevel = (_fuelLevel + details.delta.dy / 300)
                              .clamp(0.0, 1.0);
                        });
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 150,
                            height: 150,
                            child: CircularProgressIndicator(
                              value: _fuelLevel,
                              strokeWidth: 15,
                              backgroundColor: Colors.grey[300],
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            "${(_fuelLevel * 100).toInt()}%",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomTextWidget(
                      text:
                          "Selected Fuel Level: ${(_fuelLevel * 100).toInt()}%",
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build a reusable section
  Widget _buildSection(Widget child1, Widget child2) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
      ),
      height: 200,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [child1, child2],
        ),
      ),
    );
  }
}
