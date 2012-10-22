require 'whocan'

module ApplicationHelper
  def whocan_report
    WhoCan.stack.uniq.to_s
  end
end
