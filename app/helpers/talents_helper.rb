module TalentsHelper

  def talents_for_select
    @talents_for_select ||= Talent.all
  end

end

