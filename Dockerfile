# RAKH Marketing Website — static single-file site
# Purpose-built minimal container for EasyPanel (or any Docker host).
# This is intentionally separate from backend/Dockerfile and
# frontend/Dockerfile in the main app repo — this one only serves the
# public marketing site (index.html), not the actual RAKH application.

FROM nginx:1.27-alpine

# Copy all static assets (index.html, logo.png, etc.) into Nginx's html folder
COPY . /usr/share/nginx/html/

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost:80/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
