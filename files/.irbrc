%w{rubygems wirble awesome_print looksee interactive_editor}.each do |lib|
  begin
    require lib
  rescue LoadError => err
    warn "Couldn't load #{lib}: #{err}"
  end
end

# Set up Wirble
if defined?(Wirble)
  Wirble.init
  Wirble.colorize
end
