prologues:=3; % Do výstupního EPS souboru vlo¾it fonty.
filenametemplate "%j-%3c.mps"; % Výstupní soubory pojmenovávat ve tvaru 
                               % <jméno_dokumentu>-<trojmístné_èíslo_obrázku>.mps


l=10mm;

beginfig(1);
    pickup pensquare scaled 0.5 mm;

    % Definice pìti bodù.
    z1 = l*dir30;
    z2 = l*dir90;
    z3 = l*dir150;
    z4 = l*dir210;
    z5 = l*dir270;
    z6 = l*dir330;

    draw z1--z3--z5--z1;
    draw z2--z4--z6--z2;

endfig;
end;
