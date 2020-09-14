module("luci.controller.udptools", package.seeall)

function index()
	entry({"admin", "services", "udptools"}, firstchild(), _("UDPTools")).dependent = false
	entry({"admin", "services", "udptools", "config"}, cbi("udptools"), _("Config"), 2)
	entry({"admin", "services", "udptools", "control"}, template("control"), _("Control"), 1)
	entry({"admin", "services", "udptools", "restart"}, call("restart"))
	entry({"admin", "services", "udptools", "stop"}, call("stop"))
end

function restart()
	luci.sys.exec("/etc/init.d/udptools restart >/dev/null")
	luci.template.render("control")	
end

function stop()                                              
    luci.sys.exec("/etc/init.d/udptools stop >/dev/null")                             
	luci.template.render("control")	
end
