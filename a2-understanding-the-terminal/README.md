<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
## A2: Understanding the *Terminal*

The terminal is remains a primary tool to interact with computers also in
modern software development. Understanding the terminal and the system
environment remains a key capability.

1. [*Terminal* and *Shell*](21-terminal-and-shell.md)

    - What is a (software-) terminal comprised of?

    - Why are terminals relevant today?

    - Understand *ASCII*, *UTF-8* and *ANSI Escape Codes*.

    - Understand the Prompt and *PS1*.

    - What is a *Shell*? Which *Shell* do I use (*bash* or *zsh* (Mac))?

    - Hall of Fame. Who are significant people?


1. [*Filesystem* and *$HOME* directory](22-filesystem-and-HOME.md)

    - What is a *filesystem*?

    - How is a *filesystem* organized (*files, directories, mounts, links*)?

    - What is and where is my *$HOME* directory?

    - What is in my *$HOME* directory?
    
    - What are *dotfiles*?


1. [*Processes* and *Environment Variables*](23-processes-and-environment.md)

    - Process creation and inheritance.

    - Global and local *environment variables*.

    - Environment variables: *$HOME*, *$PATH*, *$PS1*.


1. [*Dotfiles*](24-dotfiles.md)

    - Role of *profile*, *rc* and *logout* files.

    - Execution order

        - *.profile* (Mac: *.zprofile* ).

        - *.bashrc* (Mac: *.zshrc*).

        - *.bash_logout* (Mac: *.zlogout*).

    - History files.

    - The *source* command and *sourcing* dotfiles.


1. [*Aliases* and *Functions*](25-aliases-and-functions.md)

    - What is an *alias*?

    - What is a *shell function*?


&nbsp;
---
### References

- [1] Ray Toal,
    [*Introduction to Bash*](https://cs.lmu.edu/~ray/notes/bash/).

- [2] Seth Kenlon,
    [*Getting started with Zsh*](https://opensource.com/article/19/9/getting-started-zsh),
    (2019).

- [3] Seth Kenlon,
    [*Getting started with Zsh*](https://opensource.com/article/19/9/getting-started-zsh),
    (2019).

- [3] Stanford Seminar: *Computer Systems CS110*,
    [*Lecture 2: Introduction to Filesystems*](https://web.stanford.edu/class/cs110/summer-2021/lecture-notes/lecture-02),
    ([Lecture Notes](https://web.stanford.edu/class/cs110/summer-2021/lecture-notes)), (2021).

- [4] Stanford Seminar: *Computer Systems CS110*,
    [*Lecture 3: Directories and Links*](https://web.stanford.edu/class/cs110/summer-2021/lecture-notes/lecture-03), (2021).

- [5] Stanford Seminar: *Computer Systems CS110*,
    [*Lecture 5: Processes*](https://web.stanford.edu/class/cs110/summer-2021/lecture-notes/lecture-05),
    ([Lecture Notes](https://web.stanford.edu/class/cs110/summer-2021/lecture-notes)), (2021).

- [6] Dionysia Lemonaki:
    [*What are Dotfiles?*](https://www.freecodecamp.org/news/dotfiles-what-is-a-dot-file-and-how-to-create-it-in-mac-and-linux/),
    (2021).

- [7] *A Curated List of Awesome Dotfiles*,
    [[*link*]](https://github.com/webpro/awesome-dotfiles).

- [8] Stackoverflow, *Complete overview of Bash and Zsh startup files sourcing order*, 
    [[*link*]](https://superuser.com/questions/1840395/complete-overview-of-bash-and-zsh-startup-files-sourcing-order)


### Further Reading

- [9] David Farrell: [*An Introduction to Tmux*](https://www.perl.com/article/an-introduction-to-tmux/), (2016).

- [10] Daniel P. Bovet, Marco Cesati: [*Understanding the Linux Kernel*](https://www.amazon.de/-/en/Daniel-P-Bovet/dp/0596002130),
([pdf](https://www.cs.utexas.edu/~rossbach/cs380p/papers/ulk3.pdf)), 3rd Ed., (2006).


---


&nbsp;
---
### Validation

In order to collect points, show notes with answered questions
(on paper or as notes in a text-file):

1. What is a terminal?

1. What is a shell?

1. What is a (Unix-) process?

1. How does the `'|'` - sign work in command lines entered in a terminal?

1. What is the *HOME* - directory?

1. Write down the path to your *HOME* - directory on your laptop.

1. Write down what is in your *HOME* - directory (five entries)?

1. What is *PATH*? What does it do?

1. Where is *PATH* defined? How can it be changed?

1. What are *dotfiles*?

1. Name five *dotfiles* you know and briefly explain their purpose.

1. What is *UTF-8* and why is it not *ASCII*?

1. What is an *ANSI* escape sequence and what is it used for?

1. How can a *pretty-prompt* be created, such as:

    <img src="../markup/img/terminal-2-pretty-prompt.png" width="600"/>


1. Who is *Ken Thompson*?

