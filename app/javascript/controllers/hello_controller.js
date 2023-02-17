import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  //El connect es un callback se ejecuta al DOM
  connect() {
    //this.element.textContent = "Hello World!"
  }

  showAlert(){
    alert("Hola!")
  }
}
