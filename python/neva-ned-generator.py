def gen_ned(enbs):
    n = len(enbs)

    lines = []
    lines.append("package fqwb_090426_omnetpp.simulations.cars;\n")
    lines.append("import simu5g.nodes.eNodeB;\n")
    lines.append("import simu5g.nodes.PgwStandard;\n")
    lines.append("import inet.node.ethernet.Eth10G;\n\n")

    lines.append("network Cars {\n")
    lines.append("    submodules:\n")

    # PGW
    lines.append("        pgw: PgwStandard;\n")

    # eNB
    for i, (name, x, y) in enumerate(enbs):
        lines.append(f"        {name}: eNodeB {{\n")
        lines.append(f'            @display("p={x},{y}");\n')
        lines.append("        }\n")

    lines.append("\n    connections allowunconnected:\n")

    # PGW connections
    for i, (name, _, _) in enumerate(enbs):
        lines.append(
            f"        pgw.pppg++ <--> Eth10G <--> {name}.ppp;\n"
        )

    # X2 linear chain
    lines.append("\n        # X2\n")
    for i in range(len(enbs) - 1):
        a = enbs[i][0]
        b = enbs[i + 1][0]

        lines.append(
            f"        {a}.x2++ <--> Eth10G <--> {b}.x2++;\n"
        )

    lines.append("}\n")

    return "".join(lines)

import xml.etree.ElementTree as ET


def load_enbs(xml_path):
    tree = ET.parse(xml_path)
    root = tree.getroot()

    enbs = []
    for i, node in enumerate(root.findall("enb")):
        x = float(node.get("x"))
        y = float(node.get("y"))

        name = f"eNodeB{i}"
        enbs.append((name, x, y))

    return enbs

def build_neighbors(enbs):
    n = len(enbs)
    neighbors = {i: [] for i in range(n)}

    for i in range(n):
        if i > 0:
            neighbors[i].append(i - 1)
        if i < n - 1:
            neighbors[i].append(i + 1)

    return neighbors


def gen_ini(enbs, neighbors):
    lines = []

    for i, (name, _, _) in enumerate(enbs):
        # MAC IDs
        lines.append(f"**.{name}.macCellId = {i+1}")
        lines.append(f"**.{name}.macNodeId = {i+1}")

        neigh = neighbors[i]

        # assign X2Apps dynamically
        lines.append(f"\n# {name} X2Apps")

        for app_idx, j in enumerate(neigh):
            target = enbs[j][0]
            lines.append(
                f'*.{name}.x2App[{app_idx}].client.connectAddress = "{target}%x2ppp{(i >> 1) & 1}"'
            )

    return "\n".join(lines)

def generate(xml_path):
    enbs = load_enbs(xml_path)

    ned = gen_ned(enbs)
    ini = gen_ini(enbs, build_neighbors(enbs))

    with open("Cars.ned", "w") as f:
        f.write(ned)

    with open("omnetpp.ini", "w") as f:
        f.write(ini)

    print(f"Generated {len(enbs)} eNBs")

generate("enb3km.xml")
