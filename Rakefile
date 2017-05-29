require 'fileutils'

require 'colorize'
require 'nokogiri'

task default: %w[all]

task :all => %W[import:princeton:mods]

namespace :import do
  namespace :princeton do

    desc "Transform Princeton MODS records to MARCXML"
    task :mods do
      puts "Converting Princeton MODS records to MARCXML...".black.on_light_yellow
      # From https://www.loc.gov/standards/mods/v3/MODS3-4_MARC21slim_XSLT1-0.xsl
      # Avoids net_http call
      template = Nokogiri::XSLT(File.read('xslt/MODS3-4_MARC21slim_XSLT1-0.xsl'))

      # Make sure the output directory exits
      output_path = 'marc/princeton/'
      FileUtils.mkdir_p output_path

      Dir.glob("princeton/mods/*.mods").each do |file|

        filename = File.basename(file, '.mods')
        puts "Transforming #{file} from MODS to XML"

        document = Nokogiri::XML(File.read(file))
        transformed = template.transform(document)

        puts "Writing #{output_path}/#{filename}.xml file"
        File.open("#{output_path}/#{filename}.xml", 'w') { |file| file.write(transformed) }
      end

    end
  end
end
