# Princeton

The pointers to the ARK files were provided by Princeton. The `Rakefile` contains tasks to parse each of the files (`princeton_islamicmss.txt` and `princeton_ymdi.txt`) and downloads IIIF manifests in to their respective folders (e.g. `records/princeton/princeton_ymdi`).

There is a QA task as well (`rake import:princeton:parse_json`) that parses all downloaded manifests to ensure that they parse in Ruby JSON. If they do not, the file is removed and a note to rerun the import task is displayed. As we move in to the next phase, we'll need better mechanisms for managing this.
