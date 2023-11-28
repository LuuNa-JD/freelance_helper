import { Application } from "@hotwired/stimulus"
import CalculateurController from "controllers/calculateur_controller"

const application = Application.start()
application.register("calculateur", CalculateurController)
// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
