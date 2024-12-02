// 1. Create base class Computer with common properties and methods.
class Computer { // Base class    
    private var brand: String
    private var processor: String
    private var ram: Int // Amount of RAM in GB

    // Initializer with validation for RAM
    init(brand: String, processor: String, ram: Int) {
        self.brand = brand
        self.processor = processor
        
        // RAM validation: it should be at least 4GB.
        if ram >= 4 {
            self.ram = ram
        } else {
            print("Warning: Invalid RAM value. Setting RAM to 4GB.")
            self.ram = 4  // Default value if invalid.
        }
    }

    // Method to display specs
    func displaySpecs() {
        print("Brand: \(self.brand), Processor: \(self.processor), RAM: \(self.ram)GB")
    }

    // Getters to access the brand, processor, and ram values
    func getBrand() -> String {
        return self.brand
    }

    func getProcessor() -> String {
        return self.processor
    }

    func getRam() -> Int {
        return self.ram
    }

    // Setters to modify the brand and the processor if needed
    func setBrand(brand: String) {
        self.brand = brand
    }

    func setProcessor(processor: String) {
        self.processor = processor
    }

    // Setters with validation for RAM
    func setRam(ram: Int) {
        if ram >= 4 {
            self.ram = ram
        } else {
            print("Error: Invalid RAM value. RAM must be at least 4GB.")
        }
    }
}

// 2. Create Subclass: Laptop, Desktop, and Server

// Subclass: Laptop
class Laptop: Computer {
    private var isTouchscreen: Bool

    // Initializer
    init(brand: String, processor: String, ram: Int, isTouchscreen: Bool) {
        self.isTouchscreen = isTouchscreen
        super.init(brand: brand, processor: processor, ram: ram)
    }

    // Override the displaySpecs() method to include this property (isTouchscreen).
    override func displaySpecs() {
        print("Laptop Spec")
        super.displaySpecs() // Call the parent class' displaySpecs
        print("Touchscreen: \(self.isTouchscreen ? "Yes" : "No")\n")
    }

    // Setter for isTouchscreen
    func setIsTouchscreen(isTouchscreen: Bool) {
        self.isTouchscreen = isTouchscreen
    }
}

// Subclass: Desktop
class Desktop: Computer {
    private var hasDedicatedGPU: Bool

    // Initializer
    init(brand: String, processor: String, ram: Int, hasDedicatedGPU: Bool) {
        self.hasDedicatedGPU = hasDedicatedGPU
        super.init(brand: brand, processor: processor, ram: ram)
    }

    // Override the displaySpecs() method to include this property (hasDedicatedGPU).
    override func displaySpecs() {
        print("Desktop Spec")
        super.displaySpecs() // Call the parent class' displaySpecs
        print("Dedicated GPU: \(self.hasDedicatedGPU ? "Yes" : "No")\n")
    }

    // Setter for hasDedicatedGPU
    func setHasDedicatedGPU(hasDedicatedGPU: Bool) {
        self.hasDedicatedGPU = hasDedicatedGPU
    }
}

// Subclass: Server
class Server: Computer {
    private var rackUnits: Int

    // Initializer
    init(brand: String, processor: String, ram: Int, rackUnits: Int) {
        self.rackUnits = rackUnits
        super.init(brand: brand, processor: processor, ram: ram)
    }

    // Override the displaySpecs() method to include this property (rackUnits).
    override func displaySpecs() {
        print("Server Spec")
        super.displaySpecs() // Call the parent class' displaySpecs
        print("Rack Units: \(self.rackUnits)\n")
    }

    // Setter for rackUnits with validation
    func setRackUnits(rackUnits: Int) {
        if rackUnits >= 4 {
            self.rackUnits = rackUnits
        } else {
            print("Invalid number of rack units. Must be at least 4.")
        }
    }
}

// 3. Write some testing code

// Create one object for each subclass and assign appropriate values to their properties
var laptop = Laptop(brand: "Apple", processor: "M2", ram: 16, isTouchscreen: true)
var desktop = Desktop(brand: "Dell", processor: "Intel i9", ram: 32, hasDedicatedGPU: true)
var server = Server(brand: "HP", processor: "Xeon", ram: 64, rackUnits: 4)

// Call the displaySpecs() method for each object to print their specifications.
laptop.displaySpecs() 
desktop.displaySpecs()
server.displaySpecs()
