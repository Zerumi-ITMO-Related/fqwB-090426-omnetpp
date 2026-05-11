import sumolib
import subprocess
import xml.etree.ElementTree as ET
import math
import os

NET_FILE = "neva.net.xml"
TRIP_FILE = "trip.xml"
ROUTE_FILE = "route.xml"
#STEP = 4800.0  # 4.8 km
#STEP = 1000.0  # 1.0 km
STEP = 3000.0

def write_trip():
    root = ET.Element("routes")
    ET.SubElement(root, "trip", {
        "id": "t0",
        "depart": "0",
        "from": "241668022",
        "to": "543518078"
    })
    ET.ElementTree(root).write(TRIP_FILE)


def run_duarouter():
    subprocess.run([
        "duarouter",
        "-n", NET_FILE,
        "-r", TRIP_FILE,
        "-o", ROUTE_FILE,
        "--ignore-errors"
    ], check=True)


def parse_route_edges():
    tree = ET.parse(ROUTE_FILE)
    root = tree.getroot()

    for veh in root.findall("vehicle"):
        route = veh.find("route")
        edges = route.attrib["edges"].split()
        return edges

    raise RuntimeError("Route not found")


def dist(a, b):
    return math.hypot(b[0] - a[0], b[1] - a[1])


def interpolate(a, b, d):
    total = dist(a, b)
    if total == 0:
        return a
    t = d / total
    return (a[0] + t * (b[0] - a[0]),
            a[1] + t * (b[1] - a[1]))


def normal_offset(p1, p2, offset):
    dx = p2[0] - p1[0]
    dy = p2[1] - p1[1]

    length = math.hypot(dx, dy)
    if length == 0:
        return (0.0, 0.0)

    # нормаль
    nx = -dy / length
    ny = dx / length

    return (nx * offset, ny * offset)


def generate_enb_positions(net, edges, flip_y=True):
    # Собираем все координаты из сети для нахождения границ
    xs, ys = [], []
    for edge in net.getEdges():
        shape = edge.getLane(0).getShape()
        for (x, y) in shape:
            xs.append(x)
            ys.append(y)
    min_y, max_y = min(ys), max(ys)
    center_y = (min_y + max_y) / 2.0

    points = []
    acc = 0.0
    next_target = STEP

    for edge_id in edges:
        edge = net.getEdge(edge_id)
        lane = edge.getLane(0)
        shape = lane.getShape()

        for i in range(len(shape) - 1):
            p1 = shape[i]
            p2 = shape[i + 1]
            seg_len = dist(p1, p2)

            while acc + seg_len >= next_target:
                remain = next_target - acc
                pos = interpolate(p1, p2, remain)
                offset_vec = normal_offset(p1, p2, 30.0)
                shifted = (pos[0] + offset_vec[0],
                           pos[1] + offset_vec[1])
                if flip_y:
                    shifted = (shifted[0], 2 * center_y - shifted[1])
                points.append(shifted)
                next_target += STEP

            acc += seg_len

    return points

def main():
    write_trip()
    run_duarouter()

    net = sumolib.net.readNet(NET_FILE)
    edges = parse_route_edges()

    points = generate_enb_positions(net, edges)

    print("<eNBs>")
    for (x, y) in points:
        print(f"<enb x=\"{x:.2f}\" y=\"{y:.2f}\" z=\"0.0\"/>")
    print("</eNBs>")
    print (f"Generated {len(points)} points")

if __name__ == "__main__":
    main()
