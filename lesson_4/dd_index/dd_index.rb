require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @files = Dir.glob("public/*").map { |file| File.basename(file) }.sort
  @order = params['order']
  @files.reverse! if @order == 'desc'

  erb :list
end