# Javascript Linter build with Ruby (OOP)

* The purpose of this project was to demonstrate my skills in Ruby programming. In this project I have created a linter of my choice which detects mistakes and let the user know where they have made those mistakes. This simple linter can be very useful when working with javascript and can help reduce your common mistakes.


# Build with

- Ruby
- VS code

# Listed below are the styles that this linter checks:

- Semicolons(;) - at the end of each line when that particular line it isn't a closing tag
- Classes - checks whether the classes start the uppercase
- Variables/Constants - checks whether the variables and constants start with lowercase
- Lastly it checks whether in the last line the user has also included and empty line

# Installation:

- Start by coping the linter folder anywhere in your computer. You can copy the folder by writing "clone https://github.com/GzimAsani/Linters-Ruby-Capstone-Project.git". It is prefered to copy near the file that you want to lint(check). Also installing ruby either globally or in your directory is required before proceeding with linting your file. The next steps are explained under the Instructions section.
- Install colorized gem by writing in your terminal `gem install colorize` in order to have a better visualization of your errors
- Install rspec by writing in your terminal `gem install rspec`

# Instructions

The next step after installing ruby and copied the folder into your machine is to move your javascript file into the "tests" folder than continue by writing "ruby bin/main.rb" which will initialize the lint and continue by copy/pasting your file.

# Good code example:

```bash
class SomeClass {
    code(code1, code2) {
        this.code1 = code1;
    }
}
```
# Bad code example:
```bash
let Newvariable; // Variable starting with uppercase
let newVariable  // Variable missing semicolon
const NewConst  // Constant starting with uppercase

class NewClass {
    12 + 2;
}

// Unexpected blank space
```

# Project Structure

```bash 
├── README.md
├── bin
│   └── main.rb
├── lib
│    ├──rules.rb
│    └──run_file.rb
├── tests
│    ├── test1.js
│    └── test2.js
```

# Prerequisites
- Text editor
- Github profile
- Git and Ruby.
- Rubocop

# Author

👤 **Gzim Asani**

- Github: [@GzimAsani](https://github.com/GzimAsani)

- LinkedIn: [Gzim Asani](https://www.linkedin.com/in/gzim-asani-83390a17a/)

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse
- GitHub
- Theodinproject.com
