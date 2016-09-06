from plio.utils.utils import find_in_dict


def create(data):
    if not data:
        raise Exception('Data is None')
        
    type = find_in_dict(data, 'type')
    if type != "test3":
        raise Exception(type, 'This is not a valid data type for test3')
    else:
        return ('Ran Test3')
