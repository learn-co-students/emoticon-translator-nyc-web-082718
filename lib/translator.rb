# require modules here
require "yaml"


def load_library(filepath)
  emojis = YAML.load_file(filepath)
  library = {
    "get_meaning" =>{},
    "get_emoticon" =>{}
  }
  emojis.each do |meaning,options|
    library["get_meaning"][options[1]] = meaning
    library["get_emoticon"][options[0]] = options[1]
  end
  return library
end

def get_japanese_emoticon(filepath,emoticon)
  library = load_library(filepath)
  if library["get_emoticon"].keys.include?(emoticon)
    return library["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(filepath,emoticon)
  library = load_library(filepath)
  if library["get_meaning"].keys.include?(emoticon)
    return library["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end