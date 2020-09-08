#batch image processing

import os
import subprocess
import glob
from cv2 import cv2
import numpy as np

def main():
    path1 = 'Data/'
    path2 = 'Output/'
    backPath = '../'
    sorceContent = '00.mov'
    deletePath1 = 'Data/*'
    deletePath2 = 'Output/*.png'

    kernel = np.ones((5, 5), np.uint8)

    os.chdir(path1)
    subprocess.call(['ffmpeg', '-i', '00.mov', '-r', '23', 'frames%06d.png'])
    os.remove(sorceContent)

    os.chdir(backPath)
    dirs = os.listdir(path1)
    for frame in dirs:
        if not frame.startswith('.'):
            print(frame)
            img = cv2.imread(os.path.join(path1, frame))
            img_dilation = cv2.dilate(img, kernel, iterations=15)
            cv2.imwrite('Output/' + str(frame), img_dilation)
            cv2.waitKey(0)
            cv2.destroyAllWindows()
    files1 = glob.glob(deletePath1)
    for i in files1:
        os.remove(i)
    os.chdir(path2)
    #subprocess.call(['mogrify', '*.png', '-spread', '40', '*.png'])
    subprocess.call(['ffmpeg', '-i', 'frames%06d.png', '-framerate', '23', '-pix_fmt', 'yuv420p', 'process.mov'])            
    os.chdir(backPath) 
    files2 = glob.glob(deletePath2)
    for j in files2:
        os.remove(j)
if __name__ == "__main__":
    main()
