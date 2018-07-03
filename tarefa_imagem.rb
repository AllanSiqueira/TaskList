require_relative 'tarefa'
class TarefaImagem < Tarefa

  attr_accessor :imagem

  def initialize(id, descricao, imagem, feita = false)
    super(id, descricao, feita)
    @imagem = imagem
  end

  def to_s
    "#{super()} || Imagem: #{imagem()}"
  end

  def remover_imagem
    @imagem = nil
  end

end
