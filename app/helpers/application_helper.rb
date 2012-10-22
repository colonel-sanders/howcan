require 'whocan'

module ApplicationHelper
  def whocan_report
    WhoCan.stack.to_s
  end
end
