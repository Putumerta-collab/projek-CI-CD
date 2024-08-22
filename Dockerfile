# Gunakan image dasar Nginx resmi
FROM nginx:alpine

# Copy semua file HTML ke direktori yang digunakan Nginx
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Jalankan Nginx
CMD ["nginx", "-g", "daemon off;"]
