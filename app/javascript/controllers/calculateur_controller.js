import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["resultatsContainer"]

  connect() {
    console.log("CalculateurController connected");
  }

  submitEnd(event) {
    event.preventDefault();
    const [data, status, xhr] = event.detail;
    const results = JSON.parse(xhr.response);

    if (status === "success" && results) {
      this.resultatsContainerTarget.innerHTML = `
        <p>TJM: <span>${results.tjm}</span></p>
        <p>THM: <span>${results.thm}</span></p>
      `;
    } else {
      this.resultatsContainerTarget.innerHTML = '<p>Aucun résultat à afficher.</p>';
    }
  }
}
