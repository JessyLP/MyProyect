import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';


import '../Firebase/singleton/DataHolder.dart';
import 'LoginView.dart';
import 'ShapeImagePositioned.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with TickerProviderStateMixin {
  final double _buttonWidth = 100;

  late AnimationController _buttonScaleController;
  late Animation<double> _buttonScaleAnimation;
  void _initButtonScale() {
    _buttonScaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _buttonScaleAnimation =
    Tween<double>(begin: 1, end: .9).animate(_buttonScaleController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _buttonWidthController.forward();
        }
      });
  }

  late AnimationController _buttonWidthController;
  late Animation<double> _buttonWidthAnimation;
  void _initButtonWidth(double screenWidth) {
    _buttonWidthController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _buttonWidthAnimation = Tween<double>(begin: _buttonWidth, end: screenWidth)
        .animate(_buttonWidthController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _positionedController.forward();
        }
      });
  }

  late AnimationController _positionedController;
  late Animation<double> _positionedAnimation;
  void _initPositioned(double screenWidth) {
    _positionedController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    // 160 = 20 left padding + 20 right padding + 10 left positioned + 10 right positioned + 100 button width
    _positionedAnimation = Tween<double>(begin: 10, end: screenWidth - 160)
        .animate(_positionedController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _screenScaleController.forward();
        }
      });
  }

  late AnimationController _screenScaleController;
  late Animation<double> _screenScaleAnimation;
  void _initScreenScale() {
    _screenScaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _screenScaleAnimation =
    Tween<double>(begin: 1, end: 24).animate(_screenScaleController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.pushReplacement(
              context,
              PageTransition(
                  child:  LoginView(),
                  type: PageTransitionType.fade));
        }
      });
  }



  void loadAllData() async{
    await Future.delayed(Duration(seconds: 10000));
    //CARGAMOS TODOS LOS RECURSOS

    //if(FirebaseAuth.instance.currentUser==null){
    if(DataHolder().perfil.uid==null){
      setState(() {
        Navigator.of(context).popAndPushNamed("/login");
      });
    }
    else{
      bool existe=await checkExistingProfile();
      if(existe){
        setState(() {
          Navigator.of(context).popAndPushNamed("/home");
        });
      }
      else{
        setState(() {
          Navigator.of(context).popAndPushNamed("/register");
        });
      }



    }
  }

  Future<bool> checkExistingProfile() async{
    String? idUser=FirebaseAuth.instance.currentUser?.uid;
    print(idUser);
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docRef = db.collection("perfiles").doc(idUser);

    DocumentSnapshot docsnap= await docRef.get();

    return docsnap.exists;
  }

  @override
  void initState() {
    _initButtonScale();
    _initScreenScale();
    super.initState();
    loadAllData();
  }

  @override
  void dispose() {
    _buttonScaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    _initButtonWidth(screenWidth);
    _initPositioned(screenWidth);

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      child: Stack(
        children: [
          const ShapeImagePositioned(),
          const ShapeImagePositioned(top: -100),
          const ShapeImagePositioned(top: -150),
          const ShapeImagePositioned(top: -200),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 35,
                  fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Thanks for using this app.                                                                                                                                                             ',
                  style: TextStyle(
                      color: CupertinoColors.white.withOpacity(.8),
                      fontSize: 20,
                      height: 1.5),
                ),
                const SizedBox(
                  height: 100,
                ),
                AnimatedBuilder(
                  animation: _buttonScaleController,
                  builder: (_, child) => Transform.scale(
                    scale: _buttonScaleAnimation.value,
                    child: CupertinoButton(
                      onPressed: () {
                        _buttonScaleController.forward();
                      },
                      child: Stack(
                        children: [
                          AnimatedBuilder(
                            animation: _buttonWidthController,
                            builder: (_, child) => Container(
                              height: _buttonWidth,
                              width: _buttonWidthAnimation.value,
                              decoration: BoxDecoration(
                                color: CupertinoColors.systemIndigo
                                    .withOpacity(.7),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                          AnimatedBuilder(
                            animation: _positionedController,
                            builder: (_, child) => Positioned(
                              top: 10,
                              left: _positionedAnimation.value,
                              child: AnimatedBuilder(
                                animation: _screenScaleController,
                                builder: (_, child) => Transform.scale(
                                  scale: _screenScaleAnimation.value,
                                  child: Container(
                                    height: _buttonWidth - 20,
                                    width: _buttonWidth - 20,
                                    decoration: const BoxDecoration(
                                      color: CupertinoColors.systemIndigo,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: Alignment.center,
                                    child: _screenScaleController.isDismissed
                                        ? const Icon(
                                      CupertinoIcons.chevron_forward,
                                      color: CupertinoColors.white,
                                      size: 35,
                                    )
                                        : null,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom + 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}