# Master-Thesis: Classical networks for the Hubbard model with a tilted potential

The work for my Master-Thesis is split into multiple repositories (links for quick access, it may be possible that the repo is private).

-   [Latex Documents, Reports and Notes](https://github.com/jonas-kell/master-thesis-documents)
-   [Final Code to produce Measurements](https://github.com/jonas-kell/master-thesis-code)
-   [The MATH-MANIPULATOR project, developed in conjunction with the thesis/practical training](https://github.com/jonas-kell/math-manipulator)
-   [A repository that holds calculations done with the MATH-MANIPULATOR tool](https://github.com/jonas-kell/master-thesis-mm-calculations)

## Pre-compiled Document

The pre-compiled version of the thesis is available [Here](./pre-compiled-documents/Classical%20networks%20for%20the%20Hubbard%20model%20with%20a%20tilted%20potential%20-%20Master%20Thesis%20Jonas%20Kell.pdf).
It has been submitted on the 13th of February 2025.

Furthermore, the respective folders contain the Report and Presentation held at the University of Augsburg on the 15th of May 2024.

## Submodules

The code that gets referenced in the thesis is managed via git-submodules and needed for building the document. Make sure to initialize the submodules before building

```shell
git submodule init
git pull --recurse-submodules
```

<!--
Create The symbolic links (run in main folder)

ln -sf ./../latex-beamer-template/beamerthemeuniamntf.sty project-work-presentation/
ln -sf ./../latex-beamer-template/beamercolorthemeuniamntf.sty project-work-presentation/
ln -sf ./../latex-beamer-template/slide-background-images/ project-work-presentation/

ln -sf ./../latex-beamer-template/beamerthemeuniamntf.sty colloquium-presentation/
ln -sf ./../latex-beamer-template/beamercolorthemeuniamntf.sty colloquium-presentation/
ln -sf ./../latex-beamer-template/slide-background-images/ colloquium-presentation/
 -->

## Compiling

To compile the documents, run

```shell
PUID=`id -u` PGID=`id -g` docker compose up
```
