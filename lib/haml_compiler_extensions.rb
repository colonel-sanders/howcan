module Haml
  module Compiler
    def precompiled_with_ambles_whocan(local_names)
      src = precompiled_with_ambles_haml(local_names)
      src.sub(/begin;/, '\0WhoCan.active_haml=self;')
    end

    alias_method :precompiled_with_ambles_haml, :precompiled_with_ambles
    alias_method :precompiled_with_ambles, :precompiled_with_ambles_whocan
  end
end
