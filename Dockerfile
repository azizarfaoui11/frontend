# Utilisez une image Node.js pour construire l'application
FROM node:20 AS build

# Répertoire de travail
WORKDIR /app

# Copiez les fichiers source de l'application
COPY . .

# Exécutez la commande de build de l'application Angular avec le chemin de base correct
RUN npm install && \
    npm run build -- --prod --base-href /summer-workshop-angular/

# Utilisez une image légère Nginx pour servir l'application
FROM nginx:alpine

# Copiez le fichier de configuration Nginx
COPY my-nginx.conf /etc/nginx/nginx.conf

# Copiez les fichiers de construction dans l'image Nginx
COPY --from=build /app/dist /usr/share/nginx/html

# Exposez le port 80
EXPOSE 80
