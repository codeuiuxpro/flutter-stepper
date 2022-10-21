import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const FinalView(),
    );
  }
}

class FinalView extends StatefulWidget {
  const FinalView({Key? key}) : super(key: key);

  @override
  _FinalViewState createState() => _FinalViewState();
}

class _FinalViewState extends State<FinalView> {
  int currentStep = 0;

  bool isVerticalStepper = true;

  _stepTapped(int step) {
    setState(() => currentStep = step);
  }

  _stepContinue() {
    currentStep < 3 ? setState(() => currentStep += 1) : null;
  }

  _stepCancel() {
    currentStep > 0 ? setState(() => currentStep -= 1) : null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('simple_stepper'),
        ),
        body: Column(
          children: [
            
            const Divider(
              thickness: 2,
              height: 30,
            ),
            Expanded(
              child: Stepper(
                type: isVerticalStepper
                    ? StepperType.vertical
                    : StepperType.horizontal,
                physics: const ScrollPhysics(),
                currentStep: currentStep,
                onStepTapped: (step) => _stepTapped(step),
                onStepContinue: _stepContinue,
                onStepCancel: _stepCancel,
                steps: [
                  Step(
                    title: const Text('Name'),
                    content: Column(
                      children: [
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Your name'),
                        ),
                      ],
                    ),
                    isActive: currentStep >= 0,
                    state: currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),

                  Step(
                    title: const Text('Mobile number'),
                    content: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Your mobile number'),
                        ),
                      ],
                    ),
                    isActive: currentStep >= 0,
                    state: currentStep >= 1
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  // The third step: Your mother name
                  Step(
                    title: const Text('Your mother last name'),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Your mother last name'),
                        ),
                      ],
                    ),
                    isActive: currentStep >= 0,
                    state: currentStep >= 2
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  // The fourth step: Verify phone number
                  Step(
                    title: const Text('Verify'),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Verification code'),
                        ),
                      ],
                    ),
                    isActive: currentStep >= 0,
                    state: currentStep >= 3
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}