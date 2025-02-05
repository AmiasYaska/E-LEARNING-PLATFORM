import { Controller } from "@hotwired/stimulus"
import Plyr from 'plyr'

export default class extends Controller {
  connect() {

    this.player = new Plyr('#player', {
      autoplay: false
    });
  }

}