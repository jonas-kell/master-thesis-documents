# Master-Thesis: Classical networks for the Hubbard model with a tilted potential

The work for my Master-Thesis is split into multiple repositories (links for quick access, it may be possible that the repo is private).

-   [Latex Documents, Reports and Notes](https://github.com/jonas-kell/master-thesis-documents)
-   [Final Code to produce Measurements](https://github.com/jonas-kell/master-thesis-code)
-   [The MATH-MANIPULATOR project, developed in conjunction with the thesis/practical training](https://github.com/jonas-kell/math-manipulator)
-   [A repository that holds calculations done with the MATH-MANIPULATOR tool](https://github.com/jonas-kell/master-thesis-mm-calculations)

## Pre-Release

This currently only contains the finished Report and Presentation held at the University of Augsburg on the 15th of May 2024.

The Thesis is not yet available, therefor final usage instructions are not completed.

<!--
# Pre-compiled Document

The pre-compiled version of the thesis is available # TODO
 -->

## Submodules

The code that gets referenced in the thesis is managed via git-submodules and needed for building the document. Make sure to initialize the submodules before building

```cmd
git submodule init
git pull --recurse-submodules
```

<!--
Create The symbolic links

ln -sf ./../latex-beamer-template/beamerthemeuniamntf.sty project-work-presentation/
ln -sf ./../latex-beamer-template/beamercolorthemeuniamntf.sty project-work-presentation/
ln -sf ./../latex-beamer-template/slide-background-images/ project-work-presentation/
 -->

<!--
# Compiling

To compile the documents, run

```cmd
cd thesis-latex/
# TODO
```

You need a working LaTeX-installation. (Best **texlive-full**, because lots of packages are used)

The libertinus font family need to be available on the system. ([GitHub](https://github.com/alerque/libertinus))

You need [Python](https://www.python.org/) (best is Python 3, use lower two commands) and [Minted](https://ctan.org/pkg/minted?lang=de)

```cmd
python3 --version
pip3 install Pygments
```

# Gnuplot

The graphs in the experiments section are compiled with [gnuplot](http://www.gnuplot.info/).

Compilation:

```cmd
gnuplot <filename>.gp
```

 -->
