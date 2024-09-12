# End-Validity of the presented results

This presentation is partly based on calculations that have been found to be `NO LONGER CORRECT`!

All the calculations, where the time evolution of the operator V is specified as a three-part-structure V_A, V_B, V_C is not correct.

This is because of a incoherency in the used commutation-relation for the hard-core-bosonic operators.

The work in this presentation references the repositories AT THE SPECIFIED COMMITS:

-   Documents (self): https://github.com/jonas-kell/master-thesis-documents/tree/8cb800fab543a6e9f283cdb1175458334ae01ac6
-   Code: https://github.com/jonas-kell/master-thesis-code/tree/58feb9be4b3275cb7e17a258ce6ab1888703d219
-   Math-Manipulator-Calculations: https://github.com/jonas-kell/master-thesis-mm-calculations/tree/290034f39d67ad2bb1da37b40c747141d66ee46d

Changes have been made to base calculations that the work is based on, still all other statements hold their validity (as far as I know).

This is not supposed to say, that this presentation is incorrect, but to warn, that there are known-false calculations in the core assumption.

As the presentation doesn't include full model runs or any statements about the physical properties of the system, basically all core-statements of the presentation hold.

In the end it is even more important, because the correct calculations have even more terms that need to be handled in the manner the presentation describes.

## Reason for inclusion in the results

Releasing work-progress is always a risk.

If I kept the repository private and did never publish the internal reports or presentations, only the correct version in the final thesis would be public.

I however believe this to be non-scientific and part of the process to walk along wrong paths to finally end upon the final solution.

While the final thesis only contains the right way, a lot can be learned from the previous attempts AND e.g. the benchmarking, which methods of optimization (analytical, sympy, logical-espresso, logical with/without if) are best used, are done on the "wrong" base calculations, because it doesn't matter (for this purpose).
