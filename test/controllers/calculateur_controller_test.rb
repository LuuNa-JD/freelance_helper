require "test_helper"

class CalculateurControllerTest < ActionDispatch::IntegrationTest
  test "should get formulaire" do
    get calculateur_formulaire_url
    assert_response :success
  end

  test "should get calculer_tjm" do
    get calculateur_calculer_tjm_url
    assert_response :success
  end
end
