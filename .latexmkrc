add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');

# ref: https://tex.stackexchange.com/questions/1226/how-to-make-latexmk-use-makeglossaries
sub run_makeglossaries {
  if ( $silent ) {
    # system "makeglossaries -q '$_[0]'"; # for unix
    system "makeglossaries", "-q", "$_[0]"; # for windows
  }
  else {
    # system "makeglossaries '$_[0]'"; # for unix
    system "makeglossaries", "$_[0]"; # for windows
  };
}

push @generated_exts, 'glo', 'gls', 'glg';
push @generated_exts, 'acn', 'acr', 'alg';

$clean_ext .= '%R.ist %R.xdy';

$pdf_mode = 1;
$pdf_latex = 'pdflatex -interaction=nonstopmode -halt-on-error -shell-escape';


