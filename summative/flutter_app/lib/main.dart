import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Color(0xFF1A1A2E),
      primaryColor: Color(0xFFE94560),
    ),
    home: PredictionScreen(),
  ));
}

class PredictionScreen extends StatefulWidget {
  @override
  _PredictionScreenState createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  // Input Controllers
  final TextEditingController ageController = TextEditingController();
  final TextEditingController bmiController = TextEditingController();
  final TextEditingController smokerController = TextEditingController();

  String result = "Enter details to predict cost";
  bool isLoading = false;

  Future<void> getPrediction() async {
    setState(() => isLoading = true);

    // YOUR LIVE RENDER URL
    final url = Uri.parse('https://insurance-api-david.onrender.com/predict');

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "age": int.tryParse(ageController.text) ?? 0,
          "bmi": double.tryParse(bmiController.text) ?? 0.0,
          "smoker": int.tryParse(smokerController.text) ?? 0,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          double cost = data['predicted_cost']; 
          result = "\$${cost.toStringAsFixed(2)}";
        });
      } else {
        setState(() {
          result = "Error: Check inputs (Age 1-99, BMI 10-60)";
        });
      }
    } catch (e) {
      setState(() {
        result = "Connection Failed. Is internet on?";
      });
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medical Cost AI", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Color(0xFF16213E),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Patient Details", style: GoogleFonts.poppins(fontSize: 18, color: Colors.white70)),
            SizedBox(height: 20),
            
            _buildInput(ageController, "Age", Icons.person, "e.g. 45"),
            SizedBox(height: 15),
            _buildInput(bmiController, "BMI", Icons.monitor_weight, "e.g. 28.5"),
            SizedBox(height: 15),
            _buildInput(smokerController, "Smoker? (1=Yes, 0=No)", Icons.smoking_rooms, "0 or 1"),
            
            SizedBox(height: 40),
            
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: isLoading ? null : getPrediction,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE94560),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: isLoading 
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text("PREDICT COST", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),

            SizedBox(height: 40),
            Center(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFF16213E),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xFFE94560), width: 1)
                ),
                child: Column(
                  children: [
                    Text("Estimated Charge", style: GoogleFonts.poppins(color: Colors.grey)),
                    SizedBox(height: 10),
                    Text(result, style: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput(TextEditingController controller, String label, IconData icon, String hint) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white24),
        labelStyle: TextStyle(color: Colors.white60),
        prefixIcon: Icon(icon, color: Color(0xFFE94560)),
        filled: true,
        fillColor: Color(0xFF16213E),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      ),
    );
  }
}