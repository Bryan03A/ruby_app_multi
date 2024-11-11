require 'sinatra'

# Define the main route (GET)
get '/' do
  # Render the HTML file (index.erb)
  erb :index
end

# Route to process the form (POST)
post '/' do
  num1 = params[:num1].to_f
  num2 = params[:num2].to_f
  @result = num1 * num2  # Store the result in an instance variable

  # Render the HTML file with the result
  erb :index
end

# Configure the port
set :port, 6003