# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  lib = YAML.load_file(file_path)
  get_meaning = {}
  get_emoticon = {}
  # get-meaning is japanese symbol to word 
  # get-emoticon is anglo emoticon to japanese symbol
  
  lib.each do |word, symbols|
    get_meaning[symbols[1]] = word
    get_emoticon[symbols[0]] = symbols[1]
  end 
  {"get_meaning" => get_meaning, "get_emoticon" => get_emoticon}
end

def get_japanese_emoticon(path, emoticon)
  lib = load_library(path)
  if lib['get_emoticon'].has_key?(emoticon)
    lib["get_emoticon"][emoticon]
  else 
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  lib = load_library(path)
  if lib["get_emoticon"].has_value?(emoticon)
    lib["get_meaning"][emoticon]
  else 
    "Sorry, that emoticon was not found"
  end
end