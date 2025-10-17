# Stage 1: Build the Flutter web app
FROM flutter-base:latest AS build

WORKDIR /app

# Copy pubspec files and get dependencies
COPY pubspec.* ./
RUN flutter pub get

# Copy the rest of the application code
COPY . .

ARG API_BASE_URL

# Build the web application
RUN flutter build web --dart-define=API_BASE_URL=$API_BASE_URL

# Stage 2: Serve the web application with Nginx
FROM nginx:stable-alpine

# Copy the built web app from the build stage
COPY --from=build /app/build/web /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
