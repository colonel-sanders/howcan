class WhoCan
  def self.stack
    Thread.current[:whocan_stack]
  end

  def self.reset_stack
    Thread.current[:whocan_stack] = []
  end

  def self.active_haml
    Thread.current[:whocan_haml]
  end

  def self.active_haml=(val)
    Thread.current[:whocan_haml] = val
  end

  def self.push_stack(val)
    stack << val
    active_haml.output_buffer << "<!-- WhoCan: #{val}-->" if active_haml && active_haml.output_buffer
  end
end
