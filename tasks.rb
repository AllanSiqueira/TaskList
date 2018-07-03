require_relative 'tarefa'
require_relative 'tarefa_prazo'

puts 'Bem-vindo ao Task List'

INSERIR_TAREFA = 1
VER_TAREFAS = 2
BUSCAR_TAREFA = 3
MARCAR_FEITA = 4
SAIR = 0

def menu
  puts '## MENU ##'
  puts "##{INSERIR_TAREFA} - Inserir Uma Tarefa"
  puts "##{VER_TAREFAS} - Ver Todas tarefas"
  puts "##{BUSCAR_TAREFA} - Buscar Uma Tarefa"
  puts "##{MARCAR_FEITA} - Marcar tarefa como Feita"
  puts "##{SAIR} - Sair"
  puts
  print 'Escolha uma opção: '
  gets.to_i
end

def imprime_tarefas(tasks)
  tasks.each do |t|
    puts t
  end
end

opcao_escolhida = menu()
tarefa_id = 1
tarefas = []

while(opcao_escolhida != SAIR) do
  if opcao_escolhida == INSERIR_TAREFA
    print 'Insira uma tarefa: '
    descricao_tarefa = gets().chomp()
    print 'Tarefa com prazo? (S/N) '
    sim_nao = gets().chomp()
    if sim_nao == 's'
      print 'Insira o Prazo: (dd/mm/aaaa) '
      prazo = gets().chomp()
      print 'Tarefa ja foi realizada? (S/N) '
      sim_nao = gets().chomp()
      if sim_nao == 's'
        tarefa = TarefaPrazo.new(tarefa_id, descricao_tarefa, prazo, true)
      else
        tarefa = TarefaPrazo.new(tarefa_id, descricao_tarefa, prazo)
      end
    else
      print 'Tarefa ja foi realizada? (S/N) '
      sim_nao = gets().chomp()
      if sim_nao == 's'
        tarefa = Tarefa.new(tarefa_id, descricao_tarefa, true)
      else
        tarefa = Tarefa.new(tarefa_id, descricao_tarefa)
      end
    end
    tarefas << tarefa
    puts "Tarefa incluida: #{ descricao_tarefa }"

    tarefa_id = tarefa_id + 1

  elsif opcao_escolhida == VER_TAREFAS
    imprime_tarefas(tarefas)
  elsif opcao_escolhida == BUSCAR_TAREFA
    print 'Insira o texto que deseja buscar: '
    texto_busca = gets().chomp().upcase()

    tarefas_encontradas = tarefas.select do |tarefa|
      tarefa.include? texto_busca
    end
    puts "#{tarefas_encontradas.length} tarefas encontradas"
    imprime_tarefas(tarefas_encontradas)

  elsif opcao_escolhida == MARCAR_FEITA
    puts 'Escolha qual tarefa deseja marcar como feita'
    puts
    imprime_tarefas(tarefas)
    print 'qual deseja marcar como feita? '
    id_marcar_feita = gets().to_i()
    tarefas.each do |t|
      if t.id == id_marcar_feita
        t.marcar_feita()
      end
    end
  end
  opcao_escolhida = menu()
end
