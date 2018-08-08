require "yaml"

def load_library(file_path)
  raw = YAML.load_file(file_path)
  # raw = YAML.load_file('./lib/emoticons.yml')
  lib = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  raw.each do |meaning, emoticons|
    lib["get_meaning"][emoticons[1]] = meaning #japanese => meaning
    lib["get_emoticon"][emoticons[0]] = emoticons[1] #english => japanese
  end
  lib
end

def get_japanese_emoticon(file_path, eng)
  english = load_library(file_path)["get_emoticon"][eng]
  if english
    english
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, jap)
  japanese = load_library(file_path)["get_meaning"][jap]
  if japanese
    japanese
  else
    "Sorry, that emoticon was not found"
  end
end
