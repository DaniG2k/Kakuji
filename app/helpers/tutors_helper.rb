module TutorsHelper
  def parse_proficiency(proficiency_int)
    case proficiency_int
    when 1
      t(:beginner, scope: 'activerecord.attributes.languages.level')
    when 2
      t(:intermediate, scope: 'activerecord.attributes.languages.level')
    when 3
      t(:advanced, scope: 'activerecord.attributes.languages.level')
    when 4
      t(:native, scope: 'activerecord.attributes.languages.level')
    end
  end
end
