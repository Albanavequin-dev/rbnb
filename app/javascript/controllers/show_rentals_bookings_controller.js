import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-rentals-bookings"
export default class extends Controller {
  static targets = ['bookings', 'rentals'];

  connect() {
  }

  toggle(event) {
    event.preventDefault()
    if (this.bookingsTarget.classList.contains("d-none")) {
      this.bookingsTarget.classList.remove("d-none")
      this.rentalsTarget.classList.add("d-none")
    }
    else {
      this.rentalsTarget.classList.remove("d-none")
      this.bookingsTarget.classList.add("d-none")
    }
  }
}
