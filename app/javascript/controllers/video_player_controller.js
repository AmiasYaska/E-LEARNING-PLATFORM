import { Controller } from "@hotwired/stimulus"
import Plyr from 'plyr'

export default class extends Controller {
  static values = { videoId: Number }

  connect() {
    this.player = new Plyr('#player', {
      autoplay: true
    })

    // Load saved progress
    this.player.on('loadedmetadata', () => {
      this.fetchProgress().then(progress => {
        if (progress) this.player.currentTime = this.player.duration * progress
      })
    })

    // Save progress every 15 seconds
    this.player.on('timeupdate', () => {
      if (this.player.currentTime % 5 < 0.25) { // Throttle saves
        this.saveProgress(this.player.currentTime / this.player.duration)
      }
    })
  }

  async fetchProgress() {
    const response = await fetch(`/videos/${this.videoIdValue}/progress`)
    const data = await response.json()
    return data.progress
  }

  async saveProgress(progress) {
    await fetch(`/videos/${this.videoIdValue}/progress`, {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector("[name='csrf-token']").content
      },
      body: JSON.stringify({ progress: progress })
    })
  }
}