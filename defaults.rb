#!/usr/bin/env ruby

gem 'hash_diff'
gem 'plist'

require 'plist'
require 'hash_diff'
require 'pp'

domains_str = `defaults domains`
apple_domains = domains_str.split(',').map(&:strip).select { _1.start_with?('com.apple.') }

before = nil
ignore_domain_keys = nil
loop do
  if before && ignore_domain_keys
    puts "Change System Preferences and hit Enter Key (Ctrl-C to exit)."
    if gets == "exit\n"
      break
    end
  end

  puts "loading..."
  after = apple_domains.map do |domain|
    xml = `defaults export #{domain} -`
    [domain, Plist.parse_xml(xml)]
  end.to_h

  if before.nil?
    before = after
    next
  elsif ignore_domain_keys.nil?
    diff = HashDiff.diff(before, after)
    ignore_domain_keys = diff.map {|k, v| [k, v.keys]}.to_h
    next
  end

  # diff = HashDiff.diff(before, after)
  diff = HashDiff.left_diff(before, after)
  diff.keys.each do |domain|
    Array(ignore_domain_keys[domain]).each do |key|
      diff[domain].delete(key)
    end
  end

  diff.delete_if { |k, v| v.empty? }

  puts
  # TODO: convert to 'defaults write'
  pp diff
  puts

  before = after
  sleep 1 if ignore_domain_keys.nil?
end
