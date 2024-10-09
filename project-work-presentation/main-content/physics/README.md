# Where to get such pdfs

These pdfs are extracted from the practical-training-latex pdf with the tool [krop](https://arminstraub.com/software/krop)

Some of these outputs may be heavily size-optimized.

Could be done by using ghostscript

```shell
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=hamiltonian.pdf hamiltonian.pdf
```

This however may not work on all pdfs.

Also converting to ps and back may result in a heavily optimized pdf size.

```shell
pdf2ps test.pdf test.ps &&  ps2pdf test.ps test.pdf  && rm test.ps
```
