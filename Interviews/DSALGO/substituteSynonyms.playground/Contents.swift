/*
 const sentence = "follow the yellow brick road";
 const synonyms = {
   follow: ["chase", "pursue"],
   yellow: ["gold", "amber", "lemon"],
 };



           "follow the yellow brick road"
 
           "chase the yellow brick road"

 */

struct Objec {
    let loc: Int
    let content: [String]
}
var count = 0
var allElements = [[String]]()
func substitutingSynonyms(_ sentence: String, _ subs: [String: [String]]) -> [String] {
    
    var elements = sentence.split(separator: " ").map { String($0) }
    
    var objcs: [Objec] = Array(subs.keys).map { key in
        return Objec(loc: elements.firstIndex(of: key)!,
                     content: subs[key]!)
    }.sorted(by: {$0.loc < $1.loc })

    performWork(objcs, &elements, 0)
    return allElements.map { $0.joined(separator: " ") }
}

func performWork(_ objcs: [Objec], _ elements: inout [String], _ startingIndex: Int) {
    
    if startingIndex >= objcs.count {
        allElements.append(elements)
        return
    }

    for index in startingIndex..<objcs.count {
        let objc = objcs[index]
        count += 1
        print(count)
        for inner in 0..<objc.content.count {
            elements[objc.loc] = objc.content[inner]
            allElements.append(elements)
            performWork(objcs, &elements, startingIndex + 1)
        }
    }
    
    return
}

print(substitutingSynonyms("follow the yellow brick road", ["follow": ["chase", "pursue"],
                                                            "yellow": ["gold", "amber", "lemon"]]))
