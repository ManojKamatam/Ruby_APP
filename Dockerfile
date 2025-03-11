FROM ruby:3.2.0-slim

# Install essential Linux packages
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    postgresql-client \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Install Rails
RUN gem install rails

# Copy only Gemfile first
COPY Gemfile ./

# Create an empty Gemfile.lock
RUN touch Gemfile.lock

# Install dependencies
RUN bundle install

# Copy the rest of the application
COPY . .

# Add entrypoint script
COPY docker/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

# Expose port 3000
EXPOSE 3000

ENTRYPOINT ["entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]
