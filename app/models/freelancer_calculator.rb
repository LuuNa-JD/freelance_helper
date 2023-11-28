class FreelancerCalculator
  attr_accessor :jours_travailles
  attr_reader :salaire_souhaite, :pourcentage_cotisations, :pourcentage_impots,
              :cotisation_chomage, :prime_mutuelle_tns, :prime_assurance_rc,
              :compensation_avantages, :frais_pro_fixes

  def initialize(attributes = {})
    @salaire_souhaite = attributes[:salaire_souhaite].to_f
    @jours_travailles = attributes[:jours_travailles].to_i
    @pourcentage_cotisations = attributes[:pourcentage_cotisations].to_f
    @pourcentage_impots = attributes[:pourcentage_impots].to_f
    @frais_pro_fixes = attributes[:frais_pro_fixes].to_f
    @cotisation_chomage = attributes[:cotisation_chomage].to_f
    @prime_mutuelle_tns = attributes[:prime_mutuelle_tns].to_f
    @prime_assurance_rc = attributes[:prime_assurance_rc].to_f
    @compensation_avantages = attributes[:compensation_avantages].to_f
  end

  def calculer_tjm
    # Étape 1: Salaire + Cotisations Sociales
    total_cost = @salaire_souhaite * (1 + @pourcentage_cotisations / 100.0)

    # Étape 2: Ajout des Impôts
    total_cost *= (1 + @pourcentage_impots / 100.0)

    # Ajout des Frais Professionnels Fixes
    total_cost += @frais_pro_fixes

    # Étape 3: Ajout des Autres Frais Fixes
    total_cost += [@cotisation_chomage, @prime_mutuelle_tns, @prime_assurance_rc, @compensation_avantages].sum

    # Calcul du TJM et THM
    tjm = total_cost / @jours_travailles
    thm = tjm / 8.0 # Durée moyenne d'une journée de travail

    { tjm: tjm.round(2), thm: thm.round(2) }
  end
end
