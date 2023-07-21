class Campeonato {
  int? campeonatoId;
  String? nome;
  String? slug;
  String? nomePopular;
  EdicaoAtual? edicaoAtual;
  FaseAtual? faseAtual;
  RodadaAtual? rodadaAtual;
  String? status;
  String? tipo;
  String? logo;
  String? regiao;
  List<Fases>? fases;

  Campeonato(
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
      this.fases});

  Campeonato.fromJson(Map<String, dynamic> json) {
    campeonatoId = json['campeonato_id'];
    nome = json['nome'];
    slug = json['slug'];
    nomePopular = json['nome_popular'];
    edicaoAtual = json['edicao_atual'] != null
        ? new EdicaoAtual.fromJson(json['edicao_atual'])
        : null;
    faseAtual = json['fase_atual'] != null
        ? new FaseAtual.fromJson(json['fase_atual'])
        : null;
    rodadaAtual = json['rodada_atual'] != null
        ? new RodadaAtual.fromJson(json['rodada_atual'])
        : null;
    status = json['status'];
    tipo = json['tipo'];
    logo = json['logo'];
    regiao = json['regiao'];
    if (json['fases'] != null) {
      fases = <Fases>[];
      json['fases'].forEach((v) {
        fases!.add(new Fases.fromJson(v));
      });
    }
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
    if (this.rodadaAtual != null) {
      data['rodada_atual'] = this.rodadaAtual!.toJson();
    }
    data['status'] = this.status;
    data['tipo'] = this.tipo;
    data['logo'] = this.logo;
    data['regiao'] = this.regiao;
    if (this.fases != null) {
      data['fases'] = this.fases!.map((v) => v.toJson());
    }
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fase_id'] = this.faseId;
    data['nome'] = this.nome;
    data['slug'] = this.slug;
    data['tipo'] = this.tipo;
    data['_link'] = this.sLink;
    return data;
  }
}

class RodadaAtual {
  String? nome;
  String? slug;
  int? rodada;
  String? status;

  RodadaAtual({this.nome, this.slug, this.rodada, this.status});

  RodadaAtual.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    slug = json['slug'];
    rodada = json['rodada'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['slug'] = this.slug;
    data['rodada'] = this.rodada;
    data['status'] = this.status;
    return data;
  }
}

class Fases {
  int? faseId;
  EdicaoAtual? edicao;
  String? nome;
  String? slug;
  String? status;
  bool? decisivo;
  bool? eliminatorio;
  bool? idaEVolta;
  String? tipo;
  List<String>? grupos;
  List<String>? chaves;
  List<String>? rodadas;
  String? proximaFase;
  String? faseAnterior;
  String? sLink;

  Fases(
      {this.faseId,
      this.edicao,
      this.nome,
      this.slug,
      this.status,
      this.decisivo,
      this.eliminatorio,
      this.idaEVolta,
      this.tipo,
      this.grupos,
      this.chaves,
      this.rodadas,
      this.proximaFase,
      this.faseAnterior,
      this.sLink});

  Fases.fromJson(Map<String, dynamic> json) {
    faseId = json['fase_id'];
    edicao = json['edicao'] != null
        ? new EdicaoAtual.fromJson(json['edicao'])
        : null;
    nome = json['nome'];
    slug = json['slug'];
    status = json['status'];
    decisivo = json['decisivo'];
    eliminatorio = json['eliminatorio'];
    idaEVolta = json['ida_e_volta'];
    tipo = json['tipo'];
    if (json['grupos'] != null) {
      grupos = <String>[];
      json['grupos'].forEach((v) {
        grupos!.add((v).toString());
      });
    }
    if (json['chaves'] != null) {
      chaves = <String>[];
      json['chaves'].forEach((v) {
        chaves!.add((v).toString());
      });
    }
    if (json['rodadas'] != null) {
      rodadas = <String>[];
      json['rodadas'].forEach((v) {
        rodadas!.add((v).toString());
      });
    }
    proximaFase = json['proxima_fase'];
    faseAnterior = json['fase_anterior'];
    sLink = json['_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fase_id'] = this.faseId;
    if (this.edicao != null) {
      data['edicao'] = this.edicao!.toJson();
    }
    data['nome'] = this.nome;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['decisivo'] = this.decisivo;
    data['eliminatorio'] = this.eliminatorio;
    data['ida_e_volta'] = this.idaEVolta;
    data['tipo'] = this.tipo;
    if (this.grupos != null) {
      data['grupos'] = this.grupos!.map((v) => v).toList();
    }
    if (this.chaves != null) {
      data['chaves'] = this.chaves!.map((v) => v).toList();
    }
    if (this.rodadas != null) {
      data['rodadas'] = this.rodadas!.map((v) => v).toList();
    }
    data['proxima_fase'] = this.proximaFase.toString();
    data['fase_anterior'] = this.faseAnterior.toString();
    data['_link'] = this.sLink;
    return data;
  }
}
