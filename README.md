# makefig4latex

Wrapper for [matlab2tikz](https://github.com/matlab2tikz/matlab2tikz) (which I redistribute in this repository) with the following functionalities:

- it generates a standalone tex file that can be compiled, or included in another tex file (as usual);
- simplified management of the relative font size compared to the plot size;
- it compiles a pdf (optional), if instructed to do so.

Will work (almost) out of the box in MacOSx and probably in Linux. Won't work in MS Windows, unless modified.

## Requirements

- Compiling a PDF calls for `pdflatex`.
- It requires several bash system utilities (`cat`, `sed`, `echo`, output redirection) which are native on MacOSx and Linux. On Windows, one has to find a way around (Cygwin? Dunno).

## Initial Configuration

- Adjust the variable `pdflatex` in this file to point to the location of the `pdflatex` executable. If you are unsure about the location, open a terminal and type the command `which pdflatex`; this will give you the path you need.
  
- `makefig4latex_demo.m` contains a simple demo for this utility.  
- Add this folder to your Matlab path and save it if you wish to reuse the function elsewhere:
```text
  addpath('./')
  savepath()
```

## Practical tips

- The conversion preserves the size of the plot.
- To control the (relative) size of the font, just play with `width`. You might forget about playing with matlab font configuration, which is painful.
- If you wish to edit the generated latex plot, set delete_files to 0, so that the tex file will be preserved. 
- Be aware that re-running the script will override any change you might have performed on the latex file, so save it elsewhere.


