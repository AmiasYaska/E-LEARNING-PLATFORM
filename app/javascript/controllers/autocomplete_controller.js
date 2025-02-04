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
            this.resultsTarget.innerHTML = ""
            return
        }

        try {
            const response = await fetch(`/videos/autocomplete?query=${encodeURIComponent(query)}`)
            const results = await response.json()
            this.displayResults(results)
        } catch(error) {
            console.error("Incomplete failed", error)
        }
    }

    displayResults(results) {
        this.resultsTarget.innerHTML = results.map(result => 
            `<li class="px-3 py-2 hover:bg-gray-300 cursor-pointer">${result}</li>`).join("")

    }

    selectResult(event) {
        this.inputTarget.value = event.target.textContent
        this.resultsTarget.innerHTML = ""
        this.element.requestSubmit()
    }


}