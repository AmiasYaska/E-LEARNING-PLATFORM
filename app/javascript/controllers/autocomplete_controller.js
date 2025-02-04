import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["input", "results"]

    connect() {
        this.timeout = null
    }

    search() {
        clearTimeout(this.timeout)
        this.timeout = setTimeout(() => {
            this.fetchResults(this.inputTarget.value)
        }, 300)
    }

    async fetchResults(query) {
        if(query.length < 2) {
            this.inputTarget.innerHTML = ""
        }

        try {
            response = await fetch("/videos/autocomplete?query=${encodeURIComponent(query)}")
            results = await response.json()
            this.displayResults(results)
        } catch(error) {
            console.log("Incomplete failed", error)
        }
        
    }
}