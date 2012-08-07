class DataFile < ActiveRecord::Base
  def self.save(upload)
    name =  upload['datafile'].original_filename
    directory = "public/data"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
    File.open(path).readlines.each do |linha|
      #id,codigo,horario,periodo,created_at,updated_at,path = linha.split(/,/)
      #horario = "'#{horario}'"
      #Manha2.create(:codigo=>codigo,:horario=>horario,:periodo => periodo,:created_at => created_at, :updated_at => updated_at,:path => path)
      nome,matricula,unidade,funcao,endereco,num,complemento,bairro,cidade,telefone,obs = linha.split(/,/)
      Participante.create(:nome=>nome,:matricula=>matricula,:unidade_id=>unidade,:funcao=>funcao,:endereco=>endereco,:complemento=>complemento,:bairro=>bairro,:cidade=>cidade,:telefone=>telefone,:obs=>obs)
    end
  end
end
