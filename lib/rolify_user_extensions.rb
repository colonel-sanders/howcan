module Rolify
  module Role 
    def has_role_whocan?(role_name, resource = nil)
      res = has_role_rolify?(role_name, resource)
      WhoCan.push_stack "role #{role_name} #{resource}: #{res}"
      res
    end

    alias_method :has_role_rolify?, :has_role?
    alias_method :has_role?, :has_role_whocan?
  end
end
