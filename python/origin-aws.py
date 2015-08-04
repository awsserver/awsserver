import sys


def distance(point):
    x, y = point.split()
    return float(x) + float(y)


def main(points):
    if len(out) <= K:
        if not len(out):
            out.append(points)
        else:
            for i in range(len(out)):
                if distance(points) < distance(out[i]):
                    out.insert(i, points)
                    break
                elif len(out) < K:
                    out.append(points)

if __name__ == '__main__':
    K = int(sys.stdin.readline().strip())
    out = []
    while True:
        data = sys.stdin.readline().strip()
        if not data:
            break
        main(data)
    print out[:K]
