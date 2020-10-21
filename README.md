# Template for R Markdown manuscript

## To use this repository

Click `Use this template` from the `GitHub` interface.
Choose a name for your new repository.
You will get a copy of this repository with all the files but none of the commit history.

I recommend that you peruse the [bookdown](https://bookdown.org/) documentation.

## Required R packages

It is probably helpful to make sure all of your packages are up to date!

At the very least:

* `bookdown`
* `rmarkdown`
* `knitr`

## Steps to get your own paper started.

1. Rename `Manscript.Rmd` to whatever you want it to be
2. Rename the value of the `PAPERFILENAME` variable in `Makefile` to match your new `Rmd` file name.
3. Update `Makefile` to reflect removing `Model.png`
4. Write your paper!

If you add external images to this repository that will be graphics for slides:

1. Commit them!
2. Add them to the `IMAGES` variable in `Makefile` so that your slides rebuild if they change.

The supporting material document is `SupportingInformation.Rmd`.
Any figures and tables added here start counting again from `1` and have an `S` prepended to their labels.
If you add supplemental equations, you'll want to do similar tricks for equation numbers and labels.
This document also gets a separate bibliography, but it uses the same `.bib` file as the main manuscript file.
The supporting material is a build dependency for the main manuscript.
Thus, any changes there will cause the main manuscript to be re-processed when a `make` command is issued.
This file also uses a separate preamble, `sipreamble.tex`.

### Managing the bibliography

Add new `Bibtex` records to `references.bib`.
The file `references.bib` is a build dependency in the `Makefile`.

Those of you using `vim`-like editors will benefit greatly from the following plugins:

* [vim-pandoc](https://github.com/vim-pandoc/vim-pandoc)
* [vim-pandoc-syntax](https://github.com/vim-pandoc/vim-pandoc-syntax)
* [vim-rmarkdown](https://github.com/vim-pandoc/vim-rmarkdown)

These plugins give you auto completion of citations via the bibliography file declared in the `YAML`.
For this repository, that file is `references.bib`.
The auto completion works using the same `<C-X-O>` that is used throughout `vim` for auto completion.
For example, [vimtex](https://github.com/lervag/vimtex) auto-completes `\cite` commands this way.
If the bibliography file contains a citation key `AuthorYear`, then the citation code in the markdown will be `[@AuthorYear]` or `@AuthorYear`.
To use auto completion, typing `@A<C-X-O>` will bring up a completion list of all citation keys starting with `A`.
You then select the correct key from that list.

The default citation code (`[@AuthorYear]`) results in a parenthetical citation, equivalent to `\citep`.
The code `@AuthorYear` is equivalent to `\citet`.
To the best of my knowledge, there is no equivalent to `\citeyearpar`.
However, you may use that command "manually", as you may enter any valid `LaTeX` in your markdown file.

### Generating the pdf of your paper

Execute `make`.
If you use a `vim`-like editor, then execute this command when in `normal` mode:

```
:make
```

The build step saves the intermediate `.tex` file.

### Changing the preamble

The `Makefile` includes `preamble.tex` as a build requirement.
You may add the usual `LaTeX` stuff to this file to configure various things.
Alternately, you can do a lot of configuration via the `YAML`.

### Configuring the R environment

1. Make the changes to the `r setup` block near the top of the `Rmd` file.
