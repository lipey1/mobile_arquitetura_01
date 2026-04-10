# mobile_arquitetura_01

Aplicacao Flutter para consumo da API publica de produtos:
`https://fakestoreapi.com/products`

## Objetivo

Demonstrar organizacao em camadas:

- `presentation`: telas e widgets
- `domain`: entidades, contratos e casos de uso
- `data`: modelos, datasource remoto e implementacao de repositorio
- `core`: rede e excecoes compartilhadas

## Funcionalidades

- requisicao HTTP para API de produtos
- conversao de JSON para objetos de dominio
- listagem de produtos exibindo:
  - titulo
  - preco
  - imagem
- tratamento basico de erros de rede e status code

## Estrutura de pastas

```text
lib/
  core/
    error/
    network/
  data/
    datasources/
    models/
    repositories/
  domain/
    entities/
    repositories/
    usecases/
  presentation/
    pages/
```

## Como executar

1. Entre na pasta do projeto:
   - `cd mobile_arquitetura_01`
2. Instale as dependencias:
   - `flutter pub get`
3. Execute:
   - `flutter run`
