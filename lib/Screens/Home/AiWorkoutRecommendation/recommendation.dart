import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../../Core/apiconfig.dart';



class WorkoutRecommendationScreen extends StatefulWidget {
  const WorkoutRecommendationScreen({super.key});

  @override
  State<WorkoutRecommendationScreen> createState() =>
      _WorkoutRecommendationScreenState();
}

class _WorkoutRecommendationScreenState extends State<WorkoutRecommendationScreen> {
  // User input fields
  String _selectedGoal = 'weight_loss';
  String _selectedFitnessLevel = 'beginner';
  String _workoutPreference = 'gym'; // gym/home/outdoor
  int _workoutDuration = 30; // minutes
  List<String> _availableEquipment = [];
  String _pastActivity = '';

  // API state
  bool _isLoading = false;
  String _recommendationResult = '';
  String _errorMessage = '';

  // Theme colors
  final Color _primaryColor = Colors.blue.shade700;
  final Color _accentColor = Colors.orange.shade600;
  final Color _textColor = Colors.black87;
  final Color _secondaryTextColor = Colors.black54;

  // Equipment options
  final List<String> _equipmentOptions = [
    'Dumbbells',
    'Resistance Bands',
    'Yoga Mat',
    'Pull-up Bar',
    'Kettlebells',
    'Treadmill',
    'Exercise Bike',
    'None'
  ];

