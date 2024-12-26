import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  initialize() {
    this.maxStackSize = 5;
    this.history = JSON.parse(localStorage.getItem('commands')) || [];
    this.index = this.history.length;
  }

  addCommand(value) {
    if (!value) { return }

    let result = this.history.filter(item => item !== value)
    result.unshift(value);
    this.history = result.slice(0, 100);

    localStorage.setItem('commands', JSON.stringify(this.history));
    this.index = this.history.length;
  }

  incrementIndex() {
    this.index += 1;

    if (this.index >= this.history.length) {
      this.index = 0;
    }
  }

  decrementIndex() {
    this.index -= 1;

    if (this.index < 0) {
      this.index = this.history.length - 1;
    }
  }

  submit(event) {
    this.addCommand(this.element.querySelector('input').value);
  }

  up() {
    this.incrementIndex();
    this.element.querySelector('input').value = this.history[this.index] || '';
  }

  down() {
    this.decrementIndex();
    this.element.querySelector('input').value = this.history[this.index] || '';
  }
}
