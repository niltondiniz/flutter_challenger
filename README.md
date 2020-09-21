# Desafio desenvolvimento mobile

## Documentação do desafio realizado

O aplicativo foi desenvolvido em Flutter na versão stable 1.20.4,
todos os pacotes necessários ao projeto estão nas dependêndicas (pubspec.yaml).

### Passos para executar a aplicação

1 Faça um clone do repositório
2 rode o comando flutter pub get no terminal (na raiz da aplicação)
3 Escolha seu emulador ou device
4 Pressione F5

### Como utilizar

O aplicativo aplicativo possui 5 telas

1. SplashScreen, apresenta o logotipo do App
2. Busca de Usuários, nesta tela o usuário informará os dados de busca de usuários
3. Resultados da busca de usuários, esta tela mostra todos os usuários encontrados que possuem no seu login,
  o texto informado na tela de busca. Para acessar os repositórios, basta escolher um usuário da lista. 
  Nesta tela é possível exibir os usuários salvos localmente no dispositivo, para isso basta clicar no botão: Mostrar Salvos
4. Repositórios, Esta tela mostra todos os repositórios do usuário selecionado, ordenados por popularidade  
  (stars). Para acessar os detalhes do repositório, basca escolher um item da lista de repositórios. Nesta tela é possivel gravar as informações localmente no dispositivo, para uma futura visualização dos dados (offline), para isso, basta pressionar o botão Salvar Local.
5. Detalhes do Repositório, esta tela mostra os dados de um repositório, e possui um acesso (link), para a  
  página do respectivo repositório no site do GitHub.

### Arquitetura utilizada no App

A arquitetura utilizada no app é o MVC, e foram utilizados alguns padrões de projeto (de forma bem simples), para auxiliar no desenvolvimento do app.
* Repository, utilizado nas consultas a API e Banco de Dados Local.
* Strategy, utilizado nos momentos de consulta onde foi necessário usar o RepositorioAPI ou o 
  RepositorioLocalStorage.

### Recursos

Os seguinte recursos estão presentes no App
* Cache de Imagem
* Testes unitários
* Armazenamento de dados Locais
* Gerenciamento de Estados com otimização de renderização de tela, prevenindo a perda de estado ao mudar a orientação da tela

