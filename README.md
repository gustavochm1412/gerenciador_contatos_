# Gerenciador de Contatos

Bem-vindo ao projeto **Gerenciador de Contatos**! Este aplicativo foi desenvolvido em Flutter e tem como objetivo facilitar o gerenciamento de contatos, oferecendo uma interface amigável para criar, visualizar e organizar suas conexões pessoais e profissionais.

---

## ⚡ Visão Geral

O **Gerenciador de Contatos** é uma aplicação mobile que permite ao usuário cadastrar, editar, listar e excluir contatos, oferecendo um controle eficiente e intuitivo sobre informações importantes, como nome, telefone, e-mail e endereço dos contatos.

### ✨ Funcionalidades
- **Cadastro de Contatos**: Insira novos contatos com informações como nome, telefone, e-mail e endereço.
- **Listagem de Contatos**: Veja todos os contatos cadastrados de forma organizada, com opções de busca e ordenação.
- **Detalhes do Contato**: Visualize todos os detalhes ao selecionar um contato.
- **Edição e Exclusão**: Atualize ou remova contatos diretamente na listagem.
- **Dashboard**: Tenha uma visão geral dos contatos, incluindo estatísticas por categoria.

---

## 🛠️ Tecnologias Utilizadas
- **Flutter**: Framework para o desenvolvimento da aplicação mobile.
- **Dart**: Linguagem de programação usada para criar o aplicativo.
- **JSON-server**: Utilizado como backend para operações CRUD.

---

## 🌱 Estrutura do Projeto

A estrutura do projeto foi pensada para ser modular e organizada, facilitando a manutenção e o desenvolvimento de novas funcionalidades.

- **lib/**: Contém o código principal do aplicativo dividido em diferentes módulos (páginas, modelos, serviços).
- **test/**: Inclui testes unitários e de widgets para garantir a qualidade do aplicativo.

### 🗂️ Classes de Domínio
- **Contato**: Representa cada contato individual, contendo atributos como nome, telefone, e-mail e categoria.
- **Categoria**: Utilizada para classificar os contatos em diferentes tipos, como "Amigos", "Trabalho", etc.

---

## 🔧 Configuração e Execução

Para rodar o **Gerenciador de Contatos** localmente, siga os passos abaixo:

### Pré-requisitos
- **Flutter SDK**: Certifique-se de que o Flutter está instalado. [Guia de Instalação](https://docs.flutter.dev/get-started/install)
- **JSON-server**: Utilize o `JSON-server` para emular um backend para a aplicação. [Guia de Instalação](https://github.com/typicode/json-server)

### 🚀 Passos para Executar

1. Clone o repositório:
   ```bash
   git clone https://github.com/gustavochm1412/gerenciador_contatos_
   ```
2. Navegue até a pasta do projeto:
   ```bash
   cd gerenciador_contatos_
   ```
3. Instale as dependências do Flutter:
   ```bash
   flutter pub get
   ```
4. Inicie o JSON-server para simular o backend:
   ```bash
   json-server --watch db.json
   ```
5. Execute o aplicativo:
   ```bash
   flutter run
   ```

---

## 📊 Dashboard e Componentes

O aplicativo inclui um **dashboard** que apresenta visualmente as estatísticas dos contatos, como número total de contatos e categorias mais populares. Também possui **componentes reutilizáveis**, como formulários de entrada de dados e botões de ação, facilitando futuras expansões.

---

## 🔗 Link para o Repositório

Você pode acessar o código fonte e contribuir através do link abaixo:
[Gerenciador de Contatos no GitHub](https://github.com/gustavochm1412/gerenciador_contatos_)


---

## ✉ Contato

Caso tenha alguma dúvida ou sugestão, sinta-se à vontade para entrar em contato:
- **E-mail**: [gustavochm1412@example.com](mailto:gustavochm1412@example.com)
- **GitHub**: [Gustavo](https://github.com/gustavochm1412)

