import UIKit

// Un commentaire sur une ligne
/*
 Un commentaire sur plusieurs ligne
 */

// Déclaration d'une variable
var prenom: String = "Sviatoslav"
var age: Int = 30

// Inférence de type (devine tous seul le type de la variable)
var prenom2 = "Mikhael"

// fonction qui permet d'afficher dans une console la valeur d'une variable
print(prenom)

// String interpolation permet d'ajouter des int dans les string
print("Hello \(prenom)")

// Déclaration d'une constante
let nom = "Dufour"

// Modification de la variable age
age = 31
print("Hello Monsieur \(nom) \(prenom) vous avez \(age)")


// Convention de nommage
var maVariable = "CamelCase"

// Quand on déclare plusieurs variable sur une ligne on utilise un ;
var a = 1; var b = 2

// Les types de bases
var entier: Int = 10
var entierGrand: UInt = 10_000

var decimal: Float = 10.3 // sur 32bit
var decimalGrand: Double = 10_000.666 // sur 64bit

var bolean: Bool = true

var caractere: Character = "a"
var chaine: String = "Chaine de caractère"
var chaine2: String = "Chaine de \n caractère sur plusieurs lignes"
var chaine3: String = " \" Chaine entre guillemet \" "
var chaine4 = """
Bonjour
Chaine
Sur plusieurs lignes
"""

// Concatenation de string
var concat = chaine + " " + chaine2
//print(concat)

var nimp: Any = "Test"

// Tester le type
/*
var testBool = true
var testBoolIsBool = testBool is Bool
var testBoolIsInt = testBool is Int
print(testBoolIsBool)
print(testBoolIsInt)
*/

// Caster le type
var testCast:Int = 23
var testCastAsDouble = Double(testCast)
print(testCastAsDouble)

// Tableau
var tab2 = [Int]() // Déclaration d'un tableau vide d'entier
var tab3: [Int] = [] // Déclaration d'un tableau vide d'entier

var tab4: [String] = ["MacOs","Windows","Linux"]
print(tab4[0])

// Tuple
let personne = (nom: "Dufour", prenom: "Sviatoslav", age: 23)
print(personne.nom)

// Optionnel
var aOptionel: Int? = 12
if let a = aOptionel {
   print(a) // return 12
}

// Operateur ternaire
var ternaire = true
print(ternaire ? "Ok" : "No ok")
