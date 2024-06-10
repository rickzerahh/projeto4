# EducaLivros Online
EducaLivros Online é um sistema de gerenciamento de livros, autores, bibliotecas, cursos, clientes e pedidos, desenvolvido utilizando Ruby on Rails, um framework popular escrito em Ruby. O objetivo deste projeto é permitir a gestão eficiente dos dados de uma livraria online, oferecendo funcionalidades como a criação, leitura, atualização e exclusão (CRUD) de registros. Rails segue o padrão de arquitetura Model-View-Controller (MVC), facilitando a organização do código e a separação das responsabilidades.

## Este projeto inclui:

- Modelos: Representam as estruturas de dados e a lógica de negócios.
- Controladores: Gerenciam as solicitações do usuário, interagem com os modelos e definem as respostas apropriadas.
- Visões: Geram a interface do usuário, exibindo os dados de maneira amigável e acessível.
  
Além das operações CRUD básicas, o sistema incorpora segurança e autenticação usando gems como Devise, e utiliza triggers e stored procedures para operações automatizadas e complexas no banco de dados. A normalização do esquema de banco de dados garante a integridade e eficiência do armazenamento de dados.

## Operações CRUD:

### Na Prática:

Neste projeto, usamos as operações CRUD (Criação, Leitura, Atualização e Exclusão) para gerenciar dados de livros, autores, bibliotecas, cursos, clientes e pedidos.

#### Criação (Create) - "C"RUD
A operação de criação permite adicionar novos registros ao banco de dados. No Rails, isso geralmente é feito através de formulários de HTML enviados para as rotas apropriadas. Por exemplo, para criar um novo livro, você teria uma rota para a página de novo livro e um controlador para manipular a criação, assim feito dentro do diretório "app/controllers/livros_controller.rb":

```
def new
  @livro = Livro.new
end

def create // CRIAÇÃO
  @livro = Livro.new(livro_params)
  if @livro.save
    redirect_to @livro, notice: 'Livro foi criado com sucesso.'
  else
    render :new
  end
end
```

#### Leitura (Read) - C"R"UD
A operação de leitura permite visualizar registros existentes. No Rails, isso é feito através de ações de controlador que buscam dados no banco de dados e os passam para as views. Por exemplo, para exibir uma lista de livros, encontrado dentro do diretório "app/controllers/livros_controller.rb":

```
def index
  @livros = Livro.all
end

def show 
  @livro = Livro.find(params[:id])
end
```

#### Atualização (Update) - CR"U"D
A operação de atualização permite modificar registros existentes. Isso envolve buscar o registro, aplicar as mudanças e salvá-las. No Rails, você teria uma rota para a página de edição e uma ação no controlador para manipular a atualização:

```
def edit
  @livro = Livro.find(params[:id])
end

def update // ATUALIZA
  @livro = Livro.find(params[:id])
  if @livro.update(livro_params)
    redirect_to @livro, notice: 'Livro foi atualizado com sucesso.'
  else
    render :edit
  end
end
```

#### Exclusão (Delete) - CRU"D"
A operação de exclusão permite remover registros do banco de dados. No Rails, isso é feito através de uma ação de controlador que deleta o registro e redireciona o usuário:

```
def destroy
  @livro = Livro.find(params[:id])
  @livro.destroy
  redirect_to livros_url, notice: 'Livro foi excluído com sucesso.'
end
```

## Triggers:

### Triggers Implementados 
(presentes dentro do diretório: *"db/migrate/20240601152000_create_update_timestamp_trigger.rb"* & *db/migrate/20240601152000_create_update_stock_trigger.rb*)

- Atualização do Estoque de Livros após uma Venda
- Atualização da Data de Última Atualização em Livros após Modificação
  
### Detalhes dos Triggers
**TRIGGER 1. Atualização do Estoque de Livros após uma Venda
Objetivo: Reduzir automaticamente o estoque de um livro quando uma nova venda é realizada, garantindo que o estoque refletido no banco de dados esteja sempre atualizado.**

```
class CreateUpdateStockTrigger < ActiveRecord::Migration[6.0]
def change
    create_trigger(:itens_pedidos, :after, :insert) do
      "UPDATE livros SET estoque = estoque - NEW.quantidade WHERE id = NEW.livro_id;"
    end
  end
end
```
Descrição: Este trigger é ativado após a inserção de um novo registro na tabela itens_pedidos. Quando um novo item de pedido é adicionado, ele reduz o estoque do livro correspondente pela quantidade vendida. A trigger garante que o estoque seja atualizado automaticamente sem a necessidade de intervenção manual.

**TRIGGER 2. Atualização da Data de Última Atualização em Livros após Modificação
Objetivo: Manter um registro da data da última atualização de informações de um livro, como o título ou o preço, para fins de auditoria e gerenciamento.**
```
class CreateUpdateTimestampTrigger < ActiveRecord::Migration[6.0]
  def change
    create_trigger(:livros, :before, :update) do
      "SET NEW.updated_at = NOW();"
    end
  end
end
```
Descrição: Este trigger é ativado antes de qualquer atualização na tabela livros. Ele atualiza automaticamente o campo updated_at com a data e hora atuais, garantindo que sempre tenhamos um registro preciso de quando as informações de um livro foram modificadas pela última vez.

