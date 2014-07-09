class Amoeba < ActiveRecord::Base
  before_save :set_color
  belongs_to :talent
  has_many :amoeba_acts
  has_many :acts, :through => :amoeba_acts

  NAMES = ["Herminone", "Maile", "Jenna", "Mica", "Lakiesha", "Alfonso", "Cassaundra", "Cher", "Myesha", "Numbers", "Nidia", "Charmain", "Greg", "Maryanne", "Idell", "Era", "Barry", "Dylan", "Stacy", "Mozel"]

  def split
    2.times do 
      Amoeba.create(:name => get_first_name, :talent_id=>self.talent_id, :generation => self.generation + 1, :acts => self.acts, :color => self.color)
    end
    self.destroy
  end

  def set_color
    unless self.color
      self.color = ["pink", "green", "blue", "grey"].sample
    end
  end

  def get_first_name
    new_name = self.name
    while new_name == self.name
      new_name = NAMES.sample
    end
    return new_name
  end

  def get_second_name
    new_name = self.name
    while new_name == self.name || new_name == Amoeba.last.name
      new_name = NAMES.sample
    end
    return new_name
  end

  def act_names
    self.acts.collect{|act| act.name}.join(", ")
  end

end
