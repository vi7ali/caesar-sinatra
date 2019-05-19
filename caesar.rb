require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  message = caesar_cipher("Hello World!", 5)
  erb :index, :locals => {message: message}
end

def caesar_cipher(sentence, offset)
  result = ""
  sentence.each_codepoint do |c|
    if c>=65 && c<=90
      result += (65+((c - 65 + offset)%26)).chr
    elsif c>=97 && c<=122
      result += (97+((c - 97 + offset)%26)).chr    
    else
      result = result + c.chr
    end
  end
  result
end