## Stored Procedures:

### Stored Procedures desenvolvidos

```
DELIMITER //
CREATE PROCEDURE calcular_total_vendas_livro(IN livro_id INT, OUT total_vendas INT)
BEGIN
    SELECT SUM(quantidade) INTO total_vendas
    FROM itens_pedidos
    WHERE livro_id = livro_id;
END //
DELIMITER ;
```
#### Cálculo do Total de Vendas de um Livro: 

Algoritmo:
- Recebe o ID do livro como entrada.
- Calcula o total de vendas desse livro somando a quantidade de exemplares vendidos.
- Retorna o total de vendas..

```
DELIMITER //
CREATE PROCEDURE atualizar_preco_livros_autor(IN autor_id INT, IN percentual FLOAT)
BEGIN
    UPDATE livros
    SET valor_livro = valor_livro + (valor_livro * percentual / 100)
    WHERE autor_id = autor_id;
END //
DELIMITER ;
```
#### Atualização do Preço de Todos os Livros de um Autor:

- Recebe o ID do autor e o percentual de aumento como entrada.
- Atualiza o preço de todos os livros desse autor, aumentando-os conforme o percentual fornecido.

## Views:

### Views aplicados
(*app/views/*)
As views foram elaboradas para exibir dados de forma organizada e permitir a interação dos usuários com o sistema. A seguir, uma descrição detalhada de cada view:
![image](https://github.com/rickzerahh/projeto4/assets/91620783/885e5b49-ad7e-4c85-92bb-677e9eb77d32)

#### Bibliotecas
A view de bibliotecas apresenta uma tabela que mostra o nome, endereço, cidade e país de cada biblioteca cadastrada. Permite visualizar, editar e excluir bibliotecas individualmente. Abaixo está o algoritmo para a view de bibliotecas.

#### Clientes
A view de clientes exibe uma tabela contendo o nome, e-mail e telefone de cada cliente registrado no sistema. Os usuários podem visualizar, editar e excluir clientes individualmente. Veja abaixo o algoritmo para a view de clientes.

#### Livros
Nesta view, os livros são apresentados em uma tabela com informações sobre título, autor, ano de lançamento e valor. Permite a visualização, edição e exclusão de livros individualmente. Confira o algoritmo para a view de livros.

#### Pedidos
A view de pedidos mostra uma tabela com detalhes sobre cada pedido, incluindo o curso associado, o cliente que fez o pedido, a data do pedido e seu status. Os usuários podem visualizar, editar e excluir pedidos individualmente. Veja abaixo o algoritmo para a view de pedidos.

## Segurança no Projeto:
(*app/controllers/application_controller*)
### Controle de Acesso
- Autenticação de Usuários: Utilizamos um sistema de autenticação para garantir que apenas usuários registrados possam acessar as funcionalidades do sistema. Os usuários devem fazer login com suas credenciais antes de poderem visualizar ou interagir com os dados.

- Autorização de Acesso: Implementamos autorização de acesso para restringir certas ações apenas a usuários autorizados. Por exemplo, apenas administradores podem acessar e modificar certas partes do sistema, como a adição ou exclusão de registros críticos.
```
class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def authorize_admin!
    unless current_user.admin?
      flash[:alert] = "Acesso negado. Você não possui permissão para acessar esta página."
      redirect_to root_path
    end
  end
end
```

## Normalização:

Nosso banco de dados é composto por várias tabelas inter-relacionadas que armazenam informações sobre livros, autores, bibliotecas, cursos, clientes e pedidos. Abaixo, detalhamos como cada tabela é estruturada e como a normalização é aplicada.

### Aplicação da Normalização

**Primeira Forma Normal (1NF)**
- A Primeira Forma Normal exige que cada coluna de uma tabela contenha valores atômicos e cada entrada seja única. Em nosso projeto, todas as tabelas são projetadas de forma que cada coluna contenha valores indivisíveis e únicos.

*Exemplo:*
A tabela livros contém colunas como titulo_livro, autor_id, ano_lancamento, valor_livro, e estoque, cada uma armazenando valores únicos e atômicos.

**Segunda Forma Normal (2NF)**
- A Segunda Forma Normal requer que todas as colunas não-chave sejam totalmente dependentes da chave primária. Em nosso projeto, todas as tabelas seguem essa regra, garantindo que todas as informações sejam diretamente dependentes da chave primária da tabela.

*Exemplo:*
A tabela livros usa id como chave primária, e todas as outras colunas (como titulo_livro, autor_id, ano_lancamento, valor_livro, e estoque) são totalmente dependentes dessa chave primária.

**Terceira Forma Normal (3NF)**
- A Terceira Forma Normal exige que não haja dependências transitivas entre colunas não-chave. Isso significa que as colunas não-chave devem depender diretamente da chave primária e não de outras colunas não-chave.

*Exemplo:*
Para garantir que a tabela livros esteja na 3NF, se tivermos informações sobre o autor, elas são armazenadas na tabela autores e não diretamente na tabela livros. A tabela livros contém uma referência (autor_id) à tabela autores.

**OBRIGADO POR LER ATÉ AQUI, ATENCIOSAMENTE RICARDO ANDRÉ**
