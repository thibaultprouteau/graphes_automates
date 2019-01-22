#!/bin/bash

fstcompile --acceptor --isymbols=A.isyms A.txt A.fsa
fstcompile --acceptor --isymbols=B.isyms B.txt B.fsa
fstunion A.fsa B.fsa C.fsa
fstintersect A.fsa B.fsa D.fsa
fstconcat A.fsa B.fsa E.fsa
fstclosure A.fsa G.fsa
fstclosure B.fsa H.fsa
fstrmepsilon C.fsa I.fsa
fstdeterminize C.fsa Cdet.fsa
fstdeterminize I.fsa Idet.fsa
fstdraw --acceptor --portrait -isymbols=A.isyms A.fsa | dot -Tpng > A.png
fstdraw --acceptor --portrait -isymbols=A.isyms B.fsa | dot -Tpng > B.png
fstdraw --acceptor --portrait -isymbols=A.isyms C.fsa | dot -Tpng > C.png
fstdraw --acceptor --portrait -isymbols=A.isyms D.fsa | dot -Tpng > D.png
fstdraw --acceptor --portrait -isymbols=A.isyms E.fsa | dot -Tpng > E.png
fstdraw --acceptor --portrait -isymbols=A.isyms G.fsa | dot -Tpng > G.png
fstdraw --acceptor --portrait -isymbols=A.isyms H.fsa | dot -Tpng > H.png
fstdraw --acceptor --portrait -isymbols=A.isyms I.fsa | dot -Tpng > I.png
fstdraw --acceptor --portrait -isymbols=A.isyms Idet.fsa | dot -Tpng > Idet.png
fstdraw --acceptor --portrait -isymbols=A.isyms Cdet.fsa | dot -Tpng > Cdet.png
fstcompile --acceptor --isymbols=A.isyms M.txt M.fsa
fstdraw --acceptor --portrait -isymbols=A.isyms M.fsa | dot -Tpng > M.png
fstminimize M.fsa Mm.fsa
fstdraw --acceptor --portrait -isymbols=A.isyms Mm.fsa | dot -Tpng > Mm.png
fstshortestpath --nshortest=4 A.fsa Asp.fsa
fstdraw --acceptor --portrait -isymbols=A.isyms Asp.fsa | dot -Tpng > Asp.png
