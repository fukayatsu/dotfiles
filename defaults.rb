#!/usr/bin/env ruby

gem 'hash_diff'
gem 'plist'

require 'plist'
require 'hash_diff'
require 'pp'

NS_GLOBAL_DOMAIN = 'NSGlobalDomain'

domains_str = `defaults domains`
apple_domains = domains_str.split(',').map(&:strip).select do |domain|
  # domain.start_with?('com.apple.')
  true
end
apple_domains << NS_GLOBAL_DOMAIN

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
    xml = `defaults export "#{domain}" -`
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
  if diff.empty?
    puts "no diff"
  else
    diff.each do |domain, config|
      config.each do |k, v|
        value =
          if v.is_a? Integer
            "-int #{v}"
          elsif v.is_a?(String)
            "-string #{v}"
          elsif v == true || v == false
            "-bool #{v}"
          elsif DateTime
            next
          else
            puts 'error: unsupported type: '
            pp v
            next
          end
        puts "defaults write \"#{domain}\" \"#{k}\" #{value}"
      end
    end
  end
  puts

  before = after
  sleep 1 if ignore_domain_keys.nil?
end
