class listCampeonatos {
  int? campeonatoId;
  String? nome;
  String? slug;
  String? nomePopular;
  EdicaoAtual? edicaoAtual;
  FaseAtual? faseAtual;
  String? rodadaAtual;
  String? status;
  String? tipo;
  String? logo;
  String? regiao;
  String? sLink;

  listCampeonatos(
      {this.campeonatoId,
      this.nome,
      this.slug,
      this.nomePopular,
      this.edicaoAtual,
      this.faseAtual,
      this.rodadaAtual,
      this.status,
      this.tipo,
      this.logo,
      this.regiao,
      this.sLink});

  listCampeonatos.fromJson(Map<String, dynamic> json) {
    campeonatoId = json['campeonato_id'];
    nome = json['nome'];
    slug = json['slug'];
    nomePopular = json['nome_popular'];
    edicaoAtual = json['edicao_atual'] != null
        ? EdicaoAtual.fromJson(json['edicao_atual'])
        : null;
    faseAtual = json['fase_atual'] != null
        ? FaseAtual.fromJson(json['fase_atual'])
        : null;
    rodadaAtual = json['rodada_atual'].toString();
    status = json['status'];
    tipo = json['tipo'];
    logo =  json['logo'];
    regiao = json['regiao'];
    sLink = json['_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['campeonato_id'] = this.campeonatoId;
    data['nome'] = this.nome;
    data['slug'] = this.slug;
    data['nome_popular'] = this.nomePopular;
    if (this.edicaoAtual != null) {
      data['edicao_atual'] = this.edicaoAtual!.toJson();
    }
    if (this.faseAtual != null) {
      data['fase_atual'] = this.faseAtual!.toJson();
    }
    data['rodada_atual'] = this.rodadaAtual;
    data['status'] = this.status;
    data['tipo'] = this.tipo;
    data['logo'] = this.logo;
    data['regiao'] = this.regiao;
    data['_link'] = this.sLink;
    return data;
  }
}

class EdicaoAtual {
  int? edicaoId;
  String? temporada;
  String? nome;
  String? nomePopular;
  String? slug;

  EdicaoAtual(
      {this.edicaoId, this.temporada, this.nome, this.nomePopular, this.slug});

  EdicaoAtual.fromJson(Map<String, dynamic> json) {
    edicaoId = json['edicao_id'];
    temporada = json['temporada'];
    nome = json['nome'];
    nomePopular = json['nome_popular'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['edicao_id'] = this.edicaoId;
    data['temporada'] = this.temporada;
    data['nome'] = this.nome;
    data['nome_popular'] = this.nomePopular;
    data['slug'] = this.slug;
    return data;
  }
}

class FaseAtual {
  int? faseId;
  String? nome;
  String? slug;
  String? tipo;
  String? sLink;

  FaseAtual({this.faseId, this.nome, this.slug, this.tipo, this.sLink});

  FaseAtual.fromJson(Map<String, dynamic> json) {
    faseId = json['fase_id'];
    nome = json['nome'];
    slug = json['slug'];
    tipo = json['tipo'];
    sLink = json['_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['fase_id'] = this.faseId;
    data['nome'] = this.nome;
    data['slug'] = this.slug;
    data['tipo'] = this.tipo;
    data['_link'] = this.sLink;
    return data;
  }
}
