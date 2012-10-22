module CanCan
  module Ability
    def can_whocan?(action, subject, *extra_args)
      res = can_cancan?(action, subject, extra_args)
      WhoCan.push_stack "#{action} #{subject}: #{res}"
      res
    end

    alias_method :can_cancan?, :can?
    alias_method :can?, :can_whocan?
  end
end
