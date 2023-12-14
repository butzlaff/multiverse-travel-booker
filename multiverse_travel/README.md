# multiverse_travel

## <h2>👋 Hello, I’m @butzlaff</h2>

## API REST para criar um plano de viagens de Rick and Morty.

<h4>Bem-vindos ao "Rick & Morty's Multiverve Travel Booker"! O aplicativo mais estranho e surpreendente do multiverso para planejar suas aventuras no multiverso. Prepare-se para embarcar em viagens malucas, onde as leis da física são apenas sugestões e os destinos são tão diversos quanto as personalidades do Rick!
</h4>
<h4>
Prepare-se para momentos épicos, perigos imprevisíveis e uma carga de diversão que desafia as leis da lógica! Baixe agora o "Rick & Morty's Multiverve Travel Booker" e prepare-se para a viagem mais maluca da sua vida! Lembre-se: não nos responsabilizamos por danos causados por Meeseeks ou por qualquer interação com Gárgulas Cromulonianas. Boa sorte!<h3>

<p>Para inciciar, devemos clonar o repositório em sua máquina, com o comando:

```sh
 git clone git@github.com:butzlaff/api_login.git
```

Feito isto, devemos instalar as dependências, para isso acesse a pasta raiz, onde o programa esta.

> ✨Dica: A pasta raiz, é onde se encontra o arquivo package.json

Após estar na pasta raiz, executamos o comando:

```sh
npm install  
```
> ✨Caso você não tenha o NodeJs instalado em sua máquina, você pode baixá-lo no seguinte site: [NodeJS SITE](https://nodejs.org/en)

Depois de instalado, as dependências, agora podemos executar nosso código!

> Nota: Você precisá instalar o banco de dados, existe um docker compose caso queira usar o Mysql, caso não tenha familiaridade com o Docker, poderá ler sua documentação no site: 

>><a href="https://docs.docker.com">Documentação Docker</a>

Ou copiando o link abaixo:

```sh
https://docs.docker.com
```
Caso já tenha instalado em sua máquina poderá inciar pelo comando:
```sh
docker compose up 
```
Outra coisa necessária é configurar o prisma, caso queira usar o Mysql, ou outro Banco de dados:

Para usar o Mysql, basta inserir o seguinte valor nas variáveis de ambiente, ou no arquivo ".env" do projeto:
```sh 
DATABASE_URL="mysql://user:password@host:PORT/database"
```

Caso queira usar o banco configurado no projeto basta rodar o comando:

```sh
npx prisma migrate dev
```

Se precisar resetar o banco de dados:

```sh
npx prisma migrate reset
```

Para mais configurações consultar a documentação do prisma:

<a href="https://prisma.io">Documentação Prisma</a>

> Este código excutará o programa!
```sh
npm run dev  
```

Porém, caso queiro rodar os testes:
```sh
npm run test
```
ou somente:
```sh
npm test
```
Caso queira verificar a cobertura dos testes, use o comando:
```sh
npm run test:coverage
```

## As rotas válidas são: 

Verfica se a API está online.
>GET
```sh
http://localhost:3001/ 
```


Cadastrar novo usuário:
>POST
```sh
http://localhost:3001/users/register
```
Formato do body para cadastro:
```sh
{
  "nome": string,
  "email": string (com email válido),
  "senha": string,
  "telefones": [
    {
      "numero": string,
      "ddd": string
    }
  ]
}
```
Fazer login:

>POST
```sh
http://localhost:3001/users/login
```
Formato do body para login:
```
{
  "senha": "string",
  "email": "string com email válido",
}
```
A Api irá retornar o seguinte formato:
```sh
{
  "id": number,
  "data_criacao": data,
  "data_alteracao": data,
  "ultimo_login": data,
  "token": "token válido"
}
```


Listar usuário:
> GET
```sh
http://localhost:3001/users/:id
```
> Onde ID é o id cadastrado no banco de dados.



1. Fork it (<https://github.com/your-github-user/multiverse_travel/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [butzlaff](https://github.com/butzlaff) - creator and maintainer
