prologues:=3; % Do v�stupn�ho EPS souboru vlo�it fonty.
filenametemplate "%j-%3c.mps"; % V�stupn� soubory pojmenov�vat ve tvaru 
                               % <jm�no_dokumentu>-<trojm�stn�_��slo_obr�zku>.mps


l=10mm;

beginfig(1);
    pickup pensquare scaled 0.5 mm;

    % Definice p�ti bod�.
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
