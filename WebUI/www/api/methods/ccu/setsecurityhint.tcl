##
# CCU.setSecurityHint
# Die Datei wird beim ersten Start der CCU2 angelegt, wenn der User best�tigt, dass er ihn gelesen hat.
#
# Parameter:
#  kein
#
# R�ckgabewert: immer true
##


catch {exec touch /etc/config/userAckSecurityHint}

jsonrpc_response true


