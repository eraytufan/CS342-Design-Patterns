class Response

  #Strategy pattern
  def initialize(key_value)
    @hash = key_value
    @counter = 0
  end

  def printtoScreen()
    raise nomethodexception
  end

  
  
end