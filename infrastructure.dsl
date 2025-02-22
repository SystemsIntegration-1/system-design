workspace "Name" "Description" {

    !identifiers hierarchical

    model {
        u = person "User"

        ui = softwareSystem "User Interface" {
            frontend = container "Frontend"
        }

        backend = softwareSystem "Backend" {
            gateway = container "API Gateway"

            warehouse = container "Warehouse"
            logistics = container "Logistics"
            branches = container "Branches"
            geolocalization = container "Geolocalization"
        }

        u -> ui.frontend "Interacts with"
        ui -> backend "Sends requests to"
        

        backend.gateway -> backend.logistics "Routes to Logistics"
        backend.gateway -> backend.branches "Routes to Branches"
        backend.gateway -> backend.warehouse "Routes to Warehouse"

        backend.logistics -> backend.branches "Coordinates with"
        backend.logistics -> backend.geolocalization "Coordinates with"
        backend.logistics -> backend.warehouse "Coordinates with"
    }

    views {
        systemContext ui "User_Interaction" {
            include *
            autolayout lr
        }
    
        
        systemContext backend "Backend_Context" {
            include *
        
            autolayout lr
        }
        
        container backend "Backend_Architecture" {
            include backend.gateway
            include backend.logistics
            include backend.branches
            include backend.geolocalization
            include backend.warehouse
            
            autolayout lr
        }

        styles {
            element "Element" {
                color #ffffff
            }
            element "Person" {
                background #d34407
                shape person
            }
            element "Software_System" {
                background #f86628
            }
            element "Container" {
                
            }
            element "API_Gateway" {
                background #ffa500
                shape hexagon
            }
        }
    }

    configuration {
        
    }
}
