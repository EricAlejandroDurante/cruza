import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dialog"
export default class extends Controller {
  static targets = ["dialog"]
  connect() {
  }
  superShow() {
    this.dialogTarget.showModal()
  }
  close() {
    this.dialogTarget.close()
  }
}