  Future<void> _getRecommendations() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _recommendationResult = '';
      _errorMessage = '';
    });

    try {
      // Prepare the prompt for Gemini API
      String prompt = """
Generate a personalized workout plan based on the following user information:
- Goal: ${_mapGoalToText(_selectedGoal)}
- Fitness Level: ${_mapLevelToText(_selectedFitnessLevel)}
- Preferred Workout Location: ${_mapPreferenceToText(_workoutPreference)}
- Available Equipment: ${_availableEquipment.isEmpty ? 'None' : _availableEquipment.join(', ')}
- Workout Duration: $_workoutDuration minutes
${_pastActivity.isNotEmpty ? '- Past Activity Notes: $_pastActivity\n' : ''}

Provide the response in this structured format:
1. [Heading] Workout Plan Overview
   - Summary of the recommended approach
   - Key focus areas based on goals

2. [Heading] Warm-up (5-10 minutes)
   - Specific warm-up exercises
   - Duration for each

3. [Heading] Main Workout
   - Exercises grouped by type (strength, cardio, etc.)
   - Sets x Reps or Duration for each
   - Rest periods
   - Modifications for fitness level

4. [Heading] Cool-down (5-10 minutes)
   - Stretching/mobility exercises
   - Duration for each

5. [Heading] Additional Notes
   - Progression tips
   - Safety considerations
   - Frequency recommendation
   - Any equipment alternatives if needed
""";

      final response = await http.post(
        Uri.parse(
          "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$geminiApiKey",
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": prompt}
              ]
            }
          ],
          "generationConfig": {
            "temperature": 0.3, // Lower for more structured output
            "topP": 0.8,
            "maxOutputTokens": 1500,
          },
        }),
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final text = jsonResponse["candidates"]?[0]?["content"]?["parts"]?[0]?["text"];

        if (text != null && text is String) {
          setState(() {
            _recommendationResult = text;
          });
        } else {
          throw Exception('Invalid API response format');
        }
      } else {
        throw Exception('API Error: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error: ${e.toString().replaceAll(geminiApiKey, '[REDACTED]')}';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  String _mapGoalToText(String goal) {
    switch (goal) {
      case 'weight_loss': return 'Weight Loss';
      case 'muscle_gain': return 'Muscle Gain';
      case 'endurance': return 'Endurance';
      case 'general_fitness': return 'General Fitness';
      default: return goal;
    }
  }

  String _mapLevelToText(String level) {
    switch (level) {
      case 'beginner': return 'Beginner';
      case 'intermediate': return 'Intermediate';
      case 'advanced': return 'Advanced';
      default: return level;
    }
  }

  String _mapPreferenceToText(String preference) {
    switch (preference) {
      case 'gym': return 'Gym';
      case 'home': return 'Home';
      case 'outdoor': return 'Outdoor';
      default: return preference;
    }
  }

  List<MapEntry<String, String>> _parseRecommendation(String result) {
    final List<MapEntry<String, String>> sections = [];
    final parts = result.split(RegExp(r'\s*\[Heading\]\s*'))
        .where((s) => s.trim().isNotEmpty)
        .toList();

    for (final part in parts) {
      final newlineIndex = part.indexOf('\n');
      if (newlineIndex != -1) {
        final title = part.substring(0, newlineIndex).trim();
        final content = part.substring(newlineIndex + 1).trim();
        if (title.isNotEmpty) {
          sections.add(MapEntry(title, content));
        }
      } else if (part.trim().isNotEmpty) {
        sections.add(MapEntry('Details', part.trim()));
      }
    }

    if (sections.isEmpty && result.trim().isNotEmpty) {
      sections.add(MapEntry('Workout Recommendation', result.trim()));
    }

    return sections;
  }

  Widget _buildRecommendationSection(String title, String content) {
    IconData iconData;
    Color iconColor = _primaryColor;

    final lowerTitle = title.toLowerCase();
    if (lowerTitle.contains('overview')) {
      iconData = Icons.assignment_outlined;
    } else if (lowerTitle.contains('warm')) {
      iconData = Icons.fireplace_outlined;
      iconColor = Colors.orange.shade600;
    } else if (lowerTitle.contains('workout')) {
      iconData = Icons.fitness_center_outlined;
      iconColor = Colors.green.shade700;
    } else if (lowerTitle.contains('cool')) {
      iconData = Icons.air_outlined;
      iconColor = Colors.blue.shade500;
    } else if (lowerTitle.contains('note')) {
      iconData = Icons.notes_outlined;
      iconColor = _accentColor;
    } else {
      iconData = Icons.info_outline;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(iconData, color: iconColor, size: 28),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: _textColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Text(
              content,
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: _secondaryTextColor,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AI Workout Recommendations',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: _primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // User Input Section
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Fitness Profile',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: _textColor,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Goal Selection
                    _buildDropdown(
                      label: 'Primary Goal',
                      value: _selectedGoal,
                      items: [
                        'weight_loss',
                        'muscle_gain',
                        'endurance',
                        'general_fitness'
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedGoal = value!;
                        });
                      },
                      displayMapper: _mapGoalToText,
                    ),

                    // Fitness Level
                    _buildDropdown(
                      label: 'Fitness Level',
                      value: _selectedFitnessLevel,
                      items: ['beginner', 'intermediate', 'advanced'],
                      onChanged: (value) {
                        setState(() {
                          _selectedFitnessLevel = value!;
                        });
                      },
                      displayMapper: _mapLevelToText,
                    ),

                    // Workout Preference
                    _buildSegmentedControl(),

                    // Duration Slider
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Workout Duration: $_workoutDuration minutes',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: _textColor,
                            ),
                          ),
                          Slider(
                            value: _workoutDuration.toDouble(),
                            min: 15,
                            max: 120,
                            divisions: 7,
                            label: '$_workoutDuration min',
                            onChanged: (value) {
                              setState(() {
                                _workoutDuration = value.round();
                              });
                            },
                            activeColor: _primaryColor,
                          ),
                        ],
                      ),
                    ),

                    // Equipment Selection
                    _buildChipSelection(),

                    // Past Activity Notes
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Past Activity/Notes (Optional)',
                        labelStyle: GoogleFonts.poppins(),
                        border: const OutlineInputBorder(),
                      ),
                      maxLines: 2,
                      onChanged: (value) {
                        setState(() {
                          _pastActivity = value;
                        });
                      },
                    ),

                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _getRecommendations,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _primaryColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                            : Text(
                          'Get Workout Plan',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Results Section
            if (_isLoading)
              _buildLoadingIndicator()
            else if (_errorMessage.isNotEmpty)
              _buildErrorMessage()
            else if (_recommendationResult.isNotEmpty)
                _buildRecommendationResults(),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    required String Function(String) displayMapper,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: _textColor,
            ),
          ),
          const SizedBox(height: 4),
          DropdownButtonFormField<String>(
            value: value,
            items: items.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(displayMapper(item),style: TextStyle(color: Colors.black),),
              );
            }).toList(),
            onChanged: onChanged,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ),
            ),
            style: GoogleFonts.poppins(),
          ),
        ],
      ),
    );
  }

  Widget _buildSegmentedControl() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Workout Preference',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: _textColor,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: SegmentedButton<String>(
              segments: [
                ButtonSegment(
                  value: 'gym',
                  label: Text('Gym', style: GoogleFonts.poppins()),
                  icon: const Icon(Icons.fitness_center_outlined),
                ),
                ButtonSegment(
                  value: 'home',
                  label: Text('Home', style: GoogleFonts.poppins()),
                  icon: const Icon(Icons.home_outlined),
                ),
                ButtonSegment(
                  value: 'outdoor',
                  label: Text('Outdoor', style: GoogleFonts.poppins()),
                  icon: const Icon(Icons.park_outlined),
                ),
              ],
              selected: {_workoutPreference},
              onSelectionChanged: (Set<String> newSelection) {
                setState(() {
                  _workoutPreference = newSelection.first;
                });
              },
              showSelectedIcon: false,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                    if (states.contains(WidgetState.selected)) {
                      return _primaryColor;
                    }
                    return Colors.grey.shade200;
                  },
                ),
                foregroundColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                    if (states.contains(WidgetState.selected)) {
                      return Colors.white;
                    }
                    return _textColor;
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChipSelection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Available Equipment',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: _textColor,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _equipmentOptions.map((equipment) {
              final isSelected = _availableEquipment.contains(equipment);
              return FilterChip(
                label: Text(equipment),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      if (equipment == 'None') {
                        _availableEquipment = ['None'];
                      } else {
                        _availableEquipment.remove('None');
                        _availableEquipment.add(equipment);
                      }
                    } else {
                      _availableEquipment.remove(equipment);
                    }
                  });
                },
                selectedColor: _primaryColor,
                checkmarkColor: Colors.white,
                labelStyle: GoogleFonts.poppins(
                  color: isSelected ? Colors.white : _textColor,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Column(
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(_primaryColor),
            ),
            const SizedBox(height: 16),
            Text(
              'Generating your personalized workout plan...',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: _secondaryTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorMessage() {
    return Card(
      color: Colors.red.shade50,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(Icons.error_outline, color: Colors.red.shade700),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                _errorMessage,
                style: GoogleFonts.poppins(
                  color: Colors.red.shade700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationResults() {
    final parsedResults = _parseRecommendation(_recommendationResult);

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Personalized Workout Plan',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: _primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            if (parsedResults.isEmpty)
              Text(
                _recommendationResult,
                style: GoogleFonts.poppins(
                  color: _secondaryTextColor,
                ),
              )
            else
              ...parsedResults.map((entry) =>
                  _buildRecommendationSection(entry.key, entry.value)),
          ],
        ),
      ),
    );
  }
}