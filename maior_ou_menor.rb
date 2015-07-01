
def da_boas_vindas
  puts
  puts "        P  /_\  P                              "
  puts "       /_\_|_|_/_\                             "
  puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
  puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
  puts "  |' '  |  |_|  |'  ' |                        "
  puts "  |_____| ' _ ' |_____|                        "
  puts "        \__|_|__/                              "
  print "Qual é o seu nome?"
  nome = gets.strip
  puts "\n\n\n\n\n\n"
  puts "Começaremos o jogo pra você, #{nome}"
  nome
end

def pede_dificuldade
  puts "Qual o nível de dificuldade que deseja?"
  puts "(1) Muito fácil (2) Fácil (3) Normal (4) Difícil (5) Impossível"
  print "Escolha: "
  dificuldade = gets.to_i
end

def sorteia_numero_secreto dificuldade
  case dificuldade
  when 1
    maximo = 30
  when 2
    maximo = 60
  when 3
    maximo = 100
  when 4
    maximo = 150
  when 5
    maximo = 200
  end
  puts "Escolhendo um número secreto entre 1...#{maximo}"
  sorteado = rand(maximo) + 1
  puts "Escolhido...que tal adivinhar hoje o nosso número secreto?"
  sorteado
end

def pede_um_numero chutes, tentativas, maximo_de_tentativas
  puts "\n\n\n\n\n\n"
  puts "Tentativa #{tentativas} de #{maximo_de_tentativas}"
  puts "Chutes até agora: #{chutes}"
  puts "Entre com o número"
  chute = gets
  puts "Será que você acertou? Você chutou #{chute}"
  chute.to_i
end

def ganhou
  puts
  puts "             OOOOOOOOOOO               "
  puts "         OOOOOOOOOOOOOOOOOOO           "
  puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
  puts "    OOOOOO      OOOOO      OOOOOO      "
  puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
  puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
  puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
  puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
  puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
  puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
  puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
  puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
  puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
  puts "         OOOOOO         OOOOOO         "
  puts "             OOOOOOOOOOOO              "
  puts
  puts "               Acertou!                "
  puts
end

def verifica_se_acertou chute, numero_secreto
   acertou = chute == numero_secreto

  if acertou
    puts "Parabéns!!! Você acertou!"
    ganhou
    return true
  end
  maior = numero_secreto > chute
  if maior
    puts "Número secreto é MAIOR"
  else
    puts "Número secreto é  MENOR"
  end
  false
end

def jogar nome, dificuldade
  numero_secreto = sorteia_numero_secreto dificuldade
  maximo_de_tentativas = 5
  chutes = []
  pontos_ate_agora = 1000

  for tentativas in 1..maximo_de_tentativas

    chute = pede_um_numero chutes, tentativas, maximo_de_tentativas
    chutes << chute
    if nome == "Gugu"
      puts "Acertou"
      break
    end
    pontos_a_perder = (chute - numero_secreto) /2.0
    pontos_a_perder = pontos_a_perder.abs
    pontos_ate_agora = pontos_ate_agora - pontos_a_perder

    if verifica_se_acertou chute, numero_secreto
      break
    end

  end
  puts "Você ganhou #{pontos_ate_agora} pontos"
end

def nao_quer_jogar?
  puts "Deseja jogar novamente? (S/N)"
  quero_jogar = gets.strip
  nao_quero_jogar = quero_jogar.upcase == "N"
end

nome = da_boas_vindas
dificuldade = pede_dificuldade

loop do
  jogar nome, dificuldade
  break if nao_quer_jogar?
end
