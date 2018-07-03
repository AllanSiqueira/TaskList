class Tarefa
  attr_reader :id, :feita

  attr_accessor :descricao

  def initialize(id, descricao, feita = false)
    @id = id
    @descricao = descricao
    @feita = feita
  end

  def include?(texto)
    @descricao.upcase.include? texto_busca
  end

  def marcar_feita
    @feita = true
  end

  def feita
    if @feita
      "Sim"
    else
      "Não"
    end
  end

  def to_s
    "Tarefa ##{id()} >> #{descricao()} || Feita: #{feita()}"
  end
end
