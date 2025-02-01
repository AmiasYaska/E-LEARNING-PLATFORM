import { Controller } from "@hotwired/stimlus"
import Plyr from "plyr"

export default class Controller {
    connect() {
        new Plyr("#player", {
            autoplay: true
        })
    }
}