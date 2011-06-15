module Behave
  class BaseLoader
    attr_reader :strategy, :orm

    include ClassExt
    
    def initialize strategy, orm
      @strategy = strategy
      @orm = orm || Troles::Config.default_orm
    end

    def singularity
      (strategy =~ /_many$/) ? :many : :one
    end
    
    def strategy_class
      strategy.to_s.camelize
    end
    
    def base_class
      "Base#{singularity.to_s.camelize}"
    end

    def namespace
      singularity == :many ? 'Troles' : 'Trole'      
    end

    def orm_namespace
      ns = namespace
      ns << "::#{orm.to_s.camelize}" if orm
      ns
    end      
  end
