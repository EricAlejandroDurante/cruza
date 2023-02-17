import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="greeting"
export default class extends Controller {
  static targets = ["name", "output"]
  connect() { 
  }

  greet(){
    this.outputTarget.textContent = this.nameTarget.value
  }
}
