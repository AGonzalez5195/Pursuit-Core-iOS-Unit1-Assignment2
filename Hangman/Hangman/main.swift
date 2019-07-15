//
//  main.swift
//  Hangman_Project
//
//  Created by Anthony Gonzalez on 7/13/19.
//  Copyright © 2019 Anthony Gonzalez. All rights reserved.
//
import Foundation

var gameStatus = true

var alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p","q", "r", "s", "t", "u", "v", "w", "x", "y", "z"] //Constructed for the purpose of making the guard statement that checks the input against this array. If the input contains anything not in here, it will be guarded against.

let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]

while gameStatus { //The game loop. Keeps going until it is false.
    print("Welcome to Hangman. How's it hanging? 🤡")
let wordToGuess = allTheWords.randomElement() // This contains the random string.

var lettersWordToGuess: [String] = [] // The string is broken up into an array containing each character as its own string. This is to make it possible to compare against the user input.
for characters in wordToGuess! {
    lettersWordToGuess.append(String(characters))
    }

let setWord = Set(lettersWordToGuess) // Set was created so that each letter only occurs once. This prevents conditions occuring more than once in words that have more than one of the same letter.
var lettersLeft = lettersWordToGuess.count //Win condition. Letters left to guess approaches 0 for every correct guess and starts at the count of the word length.
    
//print(lettersWordToGuess) //Only un-comment out for debugging purposes. Used to show actual word.
var underscoreArray: [String] = [] //This contains the array containing underscores that will then be replaced by characters upon successful guesses. Printed for user feedback (seeing correct letters + length of word).
for _ in wordToGuess! {
    underscoreArray.append("_")
}
print(underscoreArray)
var guessedChars: Set<String> = [] //This is a set that holds all of the already guessed characters.
var incorrectGuesses = 0 //A loss condition. Starts the counter at 0 and goes up with each wrong guess.
var totalGuesses = 0 //Counter that is tracked regardless of right or wrong. Returned to user at the end.


while incorrectGuesses < 6 && lettersLeft > 0 { //The game will loop until these conditions are met.
    print("Enter Letter (A-Z):", terminator: " ") //Interfacing stuff to make it clear to user what to input.
    let guess = readLine() //User input
    //The following guard statements are made to guard against users abusing/misusing the string input type. Setting it to character instead will just cause a crash which is undesirable.
    guard guess!.count == 1 else { //Guards against an input that is less than 1 or greater than 1.
        print("Input must be one letter.")
        continue
    }

    guard alphabet.contains(guess!) else { //Guards against inputs not from the alphabet variable made above.
        print("Input can only be a letter from A-Z. ")
        continue
    }
    if let guess = guess { //If the guess actually contains something, execute the stuff. Don't have to mess with optionals because of this line.
    if guessedChars.contains((guess)) {
        print("Guessed Letters: \(Array(guessedChars.sorted()))")
        print("'\(guess)' was already guessed.") //Does not increase counter if this happens.
        continue
    }
    
    if setWord.contains(String(guess)) { // Since it's a set, each character can only appear once, max.
        totalGuesses += 1
        print("")
        print("Nice job. '\(guess)' is in the word.")
    }
    guessedChars.insert((guess)) //This runs because there is nothing at the end of the previous brace that would prevent it from doing so.
    for (index, element) in lettersWordToGuess.enumerated() { //goes through the array of the chosen word, letter by letter
        if element == (guess) { //if the letter in the chosen word matches the users input, change the underscore of the empty array at the same index as the character is in the word.
            underscoreArray[index] = String(guess)
            print(underscoreArray)
            print("")
            print("Guessed Letters: \(Array(guessedChars.sorted()))")
            lettersLeft -= 1 // This is placed here instead of in the set.contains because the set having only one of each element would cause the program to hang.
            for elements in underscoreArray {
                var placeHolder: [String] = []
                placeHolder.append(elements)
                if placeHolder == (lettersWordToGuess) { //Checks to see if the current user-generated (via guesses) array matches the array of the actual word. If it does, break out of the loop and continue on.
                continue
            }
        }
    }
    if !lettersWordToGuess.contains((guess)) { //Execute if input does not match word letter.
        print("")
        print("'\(guess)' is not a letter in the word. Save him before it's too late. (\(5 - incorrectGuesses) attempts remaining)")
        print("")
        totalGuesses += 1
        incorrectGuesses += 1
        switch incorrectGuesses { //Visual feedback.
            case 1: print("""
+---+
|   |
O   |
    |
    |
    |
=========
""")
        case 2: print("""
+---+
|   |
O   |
|   |
    |
    |
=========
""")
        case 3: print("""
 +---+
 |   |
 O   |
/|   |
     |
     |
=========
""")
        case 4: print("""
 +---+
 |   |
 O   |
/|\\  |
     |
     |
=========
""")
        case 5: print("""
 +---+
 |   |
 O   |
/|\\  |
/    |
     |
=========
""")
        case 6: print("""
 +---+
 |   |
 O   |
/|\\  |
/ \\  |
     |
=========
He's dead, Jim. 😵 The word was '\(wordToGuess!)'.
""")
        default: print() // Will never print.
        }
        print(underscoreArray)
        print("Guessed Letters: \(Array(guessedChars.sorted()))")
        print("")
        break
    }
}
    if lettersLeft == 0 {
        print("You win. It took you \(totalGuesses) guesses. ")
    }
    if incorrectGuesses >= 6 || lettersLeft == 0 { //Determines the end of the game.
    print("Play again? [Enter 'Y' to retry or any other input to end.]")
    let answer = readLine()?.uppercased() //Accounts for user typing "y"
    if answer == "Y" {
        continue //restarts the loop if selected.
    } else {
        print("Thanks for playing. 🐸")
        gameStatus = false //ends the while loop if selected
    }
}
    }
}
}

//Only known issue is that if the letter appears in the word twice. The underscoreArray will print twice, each successive one showing where the characters were added. This does not affect the playability of the game at all. Just a personal annoyance.
