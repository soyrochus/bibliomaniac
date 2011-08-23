

succubus = {}

succubus.mount_console = () ->
  log = console.log
  console.log = (data) ->
    log("He hecho: " + data + " " + data)
  () ->
     console.log = log


reset = succubus.mount_console()
console.log "Meh"

reset()

console.log "Meh"