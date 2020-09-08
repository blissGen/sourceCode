"test"

from cv2 import cv2
import numpy as np

img = cv2.imread('Data/00.jpg')

cv2.namedWindow('Window', cv2.WINDOW_NORMAL)
cv2.resizeWindow('Window', 600, 600)

cv2.imshow('Window', img)
#cv2.imwrite('Output/test.png', img)

cv2.waitKey(0)
cv2.destroyAllWindows()
