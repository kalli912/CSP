import 'package:flutter/material.dart';

class PostJobPage extends StatefulWidget {
  const PostJobPage({super.key});

  @override
  State<PostJobPage> createState() => _PostJobPageState();
}

class _PostJobPageState extends State<PostJobPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _companyController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _minSalaryController = TextEditingController();
  final _maxSalaryController = TextEditingController();
  final _contactEmailController = TextEditingController();

  String _selectedJobType = 'full-time';
  String _selectedExperienceLevel = 'entry';
  String _selectedCategory = 'technology';
  bool _isRemote = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Post Job', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Post a New Job',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  // Job Title
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: 'Job Title',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value?.isEmpty ?? true
                        ? 'Please enter job title'
                        : null,
                  ),
                  const SizedBox(height: 16),
                  // Company
                  TextFormField(
                    controller: _companyController,
                    decoration: const InputDecoration(
                      labelText: 'Company',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value?.isEmpty ?? true
                        ? 'Please enter company name'
                        : null,
                  ),
                  const SizedBox(height: 16),
                  // Location
                  TextFormField(
                    controller: _locationController,
                    decoration: const InputDecoration(
                      labelText: 'Location',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Job Type Dropdown
                  DropdownButtonFormField<String>(
                    value: _selectedJobType,
                    decoration: const InputDecoration(
                      labelText: 'Job Type',
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(value: 'full-time', child: Text('Full-time')),
                      DropdownMenuItem(value: 'part-time', child: Text('Part-time')),
                      DropdownMenuItem(value: 'contract', child: Text('Contract')),
                      DropdownMenuItem(value: 'internship', child: Text('Internship')),
                    ],
                    onChanged: (value) => setState(() => _selectedJobType = value!),
                  ),
                  const SizedBox(height: 16),
                  // Salary Range
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _minSalaryController,
                          decoration: const InputDecoration(
                            labelText: 'Min Salary',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _maxSalaryController,
                          decoration: const InputDecoration(
                            labelText: 'Max Salary',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Experience Level
                  DropdownButtonFormField<String>(
                    value: _selectedExperienceLevel,
                    decoration: const InputDecoration(
                      labelText: 'Experience Level',
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(value: 'entry', child: Text('Entry Level')),
                      DropdownMenuItem(value: 'mid', child: Text('Mid Level')),
                      DropdownMenuItem(value: 'senior', child: Text('Senior Level')),
                      DropdownMenuItem(value: 'executive', child: Text('Executive')),
                    ],
                    onChanged: (value) => setState(() => _selectedExperienceLevel = value!),
                  ),
                  const SizedBox(height: 16),
                  // Job Description
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Job Description',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 5,
                  ),
                  const SizedBox(height: 16),
                  // Remote Work Checkbox
                  CheckboxListTile(
                    title: const Text('This is a remote position'),
                    value: _isRemote,
                    onChanged: (value) => setState(() => _isRemote = value!),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  const SizedBox(height: 24),
                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _submitJob,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Post Job',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitJob() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Job posted successfully!')),
      );
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _companyController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    _minSalaryController.dispose();
    _maxSalaryController.dispose();
    _contactEmailController.dispose();
    super.dispose();
  }
}
