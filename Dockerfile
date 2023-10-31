# Utilisez une image Node.js pour construire l'application
FROM node:16 AS build

# Répertoire de travail
WORKDIR /app

# Copiez les fichiers source de l'application
COPY . .

# Construisez l'application
RUN npm install
RUN npm run build

# Utilisez une image légère Nginx pour servir l'application
FROM nginx:alpine

# Copiez les fichiers de construction dans l'image Nginx
COPY --from=build /app/dist /usr/share/nginx/html

# Exposez le port 80
EXPOSE 80
