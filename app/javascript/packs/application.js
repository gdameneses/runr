// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "hotwire"
import "@hotwired/turbo-rails"
import "channels"
import "controllers"
import "bootstrap"
import "../sidebar"
import "../table"
import "table"
import "sidebar"

Turbo.session.drive = false
Rails.start()
ActiveStorage.start()
