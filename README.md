# Randomuser

Fonctionnalités
--

L'application présentée sous forme d'une tableView permet d'obtenir une liste de personnes aléatoires. Cela s'effectue par le biais d'un appel de l'API *randomuser.me*. Cette liste est composée de 1000 personnes grâce à l'utilisation du paramètre *?results=1000*.
Elle s'actualise à chaque ouverture de l'application et un indicateur d'activité est présent lors du chargement.
Chaque cellule est sélectionnable afin d'obtenir plus d'informations sur la personne.
L'appel réseau a été testé avec XCTest.

Challenges
--

- L'application iOS est développée avec Xcode 12.4 et Swift 5
- L'architecture MVC est respectée
- Un gestionnaire de dépendance (CocoaPods) a été utilisé pour Alamofire
- L'interface utilisateur a été créée en utilisant UIKit
- Pas de storyboard, ni de xib
