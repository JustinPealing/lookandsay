open System
open Microsoft.VisualStudio.TestTools.UnitTesting

let sayandsee str =
    let rec sayandseerec str count =
        match str with
        | [] -> ""
        | [x] -> (string (count + 1)) + (string x)
        | x::y::xs when x = y -> sayandseerec (y::xs) (count + 1)
        | x::y::xs -> sprintf "%s%s%s" (string (count + 1)) (string x) (sayandseerec (y::xs) 0)
    sayandseerec [for c in str -> c] 0

[<TestClass>]
type TestClass() = 
    [<TestMethod>]
    member this.sayandsee() = 
        Assert.AreEqual("11", sayandsee "1")
        Assert.AreEqual("21", sayandsee "11")
        Assert.AreEqual("1221", sayandsee "211")
        Assert.AreEqual("111221", sayandsee "1211")
        Assert.AreEqual("131221", sayandsee "3211")

[<EntryPoint>]
let main argv =
    let rec loop last count = 
        let next = sayandsee last
        printfn "%s" next
        if count > 0 then
            loop next (count - 1)
    loop "1" 10
    0
