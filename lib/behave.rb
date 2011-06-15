module Behave
  autoload :Config,   'behave/config'
  autoload :Macros,   'behave/macros'

  def has_decorator? name
  end

  def has_decorators? *names
  end

  # get the decorator!
  def decorator name
  end
end