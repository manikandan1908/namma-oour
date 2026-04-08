FROM ghcr.io/cirruslabs/flutter:stable

WORKDIR /app

# Enable web support for Flutter
RUN flutter config --enable-web

# Copy project files
COPY . .

# First time setup to get dependencies
RUN flutter pub get

# Build web release
RUN flutter build web

# We will run python's http server pointing to build/web
EXPOSE 8080

CMD ["python3", "-m", "http.server", "8080", "--directory", "build/web"]
