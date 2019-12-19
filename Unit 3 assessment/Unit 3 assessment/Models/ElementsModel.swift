//
//  ElementsModel.swift
//  Unit 3 assessment
//
//  Created by Pursuit on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct  Elements: Codable {
    // top layer is an array
    // so it is an array of dictionaries
    
    // objects that only appear in elements
    let name: String
    let symbol: String
//    let discovered_by: String?
    let number: Int
    let summary: String
    let melt: Double?
    let density: Double? // weight
    
    // objects that only appear in favs
    var favoritedBy: String?
}

/*
 {
     "id": "1",
     "category": "metalloid",
     "melt": 2349,
     "boil": 4200,
     "period": 2,
     "symbol": "B",
     "discovered_by": "Joseph Louis Gay-Lussac",
     "molar_heat": 11.087,
     "phase": "Solid",
     "source": "https://en.wikipedia.org/wiki/Boron",
     "summary": "Boron is a metalloid chemical element with symbol B and atomic number 5. Produced entirely by cosmic ray spallation and supernovae and not by stellar nucleosynthesis, it is a low-abundance element in both the Solar system and the Earth's crust. Boron is concentrated on Earth by the water-solubility of its more common naturally occurring compounds, the borate minerals.",
     "favoritedBy": "Pascal",
     "number": 5,
     "appearance": "black-brown",
     "density": 2.08,
     "atomic_mass": 10.81,
     "name": "Boron"
 }
 */


/*
 get elements model
 {
     "name": "Hydrogen",
     "appearance": "colorless gas",
     "atomic_mass": 1.008,
     "boil": 20.271,
     "category": "diatomic nonmetal",
     "color": null,
     "density": 0.08988,
     "discovered_by": "Henry Cavendish",
     "melt": 13.99,
     "molar_heat": 28.836,
     "named_by": "Antoine Lavoisier",
     "number": 1,
     "period": 1,
     "phase": "Gas",
     "source": "https://en.wikipedia.org/wiki/Hydrogen",
     "spectral_img": "https://en.wikipedia.org/wiki/File:Hydrogen_Spectra.jpg",
     "summary": "Hydrogen is a chemical element with chemical symbol H and atomic number 1. With an atomic weight of 1.00794 u, hydrogen is the lightest element on the periodic table. Its monatomic form (H) is the most abundant chemical substance in the Universe, constituting roughly 75% of all baryonic mass.",
     "symbol": "H",
     "xpos": 1,
     "ypos": 1,
     "shells": [
         1
     ]
 }
 */
