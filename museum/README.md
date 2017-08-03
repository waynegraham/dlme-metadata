# Museum Objects

## The Met Museum

The Met Musuem has a set of open access metadata records that are accessible for this project. Metadata records are kept in a GitHub repository at https://github.com/metmuseum/openaccess.

Additional information about copyright is at http://www.metmuseum.org/about-the-met/policies-and-documents/image-resources.

We are specifically looking at the ~6,100 objects in
http://www.metmuseum.org/art/collection#!?department=3&showOnly=openaccess&perPage=100&sortBy=Relevance&sortOrder=asc&offset=0&pageSize=0

### Notes

I noticed that the CSV had a field that described the Near East collection and thought this would be much easier to process with a database. I've got MariaDB, so I attempted to populate with `mysqlimport`

```
mysqlimport --columns='head -n 1 ~/projects/dlme-metadata/museum/MetObjects.csv'  --ignore-lines=1 met_museum ~/projects/dlme-metadata/museum/MetObjects.csv;
```

But kept getting permission errors. I ended up just using the utility in [Sequel Pro](https://www.sequelpro.com/).

The filtered CSV is just:

```
SELECT * FROM objects
WHERE `Department` = 'Ancient Near Eastern Art';
```

And then exported the results to `records/`
