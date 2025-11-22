# frozen_string_literal: true

# Set encoding to UTF-8 for Windows compatibility
if Gem.win_platform?
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
# require 'bootsnap/setup' # Disabled due to encoding issues with Turkish characters in path
