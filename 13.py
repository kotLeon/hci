import pandas as pd
#Zadanie 13 na kck
import matplotlib.pyplot as plt
import aseegg as ag

dane = pd.read_csv("dane.csv")

dane.columns = ['1', '2', '3', '4', '5', '6']
zmB = dane['2'] # sygnal
zmA = dane['6'] # cyfry

#filtracja sygnalu
p1 = ag.pasmowozaporowy(zmB, 200, 49, 51)
p2 = ag.dolnoprzepustowy(p1, 200, 50)

# Wykres sygnalu przefiltrowanegi i nieprzefiltrowanego
plt.subplot(211)
plt.plot(zmB, label = 'sygnal przed filtracja')
plt.xlabel("t")
plt.ylabel("A")
plt.legend(loc = 'upper right')

plt.subplot(212)
plt.plot(p1, label = 'sygnal po filtracji')
plt.xlabel("t")
plt.ylabel("A")
plt.legend(loc = 'upper right')

plt.show()


# Wykres syg przefiltrowanegi i cyfr (odkomentowac w celu wyswietlenia)
# plt.subplot(211)
# plt.plot(p1, label = 'sygnal przefiltrowany')
# plt.xlabel("t")
# plt.ylabel("A")
# plt.legend(loc = 'upper right')

# plt.subplot(212)
# plt.plot(zmA, label = 'wyświetlane znaki')
# plt.xlabel("t")
# plt.ylabel("znak")
# plt.legend(loc = 'upper right')

# plt.show()


# Cyfry i sygnal na jednym wykresie (odkomentowac w celu wyswietlenia)
# plt.plot(zmA, label = 'wyświetlane cyfry')
# plt.plot(p1*-5, label = 'sygnal przemnożony') # -5, zeby bylo w tym samym miejscu
# plt.xlabel("t")
# plt.ylabel("znak")
# plt.legend(loc = 'lower right')
# plt.show()