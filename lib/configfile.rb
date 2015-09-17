require "configfile/version"
require "yaml"
require "json"

class ConfigFile < Hash

  def initialize filename, defaults={}, form=:yaml
    @filename = filename
    @defaults = defaults
    @format = form
  end

  def defaults defaults
    @defaults = defaults
  end

  def format form
    @format = form
  end

  def parse str
    if @format == :yaml
      return YAML.load str
    elsif @format == :json
      return JSON.parse str
    end
  end

  def generate hash
    if @format == :yaml
      return hash.to_yaml
    elsif @format == :json
      return JSON.pretty_generate hash
    end
  end

  def save
    File.write(@filename, generate(self))
  end

  def to_yaml
    hnew = {}
    self.each { |k,v| hnew[k] = v }         # YAML doesn't like subclasses
    hnew.to_yaml
  end

  def load
    loaded = File.exist?(@filename) ? parse(File.read(@filename)) : {}
    self.clear
    self.merge! deep_merge(@defaults, loaded)
    save
  end

  def []= name, value
    super(name, value)
    save
  end

  def deep_merge h1, h2
    return h1 if h2 == false
    newarray = h1.dup
    h2.each do |key, val|
      if val.is_a? Hash
        if h1.include? key
          newarray[key] = deep_merge h1[key], val
        else
          h1[key] = val
        end
      else
        newarray[key] = val
      end
    end
    newarray
  end

end
