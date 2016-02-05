# R7 Forum
___

## O desafio

Seu objetivo nesse teste é construir um protótipo simplificado de um fórum de discussão web. A discussão se dá em threads (tópicos), que são comentários encadeados no estilo árvore. A interface web deve contemplar:

* Uma listagem das threads com paginação, apresentando um formulário para criar uma nova thread (figura 1).

* Páginas de exibição de threads (figura 2a). Devem exibir os comentários em árvore, sendo cada  comentário acompanhado de um formulário para resposta (figura 2c). Essa página também deve ter paginação (figura 2b).

* Os tópicos e os comentários devem ser paginados;

* Uma complicação é que comentários com palavras presentes em uma blacklist devem ser rejeitados (figura 3a,b). Tratando tantas variações quando possíveis (figura 3c,d).

Você pode usar tecnologias — linguagens, frameworks, servidores web, bancos de dados, etc. — de sua preferência, com duas ressalvas:

- A primeira é que você naturalmente não pode usar um produto de fórum pronto.

- A segunda restrição é motivada pela necessidade do time de que os membros tenham algum nível de desenvoltura com Ruby, Rails, MongoDB e Unicorn.

* A blacklist deve ser criada manualmente e em Ruby, sem usar ferramentas, frameworks ou gems;

Para a avaliação não levaremos em conta qualidades estéticas nem usabilidade das páginas. Levaremos em conta a qualidade do código e a performance do sistema, sob carga e volume de dados elevados.

___

## Requisitos Funcionais

* Ruby ~> 2.2.2
* MongoDB ~> 2.6.10
* gem 'mongoid', '~> 5.0.0'
* gem 'mondoid-autoinc', '~> 5.0'
___



