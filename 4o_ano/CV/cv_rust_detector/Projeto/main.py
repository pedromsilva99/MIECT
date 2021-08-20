#
# Deteção de corrosão em superfícies metálicas
#
# 88859 - Pedro Gonçalves
# 89228 - Pedro Silva
#
# Referências
# https://answers.opencv.org/question/178394/detection-of-rust-with-opencv-python/?fbclid=IwAR1Lztp2SBI73kiGvkekMHdWPXO16HbhvNjWfhdgQh7T5gCs1v2mXA8Bp_Q
# https://docs.opencv.org/master/d1/db7/tutorial_py_histogram_begins.html
#

import cv2
import imutils
import numpy as np
from matplotlib import pyplot as plt
import sys
import os


if len(sys.argv) != 2 and len(sys.argv) != 3:
    print('Usage1: python3 main.py img')
    print('Usage2: python3 main.py img result.jpg')
    sys.exit()


img = cv2.imread('imgs/' + sys.argv[1], cv2.IMREAD_UNCHANGED)
height, width, channels = img.shape

rust = []
# Diferentes cores de ferrugem
# rust = [(min[B, G, R], max[B, G, R])]

# Low Red
rust.append([([30, 30, 60], [50, 40, 70])])
rust.append([([25, 30, 70], [40, 45, 80])])
rust.append([([40, 60, 90], [60, 65, 110])])
# Mid Red
rust.append([([70, 57, 115], [83, 90, 130])])
rust.append([([80, 100, 145], [90, 110, 180])])
rust.append([([35, 65, 115], [45, 90, 145])])
rust.append([([20, 45, 140], [40, 65, 165])])
rust.append([([40, 85, 170], [50, 100, 185])])
rust.append([([5, 25, 115], [25, 45, 130])])
# High Red
rust.append([([95, 125, 200], [100, 140, 205])])
rust.append([([115, 150, 220], [120, 160, 225])])

# Criação da nova imagem a partir dos intervalos de ferrugem
# Primeiro intervalo
for (lower, upper) in rust[0]:
    lower = np.array(lower, dtype = "uint8")
    upper = np.array(upper, dtype = "uint8")
    mask = cv2.inRange(img, lower, upper)
    final = cv2.bitwise_and(img, img, mask=mask)

# Todos os restantes
for i in range(1, len(rust)):
    for (lower, upper) in rust[i]:
        lower = np.array(lower, dtype = "uint8")
        upper = np.array(upper, dtype = "uint8")
        mask = cv2.inRange(img, lower, upper)
        output = cv2.bitwise_and(img, img, mask=mask)
        final = cv2.bitwise_or(final, output)

# Histograma que demonstra a quantidade de
# pixeis presentes na imagem final
color = ('b', 'g', 'r')
total = 0
for i, col in enumerate(color):
    histr = cv2.calcHist([final], [i], None, [256], [1,256])
    plt.plot(histr, color = col)
    plt.xlim([0, 256])
    plt.title('Análise de corrosão')

# Limitar a largura da imagem a 1280,
# mas manter a largura se a original for menor que 1280
max_width = 1280
if width > max_width:
    n_width = max_width
else:
    n_width = width

# Guardar a imagem resultado
path = 'imgs'
if len(sys.argv) == 3:
    cv2.imwrite(os.path.join(path, sys.argv[2]), final)
else:
    cv2.imwrite(os.path.join(path , 'result.jpg'), final)
cv2.waitKey(0)

# Obter a imagem para contagem de pixeis
if len(sys.argv) == 3:
    final2 = cv2.imread('imgs/' + sys.argv[2], 0)
else:
    final2 = cv2.imread('imgs/result.jpg', 0)

tot_pixels = cv2.countNonZero(final2)
perc = tot_pixels * (100 / final2.size)
print('Número total de pixeis: ' + str(final2.size))
print('Número total de pixeis com ferrugem: ' + str(tot_pixels))
print('Percentagem de pixeis com ferrugem: {:.1f}%'.format(perc))

if perc < 3:
    print('Imagem com pouca ou nenhuma corrosao')
elif perc < 10:
    print('Imagem com alguma corrosao')
else:
    print('Imagem bastante corroída')




# Imagem original
img = imutils.resize(img, width=n_width)
cv2.imshow("original", img)
# Imagem que indica onde há ferrugem
final = imutils.resize(final, width=n_width)
cv2.imshow("final", final)
# Display do histograma
cv2.waitKey(0)
plt.show()
