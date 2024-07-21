import 'package:code_factory/app/pages/login_signup/login_page.dart';
import 'package:code_factory/app/pages/user_pages/account_pages.dart';
import 'package:code_factory/app/pages/user_pages/payment_page.dart';
import 'package:code_factory/app/pages/user_pages/saved_courses.dart';
import 'package:code_factory/app/widgets/others/header.dart';
import 'package:code_factory/app/widgets/buttons/profile_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:code_factory/app/utils/firebase_helper.dart';
import 'dart:io';

class UserProfilePage extends StatefulWidget {
  final String uid;
  const UserProfilePage({super.key, required this.uid});

  @override
  UserProfilePageState createState() => UserProfilePageState();
}

class UserProfilePageState extends State<UserProfilePage> {
  File? _imageFile;
  String? _profileImageUrl;

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  Future<void> _loadProfileImage() async {
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child('${widget.uid}.jpg');
      final url = await ref.getDownloadURL();
      if (mounted) {
        setState(() {
          _profileImageUrl = url;
        });
      }
    } on FirebaseException catch (e) {
      handleFirebaseException(context, e);
    } catch (e) {
      showErrorSnackBar(context, "Erro ao atualizar imagem de perfil: $e");
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      _uploadImage();
    }
  }

  Future<void> _uploadImage() async {
    if (_imageFile != null) {
      try {
        final ref = FirebaseStorage.instance
            .ref()
            .child('profile_images')
            .child('${widget.uid}.jpg');
        await ref.putFile(_imageFile!);
        final url = await ref.getDownloadURL();
        if (mounted) {
          setState(() {
            _profileImageUrl = url;
          });
        }
      } on FirebaseException catch (e) {
        handleFirebaseException(context, e);
      } catch (e) {
        if (mounted) {
          showErrorSnackBar(context, "Erro ao atualizar imagem de perfil: $e");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Header(
            headerTitle: 'Perfil',
            navigationFunction: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AccountPages()));
            },
          ),
          GestureDetector(
            onTap: _pickImage,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                  width: 4.0,
                ),
                image: _profileImageUrl != null
                    ? DecorationImage(
                        image: NetworkImage(_profileImageUrl!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: _profileImageUrl == null
                  ? const Icon(Icons.camera_alt, size: 50, color: Colors.grey)
                  : null,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ProfileButton(
            buttonText: "Seus Cursos",
            onPressedFunction: () {},
          ),
          const SizedBox(
            height: 15,
          ),
          ProfileButton(
            buttonText: "Salvos",
            onPressedFunction: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SavedCoursesPage(userId: widget.uid),
                ),
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
          ProfileButton(
            buttonText: "Pagamentos",
            onPressedFunction: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => (const PaymentPage()),
                ),
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
          TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: const Text(
                "Sair do aplicativo",
                style: TextStyle(
                  fontVariations: [FontVariation('wght', 500)],
                ),
              )),
        ],
      ),
    );
  }
}
