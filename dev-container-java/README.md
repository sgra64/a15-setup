<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
### Project Setup in *dev-container*

Create a new project directory *"hello-world"* in your workspace.

1. Create a new *git*-repository in the project with an *empty root commit*.

1. Commit file `.gitignore` (new file) with content:
    ```
    .gitmodules
    .devcontainer
    target
    *.class
    ```
    The commit-log shows two commits on branch *main*.

1. Install the [*.devcontainer*](https://github.com/sgra64/dev-container-java.git)
    definition into the project directory as a *git-module*.

    - Use a dedicated branch *git-module* to check-out the
        [*.devcontainer*](https://github.com/sgra64/dev-container-java.git)
        module.

    - Find steps in section
        [*Import git-Submodules*](https://github.com/sgra64/se1-play).
        Don't install modules: *.env*, *.vscode* or *.libs* -- install module
        [*.devcontainer*](https://github.com/sgra64/dev-container-java.git)
        instead.

    - Show that *.devcontainer* and *.gitmodules* exist. Show that you have
        two branches *main* and *git-modules* with command: `git branch -avv`.


<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->

&nbsp;

### Launch the project in a *.devcontainer*

Perform steps:

1. Start *Docker for Desktop*.

1. Start *VSCode* in the *"hello-world"* project. *VSCode* will recognize the
    presence of a *.devcontainer* directory and attempt to connect to the
    container. Since no container exists at the first call, *VSCode* triggers
    *Docker* to create the container:

    - *Docker* will first pull the image described in
        [*.devcontainer/devcontainer.json*](.devcontainer/devcontainer.json):
        ```json
        "image": "eclipse-temurin:25-jdk",
        ```
        Verify that the image has been pulled at the *Images*-Tab.

    - Docker will then create a new container named *"dev-container-openjdk25"*
        and start the container.
        Verify that the container has been created and started at the
        *Containers*-Tab (the little green light is turned on).

1. The *VSCode*-IDE should now be connected to the container indicated by the
    connection shown open in the lower-left frame of the IDE.

1. Open a new terminal in the *VSCode*-IDE. Enter: `uname -a` to print the
    system name, under which the terminal shell is running in the container.
    The command should print: *"Linux..."*.

1. Enter: `java --version` and `javac --version` to see the *JDK* installed
    in the container image.

The *VSCode*-IDE should show this state:

<img src="../markup/img/vscode-3-devcontainer-helloworld-java.png" width="600"/>



<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->

&nbsp;

### Run Code in *dev-container*

Create file `HelloWorld.java`:

```java
package de.bht_berlin.application;

public class HelloWorld {
    public static void main() {
        System.out.println("Hello World!");
    }
}
```

Compile and run the file in the *devcontainer*:

```sh
# compile file 'HelloWorld.java'
javac HelloWorld.java

# run the .class file
java HelloWorld
```
```
Hello World!
```

When it works, commit file *HelloWorld.java* to the *main* branch with the message *"add HelloWorld.java"*.


<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->

&nbsp;

### Create a Structured Project

*Java* - projects follow conventions and structure. Introduce structure (*"scaffold"*)
into the project with three properties:

1. `class HelloWorld` is part of a package: `de.bht_berlin.application`.

1. All source code will reside under path: `src/main/java` in the project.

1. All compiled code will reside under path: `target/classes`.

The project-scaffold is:

```sh
 +-.devcontainer                        # devcontainer settings
 |   +- devcontainer.json
 |   +- .profile, .bashrc, .termrc
 |
 +--<src/main/java>                     # project source code
 |   +--<de/bht_berlin/application>     # - package sub-structure
 |        +--HelloWorld.java
 |
 +--<target/classes>                    # compiled classes (created by the compiler)
 |   +--<de/bht_berlin/application>     # - package sub-structure
 |        +--HelloWorld.class
```

Create the `src`-structure and move source file `HelloWorld.java` to its new
location. Make changes in the file to reflect the new package path.

Verify with:

```sh
find src
```
```
src
src/main
src/main/java
src/main/java/de
src/main/java/de/bht_berlin
src/main/java/de/bht_berlin/application
src/main/java/de/bht_berlin/application/HelloWorld.java
|            |                         |
|---<path>---|-----<package-path>------|
```


<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->

&nbsp;

### Compile the Code

Compile the project such that the compiler uses source file *HelloWorld.java*
from path *src/main/java/de/bht_berlin/application* and compiles output to
path *target/classes/de/bht_berlin/application/HelloWorld.class*.

Refer to the
[`javac`](https://download.java.net/java/early_access/loom/docs/specs/man/javac.html)
command for passing proper options to the compiler:

- `-cp` for the class-path and

- `-d` for selecting the target-directory.

<!-- 
```sh
# run the compiled class
javac -cp src/main/java -d target/classes $(find src -name '*.java')
```
-->

Verify the compiler has produced the compiled class at the correct location:

```sh
find src target
```
```
src
src/main
src/main/java
src/main/java/de
src/main/java/de/bht_berlin
src/main/java/de/bht_berlin/application
src/main/java/de/bht_berlin/application/HelloWorld.java     <-- source file
^------------^-------------------------^
target
target/classes
target/classes/de
target/classes/de/bht_berlin
target/classes/de/bht_berlin/application
target/classes/de/bht_berlin/application/HelloWorld.class   <-- compiled class file
^------------^-------------------------^
```

When it works, remove the last commit (with *HelloWorld.java* in the project
directory) and commit the new structure with message *"add src (new scaffold)"*.

For removing the last commit from a branch, what difference does flag `--hard`
make?


<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->

&nbsp;

### Run the Code

Construct a proper invocation of the *java* (VM) command such that the compiled
*.class*-file is executed. Use `-cp` to specify the class-path and qualify the
class with the package-path:

<!-- 
```sh
# run the compiled class
java -cp target/classes de.bht_berlin.application.HelloWorld
```
-->

```
Hello World!
```


&nbsp;
---
### Validation

In order to collect points, show in the *devcontainer* terminal:

```sh
# show system in the devcontainer
uname -a

# show the project directory
ls -la

# show project structure
find src target

# show branches of the project
git branch -avv

# show the commit log of the 'main'-branch
git log --oneline

# compile code
javac ...

# run code
java ...
```


<!-- 
```sh
git init --initial-branch=main
git commit --allow-empty -m "root commit (empty)"
git tag root
echo -e '.gitmodules\n.devcontainer\ntarget\n*.class' > .gitignore
git add .gitignore && git commit -m "add .gitignore"
# 
git switch -c git-modules
git submodule add -f -- https://github.com/sgra64/dev-container-java.git .devcontainer &&
git rm --cached .gitmodules &&
git commit -m "git submodules: .devcontainer"
# 
git switch main
# 
mkdir -p src/main/java/de/bht_berlin/application
( echo 'package de.bht_berlin.application;'
    echo ''
    echo 'public class HelloWorld {'
    echo '  public static void main() {'
    echo '    System.out.println("Hello World!");'
    echo '  }'
    echo '}'
) > src/main/java/de/bht_berlin/application/HelloWorld.java
# 
javac -d target/classes $(find src -name '*.java')
# 
java -cp target/classes de.bht_berlin.application.HelloWorld
# 
export CLASSPATH=target/classes
java de.bht_berlin.application.HelloWorld
```
-->
