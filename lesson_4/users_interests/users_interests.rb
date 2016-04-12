require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "yaml"

before do
  @users = YAML.load_file("users.yaml")
  @names = @users.keys
end

helpers do
  def count_interests
    total = 0
    @users.each do |_, details|
      total += details[:interests].count
    end
    total
  end
end

get "/" do
  redirect "/users"
end

get "/users" do
  erb :users
end

get "/users/:name" do
  @user = @users[params[:name].to_sym]
  @other_names = @names.select { |name| name != params[:name].to_sym }

  erb :user
end
