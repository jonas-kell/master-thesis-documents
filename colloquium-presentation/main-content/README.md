# Where to get such pdfs

These pdfs are extracted from the practical-training-latex pdf with the tool [krop](https://arminstraub.com/software/krop)

Some of these outputs may be heavily size-optimized.

Could be done by converting to ps and back. (some croppings work with this, some do not)

```shell
pdf2ps test.pdf test.ps &&  ps2pdf test.ps test.pdf  && rm test.ps
```

Over-painting unwanted symbols can be done with [Xournal++](https://xournalpp.github.io/).
Edit pdf with Xournal++, paint over sections or draw shape, export as pdf.
This conserves pdf-structure and even compresses the pdf. But not as much as the first compression method.
