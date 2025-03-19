function makefig4latex(name, path, makepdf, delete_files, sans_serif, width)

% Wrapper for matlab2tikz with some added functionalities. See README.md for
% more.

% ------
% FUNCTION ARGUMENTS
% ------
% name: name of the file, without tex extension.
% path: folder where to save the result, eg ./fig.
% makepdf: boolean, default false. If true, it compiles the tex file with pdflatex.
% delete_files: : boolean, default true. If true, it deletes all latex files, leaving only the pdf.
% sans_serif: boolean, default true. boolean, if true, it uses a sans serif font family (eg, Arial). Set to false for times.
% width: float number, default 0.85. It controls the width of the plot. The only practical use is that it
% allows to adjust the relative size of the font with respect to the plot
% size.


pdflatex = '/Library/TeX/texbin/pdflatex';

if (nargin < 3)
    makepdf = false;
end
if (nargin < 4)
    delete_files = true;
end
if (nargin < 5)
    sans_serif = false;
end
if (nargin < 6)
    width = 0.85;
end
width = sprintf('%.2f\\columnwidth', width); 
fname = sprintf('%s/%s.tex', path, name);

cleanfigure
matlab2tikz(fname, 'width', width)

% Find path of the preamble.
plot_wrapper = which('makefig4latex');
st = dbstack;
namestr = st.name;
preamble = strrep(plot_wrapper,sprintf('%s.m', namestr),'latex/standalone_preamble.tex');
closing = strrep(plot_wrapper,sprintf('%s.m', namestr),'latex/standalone_closing.tex');

cmd = sprintf('cat %s %s %s > %s', preamble, fname, closing, '.temp.tex');
system(cmd);
system(sprintf('cat .temp.tex > %s && rm .temp.tex', fname));

if (sans_serif == false)
    % Comment out sarif font settings.
    target = '\usepackage[[]cm[]]{sfmath}';
    replacement = '%\usepackage[cm]{sfmath}';
    makefig4latex_strreplace(name, path, target, replacement);
    target = '\renewcommand{\familydefault}{\sfdefault}';
    replacement = '%\renewcommand{\familydefault}{\sfdefault}';
    makefig4latex_strreplace(name, path, target, replacement);
end

if makepdf
    system([pdflatex, ' -output-directory ', path, ' ', fname]);
    if delete_files
        to_cancel = {'.aux', '.log', '.tex'};
        for i=1:numel(to_cancel)
            fname_to_cancel = [path, '/', name, to_cancel{i}];
            system(['rm ', fname_to_cancel]);
        end
    end
end

