class Application

    @@items = []

    def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    
    if req.path.match(/items/)                      #Step 1
            shopping_item = req.path.split("/items/").last 
            if item = @@items.find{|item| item.name == shopping_item}
                resp.write item.price               #Step 2
            else                                    #Step 3
                resp.write "Item not found"
                resp.status = 400
            end
        else
            resp.write "Route not found"            #Step 1
            resp.status = 404
        end
    resp.finish
    end
end

# Dynmiac URL Routes: https://learn.co/tracks/web-development-immersive-2-0-module-two/rack/rack-and-the-internet/dynamic-url-routes
# Reading/lab that mentions combining URL paths and Ruby classes

#The HTTP Request: https://learn.co/tracks/web-development-immersive-2-0-module-two/rack/rack-and-the-internet/the-http-request
#Reading that mentions how to filter so that this only works for the /items path using the #path method of our Rack::Request object