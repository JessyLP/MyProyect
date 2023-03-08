
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
      imageUrl: 'https://cdnb.20m.es/sites/76/2018/09/Diez-expresiones-viejunas-que-posiblemente-nunca-has-escuchado-y-que-antiguamente-fueron-muy-famosas.jpg',
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
      answer: false,
      explication: 'Correcto, tiene 365 días, y en años bisiestos 366.',
    ),
    Question(
      title: 'El arcoiris tiene 3 colores',
      imageUrl: 'https://www.aquateknica.com/wp-content/uploads/2021/09/arcoiris.png',
      answer: false,
      explication: 'El arcoiris esta formado por 7 colores',
    ),
    Question(
      title: 'El mejor amigo del hombre es el perro.',
      imageUrl: 'https://media.traveler.es/photos/613760adcb06ad0f20e11980/master/w_1280,c_limit/202931.jpg',
      answer: true,
      explication: 'En efecto, es el perro.',
    ),
    Question(
      title: 'Hay tres estaciones del año.',
      imageUrl: 'https://www.meteorologiaenred.com/wp-content/uploads/2022/08/otono-e-invierno-1024x719.jpeg.webp',
      answer: false,
      explication: 'Tenemos cuatro estaciones: \nPrimavera,\nVerano,\nOtoño,\nInvierno.',
    ),
    Question(
      title: '¿Es la letra "d" la cuarta en el abecedario?.',
      imageUrl: 'https://i0.wp.com/aragondigital.es/wp-content/uploads/2020/04/alfabeto-o-abecedario-alfabetooabecedario.jpg?w=700&ssl=1',
      answer: true,
      explication: 'Si, lo es. Las anteriores son "a, b ,c".',
    ),
  ];
}