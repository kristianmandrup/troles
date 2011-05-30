# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "troles"
  s.summary = "Troles is roles for rails"
  s.description = "A common roles API that supports multiple role strategies and is easy to port to multiple data stores and schemas"
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.textile"]
  s.version = "0.0.1"
end