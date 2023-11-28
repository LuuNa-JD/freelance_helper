class CalculateurController < ApplicationController
  def formulaire
    @resultats = {}
    # Vue pour le formulaire
  end

  def calculer_tjm
    calculator = FreelancerCalculator.new(calculator_params)
    @resultats = calculator.calculer_tjm

    respond_to do |format|
      format.html { render :formulaire } # Ou une autre vue si nécessaire
      format.json { render json: { tjm: tjm_calculé, thm: thm_calculé } } # Renvoie les résultats au format JSON
    end
  end

  private

  def calculator_params
    params.require(:calculateur).permit(:salaire_souhaite, :jours_travailles, :pourcentage_cotisations, :pourcentage_impots,
    :frais_pro_fixes, :cotisation_chomage, :prime_mutuelle_tns,
                                        :prime_assurance_rc, :compensation_avantages)
  end
end
