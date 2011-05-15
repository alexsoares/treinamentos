class CreateCursos < ActiveRecord::Migration
  def self.up
    create_table :cursos do |t|
      t.string :nome_curto
      t.string :nome
      t.string :ministrante
      t.string :carga_horaria
      t.text :ementa
      t.text  :obs
      t.datetime :data_hora 

      t.timestamps
    end
    Curso.create :nome_curto => "Operações Básicas",
                 :nome => "Modulo 1 – Primeiros passos: operações básicas e sistema operacional",
                 :ementa => "Oferecer condições para que você tenha conhecimento das operações básicas para iniciar o trabalho com um computador, desmistificando e fazendo com que você perca o medo de utilizá-lo, conhecendo as instruções importantes de funcionamento no sentido de obter o máximo rendimento, facilitando, de forma significativa o seu trabalho.",
                 :carga_horaria => 4,
                 :ministrante => "Analistas Seduc"
               
    Curso.create(:nome_curto => "Sistema de segurança",
                 :nome => "Modulo 2 – Sistema de segurança e Anti vírus",
                 :ementa => "Muitas vezes perdemos arquivos importantes para uso no dia-a-dia ou até mesmo informações ou imagens que não mais encontraremos... Este módulo pretende oferecer condições para que você tenha a possibilidade de fazer cópias de segurança de seus importantes arquivos de trabalho, evitando a perda de informações importantes de seu dia-a-dia, que demandariam muito tempo para uma nova elaboração. Através de procedimentos simples, podem-se evitar sérios transtornos no desenvolvimento de seu trabalho.",
                 :carga_horaria => 4,
                 :ministrante => "Analistas Seduc"
               )
    Curso.create(:nome_curto => "Tratamento de imagens",
                 :nome => "Modulo 3 – Tratamento de imagens",
                 :ementa => "Oferecer condições para que você tenha conhecimento das operações básicas para iniciar o trabalho com um computador, desmistificando e fazendo com que você perca o medo de utilizá-lo, conhecendo as instruções importantes de funcionamento no sentido de obter o máximo rendimento, facilitando, de forma significativa o seu trabalho.",
                 :carga_horaria => 4,
                 :ministrante => "Analistas Seduc"
               )
    Curso.create(:nome_curto => "Editor de texto",
                 :nome => "Modulo 4 – Editor de texto",
                 :ementa => "Você poderá conhecer e utilizar um processador de textos que oferece uma gama de recursos indispensáveis para a edição e formatação de textos. Com o editor de textos é possível criar todos os tipos de documentos de uma forma simples e prática. É um programa indispensável em um ambiente profissional ou pessoal.",
                 :carga_horaria => 4,
                 :ministrante => "Analistas Seduc"
               )
    Curso.create(:nome_curto => "Lousa Interativa",
                 :nome => "Módulo 5 – Multimídia/Lousa Interativa",
                 :ementa => "Neste curso, você poderá conhecer e utilizar a multimídia como ferramenta de seu dia-a-dia em sala de aula, conhecendo operações básicas para ativar e desativar o projetor multimídia, para conectá-lo ao note-book ou a um computador desktop, gerar apresentações na lousa interativa, apresentar filmes, palestras e outras atividades que requeiram este dispositivo, sem ter que depender da disponibilidade de terceiros.",
                 :carga_horaria => 4,
                 :ministrante => "Analistas Seduc"

               )
    Curso.create(:nome_curto => "Planilha eletrônica",
                 :nome => "Modulo 6 – Planilha eletrônica de cálculo",
                 :ementa => "Neste curso, você poderá conhecer e utilizar uma planilha eletrônica que permite executar cálculos, gerar gráficos e manipular dados. Através deste aplicativo (software) é possível elaborar folhas de cálculos de alta complexidade sem necessidade de conhecimento de programação.",
                 :carga_horaria => 4,
                 :ministrante => "Analistas Seduc"

               )
    Curso.create(:nome_curto => "Software de Apresentações",
                 :nome => "Modulo 7 – Software de Apresentações",
                 :ementa => "Neste curso, você poderá conhecer e utilizar um software que cria apresentações pelo computador. Você poderá desenvolver apresentações com ferramentas que economizam tempo e simplificam seu trabalho.",
                 :carga_horaria => 4,
                 :ministrante => "Analistas Seduc"

               )
    Curso.create(:nome_curto => "Internet Básica",
                 :nome => "Modulo 8 – Internet Básica e E-mail",
                 :ementa => "Neste curso, você poderá conhecer e utilizar uma das maiores revoluções da informática que permite a comunicação remota entre computadores no mundo inteiro e a troca de informações entre os usuários que estão conectados, podendo acessar sites seguros, conhecer procedimentos específicos de segurança e aprender a criar e utilizar os gerenciadores de e-mails.",
                 :carga_horaria => 4,
                 :ministrante => "Analistas Seduc"

               )
    Curso.create(:nome_curto => "OpenOffice/BrOffice",
                 :nome => "Modulo 9 – OpenOffice/BrOffice – Operações básicas",
                 :ementa => "Neste curso, você poderá conhecer e utilizar uma ferramenta que é uma excelente solução para quem quer trabalhar com um pacote robusto e totalmente gratuito, com processador de texto, gerenciador de planilhas, aplicativos para montagem de apresentações, etc...",
                 :carga_horaria => 4,
                 :ministrante => "Analistas Seduc"
                 

               )
               
    Curso.create(:nome_curto => "Sistema GPD",
                 :nome => "Modulo 10 – Sistema GPD – Utilização - Do Básico ao Avançado",
                 :ementa => "Utilização Introdução, Básico e Avançado",
                 :carga_horaria => 4,
                 :ministrante => "Equipe Feeling TI"

               )

  end

  def self.down
    drop_table :cursos
  end
end
