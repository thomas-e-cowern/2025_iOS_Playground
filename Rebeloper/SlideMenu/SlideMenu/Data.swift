//
//  Data.swift
//  SlideMenu
//
//  Created by Thomas Cowern on 3/4/25.
//

import Foundation

struct SampleData: Identifiable {
    var id = UUID()
    var title: String
}

struct SampleProfile: Identifiable {
    var id = UUID()
    var name: String
    var email: String
}

extension SampleData {
    static var sampleData: [SampleData] {
        [
            SampleData( title: "Morbi in sem quis dui placerat ornare. Pellentesque odio nisi, euismod in, pharetra a, ultricies in, diam. Sed arcu. Cras consequat"),
            SampleData(title: "Nulla facilisi. Ut volutpat sapien arcu, at volutpat odio volutpat ac. Aliquam erat volutpat. Nulla facilisi. Cras non velit nec nisi vulputate"),
            SampleData(title: "fringilla. Donec lobortis risus in ante ultrices vehicula. Ut tortor quam, feugiat vel, aliquet nec, vulputate eget, arcu."),
            SampleData(title: "In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam quis ante. Etiam porta sem malesuada magna mollis euismod. Donec pede justo,"),
            SampleData(title: "faucibus vel, aliquet nec, vulputate eget, arcu."),
            SampleData(title: "Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus. Nam nulla quam, gravida non, commodo a, sodales sit amet, nisi"),
            SampleData(title: "Sed adipiscing ornare risus. Morbi est est, blandit sit amet, sagittis vel, euismod vel, velit. Pellentesque egestas sem. Suspendisse commodo ullamcorper magna."),
            SampleData(title: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.")
        ]
    }
}

extension SampleProfile {
    static var sampleProfile: [SampleProfile] {
        [
            SampleProfile(name: "Bill Smith", email: "bs@email.com"),
            SampleProfile(name: "Debby Jones", email: "dj@email.com"),
            SampleProfile(name: "Henry Blue", email: "hb@email.com"),
            SampleProfile(name: "Sylvia Green", email: "sg@email.com"),
            SampleProfile(name: "Andrew White", email: "aw@email.com"),
            SampleProfile(name: "Marjorie Brown", email: "mb@email.com"),
            SampleProfile(name: "Ben Bender", email: "bb@email.com")
        ]
    }
}
