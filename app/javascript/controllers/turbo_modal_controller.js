import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="turbo-modal"
export default class extends Controller {
  static targets = ["modal"]

  hideModal() {
    this.element.remove()
    this.modalTurboFrame.src = null
  }

  mouseCancel(event) {
    if (!(event && this.modalTarget.contains(event.target))) {
      this.hideModal()
    }
  }

  submitEnd(event) {
    if (event.detail.success) {
      this.hideModal()
    }
  }

  get modalTurboFrame() {
    return document.querySelector("turbo-frame[id='modal']")
  }
}
