//
//  Vegetable.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/13/25.
//

import SwiftUI
import SwiftData

@Model
class Vegetable: Decodable, Identifiable {
    var id: Int
    var vegetableCode: String
    var name: String
    var body: String
    var thumbnailImage: String
    var seedDepth: String
    var germinationSoilTemp: String
    var daysToGermination: Int
    var sowIndoors: String
    var sowOutdoors: String
    var phRange: String
    var growingSoilTemp: String
    var spacingBeds: String
    var watering: String
    var light: String
    var goodCompanions: String
    var badCompanions: String
    var sowingDescription: String?
    var growingDescription: String
    var harvestDescription: String
    var active: Bool?
    var season: String
    var daysToHarvestSeeds: Int
    var daysToHarvestSeedlings: Int
    var healthBenefits: String
    
    var imageUrl: URL? {
        return URL(string: thumbnailImage)
    }
    
    @Relationship(deleteRule: .nullify)
    var pests: [Pest]?
    
    init(id: Int, vegetableCode: String, name: String, body: String, thumbnailImage: String, seedDepth: String, germinationSoilTemp: String, daysToGermination: Int, sowIndoors: String, sowOutdoors: String, phRange: String, growingSoilTemp: String, spacingBeds: String, watering: String, light: String, goodCompanions: String, badCompanions: String, sowingDescription: String? = nil, growingDescription: String, harvestDescription: String, active: Bool? = nil, season: String, daysToHarvestSeeds: Int, daysToHarvestSeedlings: Int, healthBenefits: String, pests: [Pest]? = nil) {
        self.id = id
        self.vegetableCode = vegetableCode
        self.name = name
        self.body = body
        self.thumbnailImage = thumbnailImage
        self.seedDepth = seedDepth
        self.germinationSoilTemp = germinationSoilTemp
        self.daysToGermination = daysToGermination
        self.sowIndoors = sowIndoors
        self.sowOutdoors = sowOutdoors
        self.phRange = phRange
        self.growingSoilTemp = growingSoilTemp
        self.spacingBeds = spacingBeds
        self.watering = watering
        self.light = light
        self.goodCompanions = goodCompanions
        self.badCompanions = badCompanions
        self.sowingDescription = sowingDescription
        self.growingDescription = growingDescription
        self.harvestDescription = harvestDescription
        self.active = active
        self.season = season
        self.daysToHarvestSeeds = daysToHarvestSeeds
        self.daysToHarvestSeedlings = daysToHarvestSeedlings
        self.healthBenefits = healthBenefits
        self.pests = pests
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.vegetableCode = try container.decode(String.self, forKey: .vegetableCode)
        self.name = try container.decode(String.self, forKey: .name)
        self.body = try container.decode(String.self, forKey: .body)
        self.thumbnailImage = try container.decode(String.self, forKey: .thumbnailImage)
        self.seedDepth = try container.decode(String.self, forKey: .seedDepth)
        self.germinationSoilTemp = try container.decode(String.self, forKey: .germinationSoilTemp)
        self.daysToGermination = try container.decode(Int.self, forKey: .daysToGermination)
        self.sowIndoors = try container.decode(String.self, forKey: .sowIndoors)
        self.sowOutdoors = try container.decode(String.self, forKey: .sowOutdoors)
        self.phRange = try container.decode(String.self, forKey: .phRange)
        self.growingSoilTemp = try container.decode(String.self, forKey: .growingSoilTemp)
        self.spacingBeds = try container.decode(String.self, forKey: .spacingBeds)
        self.watering = try container.decode(String.self, forKey: .watering)
        self.light = try container.decode(String.self, forKey: .light)
        self.goodCompanions = try container.decode(String.self, forKey: .goodCompanions)
        self.badCompanions = try container.decode(String.self, forKey: .badCompanions)
        self.sowingDescription = try container.decodeIfPresent(String.self, forKey: .sowingDescription)
        self.growingDescription = try container.decode(String.self, forKey: .growingDescription)
        self.harvestDescription = try container.decode(String.self, forKey: .harvestDescription)
        self.active = try container.decodeIfPresent(Bool.self, forKey: .active)
        self.season = try container.decode(String.self, forKey: .season)
        self.daysToHarvestSeeds = try container.decode(Int.self, forKey: .daysToHarvestSeeds)
        self.daysToHarvestSeedlings = try container.decode(Int.self, forKey: .daysToHarvestSeedlings)
        self.healthBenefits = try container.decode(String.self, forKey: .healthBenefits)
        self.pests = try container.decode([Pest].self, forKey: .pests)
        
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "VegetableId"
        case vegetableCode = "VegetableCode"
        case name = "Name"
        case body = "Description"
        case thumbnailImage = "ThumbnailImage"
        case seedDepth = "SeedDepth"
        case germinationSoilTemp = "GerminationSoilTemp"
        case daysToGermination = "DaysToGermination"
        case sowIndoors = "SowIndoors"
        case sowOutdoors = "SowOutdoors"
        case phRange = "PhRange"
        case growingSoilTemp = "GrowingSoilTemp"
        case spacingBeds = "SpacingBeds"
        case watering = "Watering"
        case light = "Light"
        case goodCompanions = "GoodCompanions"
        case badCompanions = "BadCompanions"
        case sowingDescription = "SowingDescription"
        case growingDescription = "GrowingDescription"
        case harvestDescription = "HarvestDescription"
        case active = "Active"
        case season = "Season"
        case daysToHarvestSeeds = "DaysToHarvestSeeds"
        case daysToHarvestSeedlings = "DaysToHarvestSeedlings"
        case healthBenefits = "HealthBenefits"
        case pests = "Pests"
    }
}

