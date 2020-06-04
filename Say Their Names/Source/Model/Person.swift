//
//  Person.swift
//  Say Their Names
//
//  Created by Ahmad Karkouti on 30/05/2020.
//  Copyright © 2020 Franck-Stephane Ndame Mpouli. All rights reserved.
//

import Foundation

protocol PersonInterface: Decodable {
    var id: Int { get set }
    var fullName: String { get set }
    var dob: String { get set }
    var doi: String { get set }
    var childrenCount: String { get set }
    var age: String { get set }
    var city: String { get set }
    var country: String { get set }
    var bio: String { get set }
    var context: String { get set }
    var images: [Images] { get set }
    var donations: [Donation] { get set }
    var petitions: [Petition] { get set }
    var media: [Media] { get set }
    var socialMedia: [SocialMedia] { get set }
}

public struct Person: PersonInterface {
    var id: Int
    var fullName: String
    var dob: String
    var doi: String
    var childrenCount: String
    var age: String
    var city: String
    var country: String
    var bio: String
    var context: String
    var images: [Images]
    var donations: [Donation]
    var petitions: [Petition]
    var media: [Media]
    var socialMedia: [SocialMedia]
    
    private enum CodingKeys: String, CodingKey {
        case id, fullName = "full_name", dob = "date_of_birth", doi = "date_of_incident", childrenCount = "number_of_children",
        age, city, country, bio, context, images, donations = "donation_links", petitions = "petition_links", media = "media_links",
        socialMedia = "social_media"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try values.decodeIfPresent(Int.self, forKey: .id) ?? -1
        self.fullName = try values.decodeIfPresent(String.self, forKey: .fullName) ?? ""
        self.dob = try values.decodeIfPresent(String.self, forKey: .dob) ?? ""
        self.doi = try values.decodeIfPresent(String.self, forKey: .doi) ?? ""
        self.childrenCount = try values.decodeIfPresent(String.self, forKey: .childrenCount) ?? "0"
        self.age = try values.decodeIfPresent(String.self, forKey: .age) ?? ""
        self.city = try values.decodeIfPresent(String.self, forKey: .city) ?? ""
        self.country = try values.decodeIfPresent(String.self, forKey: .country) ?? ""
        self.bio = try values.decodeIfPresent(String.self, forKey: .bio) ?? ""
        self.context = try values.decodeIfPresent(String.self, forKey: .context) ?? ""
        self.images = try values.decodeIfPresent([Images].self, forKey: .images) ?? []
        self.donations = try values.decodeIfPresent([Donation].self, forKey: .donations) ?? []
        self.petitions = try values.decodeIfPresent([Petition].self, forKey: .petitions) ?? []
        self.media = try values.decodeIfPresent([Media].self, forKey: .media) ?? []
        self.socialMedia = try values.decodeIfPresent([SocialMedia].self, forKey: .socialMedia) ?? []
    }    
}
