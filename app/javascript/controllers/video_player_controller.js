import { Controller } from "@hotwired/stimulus"
import Plyr from "plyr"

export default class extends Controller {
  connect() {
    new Plyr(this.element.querySelector("video"), {
      autoplay: true
    })
  }
}