// MARK: - Pest
struct Pest: Codable {
    var name: String
    var description: String
    var symptoms: String
    var treatment: String
    var photo: String
}

extension Vegetable {
    static var sampleVegetable = Vegetable(
        id: 1, vegetableCode: "002", name: "Hot Pepper", body: "A vibrant and fiery vegetable that adds spice to any dish. Hot peppers are prized for their heat levels, ranging from mild to extreme, and are rich in vitamin C and capsaicin.", thumbnailImage: "https://www.azamsharp.com/images/carrot.png", seedDepth: "1/4-1/2 (6-13 mm)", germinationSoilTemp: "75 F (24 C)", daysToGermination: 6, sowIndoors: "Not recommended", sowOutdoors: "Spring to summer", phRange: "5.5-6.5", growingSoilTemp: "60-70 F (16-21 C)", spacingBeds: "2 (5 cm)", watering: "Moderate", light: "Full sun", goodCompanions: "Bean, cabbage, chive, leaf vartuce", badCompanions: "Celery, dill, parsnip", sowingDescription: "\r", growingDescription: "The seeds will start to sprout in couple of weeks. When watering the seeds make sure to avoid getting the leaves wet. The wetting of leaves can result in burning holes into the leaves from the sun.", harvestDescription: "Harvest the carrots when bit that sticks out of the ground is the diameter of a quarter. Dig them up carefully so as not to damage the root.", active: false, season: "Spring,Fall,Summer,Winter", daysToHarvestSeeds: 90, daysToHarvestSeedlings: 70, healthBenefits: "Rich in beta-carotene, carrots promote eye health, boost immunity, and support healthy skin.", pests:
            [
                Pest(
                    name: "Carrot Fly", description: "The carrot fly (Psila rosae) is a small, black-bodied insect with an orange head and legs. It is a common pest affecting carrots, parsnips, celery, and other Apiaceae plants. The larvae burrow into the roots of these plants, causing damage that results in stunted growth, discoloration, and increased susceptibility to secondary infections.", symptoms: "Rust-colored tunnels in the roots, yellowing and wilting foliage, and cracking of roots. Severely infested plants may rot and fail to thrive.", treatment: "Use fine mesh netting to cover plants and prevent adult flies from laying eggs. Practice crop rotation to disrupt the lifecycle of the pest. Remove and destroy infested plants immediately to prevent the spread of larvae. Companion planting with strong-smelling plants such as onions or garlic can also deter carrot flies.", photo: "https://www.azamsharp.com/images/carrotfly.png"
                ),
                Pest(
                    name: "Aphids", description: "Aphids are tiny, soft-bodied insects that can vary in color, including green, yellow, brown, red, or black. They feed on plant sap by piercing leaves and stems with their mouthparts. Aphids are a common pest in gardens and farms, often forming large colonies on new growth.", symptoms: "Infested plants may show curling or yellowing leaves, stunted growth, and sticky honeydew residue on foliage. The honeydew can attract ants and lead to the development of sooty mold on the plant surfaces.", treatment: "Introduce natural predators such as ladybugs and lacewings to control aphid populations. Spray plants with a strong jet of water to dislodge the insects. Apply neem oil or insecticidal soap for organic pest management. Remove and destroy heavily infested parts of the plant to prevent further spread.", photo: "https://www.azamsharp.com/images/aphids.png"
                )
            ]
    )
}


