import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="milestones"
export default class extends Controller {
  static targets = ["source"]
  newForm() {
    console.log(this.sourceTarget)
    this.sourceTarget.innerHTML = this.element;
    console.log("new code")

  }
}
