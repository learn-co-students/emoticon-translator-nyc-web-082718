require "yaml"
require "pry"

def load_library(path)
  newHash = {}
  newHash['get_meaning'] = {}
  newHash['get_emoticon'] = {}
  hash = YAML.load_file(path)
  hash.each do |key, value|
    newHash['get_meaning'][value[1]] = key
    newHash['get_emoticon'][value[0]] = value[1]
  end
  return newHash
end

#  =D	（￣ー￣）
def get_japanese_emoticon(path, emoticon)
  hash = load_library(path)
  hash["get_emoticon"].each do |key, value|
    if emoticon == key
      return value
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  hash = load_library(path)
  hash["get_meaning"].each do |key, value|
    if emoticon == key
      return value
    end
  end
  return "Sorry, that emoticon was not found"
end
