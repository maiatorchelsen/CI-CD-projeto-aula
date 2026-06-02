# ESTÁGIO 1
FROM node:18-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# ESTÁGIO 2 PRODUÇÃO
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install --production

# 3. Copia o JS compilado do estágio 'builder'
# Este é o truque! Não copiamos o /src 
COPY --from=build /app/dist ./dist

# 4. Expõe a porta que o Render espera (embora ele use $PORT)
EXPOSE 3000

# 5. Comando para rodar a aplicação
# Ele vai executar "node dist/index.js"
CMD ["npm", "start"]
