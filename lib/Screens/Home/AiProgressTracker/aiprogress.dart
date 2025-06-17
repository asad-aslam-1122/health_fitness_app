import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart'; // Removed - Not used in this version
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../Core/apiconfig.dart';

// Ensure this path is correct and the file contains your API key

class AIProgressTracker extends StatefulWidget {
  const AIProgressTracker({super.key});

  @override
  AIProgressTrackerState createState() => AIProgressTrackerState();
}

class AIProgressTrackerState extends State<AIProgressTracker> {
  File? _imageFile;
  String _userData = '';
  String _result = '';
  bool _isAnalyzing = false;
  double _progressValue = 0.0;
  final picker = ImagePicker();
  List<FitnessData> _progressHistory = [];
  final TextEditingController _dataController = TextEditingController();

  // Sample fitness metrics (would normally come from API or dedicated input)
  final Map<String, String> _fitnessMetrics = {
    'Body Fat %': '22%',
    'Muscle Mass': '38%',
    'Hydration': '60%',
    'BMI': '24.1',
  };

  @override
  void initState() {
    super.initState();
    // Initialize with sample data for demonstration
    _progressHistory = [
      FitnessData(DateTime.now().subtract(Duration(days: 60)),
          weight: 85, bodyFat: 25, muscleMass: 35),
      FitnessData(DateTime.now().subtract(Duration(days: 30)),
          weight: 82, bodyFat: 23, muscleMass: 36),
      FitnessData(DateTime.now(),
          weight: 80, bodyFat: 22, muscleMass: 38),
    ];
  }

  @override
  void dispose() {
    _dataController.dispose(); // Dispose the controller
    super.dispose();
  }


