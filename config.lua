-- file : config.lua
local module = {}

module.SSID = {}
module.SSID["YOUR_SSID"] = "YOUR_PASSWORD"

module.HOST = "MQTT_HOSTNAME_OR_IP"
module.PORT = 1883
module.ID = "lamp1"
module.USER = "MQTT_USERID"
module.PASS = "MQTT_PASSWORD"

module.ENDPOINT = "relay/"
return module  
