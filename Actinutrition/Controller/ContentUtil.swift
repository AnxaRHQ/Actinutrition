//
//  ContentUtil.swift
//  Actinutrition
//
//  Created by Elaine Reyes on 1/19/18.
//  Copyright © 2018 HAPILABS LIMITED. All rights reserved.
//

import UIKit

class ContentUtil: NSObject
{
    //MARK: Shared Instance
    
    static let sharedInstance : ContentUtil =
    {
        let instance = ContentUtil()
        return instance
    }()
    
    // MARK: - Initialization Method
    
    override init()
    {
        super.init()
    }
    
    // MARK: - Menu Contents
    
    func mainMenuContentsArray() -> [String]
    {
        return ["ACCUIEL",
                "BOUTIQUE",
                "POURQUOI ACTINUTRITION ?",
                "BLOG",
                "PROGRAMME MINCEUR GRATUIT"]
    }
    
    func boutiqueMainContentsArray() -> [String]
    {
        return ["Détox",
                "Minceur",
                "Santé"]
    }
    
    func minceurContentsArray() -> [String]
    {
        return ["Aides Minceur",
                "Brûleurs de graisse",
                "Coupe-faim - Modérateur d'appétit"]
    }
    
    func santeContentsArray() -> [String]
    {
        return ["Circulation sanguine",
                "Digestion et constipation",
                "Vitalité et anti-âge",
                "Articulations",
                "Stress et sommeil"]
    }
    
    func pourquoiContentsArray() -> [String]
    {
        return ["Philosophie et engagements",
                "Recherche et développement",
                "Suivi Personnalisé",
                "Où acheter nos produits",
                "ACE BioTechnology"]
    }
    
    // MARK: - Menu Links
    
    func mainMenuLinksArray() -> [String]
    {
        return ["http://actinutrition.fr/",
                "http://shopping.actinutrition.fr/",
                "http://actinutrition.fr/Laboratoires-Actinutrition.asp",
                "https://blog.actinutrition.fr/",
                "http://actinutrition.fr/actinutrition-ebook3.asp?s=7"]
    }
    
    func boutiqueMainLinksArray() -> [String]
    {
        return ["http://shopping.actinutrition.fr/draineurs-detox",
                "http://shopping.actinutrition.fr/minceur",
                "http://shopping.actinutrition.fr/sante"]
    }
    
    func minceurLinksArray() -> [String]
    {
        return ["http://shopping.actinutrition.fr/aides-minceur",
                "http://shopping.actinutrition.fr/bruleurs-de-graisse",
                "http://shopping.actinutrition.fr/coupe-faim-moderateur-d-appetit"]
    }
    
    func santeLinksArray() -> [String]
    {
        return ["http://shopping.actinutrition.fr/circulation-sanguine",
                "http://shopping.actinutrition.fr/digestion-et-constipation",
                "http://shopping.actinutrition.fr/vitalite-et-anti-age",
                "http://shopping.actinutrition.fr/articulations",
                "http://shopping.actinutrition.fr/stress-et-sommeil"]
    }
    
    func pourquoiLinksArray() -> [String]
    {
        return ["http://actinutrition.fr/Laboratoires-Actinutrition/Philosophie-engagements.asp",
                "http://actinutrition.fr/Laboratoires-Actinutrition/Comite-Scientifique.asp",
                "http://actinutrition.fr/Laboratoires-Actinutrition/Suivi-Personnalise.asp",
                "http://shopping.actinutrition.fr/",
                "http://actinutrition.fr/Laboratoires-Actinutrition/ACE-BioTechnology.asp"]
    }
}