  Future<void> _pickImage() async {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ), // Correct placement of shape
      builder: (BuildContext context) { // Explicit type for clarity
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0), // Adjusted padding
                child: Text('Select Image Source',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)), // Added bold
              ),
              Divider(color: Colors.grey[700], height: 1), // Added height
              ListTile(
                leading: Icon(Icons.camera_alt, color: Colors.orange.shade700), // Matched button color
                title: Text('Take a photo',
                    style: TextStyle(color: Colors.white)),
                onTap: () async {
                  Navigator.pop(context);
                  final picked = await picker.pickImage(
                    source: ImageSource.camera,
                    preferredCameraDevice: CameraDevice.rear,
                  );
                  if (picked != null) {
                    setState(() {
                      _imageFile = File(picked.path);
                      _result = ''; // Clear previous result
                    });
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library, color: Colors.orange.shade700), // Matched button color
                title: Text('Choose from gallery',
                    style: TextStyle(color: Colors.white)),
                onTap: () async {
                  Navigator.pop(context);
                  final picked = await picker.pickImage(
                    source: ImageSource.gallery,
                    imageQuality: 85, // Keep image quality reasonable
                  );
                  if (picked != null) {
                    setState(() {
                      _imageFile = File(picked.path);
                      _result = ''; // Clear previous result
                    });
                  }
                },
              ),
              SizedBox(height: 8), // Padding at the bottom
            ],
          ),
        );
      },
    );
  }

  Future<void> _analyzeImage() async {
    // Trim user data to avoid issues with leading/trailing whitespace
    final String trimmedUserData = _userData.trim();

    if (_imageFile == null || trimmedUserData.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select an image and enter user data (goals, metrics, etc.)'),
          backgroundColor: Colors.redAccent, // Use a more indicative color for errors
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(10), // Add margin
        ),
      );
      return;
    }

    setState(() {
      _isAnalyzing = true;
      _progressValue = 0.0;
      _result = ''; // Clear previous results when starting analysis
    });

    // Simulate progress (in real app this might track upload)
    for (int i = 0; i < 5; i++) {
      if (!_isAnalyzing) break; // Stop simulation if cancelled early
      await Future.delayed(Duration(milliseconds: 300));
      // Check if mounted before calling setState
      if(mounted) {
        setState(() => _progressValue = (i + 1) * 0.2);
      }
    }

    try {
      final bytes = await _imageFile!.readAsBytes();
      final base64Image = base64Encode(bytes);

      // Ensure API Key is available
      if (geminiApiKey.isEmpty) {
        throw Exception("API Key is missing. Please configure it in apiconfig.dart");
      }

      final url =
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$geminiApiKey';

      final prompt = {
        "contents": [
          {
            "parts": [
              {
                "text": """
You are a helpful and encouraging AI Fitness Coach specializing in visual body composition analysis and progress tracking.

**Task:**
1.  **Analyze User Input:** Carefully review the provided body photo and the user's text data (metrics, routine, goals, diet info).
2.  **Provide Detailed Insights:**
    *   Estimate current body composition (e.g., body fat percentage range, muscle definition level). Be descriptive rather than giving exact false numbers unless explicitly provided by user data.
    *   Assess potential fitness level based on visual cues and provided data.
    *   Mention any visually notable muscle imbalances or postural observations (use cautious language, e.g., "appears to be," "potential").
    *   Identify strengths and potential areas for improvement based on the analysis and stated goals.
3.  **Create a Realistic 2-Month Projection:**
    *   Outline expected progress if the user continues their current trajectory (based on provided info).
    *   Suggest *optimized* progress achievable with specific, recommended changes. Be motivational but realistic.
4.  **Offer Actionable Recommendations:**
    *   Suggest specific training adjustments (e.g., exercises, frequency, intensity focus) tailored to the user's goals and current state.
    *   Provide nutritional focus areas (e.g., protein intake, hydration, calorie adjustments – general advice unless specific diet info is given).
    *   Recommend relevant recovery strategies (e.g., sleep, stretching, active recovery).

**Formatting:**
*   Use clear headings (like **Analysis**, **Projection**, **Recommendations**).
*   Use bullet points (`*`) or numbered lists for readability.
*   Maintain a positive and supportive tone.
*   **Important:** Do NOT provide medical advice. Frame suggestions around fitness and general wellness.

**User Data:**
$trimmedUserData

**(Image provided shows the user's current physique)**
""",
              },
              {
                "inline_data": {"mime_type": "image/jpeg", "data": base64Image},
              },
            ],
          },
        ],
        // Optional: Add safety settings if needed
        // "safetySettings": [
        //   {
        //     "category": "HARM_CATEGORY_HARASSMENT",
        //     "threshold": "BLOCK_MEDIUM_AND_ABOVE"
        //   },
        //   // Add other categories as needed
        // ]
      };

      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(prompt),
      );

      if (!mounted) return; // Check if widget is still in the tree

      if (response.statusCode == 200) {
        final resultData = jsonDecode(response.body);

        // **Safer parsing**
        final candidates = resultData['candidates'] as List<dynamic>?;
        if (candidates != null && candidates.isNotEmpty) {
          final content = candidates[0]['content'] as Map<String, dynamic>?;
          if (content != null) {
            final parts = content['parts'] as List<dynamic>?;
            if (parts != null && parts.isNotEmpty) {
              final text = parts[0]['text'] as String?;
              if (text != null) {
                setState(() {
                  _result = text;
                  // --- Real App TODO ---
                  // Parse actual metrics FROM the 'text' result here if the AI provides them
                  // Update _progressHistory with parsed data, not simulated data.
                  // For now, we keep the simulation:
                  if (_progressHistory.isNotEmpty) {
                    _progressHistory.add(FitnessData(
                      DateTime.now(),
                      weight: _progressHistory.last.weight - 1, // Example change
                      bodyFat: _progressHistory.last.bodyFat - 0.5,
                      muscleMass: _progressHistory.last.muscleMass + 0.5,
                    ));
                    // Limit history size if needed
                    // if (_progressHistory.length > 10) {
                    //   _progressHistory.removeAt(0);
                    // }
                  }
                });
              } else {
                setState(() => _result = 'Error: Could not extract text from API response part.');
              }
            } else {
              setState(() => _result = 'Error: API response content has no parts.');
            }
          } else {
            setState(() => _result = 'Error: API response candidate has no content.');
          }
        } else {
          // Check for prompt feedback if no candidates
          final promptFeedback = resultData['promptFeedback'] as Map<String, dynamic>?;
          if (promptFeedback != null && promptFeedback['blockReason'] != null) {
            setState(() => _result = 'Error: Request blocked by API. Reason: ${promptFeedback['blockReason']}. Content might be inappropriate.');
          } else {
            setState(() => _result = 'Error: No candidates found in API response and no block reason provided.');
          }
        }
      } else {
        setState(() => _result = 'Error: ${response.statusCode}\n${response.body}');
      }
    } catch (e) { // Catch stackTrace for better debugging
      if (mounted) { // Check if mounted before setState
        setState(() => _result = 'An unexpected error occurred: $e');
      }
    } finally {
      if (mounted) { // Check if mounted before setState
        setState(() => _isAnalyzing = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent, // Make AppBar transparent
        elevation: 0, // No shadow
        title: Text('AI Fitness Tracker',

            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        iconTheme: IconThemeData(color: Colors.white), // Back button color
        flexibleSpace: Container( // Apply gradient to AppBar background
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.deepPurple.shade800, Color(0xff121212)], // Gradient from purple to bg color
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // --- Image Section ---
            Card(
              color: Colors.grey[900], // Dark card background
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              clipBehavior: Clip.antiAlias, // Clip child content
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text('Body Composition Analysis',
                        textAlign: TextAlign.center, // Center title
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 16), // Increased spacing
                    GestureDetector( // Allow tapping the image area too
                      onTap: _pickImage,
                      child: _imageFile != null
                          ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          _imageFile!,
                          height: 250, // Slightly larger image view
                          width: double.infinity, // Take full card width
                          fit: BoxFit.cover,
                        ),
                      )
                          : Container(
                        height: 250, // Match height
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.image_search, // More relevant icon
                                  size: 50, color: Colors.grey[500]),
                              SizedBox(height: 12),
                              Text('Tap to select an image',
                                  style: TextStyle(color: Colors.grey[400])), // Adjusted text
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16), // Increased spacing
                    ElevatedButton.icon(
                      icon: Icon(_imageFile == null ? Icons.add_a_photo : Icons.edit, size: 20), // Change icon based on state
                      label: Text(_imageFile == null
                          ? 'Upload Body Photo'
                          : 'Change Photo'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.shade700,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)), // More rounded
                        padding: EdgeInsets.symmetric(
                            horizontal: 30, vertical: 12), // Adjust padding
                      ),
                      onPressed: _pickImage,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20), // Increased spacing between cards

            // --- User Data Input ---
            Card(
              color: Colors.grey[900],
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your Fitness Details & Goals', // More descriptive title
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 16),
                    TextField(
                      controller: _dataController,
                      maxLines: 5, // Allow more lines
                      minLines: 3, // Ensure minimum height
                      style: TextStyle(color: Colors.white, fontSize: 15), // Slightly larger text
                      decoration: InputDecoration(
                        hintText: 'Enter current metrics (e.g., weight: 80kg, height: 180cm), workout routine (e.g., 3x week PPL), diet notes (e.g., high protein), and primary goals (e.g., lose fat, gain muscle)... The more detail, the better the analysis!',
                        hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14), // Adjusted hint style
                        border: OutlineInputBorder( // Use outline border
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey[700]!), // Subtle border color
                        ),
                        enabledBorder: OutlineInputBorder( // Border when enabled
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey[700]!),
                        ),
                        focusedBorder: OutlineInputBorder( // Border when focused
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.deepPurple.shade400), // Highlight color
                        ),
                        filled: true,
                        fillColor: Colors.grey[850], // Slightly different fill
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Adjust padding
                      ),
                      onChanged: (val) => _userData = val,
                      textInputAction: TextInputAction.done, // Set keyboard action
                    ),
                    // Keep sample metrics display if desired
                    if (_fitnessMetrics.isNotEmpty) ...[
                      SizedBox(height: 16),
                      Text('Example Metrics (From Other Sources)', // Clarify origin
                          style: TextStyle(
                              color: Colors.grey[400], // Less emphasis
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                      SizedBox(height: 10),
                      Wrap(
                        spacing: 10, // Increase spacing
                        runSpacing: 8,
                        children: _fitnessMetrics.entries.map((e) => Chip(
                          backgroundColor: Colors.deepPurple.shade700,
                          label: Text('${e.key}: ${e.value}',
                              style: TextStyle(color: Colors.white, fontSize: 13)), // Adjust font size
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4), // Adjust padding
                        )).toList(),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // --- Progress Chart ---
            if (_progressHistory.length > 1) // Only show chart if there's data to plot
              Card(
                color: Colors.grey[900],
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 10), // Adjust padding
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Progress History',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 12),
                      SizedBox(
                        height: 220, // Slightly taller chart
                        child: SfCartesianChart(
                          plotAreaBorderWidth: 0,
                          backgroundColor: Colors.transparent,
                          primaryXAxis: DateTimeAxis(
                            // dateFormat: DateFormat.Md(), // Example if intl is used
                            edgeLabelPlacement: EdgeLabelPlacement.shift, // Avoid labels overlapping
                            intervalType: DateTimeIntervalType.auto, // Auto interval
                            axisLine: AxisLine(width: 0),
                            majorGridLines: MajorGridLines(width: 0), // Hide vertical grid lines
                            labelStyle: TextStyle(color: Colors.grey[400], fontSize: 11),
                          ),
                          primaryYAxis: NumericAxis(
                            // title: AxisTitle(text: 'Value', textStyle: TextStyle(color: Colors.grey[400])), // Optional Y-axis title
                            axisLine: AxisLine(width: 0),
                            majorTickLines: MajorTickLines(size: 0), // Hide major ticks
                            majorGridLines: MajorGridLines(
                                color: Colors.grey[800], // Subtle grid lines
                                width: 0.5 // Thinner lines
                            ),
                            labelStyle: TextStyle(color: Colors.grey[400], fontSize: 11),
                          ),
                          series: <CartesianSeries<FitnessData, DateTime>>[
                            // Weight Series
                            LineSeries<FitnessData, DateTime>(
                              dataSource: _progressHistory,
                              xValueMapper: (FitnessData data, _) => data.date,
                              yValueMapper: (FitnessData data, _) => data.weight,
                              name: 'Weight (kg)',
                              color: Colors.orange.shade600,
                              width: 2.5, // Slightly thicker line
                              markerSettings: MarkerSettings(
                                isVisible: true,
                                shape: DataMarkerType.circle,
                                height: 8, width: 8, // Larger markers
                                borderWidth: 2,
                                borderColor: Colors.orange.shade600,
                                color: Colors.grey[900], // Match card background for hollow effect
                              ),
                              // dataLabelSettings: DataLabelSettings(isVisible: true) // Optional: show data labels
                            ),
                            // Body Fat Series
                            LineSeries<FitnessData, DateTime>(
                              dataSource: _progressHistory,
                              xValueMapper: (FitnessData data, _) => data.date,
                              yValueMapper: (FitnessData data, _) => data.bodyFat,
                              name: 'Body Fat %',
                              color: Colors.deepPurple.shade400, // Lighter purple
                              width: 2.5,
                              dashArray: <double>[5, 5], // Dashed line for distinction
                              markerSettings: MarkerSettings(
                                isVisible: true,
                                shape: DataMarkerType.diamond, // Different shape
                                height: 8, width: 8,
                                borderWidth: 2,
                                borderColor: Colors.deepPurple.shade400,
                                color: Colors.grey[900],
                              ),
                            ),
                            // Optional: Add Muscle Mass Series if desired
                            // LineSeries<FitnessData, DateTime>(
                            //   dataSource: _progressHistory,
                            //   xValueMapper: (FitnessData data, _) => data.date,
                            //   yValueMapper: (FitnessData data, _) => data.muscleMass,
                            //   name: 'Muscle Mass',
                            //   color: Colors.green.shade400,
                            //   // ... other settings
                            // ),
                          ],
                          legend: Legend(
                            isVisible: true,
                            position: LegendPosition.bottom,
                            textStyle: TextStyle(color: Colors.white, fontSize: 12),
                            overflowMode: LegendItemOverflowMode.wrap, // Wrap if too many items
                            iconHeight: 10, iconWidth: 10, // Smaller legend icons
                          ),
                          tooltipBehavior: TooltipBehavior( // Enable tooltips on tap/hover
                              enable: true,
                              header: '', // No default header
                              format: 'point.x : point.y', // Basic format
                              color: Colors.grey[800], // Tooltip background
                              textStyle: TextStyle(color: Colors.white)
                          ),
                          trackballBehavior: TrackballBehavior( // Enable trackball for better data exploration
                              enable: true,
                              lineWidth: 1.0,
                              lineColor: Colors.grey[500],
                              activationMode: ActivationMode.singleTap, // Activate on tap
                              tooltipSettings: InteractiveTooltip(
                                  enable: true,
                                  color: Colors.grey[800],
                                  textStyle: TextStyle(color: Colors.white),
                                  format: 'point.x\npoint.series.name: point.y' // Show date, series name, value
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            if (_progressHistory.length > 1) SizedBox(height: 20),

            // --- Analyze Button ---
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple.shade600, // Slightly lighter purple
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)), // Match other buttons
                padding: EdgeInsets.symmetric(vertical: 16), // Consistent padding
                elevation: 5, // Slightly more elevation
                disabledBackgroundColor: Colors.grey[700], // Color when disabled
              ),
              onPressed: _isAnalyzing ? null : _analyzeImage, // Disable when analyzing
              child: _isAnalyzing
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox( // Constrain progress indicator size
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                        value: _progressValue > 0 ? _progressValue : null, // Indeterminate if 0
                        strokeWidth: 3, // Thicker stroke
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white)), // Use valueColor
                  ),
                  SizedBox(width: 15), // Increased spacing
                  Text('AI Analyzing...',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)), // Bolder text
                ],
              )
                  : Text('Analyze with AI',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)), // Bolder, larger text
            ),

            SizedBox(height: 20),

            // --- Results Section ---
            if (_result.isNotEmpty) ...[
              Text('AI Analysis & Recommendations', // More specific title
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 19, // Slightly larger
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              Card(
                color: Colors.grey[900],
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text left
                    children: [
                      // Optional Header for the result box
                      // Container(
                      //   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      //   decoration: BoxDecoration(
                      //       color: Colors.deepPurple.shade900,
                      //       borderRadius: BorderRadius.circular(8)),
                      //   child: Row(
                      //     mainAxisSize: MainAxisSize.min, // Prevent row from expanding
                      //     children: [
                      //       Icon(Icons.insights, color: Colors.orange.shade600, size: 20),
                      //       SizedBox(width: 8),
                      //       Text('Fitness Insights',
                      //           style: TextStyle(
                      //               color: Colors.white,
                      //               fontWeight: FontWeight.bold,
                      //               fontSize: 15)),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(height: 16),
                      SelectableText( // Allow user to select/copy text
                        _result,
                        style: TextStyle(
                            fontSize: 15, // Consistent text size
                            color: Colors.white.withAlpha((0.2 * 255).toInt()), // Slightly transparent white
                            height: 1.5), // Line spacing
                      ),
                      SizedBox(height: 20), // Spacing before buttons
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              icon: Icon(Icons.share_outlined, size: 20), // Use outlined icon
                              label: Text('Share'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.orange.shade600, // Orange outline/text
                                side: BorderSide(color: Colors.orange.shade600, width: 1.5), // Thicker border
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                padding: EdgeInsets.symmetric(vertical: 12),
                              ),
                              onPressed: () {
                                // TODO: Implement share functionality (e.g., using 'share_plus' package)
                                // Share.share(_result);
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Share action placeholder')));
                              },
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton.icon(
                              icon: Icon(Icons.save_alt_outlined, size: 20), // Use outlined icon
                              label: Text('Save Report'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple.shade600, // Match main button
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                padding: EdgeInsets.symmetric(vertical: 12),
                              ),
                              onPressed: () {
                                // TODO: Implement save functionality (e.g., save to local storage, cloud)
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Save report action placeholder')));
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20), // Padding at the very bottom
            ],
          ],
        ),
      ),
    );
  }
}

// --- Data Class ---
class FitnessData {
  final DateTime date;
  final double weight; // e.g., in kg
  final double bodyFat; // e.g., in %
  final double muscleMass; // e.g., in % or kg (be consistent)

  FitnessData(this.date, {
    required this.weight,
    required this.bodyFat,
    required this.muscleMass,
  });
}