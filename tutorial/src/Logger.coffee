fs = require("fs")

class Logger

  constructor: (options) ->
    @log_filename = options.get_log_filename()

  log: (message) ->
    fs.appendFileSync(@log_filename, message)

module.exports = Logger
