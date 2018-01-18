history and features
===

  - Elm is a strongly typed pure functional language that compiles to javascript and it competes with projects like React as a tool for creating websites and web apps. It is a programming language and a web application framework all in one.

    - Elm has 4 major design decisions
        - Typed Functional Language
          - When you think of a functional language, you will quickly begin to think about the ideas and unique terms that describe a functional language such as "Immutable", "Monads", "Higher order functions", "Currying", "Recursion", "Folding", "Pattern matching", and "List, set, and tuples". Elm has all of these but it doesn't force them down your throat. Don't let all these terms scare you as it will make you a better developer.
          - Elm is a pure functional language. Meaning that we don't have side effects. A function without side effects means that they recieve an input and they generate an output and in the middle they don't update anything outside of themselves.
        - User-focused design
          - Elm was designed for the front end developer. It was designed to work with people who already know javascript and to lead them by the hand into this world.
          - No runtime errors in practice. No null. no undefined is not a function. You can have plenty of logical errors
          - Friendly error messages that help you add features more quickly. One of the advantages that a typed functional language has that the program has a good idea about what you're trying to accomplish or what the next steps are. This is the result of static analysis on your code. If it discovers something wrong, or finds something that could potentially go wrong, its not only going to tell you, but a lot of times, it will give you hints on what you need to change in order to make it work properly.
        - Useability
          - Obvious Names (Looking through the documentation, you won't see terms like Monad, even though it is used heavily)
          - Excellent Tooling
          - Thorough Documentation
          - Friendly error messages
        - Maintainability (elm understands that initial development is going to be smooth sailing, but what happens when the code base matures and new developers are brought onto the project. How easy is it going to be to on board devs)
          - Static type checking
          - Automatic Semantic Versioning: Since it has this static type checking.
             It can compare one version of a library to another to provide whats called Automatic Semantic Versioning. The elm
             package manager will automatically determine the version of a library based on built-in rules for what is a major version or a minor version. You won't be worried whether you will accidently introduce a breaking change because a new version will be assigned to it.

- Other features of Elm
    - Interop with Javascript
      - When elm is introduced to a company, it will most likely have a significant amount of javascript, Elm is designed to interop with javascript. So if there is a library that you have used a lot, elm has features to allow you to use the library and still maintain the reliability of your elm application
    - Virtual Dom
      - Elm uses a virtual dom. Due to the natue of how elm applications work, it lends itself to this concept. You won't be updating the Dom, but instead the state of this virtual dom. Elm will then determine the most efficient path to update the page for you.

    - Elm is all about
    - Well-architected code that stays well-architected as your app grows.
    - Automatically enforced semantic versioning for all Elm packages

Where it came from?
===
  - Designed by Evan Cazplicki in 2012 while working on his masters from Harvard. He used to work at google and prezi but now he works at noredink using Elm

Transcript:

### Js Problems:
  - Our journey today begins with JavaScript. Javascript has had grownquite a bit not only to its core language but we've seen numerous web frameworks emerge each one trying to make the web a better place for developer happiness. Angular took the scene in 2010 where the web began to change to more of a MVC mentality when designing web applications. Two way data binding and dirty tracking was clearly not the way. Controllers then turned to Components and in 2013 we saw another javascript renassance with React. 2014 brought Vue, preact, inferno, and the billion different React copy-cats. These libraries brought to the table the concept of a virtual dom.
  - With each library that was released, problems were solved and the web got a lot more efficient with the virtual dom. We continue to improve on JavaScript development though there is still one problem that we haven't addressed. And that problem is JavaScript. Don't get me wrong, JavaScript is a necessary and I do enjoy working in it but the language riddled with problems and poor design decisions. Douglas Crockford says that if you stick to the “Good Parts” of JavaScript, you can write wonderful software. If we compare the good parts of JavaScript versus the bad parts, there is a great divide between good practices vs the ugly.

  - Here is a esoteric demo in JS.
  - Lets print out the letter e only using +!()[]
      - [] // lets start out with a simple array. Arrays return themselves.
      - ![] // negating an array returns false
      - !![] // negating it again returns true
      - 1 + [] // converts it to a string
      - !![] + [] // yields 'true'
      - Now if we index into this string using (!![] + [])[3], we can get our result.
      - Since we cannot use 3 lets see how we can get 3.
      - well false converts to 0 when evaluated as a boolean, 1 if its true.
      - +!+[]+!+[]+!+[] or ![] + ![] + ![]
      - (!![]+[])[!![]+!![]+!![]] is our answer.

  - It isn't hard to see that one can delve into the ugly side of javascript without intending to. JavaScript has a lot of short comings and today we're going to look at a language that compiles to JS that can give us guarantees that JavaScript by itself cannot. We'll be climbing this mountain called Elm today. I've chosen to divide this up into two different sections: the core language, elm architecture. My intent is to give a basic introduction to elm.

### About Elm
  - It is a pure functional language. A pure language is typed. It is based on the ML languages (Haskell, OCamel, ML and others). It's compiler is actually written in Haskell. Elm does a great job using friendly language and doesn't force you to understand all the functional programming lingo. Don't get me wrong, eventually the terminology will make sense.
  - Elm boasts its ability to not produce runtime errors. No runtime errors in practice. No null. no undefined is not a function. You can have plenty of logical errors. This is thanks to its super friendly compiler being able to analyize your code
  - It has solid performance when compared to react, angular, vue, and others.
  - Enforced Semantic Versioning. The Elm compiler can determine the versioning without you having to worry about if you made a breaking change. It will automatically detect when a version bump is needed just by reading and comparing your code. Since it has this static type checking. It can compare one version of a library to another to provide whats called Automatic Semantic Versioning. The elm package manager will automatically determine the version of a library based on built-in rules for what is a major version or a minor version. You won't be worried whether you will accidently introduce a breaking change because a new version will be assigned to it.

# Core Language
### Functions
 - Elm is based on 40+ years of functional programming research and achievements. Functions are the building blocks of all elm applications. A function takes an input and then returns an output. There is no interaction outside of the function. Functions are inherently modular, reusable and composable because they only depend on their arguments.

 - A function has a label and arguments that are separated by whitespace. This design decision promotes a smaller, purposeful functions that are easier to reuse and compose. These functions don't rely on global state.

 - If a functions has multiple statements, the last statement is returned. AskVegeta takes in a level (btw the elm compiler already knows that it is an Integer) and returns one or the other.

### Referential Transparency
 - Because a function is only concerned with the arguments. Given a function and an input value, you will always recieve the same output. In the functional world, this is called Referential Transparency. Any call to mult could theoretically be replaced with the corresponding return value. Same thing with add.

 - Now that we know a little more about how functions work in Elm, It is worth taking a look at how functions are applied.

### Currying / Partial Application

Functions are curried by default. Meaning that they take on argument and then return a function taking the next argument. This allows functions to be built up instead of requiring all the arguments upfront.

### Piping

There are times when multiple function calls can get extremely long. In order to maintain readability, Elm has a nice syntax for piping values from one function into another.

### Typing

So far we haven't had to define types as we just let elm determine them for us. By specifying types, the elm compiler can help us error check our assertions. It helps us create contracts with our functions so that our functions will be expecting certain types so there isn't a need to have runtime validation if the value is null or is a type that isn't valid for the function.

Defining a type is much like defining functions. We begin with the identifier followed by a colon. Each function is curried and takes one argument. Functions that don't take arguments are called constants.

"Life" returns 42; You only need to specify the return type; Numbers is a list of ints. Functions take the -> syntax. You can think of the arrow function like a lambda function. It takes one argument then returns a function that takes another argument. The last type given is the return type. The beauty of adding types is to give the compiler addition context of your application therefore it can give you more helpful compiler messages.

### Lists, tuples, and records

Elm brings to the table a couple of core data structures that will be instrumental in building applications.
  - Lists
      - can hold many values but the values must be of the same type.
      - a handful of higher order functions are built in such as Map, Filter,

  - Tuples on the other hand can hold any type. You can put as many values as you want into a tuple. The unfortunate problem with tuples is that extracting and updating a single element isn’t simple. Records to the rescue.
  - Records
    - Record is a key-value pair, similar to objects in javascript or python.
You cannot ask for a field that does not exist. No field will ever be undefined or null.

### Immutability

 - Every data structure in elm is immutable. When a value is updated, a new data structure is created. The ”merge” operator works much like the spread operator does in javascript. It takes the record along with every key that it has on the left of the merge operator, and updates the fields on the right.
 - Be aware that the field you’ve chosen to update must already exist in the record. New fields aren’t allowed here because it will break the record’s type. A new record needs to be created.
 - You may think that creating everytime is wasteful and inefficient. Many languages, including elm, implement what is called persistent data structures. Once a data structure is created

### Type Aliases

 - With type aliases, by defining a type, elm gives us a constructor function that takes in arguments in order.
As we take a look at the field color, we would like to avoid having to write as much runtime validation as possible. Because we delegated it as a String, We will have to validate it via runtime checks. We can do better by leveraging elm’s built in type checking
 - Elm has what are called Union Types

### Union Types

 - With type aliases, by defining a type, elm gives us a constructor function that takes in arguments in order.
As we take a look at the field color, we would like to avoid having to write as much runtime validation as possible. Because we delegated it as a String, We will have to validate it via runtime checks. We can do better by leveraging elm’s built in type checking. By creating a type called Color, we can have Elm
 - Elm has what are called Union Types. It allows you to represent complex data much more naturally.  The way this is read is a color can be Black Or Blue Or White Or Blend. Union types give us constructor functions as well. Blend takes two arguments for its constructor.
 - You need the parenthesis otherwise Elm will interpret this as passing two arguments to Cat instead of to Blend.
Union types are helpful for many circumstances. It is common to use them to describe the types of messages that a update our models. Other uses are to define different states data could be in such as in a Todo list where data could be completed, active, or a list of tasks. It simply is a state machine that gives your application a limited subset of available possibilities completely backed by the elm compiler for compile time validation.

### Maybe Type

 - Now, Elm doesn’t have the notion of a null value yet null values can happen everywhere. A common example is pulling data back about a user from a database. The user could not exist. How do we handle these situations? Elm defines a special union type called Maybe. Here is the source code in elm.
 - The way we read this is We Just have a Cat or a User or nothing, where cat or a user could be anything. The letter ‘A’ in Elm here means “Anything.” It could be a record, list of strings, anything. This is the same idea as a Generic type.
 - If you want to have a Maybe value, you have to use the Nothing or Just constructors to create it. This means that to deal with the data, you have to use a case expression. This means the compiler can ensure that you have definitely covered both possibilities.
