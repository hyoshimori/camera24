import { Controller } from "@hotwired/stimulus"

let counter = 0;
// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["input"]

  input(){
    if (counter === 0) {
      this.element.lastElementChild.lastElementChild.setAttribute('class', 'active');
      counter += 1;
    } else if (counter === 1) {
      this.element.lastElementChild.lastElementChild.removeAttribute('class', 'active');
      counter -= 1;
    }
  }
}
