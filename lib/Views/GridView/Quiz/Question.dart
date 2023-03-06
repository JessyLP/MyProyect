
class Question {
  final String title;
  final String imageUrl;
  final bool answer;
  final String explication;

  Question({
    required this.title,
    required this.imageUrl,
    required this.answer,
    required this.explication,
  });
}

class QuestionData {

  List<Question> questions = [
    Question(
      title: '¿Correcto?-"Eso lo va a hacer Rita la Cantaora"',
      imageUrl: 'https://www.literautas.com/es/blog/wp-content/uploads/fases-proceso-de-escritura-500x227.jpg',
      answer: true,
      explication: 'Un antiguo dicho.',
    ),
    Question(
      title: '¿Es una manzana?',
      imageUrl: 'https://www.frutality.es/wp-content/uploads/manzana-fuji%C3%A7.png',
      answer: true,
      explication: 'Si, es una manzana, las hay de varios tipos.',
    ),
    Question(
      title: '¿Un año tiene 345 días?',
      imageUrl: 'https://cdnm.westwing.com/image/upload/v1/contenthub/app/uploads/es/2022/01/13094400/pcm-1654_seo_westwingyearlycalender_es_optimized-1434x2048.jpg',
      answer: true,
      explication: 'Correcto, tiene 365 días, y en años bisiestos 366.',
    ),
    Question(
      title: 'El arcoiris tiene 3 colores',
      imageUrl: 'https://t2.uc.ltmcdn.com/fr/posts/3/4/0/le_drapeau_americain_et_sa_signification_14043_600.jpg',
      answer: true,
      explication: 'El arcoiris esta formado por 7 colores',
    ),
    Question(
      title: 'El mejor amigo del hombre es el perro.',
      imageUrl: 'https://fr.april-international.com/sites/france/files/2022-05/L%27organisation%20du%20système%20de%20santé%20en%20Australie_0.jpg',
      answer: true,
      explication: 'En efecto, es el perro.',
    ),
    Question(
      title: 'Hay tres estaciones del año.',
      imageUrl: 'https://static.le-systeme-solaire.net/ressources/syssol/sun_title.jpg',
      answer: true,
      explication: 'Tenemos cuatro estaciones: \nPrimavera,\nVerano,\nOtoño,\nInvierno.',
    ),
    Question(
      title: '¿Es la letra "d" la cuarta en el abecedario?.',
      imageUrl: 'https://t2.uc.ltmcdn.com/fr/posts/3/4/0/le_drapeau_americain_et_sa_signification_14043_600.jpg',
      answer: true,
      explication: 'Si, lo es. Las anteriores son "a, b ,c".',
    ),
  ];
}