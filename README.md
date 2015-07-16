# Reddit Scraper

A [Ruby](https://www.ruby-lang.org/) script to scrape public [Reddit](https://www.reddit.com/) data sequentially. 

To run as an independent script:

```
$ ./reddit_scraper.rb [start_at [blocks_count [block_size [type_prefix [reddit_user [output_dir]]]]]]
```

To run in a Docker container:

```
$ docker run -d -v /host/data/directory:/output ibnesayeed/reddit-scraper [start_at [blocks_count [block_size [type_prefix [reddit_user [output_dir]]]]]]
```
