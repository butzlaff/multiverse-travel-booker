# Multiverse Travel Booker

## <h2>👋 Hello, I’m @butzlaff</h2>

<h5>📚Sou apaixonado pelo universo Rick and Morty, já assisti diversas vezes o desenho, e foi muito divertido criar esta API.</h5>


## API REST para criar um plano de viagens de Rick and Morty.

<h4>Bem-vindos ao "Rick & Morty's Multiverve Travel Booker"! O aplicativo mais estranho e surpreendente do multiverso para planejar suas aventuras no multiverso. Prepare-se para embarcar em viagens malucas, onde as leis da física são apenas sugestões e os destinos são tão diversos quanto as personalidades do Rick!
</h4>
<h4>
Prepare-se para momentos épicos, perigos imprevisíveis e uma carga de diversão que desafia as leis da lógica! Baixe agora o "Rick & Morty's Multiverve Travel Booker" e prepare-se para a viagem mais maluca da sua vida! Lembre-se: não nos responsabilizamos por danos causados por Meeseeks ou por qualquer interação com Gárgulas Cromulonianas. Boa sorte!<h3>

<p>Para inciciar, devemos clonar o repositório em sua máquina, com o comando:

```sh
 git git@github.com:butzlaff/multiverse-travel-booker.git
```

Feito isto, devemos instalar as dependências, para isso acesse a pasta raiz, onde o programa esta.

> ✨Dica: A pasta raiz, é onde se encontra o arquivo shard.yml

Após estar na pasta raiz, executamos o comando:

