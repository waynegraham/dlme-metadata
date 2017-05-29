require 'fileutils'
require 'open-uri'

# rubygems
require 'colorize'
require 'nokogiri'

task default: %w[all]

task :all => %W[import:penn:all import:princeton:mods]

namespace :import do

  namespace :penn do
    task :all => %W[import:penn:marc import:penn:galen import:penn:schoenberg]

    desc "Make a local copy of online MARC records"
    task :marc do
      puts "Importing records from Penn".light_white.on_blue
    end

    task :schoenberg do

      puts "Schoenberg papers will need massaging to work to get into a format that can be used by DLME"
      template = Nokogiri::XSLT(File.read('xslt/MODS3-4_MARC21slim_XSLT1-0.xsl'))
      # See http://www.tei-c.org/SIG/Libraries/teiinlibraries/main-driver.html#index.xml-body.1_div.4_div.1_div.6

      # http://openn.library.upenn.edu/Data/0001/html/ljs189.html
      # http://openn.library.upenn.edu/Data/0001/ljs189/data/ljs189_TEI.xml # metadata
      # http://openn.library.upenn.edu/Data/0001/ljs189/ # data

      ids = %W(189 196 235 286 293 294 295 296 299 311 312 322 37 38 387 388 398 399 40 400 403 404 405 407 408 409 410 412 414 417 425 426 427 434 435 436 441 444 447 45 455 456 459 460 464 467 469 486 489 49 495)

      ids.each do |id|
        url = "http://openn.library.upenn.edu/Data/0001/ljs#{id}/data/ljs#{id}_TEI.xml"
        puts "Fetching #{url}"
        document = Nokogiri::HTML(open("http://en.wikipedia.org/"))
      end
      # Jewish wars? 36
      # Yesod ʻolam (Spain or Italy, ca. 1460) 476
      # Perush sefer ha-yesodot shel Uklids (Italy?, between 1650 and 1750?) 491
      # Marʼeh ha-ofanim ... etc. (Italy, between 1425 and 1450) 494
      # Tsurat ha-arets 498

    end

    desc "Convert Galen Syriac Palimpsest"
    task :galen do
      # Description: http://openn.library.upenn.edu/Data/0014/GalenSyriacPalimpsest/0_ReadMe.txt
      # Folio Index: http://openn.library.upenn.edu/Data/0014/GalenSyriacPalimpsest/Documents/Internal/FolioIndex.html

      puts "Galen Syriac Palimpsest will need massaging to work to get into a format that can be used by DLME"
    end
  end

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
