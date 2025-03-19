# makefig4latex

This is a wrapper for the Matlab library [matlab2tikz](https://github.com/matlab2tikz/matlab2tikz) (which I redistribute in this repository) that can generate standalone PDF figures from a matlab plot. To try it out, download the repo, and run makefig4latex_demo.m.

Tip (not yet implemented as an automated feature in the code): to handle extra long legends, replace the legend settings in preamble of the axis enviroment in the generated latex file with the following one:

```latex
legend style={at={(0.5,1.2)}, anchor=north, legend cell align=left, align=left, draw=none, fill=none, legend columns = 7}
```

## Main functionalities

- It generates a standalone tex file that can be compiled, or included in another tex file (as usual).
- Simplified management of the relative font size compared to the plot size;
- It compiles a pdf (requires `pdflatex` installed) if instructed to do so.

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
- To control the (relative) size of the font compared to the plot, you can adjust the function argument `width`. No need of playing with the matlab font-size configuration, which is painful.
- If you wish to edit the generated latex plot, set delete_files to 0, so that the tex file will be preserved. 
- Be aware that re-running the script will override any change you might have performed on the latex file, so save it elsewhere.
