#!/usr/bin/env ruby
require 'rqrcode'


def parse_file(file)
    contents = File.read file

    contents = contents.gsub(/^ *require (.*)/) {
        match = Regexp.last_match
        file = match[1]
        replace_require(file)
    }

    contents = contents.gsub(/^ *require_relative (.*)/) {
        match = Regexp.last_match
        file = match[1]
        replace_require_relative(file)
    }

    contents
end

def replace_require(file)
    _file = parse_file_name(file)
    parse_file(_file)
end

def replace_require_relative(from_file, file)
    dir = File.dirname from_file
    _file = File.join dir, file
    _file = parse_file_name(_file)
    parse_file(_file)
end

def parse_file_name(file)
    _file = file.gsub("\"", "")
    if _file.include? '.rb'
        return _file
    else
        return "#{_file}.rb"
    end
end

puts parse_file(ARGV[0])