<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
## A3: *Python* - Setup


&nbsp;

### Install *Python* or use a *Dev-Container*

If you have no *Python* (version 3) installed, install or create a *Dev-Container*.

[*VSCode Dev-Containers*](https://learn.microsoft.com/en-us/windows/dev-environment/docker/dev-containers)
use *Docker Containers* with the *VSCode-IDE*.
They are convenient to setup for different programming environments.

A *Dev-Container* is created based on a configuration file `devcontainer.json` in a
directory `.devcontainer` residing in a project directory, see:

- [*dev-container-python*](../dev-container-python/.devcontainer) for a *Python Dev-Container*
    with configuration file
    [`.devcontainer/devcontainer.json`](../dev-container-java/.devcontainer/devcontainer.json)
    (Python).


&nbsp;

### Verify *Python*

Check if you have *Python 3* installed. Name three differences between
[Python 2 and 3](https://www.guru99.com/python-2-vs-python-3.html#7).

Run commands in the terminal (version 3.x.y may vary):
```sh
> python --version
Python 3.12.0
```

If you see error *command not found*, add path to Python installation to
PATH variable in `.bashrc` (Mac: `.zshrc`).


&nbsp;

### Setup *pip*

Check if you have a Python package manager installed (pip, conda, ... ). [`pip`](https://pip.pypa.io)
is Python's default package manager to install additional Python packages and libraries.

Follow [instructions](https://pip.pypa.io/en/stable/installing) for installation:

- [download](https://bootstrap.pypa.io/get-pip.py) the `get-pip.py` file.

- run `python get-pip.py`

- or update pip to latest version: `python -m pip install --upgrade pip`


Run commands in terminal:

```sh
> pip --version
pip 23.2.1 from C:\Users\svgr2\AppData\Local\Programs\Python\Python312\Lib\site-
packages\pip (python 3.12)
```


&nbsp;
---
### Validation

Start Python in the terminal and execute commands:
```py
> python
Python 3.12.0 (tags/v3.12.0:0fb18b0, Oct  2 2023, 13:03:39) [MSC v.1935 64 bit (AMD64)] on win32
Type "help", "copyright", "credits" or "license" for more information.

>>> print('Hello World')
Hello World

>>> help('modules')
...lists installed python packages

>>> 2+3*4
14

>>> x = 2+3*4
>>> x
14
```

Create a file *print_sys.py* with following content.
```py
import platform

impl = platform.python_implementation()
ver = platform.version()
mach = platform.machine()
sys = platform.system()

print('Python impl:    ' + impl)
print('Python version: ' + ver)
print('Python machine: ' + mach)
print('Python system:  ' + sys)
print('Python version: ' + platform.python_version())
```

Run file *print_sys.py*. Output varies depending on your system.
```
> python print_sys.py
Python impl:    CPython
Python version: 10.0.19045
Python machine: AMD64
Python system:  Windows
Python version: 3.12.0
```
