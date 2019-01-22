#!/bin/bash

fstcompile --acceptor --isymbols=ascii.isyms homme.txt homme.fsa
fstcompile --acceptor --isymbols=ascii.isyms mars.txt mars.fsa
fstcompile --acceptor --isymbols=ascii.isyms martien.txt martien.fsa
fstdraw --acceptor --portrait -isymbols=ascii.isyms homme.fsa | dot -Tpng > homme.png
fstdraw --acceptor --portrait -isymbols=ascii.isyms martien.fsa | dot -Tpng > martien.png
fstdraw --acceptor --portrait -isymbols=ascii.isyms mars.fsa | dot -Tpng > mars.png
fstunion martien.fsa mars.fsa espace.fsa
fstunion espace.fsa homme.fsa univers.fsa
fstdraw --acceptor --portrait -isymbols=ascii.isyms univers.fsa | dot -Tpng > univers.png
fstrmepsilon univers.fsa | fstdeterminize | fstminimize > universFinal.fsa
fstdraw --acceptor --portrait -isymbols=ascii.isyms universFinal.fsa | dot -Tpng > universFinal.png
fstclosure universFinal.fsa universFinalSeq.fsa
fstdraw --acceptor --portrait -isymbols=ascii.isyms universFinalSeq.fsa | dot -Tpng > universFinalSeq.png
fstshortestpath --nshortest=4  universFinalSeq.fsa test.fsa
fstdraw --acceptor --portrait -isymbols=ascii.isyms test.fsa | dot -Tpng > test.png
