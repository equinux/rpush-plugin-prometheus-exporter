# coding: utf-8
Gem::Specification.new do |spec|
  spec.name = "rpush-plugin-prometheus-exporter"
  spec.version = "0.0.2"
  spec.authors = ["Maximilian Szengel"]
  spec.email = ["szengel@equinux.com"]
  spec.summary = "Rpush plugin for prometheus_exporter."
  spec.description = "Instrument Rpush with prometheus."
  spec.homepage = "https://github.com/equinux/rpush-plugin-prometheus-exporter"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "prometheus_exporter", "~> 0.7.0"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
