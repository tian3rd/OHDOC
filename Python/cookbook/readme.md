## Cook it up

Q: How to find out the element in a list with the most occurrences?
A:

Q: How to properly set the file size limit for the logger file (don't want it to grow out of control).
A: Lose basicConfig() and use RotatingFileHandler as suggested here: https://stackoverflow.com/questions/24505145/how-to-limit-log-file-size-in-python

Q: How to log properly?
A: 1. Video guide: https://www.youtube.com/watch?v=HGOBQPFzWKo&t=8410s 2.

Q: How to save data of x and y axis to a csv file using `numpy`?
A: `np.savetxt('filename', np.vstack((x,y)).T, delimiter=', ')`
