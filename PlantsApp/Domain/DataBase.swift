//
//  DataBase.swift
//  PlantsApp
//
//  Created by Jaqueline Oliveira on 12/12/22.
//

import Foundation
import UIKit

class DataBase {
    
    static var shared = DataBase()
    
    var imageMenu : [Plant] = [
        
        Plant(name: "Imbé",
                  plantImage: UIImage(named: "Imbé") ?? UIImage(),
                  description: "Este é um dos representantes mais populares de um gênero com mais de 500 espécies de filodendro, a maioria oriunda de regiões tropicais das Antilhas às América Central e do Sul. Quando um imbé muito antigo floresce, suas flores são discretas, sem pétalas e ficam praticamente escondidas pela folhagem."),
        Plant(name: "Peperomia",
                  plantImage: UIImage(named:"Peperomia") ?? UIImage(),
                  description: "A peperômia é uma das plantas mais fáceis de cultivar dentro de casa. Ela tem em média 25 centímetros, não ocupa muito espaço, gosta do calor e não é tóxica. Você pode deixar uma floreira ou vaso de peperômia perto do seu pet sem se preocupar!"),
        Plant(name: "Aningapara",
                  plantImage: UIImage(named:"Aningapara") ?? UIImage(),
                  description: "Dieffenbachia seguine, conhecida pelos nomes comuns de comigo-ninguém-pode e aningapara, é uma planta da família das Araceae muito apreciada como ornamental de interiores, dada a sua tolerância à baixa luminosidade ambiente e baixa umidade relativa do ar."),
        Plant(name: "Yucca",
                  plantImage: UIImage(named: "Yucca") ?? UIImage(),
                  description: "Yucca é um género botânico pertencente à subfamília Agavoideae. Arbusto perene do gênero Yucca, com cerca de 40 espécies, nativa da América Central e do sul dos Estados Unidos."),
        Plant(name: "Espada de São Jorge",
                  plantImage: UIImage(named: "EspadadeSãoJorge") ?? UIImage(),
                  description: "A espada-de-são-jorge, espada-de-santa-bárbara ou espada-de-Iansã, também conhecida como língua-de-sogra, rabo-de-lagarto e sanseviéria, é uma planta herbácea de origem africana. Também é importante saber que é uma planta tóxica, e que não deve ser ingerida."),
        Plant(name: "Zamioculca",
                  plantImage: UIImage(named: "Zamioculca") ?? UIImage(),
                  description: "Zamioculcas é um género botânico, pertencente à família Araceae, que contém apenas a espécie Zamioculcas zamiifolia."),
        Plant(name: "Imbé",
                  plantImage: UIImage(named: "Imbé") ?? UIImage(),
                  description: "Este é um dos representantes mais populares de um gênero com mais de 500 espécies de filodendro, a maioria oriunda de regiões tropicais das Antilhas às América Central e do Sul. Quando um imbé muito antigo floresce, suas flores são discretas, sem pétalas e ficam praticamente escondidas pela folhagem."),
        Plant(name: "Peperomia",
                  plantImage: UIImage(named:"Peperomia") ?? UIImage(),
                  description: "A peperômia é uma das plantas mais fáceis de cultivar dentro de casa. Ela tem em média 25 centímetros, não ocupa muito espaço, gosta do calor e não é tóxica. Você pode deixar uma floreira ou vaso de peperômia perto do seu pet sem se preocupar!"),
        Plant(name: "Aningapara",
                  plantImage: UIImage(named:"Aningapara") ?? UIImage(),
                  description: "Dieffenbachia seguine, conhecida pelos nomes comuns de comigo-ninguém-pode e aningapara, é uma planta da família das Araceae muito apreciada como ornamental de interiores, dada a sua tolerância à baixa luminosidade ambiente e baixa umidade relativa do ar."),
        Plant(name: "Yucca",
                  plantImage: UIImage(named: "Yucca") ?? UIImage(),
                  description: "Yucca é um género botânico pertencente à subfamília Agavoideae. Arbusto perene do gênero Yucca, com cerca de 40 espécies, nativa da América Central e do sul dos Estados Unidos."),
        Plant(name: "Espada de São Jorge",
                  plantImage: UIImage(named: "EspadadeSãoJorge") ?? UIImage(),
                  description: "A espada-de-são-jorge, espada-de-santa-bárbara ou espada-de-Iansã, também conhecida como língua-de-sogra, rabo-de-lagarto e sanseviéria, é uma planta herbácea de origem africana. Também é importante saber que é uma planta tóxica, e que não deve ser ingerida."),
        Plant(name: "Zamioculca",
                  plantImage: UIImage(named: "Zamioculca") ?? UIImage(),
                  description: "Zamioculcas é um género botânico, pertencente à família Araceae, que contém apenas a espécie Zamioculcas zamiifolia."),
        Plant(name: "Imbé",
                  plantImage: UIImage(named: "Imbé") ?? UIImage(),
                  description: "Este é um dos representantes mais populares de um gênero com mais de 500 espécies de filodendro, a maioria oriunda de regiões tropicais das Antilhas às América Central e do Sul. Quando um imbé muito antigo floresce, suas flores são discretas, sem pétalas e ficam praticamente escondidas pela folhagem."),
        Plant(name: "Peperomia",
                  plantImage: UIImage(named:"Peperomia") ?? UIImage(),
                  description: "A peperômia é uma das plantas mais fáceis de cultivar dentro de casa. Ela tem em média 25 centímetros, não ocupa muito espaço, gosta do calor e não é tóxica. Você pode deixar uma floreira ou vaso de peperômia perto do seu pet sem se preocupar!"),
        Plant(name: "Aningapara",
                  plantImage: UIImage(named:"Aningapara") ?? UIImage(),
                  description: "Dieffenbachia seguine, conhecida pelos nomes comuns de comigo-ninguém-pode e aningapara, é uma planta da família das Araceae muito apreciada como ornamental de interiores, dada a sua tolerância à baixa luminosidade ambiente e baixa umidade relativa do ar."),
        Plant(name: "Yucca",
                  plantImage: UIImage(named: "Yucca") ?? UIImage(),
                  description: "Yucca é um género botânico pertencente à subfamília Agavoideae. Arbusto perene do gênero Yucca, com cerca de 40 espécies, nativa da América Central e do sul dos Estados Unidos."),
        Plant(name: "Espada de São Jorge",
                  plantImage: UIImage(named: "EspadadeSãoJorge") ?? UIImage(),
                  description: "A espada-de-são-jorge, espada-de-santa-bárbara ou espada-de-Iansã, também conhecida como língua-de-sogra, rabo-de-lagarto e sanseviéria, é uma planta herbácea de origem africana. Também é importante saber que é uma planta tóxica, e que não deve ser ingerida."),
        Plant(name: "Zamioculca",
                  plantImage: UIImage(named: "Zamioculca") ?? UIImage(),
                  description: "Zamioculcas é um género botânico, pertencente à família Araceae, que contém apenas a espécie Zamioculcas zamiifolia."),
        
    ]
    
    var myPlants: [Plant] = []
    
    var userName: String = ""
}
