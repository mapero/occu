##
# User.getLanguage
# Ermittelt die vom User gew�hlte Sprache
#
# Parameter:
#   userID: [string] userId des Anwenders
#
# R�ckgabewert: Gew�hlte Sprache des Users
##

set script {
  var user = dom.GetObject(userID);
  Write(user.UserFirstName());
}
set userName [hmscript $script args]

if {[catch {set fp [open "/etc/config/userprofiles/$userName.lang" r]}] == 0} {
  set data [read $fp]
  set lang [split $data "\n"]
  close $fp
} else {
  set lang "0"
}

jsonrpc_response [lindex $lang 0]