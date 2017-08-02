# Scripts

The `map_pids.rb` file contains gross, hacky methods to extract maps pertaining to the DLME project from GeoBlacklight and the OpenGeoMetadata projects. A search is done on the SUL GeoBlacklight instance, parsing out the layer IDs from the search results. These are cached in a CSV file and then each of the projects that have data in the OpenGeoMetadata project has it's metadata files copied in the `records` directory.

## Metadata Types

* **Harvard**: FGDC
* **Stanford**: ISO 19139 (and MODS)

## Indexing Considerations

As these are used in GeoBlacklight instances, we should be able to adapt the codebase there to standardize between FGDC and ISO 19139 formats.
