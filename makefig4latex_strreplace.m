function makefig4latex_strreplace(name, path, target, replacement)
% Implement an inline text replacement of the target string 'target' with
% 'replacement' in the file at path/name.tex. Implemented with sed. It
% problably won't work in MS Windows.

target = replace(target,'\','\\');
replacement = replace(replacement,'\','\\');

cmd = sprintf("sed -i.bak -E 's/%s/%s/g' '%s/%s.tex'", target, replacement, path, name);
[status, cmdout] = system(cmd);

if (status ~= 0)
    error(cmdout);
end



