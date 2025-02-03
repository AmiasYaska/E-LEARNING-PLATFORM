import { Controller } from "@hotwired/stimulus"
import Plyr from 'plyr'
import debounce from 'lodash.debounce'; // Optional for better performance

export default class extends Controller {
  static values = { videoId: Number }

  connect() {
    console.log("Video ID:", this.videoIdValue); // Debugging

    this.player = new Plyr('#player', {
      autoplay: false
    });

    // Load saved progress when video can be played
    this.player.on('canplay', () => {
      this.fetchProgress().then(progress => {
        if (progress) {
          this.player.currentTime = this.player.duration * progress;
        }
      });
    });

    // Save progress every 5 seconds
    this.player.on('timeupdate', () => {
      if (Math.floor(this.player.currentTime) % 5 === 0) {
        this.saveProgress(this.player.currentTime / this.player.duration);
      }
    });
  }

  async fetchProgress() {
    try {
      const response = await fetch(`/videos/${this.videoIdValue}/progress`);
      if (!response.ok) throw new Error("Failed to fetch progress");
      const data = await response.json();
      return data.progress || 0;
    } catch (error) {
      console.error("Error fetching progress:", error);
      return 0;
    }
  }

  async saveProgress(progress) {
    try {
      await fetch(`/videos/${this.videoIdValue}/progress`, {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector("[name='csrf-token']").content
        },
        body: JSON.stringify({ progress })
      });
    } catch (error) {
      console.error("Error saving progress:", error);
    }
  }
}
