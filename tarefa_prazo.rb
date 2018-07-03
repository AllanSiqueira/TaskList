require_relative 'tarefa'
require 'date'
class TarefaPrazo < Tarefa

  attr_accessor :prazo

  def initialize(id, descricao, prazo, feita = false)
    super(id, descricao, feita)
    @prazo = prazo
  end

  def prazo
    if Date.strptime(@prazo,'%d/%m/%Y') < DateTime.now
      "Fora do Prazo (#{@prazo})"
    else
      "No prazo (#{@prazo})"
    end
  end

  def to_s
    "#{super()} || Prazo: #{prazo()}"
  end

end
