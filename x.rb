begin
  raise "hell"
rescue Exception => e
  p e.backtrace
end
