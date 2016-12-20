# latexmk config file
#
# %B: base of filename for current command. E.g., if a postscript file document.ps is being made from the dvi file document.dvi, then the basename is document.
# %D: destination file (e.g., the name of the postscript file when converting a dvi file to postscript).
# %O: options
# %R: root filename. This is the base name for the main tex file.
# %S: source file (e.g., the name of the dvi file when converting a dvi file to ps).
# %T: The name of the primary tex file.
# %Y: Name of directory for auxiliary output files (see the configuration variable $aux_dir). A directory separation character (’/’) is appended if $aux_dir is non-empty and does not end in a suitable character, with suitable characters being those appropriate to UNIX and MS-Windows, i.e., ’:’, ’/’ and ’\’.
# %Z: Name of directory for output files (see the configuration variable $out_dir). A directory separation character (’/’) is appended if $out_dir is non-empty and does not end in a suitable character, with suitable characters being those appropriate to UNIX and MS-Windows, i.e., ’:’, ’/’ and ’\’.

# PDF settings
$pdf_mode=1;
$poscscript_mode=0;
$dvi_mode=0;

$pdflatex='xelatex --shell-escape %O %S -pdf -dvi- -ps-';
#$pdflatex='pdflatex -shell-escape -synctex=1 %O  %S';
$pdflatex_silent_switch='-interaction=batchmode';
$silent=1;
$recorder=1;

$biber='biber --input-directory=bib %O %S';

# Previewer settings
$pdf_previewer='start /usr/bin/evince %O %S 2>/dev/null';
$preview_continuous_mode=1;

# Misc settings
$out_dir='out';
$always_view_file_via_temporary=1;

# Notification settings
my $notify_id=-1;
$compiling_cmd='internal my_compilation_cmd';
$failure_cmd='internal my_failure_cmd';
$success_cmd='internal my_success_cmd';

sub my_compilation_cmd {
	$notify_id = `notify-send -p -t 2000 -i emblem-synchronizing -r $notify_id "latexmk" "compiling" 2>/dev/null`;
	chomp($notify_id);
}

sub my_failure_cmd {
	$notify_id = `notify-send -p -t 2000 -i emblem-important -r $notify_id "latexmk" "compilation failed" 2>/dev/null`;
	chomp($notify_id);
}

sub my_success_cmd {
	$notify_id = `notify-send -p -t 2000 -i emblem-default -r $notify_id "latexmk" "compilation successful" 2>/dev/null`;
	chomp($notify_id);
}

# vim: ft=perl syntax=on
