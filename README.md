
# CI/CD (Node + TypeScript + Docker)

Projeto simples em **Node.js + TypeScript** usando **Express**, com build para `dist/`, Dockerfile multi-stage e pipeline de CI no GitHub Actions.

## Requisitos

- Node.js **18+**
- npm **9+** (ou o que vier com o Node)
- (Opcional) Docker

## Instalação

```bash
npm install
```

## Rodar no localhost

### Modo desenvolvimento (ts-node)

```bash
npm run dev
```

- URL: http://localhost:3000/
- Resposta esperada: `OK`

#### Trocar a porta

PowerShell (Windows):

```powershell
$env:PORT=3001
npm run dev
```

Bash (Linux/macOS/Git Bash):

```bash
PORT=3001 npm run dev
```

### Modo “produção” (build + start)

```bash
npm run build
npm start
```

## Endpoints

- `GET /` → `200 OK` com texto `OK`

## Docker

### Build da imagem

```bash
docker build -t ci-cd-app .
```

### Rodar o container

```bash
docker run --rm -p 3000:3000 ci-cd-app
```

Abra: http://localhost:3000/

> Observação: este Dockerfile expõe a porta 3000. Se quiser usar outra, defina `PORT` e mapeie a porta no `docker run`.

## CI (GitHub Actions)

O workflow está em `.github/workflows/ci-pipeline.yml` e roda:

- `npm ci`
- `npm run build`
- `docker build`

Ele pode ser acionado manualmente pela aba **Actions** (evento `workflow_dispatch`) e também em PRs (evento `pull_request`).

> Dica: se você quiser que rode também em **push**, descomente o `push:` no arquivo do workflow.
