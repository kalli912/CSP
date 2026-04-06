import 'package:flutter/material.dart';

class SearchWorkersPage extends StatefulWidget {
  const SearchWorkersPage({super.key});

  @override
  State<SearchWorkersPage> createState() => _SearchWorkersPageState();
}

class _SearchWorkersPageState extends State<SearchWorkersPage> {
  final _searchController = TextEditingController();
  String _selectedJobType = 'all';
  String _selectedLocation = 'all';
  String _selectedExperience = 'all';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Search Workers', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSearchSection(),
            const SizedBox(height: 24),
            _buildSearchResults(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: 'Search candidates, skills...',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // search workers
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  ),
                  child: const Icon(Icons.search, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedJobType,
                    decoration: const InputDecoration(
                      labelText: 'Job Type',
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(value: 'all', child: Text('All Job Types')),
                      DropdownMenuItem(value: 'full-time', child: Text('Full-time')),
                      DropdownMenuItem(value: 'part-time', child: Text('Part-time')),
                      DropdownMenuItem(value: 'contract', child: Text('Contract')),
                      DropdownMenuItem(value: 'internship', child: Text('Internship')),
                    ],
                    onChanged: (value) => setState(() => _selectedJobType = value!),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedLocation,
                    decoration: const InputDecoration(
                      labelText: 'Location',
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(value: 'all', child: Text('All Locations')),
                      DropdownMenuItem(value: 'remote', child: Text('Remote')),
                      DropdownMenuItem(value: 'onsite', child: Text('On-site')),
                      DropdownMenuItem(value: 'hybrid', child: Text('Hybrid')),
                    ],
                    onChanged: (value) => setState(() => _selectedLocation = value!),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Search Results',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          _buildCandidateCard(),
        ],
      ),
    );
  }

  Widget _buildCandidateCard() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('John Doe',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Frontend Developer', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // save candidate
                  },
                  icon: const Icon(Icons.star_border),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                const Text('Austin, TX (Remote)'),
                const SizedBox(width: 16),
                Icon(Icons.work, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                const Text('5 yrs experience'),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Skilled frontend developer with React, JavaScript, and CSS expertise.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: [
                _buildSkillChip('React'),
                _buildSkillChip('JavaScript'),
                _buildSkillChip('CSS'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Chip(
      label: Text(skill, style: const TextStyle(fontSize: 12)),
      backgroundColor: Colors.blue.withOpacity(0.1),
      labelStyle: const TextStyle(color: Colors.blue),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
