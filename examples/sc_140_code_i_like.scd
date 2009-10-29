/* by Nathaniel Virgo (headcube */

Pbind(\dur,0.3,\sustain,1.5,\k,Pstutter(16,Pfunc{rrand(4,10)*10}),\freq,Pfunc{|e|exprand(50,500).round(e.k)},\amp,Pgbrown(0.01,0.1)).play