```sh
shards install  
```
> ✨Caso você Crystal instalado em sua máquina, você pode baixá-lo no seguinte site: [Crystal Official Web Site](https://crystal-lang.org/)

Depois de instalado, as dependências, agora podemos executar nosso código!

> Nota: Você precisá instalar o banco de dados, existe um docker-compose usando Postgres, caso não tenha familiaridade com o Docker, poderá ler sua documentação no site: 

><a href="https://docs.docker.com">Documentação Docker</a>

Ou copiando o link abaixo:

```sh
https://docs.docker.com
```
Caso já tenha instalado em sua máquina poderá inciar pelo comando:
```sh
docker compose up -d
```

> O código será executado automaticamente no docker.
> Caso queira rodar localmente talves seja necessário mudar algumas configurações do banco de dados, o comando para rodar localmente é:
```sh
crystal run src/multiverse_travel.cr
```
>Enquanto aos TESTES locais, é imprescindível que o banco de dados esteja limpo, para isso execute o arquivo:
```sh
before_integration_tests
```
Feito isto, poderemos rodar os testes:
```sh
KEMAL_ENV=test crystal spec
```

## As rotas válidas são: 

:bomb: Importante [integer] = Array de números inteiros
Verfica que a API está online.

>GET
```sh
http://localhost:3000/ 
```

Cadastrar nova Viagem:
>POST
```sh
http://localhost:3000/travel_plans
```
Formato do body para cadastro:
```sh
{
	"travel_stops": [
		1,
		2
	]
}
```
Em caso de sucesso, a API retornará:

```sh
{
  "id": 1,
	"travel_stops": [
		1,
		2
	]
}
```

Buscar todas as viagens cadastradas:

:star::star: O retorno de todas as solicitações de GET terá o status 200, quando bem sucedido.

>GET
```sh
http://localhost:3000/travel_plans
```

Em caso de sucesso, a API retornará um array contendo todas as viagens já cadastradas:

```sh
[{
  "id": 1,
	"travel_stops": [
		1,
		2
	]
}]

ou [] caso não exista nenhuma
```
Além disso é possível retonar as viagens de forma expandida e/ou otimizada:

O retorno da Viagem expandida será parecida com :
```sh
[{
	"id": 1,
	"travel_stops": [
		{
			"id": 1,
			"name": "Earth (C-137)",
			"type": "Planet",
			"dimension": "Dimension C-137"
		},
		{
			"id": 2,
			"name": "Abadango",
			"type": "Cluster",
			"dimension": "unknown"
		}
	]
}]
```
O retorno da Viagem otimizada: 

```sh
[{
	"id": 1,
	"travel_stops": [
		2,
		1
	]
}]
```

>GET
```sh
http://localhost:3000/travel_plans?expand=true&optimize=true
```
O resultado da busca por uma Viagem otimizada e expandia será:

```sh
[{
	"id": 1,
	"travel_stops": [
		{
			"id": 2,
			"name": "Abadango",
			"type": "Cluster",
			"dimension": "unknown"
		},
		{
			"id": 1,
			"name": "Earth (C-137)",
			"type": "Planet",
			"dimension": "Dimension C-137"
		}
	]
}]
```
OBS: 
  > expand: busca as informações com os dados da localidade das paradas da viagem

  > optimize: Esse paramêtro faz com o que você otimize suas paradas durante, da menor popularidade de uma localidade para maior, porém, visitando todas as localizações de uma mesma dimensão antes de se pular para uma localização de outra dimensão, com o objetivo de minizar os saltos dimensionais.

** Importante: Você pode trazer a rota somente expandida ou otimizada também

Basta alterar o true, para false, ou omitir o paramêtro

```sh
http://localhost:3000/travel_plans?expand=false&optimize=true
http://localhost:3000/travel_plans?expand=true&optimize=false
http://localhost:3000/travel_plans?expand=true
http://localhost:3000/travel_plans?optimize=true
```


Para recuperar uma viagem específica, basta adicionar o ID na rota:

Em caso de sucesso, a API retornará um JSON contendo a viagem encontrada:

O ID precisa ser to tipo inteiro.
>GET
```sh
http://localhost:3000/travel_plans/1
```
E o retorno será: 
```sh
{
  "id": 1,
	"travel_stops": [
		1,
		2
	]
}
```
Além disso também é possível retonar a viagem de forma expandida e/ou otimizada:

O retorno da Viagem expandida será parecida com :
```sh
{
	"id": 1,
	"travel_stops": [
		{
			"id": 1,
			"name": "Earth (C-137)",
			"type": "Planet",
			"dimension": "Dimension C-137"
		},
		{
			"id": 2,
			"name": "Abadango",
			"type": "Cluster",
			"dimension": "unknown"
		}
	]
}
```
O retorno da Viagem otimizada: 

```sh
{
	"id": 1,
	"travel_stops": [
		2,
		1
	]
}
```

>GET
```sh
http://localhost:3000/travel_plans/:id?expand=true&optimize=true
```
O resultado da busca por uma Viagem otimizada e expandia será:

```sh
{
	"id": 1,
	"travel_stops": [
		{
			"id": 2,
			"name": "Abadango",
			"type": "Cluster",
			"dimension": "unknown"
		},
		{
			"id": 1,
			"name": "Earth (C-137)",
			"type": "Planet",
			"dimension": "Dimension C-137"
		}
	]
}
```

```sh
http://localhost:3000/travel_plans/:id?expand=false&optimize=true
http://localhost:3000/travel_plans/:id?expand=true&optimize=false
http://localhost:3000/travel_plans/:id?expand=true
http://localhost:3000/travel_plans/:id?optimize=true
```
Para excluir uma viagem:

>DELETE
```sh
http://localhost:3000/travel_plans/1
```
E o retorno será somente o status code: 
```sh
status: 204 (no content)
```

Para editar uma viagem:

>PUT
```sh
http://localhost:3000/travel_plans/1
```
Com o seguintes dados no body: 
```sh
{
  "travel_stops": [3 ,4]
}
```
E o retorno será somente o status code: 
```sh
status: 200
```
```sh
{ 
  "id": 1
  "travel_stops": [3 ,4]
}
```

E por fim, existe uma função para adicionar novas paradas a uma viagem já cadastrada:

>PATCH
```sh
http://localhost:3000/travel_plans/1
```

Se a viagem já estiver com a parada: 1 e 2, como no exemplo abaixo:

```sh
{
  "id": 1,
  "travel_stops": [1, 2]
}
```
E adicionar as seguintes paradas: 
```sh
{
  "travel_stops": [3 ,4]
}
```

E o retorno será o status code: 
```sh
status: 200
```
```sh
{ 
  "id": 1
  "travel_stops": [1, 2, 3 ,4]
}
```

## Contributors

- [butzlaff](https://github.com/butzlaff) - creator and maintainer
