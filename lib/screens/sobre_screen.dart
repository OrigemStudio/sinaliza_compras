import 'package:flutter/material.dart';

class SobreScreen extends StatefulWidget {
  @override
  _SobreScreenState createState() => _SobreScreenState();
}

class _SobreScreenState extends State<SobreScreen> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Informações Importantes'),
        centerTitle: true,
        elevation: 8,
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            margin:
                const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(20.0),
                boxShadow: [
                  new BoxShadow(
                      color: Colors.black.withAlpha(70),
                      offset: const Offset(3.0, 10.0),
                      blurRadius: 15.0)
                ]),
            child: ExpansionTile(
              trailing: Container(
                  child: Icon(
                Icons.shopping_basket,
                color: Colors.purple,
              )),
              title: Text(
                'Promoções Diárias',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              leading: Icon(
                Icons.help,
                color: Colors.grey[600],
              ),
              children: <Widget>[
                Divider(
                  height: MediaQuery.of(context).size.height * .003,
                  color: Colors.purple,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 8, left: 16, right: 16),
                    child: Text(
                      'Sobre as Responsabilidades',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.only(bottom: 10, left: 16, right: 16),
                  child: Text(
                      "A responsabilidade por cada produto/serviço postado no Sinaliza Compras, fica a cargo exclusivamente do anunciante vinculado aquele item. O Sinaliza Compras, é apenas um meio moderno e digital, para facilitar a disseminação dos mesmos."),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                  const EdgeInsets.only(bottom: 10, left: 16, right: 16),
                  child: Text(
                      "Portanto, qualquer eventualidade que inclua: valor incorreto do produto/serviço, data de validade da oferta incorreta, quantidade de unidades do item incoerente ou informações contidas no cupom de desconto incorretas, a responsabilidade, fica a cargo do anunciante em questão."),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                  const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                  child: Text(
                      "As regras citadas acima, são necessárias, para que o eco-sistema do Sinaliza Compras, se mantenha organizado, assim como ocorre no comércio geral."),
                ),
                Divider(
                  height: MediaQuery.of(context).size.height * .003,
                  color: Colors.purple,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 8, left: 16, right: 16),
                    child: Text(
                      'Sobre os usuários do Sinaliza Compras',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                  const EdgeInsets.only(bottom: 10, left: 16, right: 16),
                  child: Text(
                      "Todos os produtos e serviços anunciados no Sinaliza Compras, são atualizados periodicamente. Portanto, a validade de promoções/ofertas, somente serão válidas, se o usuário apresentar o produto em questão no aplicativo, no momento da compra. O anunciante, não terá nenhum compromisso em relação a um produto que não esteja anexado ao app."),
                ),
                Divider(
                  height: MediaQuery.of(context).size.height * .003,
                  color: Colors.purple,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 8, left: 16, right: 16),
                    child: Text(
                      'Sobre futuras atualizações no Sinaliza Compras',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                  const EdgeInsets.only(bottom: 10, left: 16, right: 16),
                  child: Text(
                      "Em datas futuras, a Origem Studio continuará o desenvolvimento do app Sinaliza Compras, trazendo melhorias e novidades como:"),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                  const EdgeInsets.only(top: 8, bottom: 10, left: 16, right: 16),
                  child: Text(
                      "Melhorias no Layout",
                    style: TextStyle(
                      color: Colors.purple
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                  const EdgeInsets.only(bottom: 10, left: 16, right: 16),
                  child: Text(
                      "Novas ferramentas",
                    style: TextStyle(
                        color: Colors.purple
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                  const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                  child: Text(
                      "Outras atualizações poderão ser acrescentadas nesta lista. A Origem Studio ouvirá sempre usuários e anunciantes, para manter o app com a melhor qualidade possível!"),
                ),
              ],
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(20.0),
                boxShadow: [
                  new BoxShadow(
                      color: Colors.black.withAlpha(70),
                      offset: const Offset(3.0, 10.0),
                      blurRadius: 15.0)
                ]),
            child: ExpansionTile(
              trailing: Container(
                  child: Icon(
                Icons.home,
                color: Colors.purple,
              )),
              title: Text(
                'Perfis de Empresas',
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(
                Icons.help,
                color: Colors.grey[600],
              ),
              children: <Widget>[
                Divider(
                  height: MediaQuery.of(context).size.height * .003,
                  color: Colors.purple,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 8, left: 16, right: 16),
                    child: Text(
                      'Sobre responsabilidades',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                  const EdgeInsets.only(bottom: 10, left: 16, right: 16),
                  child: Text(
                      "As informações contidas no perfil de cada anunciante, é de total responsabilidade dos mesmos. Informações como: história da empresa, endereço, número de telefone, contato via whatsapp, contato via messenger ou e-mail, fica a cargo de cada anunciante prestar informação correta no app"),
                ),
                Divider(
                  height: MediaQuery.of(context).size.height * .003,
                  color: Colors.purple,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 8, left: 16, right: 16),
                    child: Text(
                      'Sobre futuras atualizações no Sinaliza Compras',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                  const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                  child: Text(
                      "Em datas futuras, a Origem Studio continuará o desenvolvimento do app Sinaliza Compras, trazendo melhorias e novidades como:"),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                  const EdgeInsets.only(bottom: 4, left: 16, right: 16),
                  child: Text(
                    "Sistema de localização de empresa por mapa",
                    style: TextStyle(
                        color: Colors.purple
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                  const EdgeInsets.only(top: 4, bottom: 6, left: 16, right: 16),
                  child: Text(
                    "Melhorias no Layout",
                    style: TextStyle(
                        color: Colors.purple
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                  const EdgeInsets.only(bottom: 10, left: 16, right: 16),
                  child: Text(
                    "Novas ferramentas",
                    style: TextStyle(
                        color: Colors.purple
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                  const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                  child: Text(
                      "Outras atualizações poderão ser acrescentadas nesta lista. A Origem Studio ouvirá sempre usuários e anunciantes, para manter o app com a melhor qualidade possível!"),
                ),
              ],
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(20.0),
                boxShadow: [
                  new BoxShadow(
                      color: Colors.black.withAlpha(70),
                      offset: const Offset(3.0, 10.0),
                      blurRadius: 15.0)
                ]),
            child: ExpansionTile(
              trailing: Container(
                  child: Icon(
                Icons.calendar_today,
                color: Colors.purple,
              )),
              title: Text(
                'Eventos',
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(
                Icons.help,
                color: Colors.grey[600],
              ),
              children: <Widget>[
                Divider(
                  height: MediaQuery.of(context).size.height * .003,
                  color: Colors.purple,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 8, left: 16, right: 16),
                    child: Text(
                      'Sobre responsabilidades',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                  const EdgeInsets.only(bottom: 10, left: 16, right: 16),
                  child: Text(
                      "A finalidade da dessão (Eventos), é simplesmente divulgar eventos locais e regionais, ampliando a visibilidade do evento para o público geral."),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                  const EdgeInsets.only(bottom: 10, left: 16, right: 16),
                  child: Text(
                      "Todas as informações contidas nesta sessão, serão confirmadas antes de serem adicionadas ao app"),
                ),
              ],
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(20.0),
                boxShadow: [
                  new BoxShadow(
                      color: Colors.black.withAlpha(70),
                      offset: const Offset(3.0, 10.0),
                      blurRadius: 15.0)
                ]),
            child: ExpansionTile(
              trailing: Container(
                  child: Icon(
                Icons.face,
                color: Colors.purple,
              )),
              title: Text(
                'Cadastrar',
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(
                Icons.help,
                color: Colors.grey[600],
              ),
              children: <Widget>[
                Divider(
                  height: MediaQuery.of(context).size.height * .003,
                  color: Colors.purple,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 8, left: 16, right: 16),
                    child: Text(
                      'Sobre as Responsabilidades dos usuários ao cadastrar',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                  const EdgeInsets.only(bottom: 10, left: 16, right: 16),
                  child: Text(
                      "O cadastro do usuário, simplesmente tem a finalidade de coletar dados para confirmar a existência do usuário, e posteriormente, para que o mesmo possa concorrer aos brindes do Sinaliza Compras."),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                  const EdgeInsets.only(bottom: 10, left: 16, right: 16),
                  child: Text(
                      "Portanto, informações incorretas no momento do cadastro, impedirá com que o usuário concorra aos brindes que o Sinaliza Compras irá sortear mensalmente."),
                ),
                Divider(
                  height: MediaQuery.of(context).size.height * .003,
                  color: Colors.purple,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 8, left: 16, right: 16),
                    child: Text(
                      'Sobre impedimentos em relação ao sorteio dos brindes do Sinaliza Compras',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                  const EdgeInsets.only(bottom: 10, left: 16, right: 16),
                  child: Text(
                      "Anunciantes, funcionários de empresas que anunciam no Sinaliza Compras, parentes de até terceiro grau dos que anunciam no Sinaliza Compras, não poderão participar dos sorteios de brindes promovidos pelo Sinaliza Compras."),
                ),
              ],
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(20.0),
                boxShadow: [
                  new BoxShadow(
                      color: Colors.black.withAlpha(70),
                      offset: const Offset(3.0, 10.0),
                      blurRadius: 15.0)
                ]),
            child: ExpansionTile(
              trailing: Container(
                  child: Icon(
                Icons.list,
                color: Colors.purple,
              )),
              title: Text(
                'Minhas Listas',
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(
                Icons.help,
                color: Colors.grey[600],
              ),
              children: <Widget>[
                Divider(
                  height: MediaQuery.of(context).size.height * .003,
                  color: Colors.purple,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 8, left: 16, right: 16),
                    child: Text(
                      'Sobre a finalidade da lista',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                  const EdgeInsets.only(bottom: 10, left: 16, right: 16),
                  child: Text(
                      "O sistema de listas, tem por finalidade, organizar por categoria, cada item que o usuário separa para fazer a compra posteriormente."),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                  const EdgeInsets.only(bottom: 10, left: 16, right: 16),
                  child: Text(
                      "Todos os produtos adicionados a lista, manterão suas características conforme o anunciante determinou, fazendo com que cada item vinculado a lista do usuário, seja mantido somente no tempo em que o anunciante o mantê-lo postado."),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                  const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                  child: Text(
                      "Desta forma, o anunciante não terá nenhum compromisso mediante a produtos que já não estejam mais publicados"),
                ),
              ],
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 16, bottom: 64, left: 16, right: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(20.0),
                boxShadow: [
                  new BoxShadow(
                      color: Colors.black.withAlpha(70),
                      offset: const Offset(3.0, 10.0),
                      blurRadius: 15.0)
                ]),
            child: ExpansionTile(
              trailing: Container(
                height: MediaQuery.of(context).size.height / 30,
                child: Image.asset(
                  'assets/sinaliza_notification.png',
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                'Sinaliza Compras',
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(
                Icons.help,
                color: Colors.grey[600],
              ),
              children: <Widget>[
                Divider(
                  height: MediaQuery.of(context).size.height * .003,
                  color: Colors.purple,
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 16, bottom: 16, left: 16, right: 16),
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        height: 15,
                      ),
                      new Container(
                        padding: const EdgeInsets.only(
                            top: 0.0, bottom: 8.0, left: 0.0, right: 0.0),
                        height: 180,
                        child: Center(
                          child: Image.asset(
                            'assets/sinaliza_notification.png',
                          ),
                        ),
                      ),
                      new Text(
                        'Sinaliza Compras',
                        style: TextStyle(fontSize: 24, color: Colors.purple),
                      ),
                      new Text(
                        'Versão 0.1.5',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      new Container(
                        height: 50,
                      ),
                      new Text(
                        'Desenvolvido por:',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Container(
                          padding: const EdgeInsets.only(
                              top: 15.0, bottom: 0.0, left: 0.0, right: 0.0),
                          height: 80,
                          child:
                              Image.asset('assets/LogoOrigemStudioBlack.png'))
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
