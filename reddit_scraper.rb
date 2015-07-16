#!/usr/bin/env ruby

start_time   = Time.now.utc.to_i
start_at     = (ARGV.shift || 1  ).to_i
blocks_count = (ARGV.shift || 10 ).to_i
block_size   = (ARGV.shift || 100).to_i
type_prefix  =  ARGV.shift || "t3"
reddit_user  =  ARGV.shift || "/u/ibnesayeed"
output_dir   =  ARGV.shift || "output/#{type_prefix}/#{start_time}"
end_at       = start_at + block_size * blocks_count - 1
version_str  = "v1.0.#{start_time}"
user_agent   = "linux-docker:ruby-reddit-#{type_prefix}-scraper:#{version_str} (by #{reddit_user})"
throttle     = 2

`mkdir -p #{output_dir}`

(start_at..end_at).step(block_size) do |block_start|
  block_end = block_start + block_size - 1
  ids = (block_start..block_end).map{|i| "t3_#{i.to_s(36)}"}.join ","
  uri = "https://www.reddit.com/by_id/#{ids}.json?limit=#{block_size}"
  `curl -i -s -A "#{user_agent}" "#{uri}" > #{output_dir}/#{block_start}-#{block_end}.http &`
  sleep throttle
end
