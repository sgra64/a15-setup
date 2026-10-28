/**
 * Main driver class with the {@code static void main(String[] args)}
 * configured as run-target that invokes code in other classes:
 * <pre>
 *  - Conditional.java
 *  - ListsAndSets.java
 *  - OptionalExample.java
 *  - RecordExample.java
 * </pre>
 */
public class Application {

    /**
     * Invoke the Java compiler for all *.java files
     * - javac $(find . -name '*.java')
     * 
     * Run the program 
     * - java Application
     * 
     * Invoke the the Javadoc compiler:
     * - javadoc -Xdoclint:all,-missing -d docs Conditional.java
     */

    /**
     * Inner class with driver code invoking code examples.
     */
    private static class Runner {
        private Runner() { }
        private final Conditional conditional = new Conditional();
        // private final ListsAndSets listsAndSets = new ListsAndSets();
        // private final OptionalExample optionalExample = new OptionalExample();
        // private final RecordExample recordExample = new RecordExample();

        /**
         * Driver method to run example B.1 Conditional Operator '?'
         */
        void runConditional() {
            System.out.println("\nConditional.runConditional():");
            for(int i=-2; i < 4; i++) {
                // String res = conditional.testNumber(i);
                String res = conditional.testNumberUsingConditional(i);
                res = String.format(" - number %2d is: \"%s\"", i, res);
                System.out.println(res);
            }
        }

        // /**
        //  * Driver method to run example B.2: List<T>, Set<T>
        //  */
        // void runListsAndSets() {
        //     System.out.println("\nListsAndSets.runListsAndSets():");
        //     listsAndSets.print(listsAndSets.numbersList());
        //     listsAndSets.print(listsAndSets.numbersSet());
        //     // // 
        //     // System.out.println(" - removeDuplicates()");     // <-- uncomment for b)
        //     // listsAndSets.removeDuplicates();
        //     // listsAndSets.print(listsAndSets.numbersList());
        //     // // 
        //     // System.out.println(" - printPermutation([1, 2, 3])");    // <-- uncomment for c)
        //     // listsAndSets.printPermutation(listsAndSets.numbersList());
        //     // // 
        //     // listsAndSets.numbersList().add(4);               // <-- uncomment for d)
        //     // System.out.println(" - printPermutation([1, 2, 3, 4])");
        //     // listsAndSets.printPermutation(listsAndSets.numbersList());
        // }

        // /**
        //  * Driver method to run example B.3: Optional<T>
        //  */
        // void runOptionalExample() {
        //     System.out.println("\nOptionalExample.runDemo():");
        //     optionalExample.runDemo();
        // }

        // /**
        //  * Driver method to run example B.4: Java record
        //  */
        // void runRecordExample() {
        //     System.out.println("\nRecordExample.runDemo():");
        //     recordExample.runDemo();
        // }
    }

    private static Runner runner = new Runner();

    public static void main(String[] args) {
        System.out.println("Application");
        // 
        runner.runConditional();
        // runner.runListsAndSets();
        // runner.runOptionalExample();
        // runner.runRecordExample();
    }
}
