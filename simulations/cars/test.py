import xml.etree.ElementTree as ET
tree = ET.parse('neva.net.xml')
root = tree.getroot()

allowed_edges = []
for edge in root.findall('edge'):
    eid = edge.get('id')
    if eid and 'function' not in edge.attrib:  # исключаем internal
        etype = edge.get('type', '')
        if 'motorway' in etype or 'trunk' in etype:  # ваши критерии
            allowed_edges.append(eid)

# записать в XML
with open('allowed_edges.xml', 'w') as f:
    f.write('<edgedata><interval begin="0" end="86400">')
    for e in allowed_edges:
        f.write(f'<edge id="{e}" allow="authority"/>')
    f.write('</interval></edgedata>')
    
