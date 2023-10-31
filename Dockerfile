# Use an official Nginx image as a parent image
FROM nginx:latest

# Copier la configuration Nginx personnalisée dans le répertoire de configuration de Nginx
COPY my-nginx.conf /etc/nginx/nginx.conf

# Copier les fichiers de l'application Angular construite dans le répertoire web de Nginx
COPY dist/ /usr/share/nginx/html

# Exposer le port 80 pour le trafic web
EXPOSE 80

# Démarrer Nginx avec l'option "daemon off;" pour s'exécuter en premier plan
CMD ["nginx", "-g", "daemon off;"]
