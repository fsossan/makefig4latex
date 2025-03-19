
% Plot something and use makefig4latex to convert to latex (and compile a
% pdf).

t = linspace(0, 2*pi, 1000);
x = 16 * sin(t).^3;
y = 13 * cos(t) - 5 * cos(2*t) - 2 * cos(3*t) - cos(4*t);

plot(x, y, 'r', 'LineWidth', 2);
xlabel('X');
ylabel('Y');

name = 'i_love_tikz'; % Name of your plot (without any extension).
path = './'; % Where you wanna have your plot. './' stands for current folder.
makepdf_flag = true; % Compile a pdf.
delete_files_flag = false; % Do not delete latex file after compilation.
sans_serif_flag = false; % Use serif font family (times)
width = 1; % Its only practical use is controlling the font size relative to the plot.

makefig4latex(name, path, makepdf_flag, delete_files_flag, sans_serif_flag, width);
