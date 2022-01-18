import json

def read_input_file():

    data = []
    with open('inventory') as data_input:
        data = [l for l in data_input if l != "\n"]

    return data

def make_json_inventory():

    inventory = dict()
    keys, elements = [], []
    data = read_input_file()
    x = 0
    for d in range (0, len(data)):
        if data[d].count("]") != 0:
            group = data[d][1 : data[d].find("]")]
            inventory[group] = {"hosts": ''}
            keys.append(group)
            x += 1
        elif data[d].count("]") == 0:
            elements = data[d].split()
            for e in range (0, len(elements)):
                if elements[e].count("=") == 0:
                    inventory[keys[x - 1]]["hosts"] = {elements[e] : ''}
                else:
                    inventory[keys[x - 1]]["hosts"][elements[e - 1]] = \
                    {elements[e][ : elements[e].find("=")] : elements[e][elements[e].find("=") + 1 : ]}

    print(f"inventory {json.dumps(inventory)}")

    with open('inventory.json', 'w') as f:
        f.write(json.dumps(inventory))

make_json_inventory()
