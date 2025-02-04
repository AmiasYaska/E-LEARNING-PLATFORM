import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["input", "results"]
    connect () {
        this.timeout = null
    }

    search() {
        clearTimeout(this.timeout)
        this.timeout = setTimeout(() => { 
            this.fetchResults(this.inputTarget.value)
        }, 300)
    }
}