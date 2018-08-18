# require modules here
require 'pry'
require 'yaml'

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  lib = {
    "get_emoticon" => {},
    "get_meaning" => {}
  }

  emoticons.each do |meaning, emoticon_arr|
    lib["get_meaning"][emoticon_arr[1]] = meaning
    lib["get_emoticon"][emoticon_arr[0]] = emoticon_arr[1]
  end

  lib
end

def get_japanese_emoticon(file_path, emoticon)
  lib = load_library(file_path)

  if lib["get_emoticon"].has_key?(emoticon)
    lib["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  lib = load_library(file_path)

  if lib["get_meaning"].has_key?(emoticon)
    lib["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
