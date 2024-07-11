import 'package:flutter/material.dart';
import '../models/note_model.dart';
import 'note.dart';
import 'dart:math'; // Import untuk menggunakan Random

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Note> notes = [];
  String _searchText = "";

  void _addNote(Note note) {
    setState(() {
      notes.add(note);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Note> displayedNotes = _searchText.isEmpty
        ? notes
        : notes.where((note) => note.title.toLowerCase().contains(_searchText.toLowerCase())).toList();

    displayedNotes.sort((a, b) {
      int aValue = a.title.toLowerCase().indexOf(_searchText.toLowerCase());
      int bValue = b.title.toLowerCase().indexOf(_searchText.toLowerCase());

      if (aValue != -1 && bValue != -1) {
        return aValue.compareTo(bValue);
      } else if (aValue != -1) {
        return -1;
      } else if (bValue != -1) {
        return 1;
      } else {
        return 0;
      }
    });

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Dashboard'),
      // ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 300, // Panjang teksnya 300
                      child: 
                      Text(
                        'Halo Randoo,',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('./images/user.png'), // Ganti dengan nama file gambar profil Anda
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ada acara apa hari ini?',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey
                    ),
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Cari catatan...",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchText = value;
                    });
                  },
                  style: TextStyle(
                    height: 1.0, // Mengatur tinggi ukuran searchbar
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: displayedNotes.isEmpty
                ? Center(
                    child: Text(
                      'Anda Belum Membuat Catatan Tuan...',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: displayedNotes.length,
                    itemBuilder: (context, index) {
                      final note = displayedNotes[index];
                      return Container(
                        margin: EdgeInsets.only(left: 12, right: 
                        5, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30), // Mengubah border radius menjadi 25
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(5),
                        width: max(100, note.title.length * 10.0), // Ukuran lebar textbox disesuaikan dengan panjang isi notes
                        height: max(100, note.content.length * 10.0), // Ukuran tinggi textbox disesuaikan dengan panjang isi notes
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10, left: 10, right: 5, bottom: 10),
                                child: Text(
                                  note.title,
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 0, left: 10),
                                child: Text(
                                  note.content,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: FloatingActionButton(
              backgroundColor: Colors.black, // Mengubah warna floating button menjadi hitam
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NoteScreen(onSave: _addNote),
                  ),
                );
              },
              child: Icon(Icons.add, color: Colors.white), // Mengubah warna icon add menjadi putih
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/dashboard');
          } else if (index == 1) {
            // Tidak ada navigasi karena ini adalah floating action button
          } else if (index == 2) {
            Navigator.pushNamed(context, '/profile1');
          }
        },
      ),
    );
  }
}
