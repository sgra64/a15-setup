<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
# Assignments B

Goal of this assignments is to learn or repeat some techniques for *Java*.

Steps:

1. [B.1 *Conditional* Operator `?`](#b1-conditional-operator-) - 1 Pts

1. [B.2: `List<T>`, `Set<T>`](#b2-listt-sett) - 2 Pts

1. [B.3: `Optional<T>`](#b3-optionalt) - 1 Pts

1. [B.4: *Java* `record`](#b4-java-record) - 1 Pts

1. [B.5: *Refactoring* and *CLASSPATH*](#b5-refactoring-and-classpath) - 3 Pts

<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->

<!-- 
javadoc -Xdoclint:all,-missing -d docs Conditional.java

 -->

<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
---
&nbsp;

## B.1 *Conditional* Operator `?`

Create a new *Java*-file: `Conditional.java`. Understand what method
`String testNumber(int i)` returns from the *Javadoc* and implement the method
using `if(...)` statements.

```java
/**
 * Class to demonstrate the conditional operator {@code '?'}.
 */
public class Conditional {

    /**
     * Return String {@code "gerade"} when parameter {@code i} is an even
     * number (with {@code i > 0}), return {@code "ungerade"} when parameter
     * {@code i} is an odd number (with {@code i > 0}), return {@code "null"}
     * for {@code i==0} and return {@code "negativ"} for {@code i < 0}.
     * @param i number to test
     * @return String {@code "gerade"}, {@code "ungerade"}, {@code "null"},
     *      {@code "negativ"}
     */
    public String testNumber(int i) {
        ...
    }

    public String testNumberUsingConditional(int i) {
        return i < 0? "negativ" :
            i==0? "null" : i % 2 == 0? "gerade" : "ungerade";
    }
}
```

Understand file [`Application.java`](Application.java).

Run `Application.java`. The expected output is:

```
runConditional():
 - number -2 is: "negativ"
 - number -1 is: "negativ"
 - number  0 is: "null"
 - number  1 is: "ungerade"
 - number  2 is: "gerade"
 - number  3 is: "ungerade"
```

Implement method `public String testNumberUsingConditional(int i)` using the
`?` operator with no `if` statements.

Re-run the code.

&nbsp;

When the example is working, commit files with message: `Conditional '?' demo`.


<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
---
&nbsp;

## B.2: `List<T>`, `Set<T>`

Create a new *Java*-file: `ListsAndSets.java`.

```java
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Class to demonstrate {@code 'List<T>'} and {@code 'Set<T>'} examples.
 */
public class ListsAndSets {
    private List<Integer> numbersList = new ArrayList<Integer>();
    private Set<Integer> numbersSet = new HashSet<Integer>();

    /**
     * Constructor.
     */
    ListsAndSets() {
        numbersList.addAll(List.of(1, 2, 2, 2, 3));
        numbersSet.addAll(numbersList);
    }

    /**
     * Getter method for numbersList.
     * @return numbersList
     */
    List<Integer> numbersList() { return numbersList; }

    /**
     * Getter method for numbersSet.
     * @return numbersSet
     */
    Set<Integer> numbersSet() { return numbersSet; }

    /**
     * Remove duplicate numbers from {@link numbersList}.
     */
    void removeDuplicates() {
        // implement
    }

    /**
     * Print permutation of the list, e.g. for input list {@code [1, 2, 3]}:
     * <pre>
     * [1, 2, 3]
     * [1, 3, 2]
     * [2, 1, 3]
     * [2, 3, 1]
     * [3, 2, 1]
     * [3, 1, 2]
     * </pre>
     * @param list
     */
    void printPermutation(List<Integer> collection) {
        // implement (you may use AI to suggest an implementation)
    }

    /**
     * Print collection with type and elements
     * ({@code 'List<T>'} or {@code 'Set<T>'}).
     * @param collection collection to print.
     */
    void print(Collection<Integer> collection) {
        System.out.println(String.format(" - numbers%s: %s",
            collection.getClass().getSimpleName(), collection));
    }
}
```

a) Extend class [`Application.java`](Application.java) to run the examples
in method:

```java
void runListsAndSets() {
    System.out.println("runListsAndSets():");
    listsAndSets.print(listsAndSets.numbersList());
    listsAndSets.print(listsAndSets.numbersSet());
    // 
    // System.out.println(" - removeDuplicates()");     // <-- uncomment for b)
    // listsAndSets.removeDuplicates();
    // listsAndSets.print(listsAndSets.numbersList());
    // // 
    // System.out.println(" - printPermutation([1, 2, 3])");    // <-- uncomment for c)
    // listsAndSets.printPermutation(listsAndSets.numbersList());
    // // 
    // listsAndSets.numbersList().add(4);               // <-- uncomment for d)
    // System.out.println(" - printPermutation([1, 2, 3, 4])");
    // listsAndSets.printPermutation(listsAndSets.numbersList());
}
```

Expected output is:

```
runListsAndSets():
 - numbersArrayList: [1, 2, 2, 2, 3]
 - numbersHashSet: [1, 2, 3]
```

&nbsp;

b) Implement method `removeDuplicates();` that removes duplicates numbers
from *numbersList*.

Uncomment lines from the driver `runListsAndSets()` to print:

```
 - removeDuplicates()
 - numbersArrayList: [1, 2, 3]
```

&nbsp;

c) Implement method `printPermutation();` and uncomment lines from the driver.
You may ask an AI to propose an algorithm that prints the permutation of
numbers of the input list:

<!-- 
Ask Gemini: give me java code that prints the permutation of a collection of
numbers using void printPermutation(Collection<Integer> collection).
 -->

```
printPermutation([1, 2, 3]):
[1, 2, 3]
[1, 3, 2]
[2, 1, 3]
[2, 3, 1]
[3, 2, 1]
[3, 1, 2]
```

d) Remove the comments to add number `4` to the list and re-run the code
for list: `[1, 2, 3, 4]`:

```
[1, 2, 3, 4]    [2, 1, 3, 4]    [3, 2, 1, 4]    [4, 2, 3, 1]
[1, 2, 4, 3]    [2, 1, 4, 3]    [3, 2, 4, 1]    [4, 2, 1, 3]
[1, 3, 2, 4]    [2, 3, 1, 4]    [3, 1, 2, 4]    [4, 3, 2, 1]
[1, 3, 4, 2]    [2, 3, 4, 1]    [3, 1, 4, 2]    [4, 3, 1, 2]
[1, 4, 3, 2]    [2, 4, 3, 1]    [3, 4, 1, 2]    [4, 1, 3, 2]
[1, 4, 2, 3]    [2, 4, 1, 3]    [3, 4, 2, 1]    [4, 1, 2, 3]
```

&nbsp;

When the example is working, commit files with message: `Lists and Sets demo`.


<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
---
&nbsp;

## B.3 `Optional<T>`

Recreate the example from section `4.3 Optional<T>` from the slide-deck
[*Programmierkonzepte und Technologien*](https://lms.bht-berlin.de/pluginfile.php/2775597/mod_resource/content/9/SE1-02%20-%20Java%20Programmierkonzepte%20und%20Technologien.pdf).

Create a class `OptionalExample.java`:

```java
import java.util.Map;
import java.util.Optional;

/**
 * Class to demonstrate an {@code 'Optional<T>'} example.
 */
class OptionalExample {

    class Articles {
        final Map<String, Integer> prices;
            Articles(Map<String, Integer> prices) {
            this.prices = prices;
        }
        Integer getPrice(String article) {
            return prices.get(article);
        }
        Optional<Integer> getPriceOptional(String article) {
            return Optional.ofNullable(prices.get(article));
        }
    }

    private final Articles articles = new Articles(Map.of("Tasse", 999, "Kanne", 1999, "Becher", 749));

    private final String article = "Tasse";


    void runDemo() {
        runDemoWithNullPointerException();
        // runDemoNoNullPointerException();
        // runDemoOptional();
        // runDemoOptionalFunctional();
    }

    /**
     * Run the demo with NullPointerException from 4.3.2
     */
    private void runDemoWithNullPointerException() {
        System.out.println("runDemoWithNullPointerException():");
        // 
        int price = articles.getPrice(article);
        System.out.println(String.format(" - Der Preis für %s ist: %d", article, price));
    }

    /**
     * Run the demo with NullPointerException from 4.3.2
     */
    private void runDemoNoNullPointerException() {
        System.out.println("runDemoNoNullPointerException():");
        // ...
    }

    /**
     * Run the demo with NullPointerException from 4.3.3
     */
    private void runDemoOptional() {
        System.out.println("runDemoOptional():");
        // ...
    }

    /**
     * Run the demo with NullPointerException from 4.3.4
     */
    private void runDemoOptionalFunctional() {
        System.out.println("runDemoOptionalFunctional():");
        // ...
    }
}
```

&nbsp;

When the example is working, commit files with message: `Optionals demo`.


<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->

---
&nbsp;

## B.4: *Java* `record`

Change `class Article` to become a
[*java* `record`](https://medium.com/@ksaquib/understanding-java-records-a-comprehensive-guide-448442d8cda9)
and implement the example from section `4.11 Record`.

```java

```

When the example is working, commit files with message: `Java 'record' demo`.


<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
---
&nbsp;

## B.5: *Refactoring* and *CLASSPATH*

At this point, all *.java* files are in the project directory:

```
- Application.java      <-- main class with driver code
- Conditional.java
- ListsAndSets.java
- OptionalExample.java
- RecordExample.java
```

Compile *.java* files and run the code in the terminal:

```sh
# list all .java files
find . -name '*.java'

# compile all .java files
javac $(find . -name '*.java')

# show all .class files
ls -la *.class
```

Output shows the compiled **.class* files, also in the project directory:

```
-rw-r--r-- 1 svgr2 1771 Oct 28  Application$Runner.class
-rw-r--r-- 1 svgr2  771 Oct 28  Application.class
-rw-r--r-- 1 svgr2  562 Oct 28  Conditional.class
-rw-r--r-- 1 svgr2  427 Oct 28  HelloWorld.class
-rw-r--r-- 1 svgr2 3057 Oct 28  ListsAndSets.class
-rw-r--r-- 1 svgr2 1110 Oct 28  OptionalExample$Articles.class
-rw-r--r-- 1 svgr2 3001 Oct 28  OptionalExample.class
-rw-r--r-- 1 svgr2 1508 Oct 28  RecordExample$Article.class
-rw-r--r-- 1 svgr2 2629 Oct 28  RecordExample.class
```

Run code:

```sh
# run the code
java Application
```

Running the program shows the the output of the examples,
enable outputs if any is missing:

```
Application

Conditional.runConditional():
 - number -2 is: "negativ"
 - number -1 is: "negativ"
 - number  0 is: "null"
 - number  1 is: "ungerade"
 - number  2 is: "gerade"
 - number  3 is: "ungerade"

ListsAndSets.runListsAndSets():
 - numbersArrayList: [1, 2, 2, 2, 3]
 - numbersHashSet: [1, 2, 3]
 - removeDuplicates()
 - numbersArrayList: [1, 2, 3]
 - printPermutation([1, 2, 3])
[1, 2, 3]
[1, 3, 2]
[2, 1, 3]
[2, 3, 1]
[3, 2, 1]
[3, 1, 2]

OptionalExample.runDemo():
runDemoNoNullPointerException():
 - Der Preis fuer Tasse ist: 999
runDemoOptional():
 - Der Preis fuer Tasse ist: 999
runDemoOptionalFunctional():
 - Der Preis fuer Tasse ist: 999

RecordExample.runDemo():
 - Artikel: Messer,     Preis:  555
 - Artikel: Becher,     Preis:  749
 - Artikel: Tasse,      Preis:  999
 - Artikel: Kanne,      Preis: 1999
```


<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->

&nbsp;

### The new Project Structure (*scaffold*)

*Java* - projects follow conventions and structure. Introduce structure (*"scaffold"*)
into the project with three properties:

1. `class Application` will become part of a package: `de.bht_berlin.application`.

1. Other classes will become part of a package: `de.bht_berlin.examples`.

1. All source code will reside under path: `src/main/java` in the project.

1. All compiled code will reside under path: `target/classes`.

The project-scaffold is:

```sh
 |
 +--<src/main/java>                     # project source code
 |   +--<de/bht_berlin>                 # - package sub-structure
 |        |
 |        +--<application>
 |        |    +--Application.java
 |        |
 |        +--<examples>
 |             +--Conditional.java
 |             +--HelloWorld.java
 |             +--ListsAndSets.java
 |             +--OptionalExample.java
 |             +--RecordExample.java
 |
 +--<target/classes>                    # compiled classes (created by the compiler)
 |   +--<de/bht_berlin>                 # - package sub-structure
 |        |
 |        +--<application>
 |        |    +--Application.class
 |        |    +--Application$Runner.class
 |        |
 |        +--<examples>
 |             +--Conditional.class
 |             +--HelloWorld.class
 |             +--ListsAndSets.class
 |             +--OptionalExample$Articles.class'
 |             +--OptionalExample.class
 |             +--RecordExample$Article.class'
 |             +--RecordExample.class
```

*Martin Fowler* understands [*Refactoring*](https://refactoring.com/) as a
*"disciplined technique for restructuring an existing body of code, altering its internal structure without changing its external behavior"*,
see also the book [*Refactoring Improving the Design of Existing Code*](https://martinfowler.com/books/refactoring.html).

In the case here,

1. we introduce structure for the source code and

1. create space where the compiler can place compiled output.

Goal is the introduce structure into our project.

Create the `src`-structure and move source files into this structure.
Validate the result at the end:

```sh
# list the structure under 'src'
find src
```
```
src
src/main
src/main/java
src/main/java/de
src/main/java/de/bht_berlin
src/main/java/de/bht_berlin/application
src/main/java/de/bht_berlin/application/Application.java
|            |                         |
|---<path>---|-----<package-path>------|

src/main/java/de/bht_berlin/examples
src/main/java/de/bht_berlin/examples/Conditional.java
src/main/java/de/bht_berlin/examples/ListsAndSets.java
src/main/java/de/bht_berlin/examples/OptionalExample.java
src/main/java/de/bht_berlin/examples/RecordExample.java
|            |                      |
|---<path>---|---<package-path>-----|
```


<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->

&nbsp;

### Compile & Run the Code in the *VSCode IDE*

In order for *VSCode* to understand the new structure, add to your local
project settings in *.vscode/settings.json* lines:

```json
{
    // ...
    "java.project.sourcePaths": [ "src/main/java" ],
    "java.project.outputPath": "target/classes",
}
```

Code still does not compile at this time. More changes are needed:

1. Add the `package` information at the begin of each class.

1. `import` statements need to be added for class references crossing
    packages.

1. Classes and methods may need to be declared *public*. *VSCode* will
    mark these places.

Make these changes such that the code compiles in *VSCode*.

When the *VSCode* does no longer show errors (in red), the code should run
with the regular *VSCode* launcher. Run the code in in *VSCode*.


<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->

&nbsp;

### Compile & Run the Code in the *Terminal*

The compiler must be told where to find the source code (under: *src/main/java*)
and where to place the compiled classes (under: *target/classes*).

Refer to the
[`javac`](https://download.java.net/java/early_access/loom/docs/specs/man/javac.html)
command for passing proper options to the compiler:

- `-cp` or `--classpath=` for the classpath and

- `-d` for selecting the target-directory.

- furthermore, all *.java* will be collected in order to compile all output
    at once rather than compiling each file separately (slower).

```sh
# compile sources from 'src/main/java' to 'target/classes'
javac -cp src/main/java -d target/classes $(find src -name '*.java')

# verify sources and compiled classes
find src target
```
```
src
src/main
src/main/java
src/main/java/de
src/main/java/de/bht_berlin
src/main/java/de/bht_berlin/application
src/main/java/de/bht_berlin/application/Application.java
src/main/java/de/bht_berlin/examples
src/main/java/de/bht_berlin/examples/Conditional.java
src/main/java/de/bht_berlin/examples/ListsAndSets.java
src/main/java/de/bht_berlin/examples/OptionalExample.java
src/main/java/de/bht_berlin/examples/RecordExample.java
             ^----------------------^
target
target/classes
target/classes/de
target/classes/de/bht_berlin
target/classes/de/bht_berlin/application
target/classes/de/bht_berlin/application/Application$Runner.class
target/classes/de/bht_berlin/application/Application.class
target/classes/de/bht_berlin/examples
target/classes/de/bht_berlin/examples/Conditional.class
target/classes/de/bht_berlin/examples/ListsAndSets.class
target/classes/de/bht_berlin/examples/OptionalExample$Articles.class
target/classes/de/bht_berlin/examples/OptionalExample.class
target/classes/de/bht_berlin/examples/RecordExample$Article.class
target/classes/de/bht_berlin/examples/RecordExample.class
              ^----------------------^  <-- same structure as under 'src/main/java'
```

&nbsp;

Run the code in the terminal:

```sh
# run the code
java --class-path=target/classes de.bht_berlin.application.Application

# run using the shortcut '-cp' for the classpath
java -cp target/classes de.bht_berlin.application.Application

# set the CLASSPATH environment variable and run
export CLASSPATH="target/classes"

java de.bht_berlin.application.Application
```

Output appears:

```
Application

Conditional.runConditional():
 - number -2 is: "negativ"
 - number -1 is: "negativ"
 - number  0 is: "null"
 - number  1 is: "ungerade"
 - number  2 is: "gerade"
 - number  3 is: "ungerade"

ListsAndSets.runListsAndSets():
 - numbersArrayList: [1, 2, 2, 2, 3]
 - numbersHashSet: [1, 2, 3]
 - removeDuplicates()
 - numbersArrayList: [1, 2, 3]
 - printPermutation([1, 2, 3])
[1, 2, 3]
[1, 3, 2]
[2, 1, 3]
[2, 3, 1]
[3, 2, 1]
[3, 1, 2]

OptionalExample.runDemo():
runDemoNoNullPointerException():
 - Der Preis fuer Tasse ist: 999
runDemoOptional():
 - Der Preis fuer Tasse ist: 999
runDemoOptionalFunctional():
 - Der Preis fuer Tasse ist: 999

RecordExample.runDemo():
 - Artikel: Messer,     Preis:  555
 - Artikel: Becher,     Preis:  749
 - Artikel: Tasse,      Preis:  999
 - Artikel: Kanne,      Preis: 1999
```

&nbsp;

When everything is working, commit with message: `refactoring: src/main/java, target/classes`.

Show the commit log.


<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->


<!-- 
&nbsp;
<img src="../markup/img/vscode-1.png" width="800"/>
-->
