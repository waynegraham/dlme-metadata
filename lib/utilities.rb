require 'dotenv'
require 'dotenv/tasks'
require 'date'
require 'fileutils'
require 'colorize'
require 'csv'

def setup
  FileUtils.mkdir_p('records')
end

def parse_date(date)
  [DateTime.parse(date).year.to_s]
end

def merge_types(_keys)
  ['photogrammetry']
end
