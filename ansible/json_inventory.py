import json

def read_input_file():

    data = []
    with open('inventory') as data_input:
        data = [l.replace("\n", "") for l in data_input if l != "\n"]
    print(data)

def make_json_inventory():
    inventory = dict()
    

    with open('inventory.json') as f:
        f.write(json.loads(inventory))

read_input_file()
# make_json_inventory()
