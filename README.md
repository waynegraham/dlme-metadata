# Digital Library of the Middle East

Additional metadata data for the DLME (and working notes)

## Penn

The folks at Penn promised a method to pull their records (with a custom `710`). In addition to this, Will has additional record sets in [OPenn](http://openn.library.upenn.edu/) including:

* [Penn Museum Archive](http://openn.library.upenn.edu/html/0018.html)
* [Private Collection A](http://openn.library.upenn.edu/html/0014.html) - The Galen Syriac Palimpsest
* [Lawrence J. Schoenberg Manuscripts](http://openn.library.upenn.edu/html/0001.html) - need a filter for MENA related papers

[Technical documentation](http://openn.library.upenn.edu/TechnicalReadMe.html) for OPenn Archive describes the file format and how the TEI is created.  



## Princeton

Many of Princeton's collections are in IIIF with links to their marc representations. Other records in PUDL are in MODS including:

* [Princeton Digital Library of Islamic Manuscripts](http://pudl.princeton.edu/collections/pudl0032)
* [Yemeni Manuscript Digitization Initiative](http://pudl.princeton.edu/collections/pudl0079)
* [Middle Eastern Film Posters Digitization Initiative](http://pudl.princeton.edu/collections/pudl0100)

Sample files are in `princeton/mods`. There is a `rake` task to convert these records to MARC

`rake import:princeton:mods`

## MODS Conversions

Conversions are local caches of the Official MODS Site (with local modifications). For originals, see [LOC MODS Conversions](https://www.loc.gov/standards/mods/mods-conversions.html)
