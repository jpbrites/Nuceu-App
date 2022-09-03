class EventModel {
  String id;
  String titulo;
  String textoInformativo;
  DateTime data;
  String fotoUrl;

  EventModel({
    this.id = '',
    required this.titulo,
    required this.textoInformativo,
    required this.data,
    this.fotoUrl = '',
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'titulo': titulo,
        'textoInformativo': textoInformativo,
        'data': data,
        'fotoUrl': fotoUrl,
      };

  static EventModel parse(Map<String, dynamic> post) => EventModel(
        id: post['id'],
        titulo: post['titulo'],
        textoInformativo: post['textoInformativo'],
        data: post['data'].toDate(),
        fotoUrl: post['fotoUrl'],
      );
}
