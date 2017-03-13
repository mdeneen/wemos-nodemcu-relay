local module = {}  
m = nil

local function register_myself()  
    m:subscribe(config.ENDPOINT..config.ID.."/#",0,function(conn)
        print("Successfully subscribed to state endpoint")
    end)
end

local function mqtt_start()  
    m = mqtt.Client(config.ENDPOINT..config.ID, 120, config.USER, config.PASS)
    m:on("message", function(conn, topic, data)
      print("message" .. topic)
      print("message" .. data)
      if topic == config.ENDPOINT..config.ID.."/state" then
          if data == "ON" then
              gpio.write(1, gpio.HIGH)
          else
              gpio.write(1, gpio.LOW)
          end
      end
    end)
    -- Connect to broker
    m:connect(config.HOST, config.PORT, 0, 1, function(con) 
        register_myself()
    end) 

end

function module.start()
  gpio.mode(1, gpio.OUTPUT)
  mqtt_start()
end

return module
