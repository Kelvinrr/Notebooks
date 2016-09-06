from plio.utils.utils import find_in_dict


def create(data):
    if not data:
        raise Exception('Data is None')

    type = find_in_dict(data, 'type')
    if type != "test2":
        raise Exception(type, 'This is not a valid data type for test2')
    else:
        return ('Ran Test2')
