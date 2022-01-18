import json

def read_input_file():

    data = []
    with open('inventory') as data_input:
        # data = [l.replace("\n", "") for l in data_input if l != "\n"]
        data = [l for l in data_input if l != "\n"]

    groups_count = 0
    for e in data:
        if e.count("[") != 0:
            groups_count += 1

    return data, groups_count

def make_template():
    data, groups_count = read_input_file()
    x = 1
    level = json.dumps({f"GROUP_NAME_{x}": {"hosts": {"HOST_NAME": {"ansible_host": f"IP_{x}"}}}})
    group = f"GROUP_NAME_{x}"
    # {"GROUP_NAME_1": {"hosts": {"HOST_NAME": {"ansible_host": "IP_1"}}}}
    level_part = {"hosts": {"HOST_NAME": {"ansible_host": f"IP_{x}"}}}
    inventory_template = f'"{group}":{level_part},' * groups_count
    inventory_template = inventory_template.replace("'", '"')[: -1]
    print(type(inventory_template))
    # inventory_template = json.dumps(inventory_template)
    print(inventory_template)
    # print(type(inventory_template))
    # for i in range (0, groups_count):
    #     inventory_template = {level * groups_count}

    # inventory = json.dumps(inventory_template)


def make_json_inventory():
    inventory = dict()
    keys, elements = [], []
    data, groups_count = read_input_file()
    print(data)
    x = 0
    for e in range (0, len(data)):
        if data[e].count("]") != 0:
            group = data[e][1 : data[e].find("]")]
            inventory[group] = {"host": ''}
            keys.append(group)
            x += 1
            # print(f"inventory_1 {inventory}")
        elif data[e].count("]") == 0:
            elements = data[e].split()
            for s in range (0, len(elements)):
                if elements[s].count("=") == 0:
                    print(inventory)
                    print(type(inventory))
                    inventory[keys[x - 1]]["host"] = elements[s]
                    # print(inventory[keys[x - 1]]["host"]) # = elements[s]
                    # print(type(inventory[keys[x - 1]]["host"]))
                else:
                    print(inventory[keys[x - 1]])#[elements[s - 1]]) #= elements[s] 
                    # inventory[data[e]] = s
        

    # print(f"inventory {inventory}")
    # print(keys)
    # print(elements)

    # with open('inventory.json') as f:
    #     f.write(json.loads(inventory))

# read_input_file()
# make_template()
make_json_inventory()
