# Use the base Ruby image with Alpine for a lightweight container
FROM ruby:3.1-alpine

# Install dependencies required to compile native gems
RUN apk add --no-cache build-base

# Create and set the working directory inside the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock to install dependencies
COPY Gemfile Gemfile.lock ./

# Install the required gems defined in the Gemfile
RUN bundle install

# Copy all project contents to the container
COPY . .

# Expose the port on which the app will listen (in your case, 5004)
EXPOSE 6003

# Command to run the Sinatra application
CMD ["bundle", "exec", "ruby", "app.rb", "-o", "0.0.0.0", "-p", "6003"]