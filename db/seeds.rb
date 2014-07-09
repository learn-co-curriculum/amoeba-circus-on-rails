def main
  make_talents
  make_amoebas
  make_acts
  make_sure_all_ameobas_have_acts
end

def make_talents
  names = ["acrobat", "contortionist", "clown", "juggler", "freak"]
  names.each do |name|
    Talent.create(:name => name)
  end
end

def make_amoebas
  names = ["Nisha", "Jahmil", "Lavoisier", "Logan", "Arel", "Amanda", "Katie", "Tristan"]
  names.each do |name|
    amoeba = Amoeba.create(:name => name, :generation => 1)
    random_talent = Talent.find(rand(1...Talent.all.count))
    random_talent.amoebas << Amoeba.find_by(:name => name)
  end
end

def make_acts
  names = ["Monty Python's Flying Circus", "Synchronized Swimming", "Dance Troupe", "Ninja Troupe", "Cirque du Soleil", "Flying Wallendas"]
  names.each do |name|
    act = Act.create(:name => name, date: Date.today, time: Time.now)
    rand(1..3).times do
      amoebas_without_this_act = []
      Amoeba.all.each do |amoeba|
        unless amoeba.acts.include?(act)
          amoebas_without_this_act << amoeba
        end
      end
      act.amoebas << amoebas_without_this_act.sample
    end
  end 
end

def make_sure_all_ameobas_have_acts
  all_of_em = Amoeba.all
  amoebas_without_acts = []
  all_of_em.each do |a|
    if a.acts.count < 1
      amoebas_without_acts << a
    end
  end
  amoebas_without_acts.each do |a|
    a.acts << [Act.find(rand(1...Act.all.count)), Act.find(rand(1...Act.all.count))]
    a.save
  end
end

main