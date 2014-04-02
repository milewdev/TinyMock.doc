chai   = require("chai")
should = chai.should()
mock   = require("TinyMockJS").mock
Logger = require("../src/Logger").Logger
fs     = require("fs")

describe "Logger", ->
  describe "constructor(options)", ->
    it "retrieves the log file name from 'options'", ->
      mock (options) ->
        options.expects("get_log_filename")
        logger = new Logger(options)        
          
  describe "write(message)", ->
    
    logger = undefined
    
    beforeEach ->
      options = { get_log_filename: -> "log.txt" }
      logger = new Logger(options)

    it "writes 'message' to 'log_filename' that was passed to the constructor", ->
      mock ->
        fs.expects("appendFileSync").args("log.txt", "a message")
        logger.log("a message")

    it "does not eat exceptions thrown by fs.appendFileSync", ->
      mock ->
        fs.expects("appendFileSync").args("log.txt", "a message").throws(new Error("an error"))
        (-> logger.log("a message") ).should.throw("an error")
