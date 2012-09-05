class Relatorio < ActiveRecord::Base
  belongs_to :user, :dependent => :destroy
  def path_truncado
      str = self.path
      str[6..(str.length)]
  end

end
