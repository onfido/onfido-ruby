# -*- encoding: utf-8 -*-

=begin
#Onfido API v3.6

#The Onfido API (v3.6)

The version of the OpenAPI document: v3.6

Generated by: https://openapi-generator.tech
Generator version: 7.5.0

=end

$:.push File.expand_path("../lib", __FILE__)
require "onfido/version"

Gem::Specification.new do |s|
  s.name        = "onfido"
  s.version     = Onfido::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["OpenAPI-Generator"]
  s.email       = [""]
  s.homepage    = "https://github.com/onfido/onfido-ruby"
  s.summary     = "The official Ruby library for integrating with the Onfido API."
  s.description = "Ruby Library for the Onfido API"
  s.license     = "MIT"
  s.required_ruby_version = ">= 2.7"
  s.metadata    = {}

  s.add_runtime_dependency 'faraday', '>= 1.0.1', '< 3.0'
  s.add_runtime_dependency 'faraday-multipart'
  s.add_runtime_dependency 'marcel'
  s.add_runtime_dependency 'openssl'

  s.add_development_dependency 'rspec', '~> 3.6', '>= 3.6.0'
  s.add_development_dependency 'rspec-its', '~> 1.2'

  s.files         = `find *`.split("\n").uniq.sort.select { |f| !f.empty? }
  s.test_files    = `find spec/*`.split("\n")
  s.executables   = []
  s.require_paths = ["lib"]
end
