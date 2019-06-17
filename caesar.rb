# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/cipher.rb'

get '/' do
  erb :index
end

get '/output' do
  str = params['str']
  offset = params['offset'].to_i
  encoded_string = Cipher.new(str: str, offset: offset).encrypt
  erb :output, locals: { enc_str: encoded_string }
end
