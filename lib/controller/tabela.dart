class Tabela {
  int? posicao;
  int? pontos;
  Time? time;
  int? jogos;
  int? vitorias;
  int? empates;
  int? derrotas;
  int? golsPro;
  int? golsContra;
  int? saldoGols;
  num? aproveitamento;
  int? variacaoPosicao;
  List<String>? ultimosJogos;

  Tabela(
      {this.posicao,
      this.pontos,
      this.time,
      this.jogos,
      this.vitorias,
      this.empates,
      this.derrotas,
      this.golsPro,
      this.golsContra,
      this.saldoGols,
      this.aproveitamento,
      this.variacaoPosicao,
      this.ultimosJogos});

  Tabela.fromJson(Map<String, dynamic> json) {
    posicao = json['posicao'];
    pontos = json['pontos'];
    time = json['time'] != null ? Time.fromJson(json['time']) : null;
    jogos = json['jogos'];
    vitorias = json['vitorias'];
    empates = json['empates'];
    derrotas = json['derrotas'];
    golsPro = json['gols_pro'];
    golsContra = json['gols_contra'];
    saldoGols = json['saldo_gols'];
    aproveitamento = json['aproveitamento'];
    variacaoPosicao = json['variacao_posicao'];
    ultimosJogos = json['ultimos_jogos'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['posicao'] = this.posicao;
    data['pontos'] = this.pontos;
    if (this.time != null) {
      data['time'] = this.time!.toJson();
    }
    data['jogos'] = this.jogos;
    data['vitorias'] = this.vitorias;
    data['empates'] = this.empates;
    data['derrotas'] = this.derrotas;
    data['gols_pro'] = this.golsPro;
    data['gols_contra'] = this.golsContra;
    data['saldo_gols'] = this.saldoGols;
    data['aproveitamento'] = this.aproveitamento;
    data['variacao_posicao'] = this.variacaoPosicao;
    data['ultimos_jogos'] = this.ultimosJogos;
    return data;
  }
}

class Time {
  int? timeId;
  String? nomePopular;
  String? sigla;
  String? escudo;

  Time({this.timeId, this.nomePopular, this.sigla, this.escudo});

  Time.fromJson(Map<String, dynamic> json) {
    timeId = json['time_id'];
    nomePopular = json['nome_popular'];
    sigla = json['sigla'];
    escudo = json['escudo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time_id'] = this.timeId;
    data['nome_popular'] = this.nomePopular;
    data['sigla'] = this.sigla;
    data['escudo'] = this.escudo;
    return data;
  }
}
