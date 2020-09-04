def is_sublist(sub_l, l, bidirectional=True):
    idxes = [l.index(i) for i in sub_l if i in l]
    if len(idxes) == len(sub_l):
        is_sublist = all([x - y == 1 for x, y in zip(idxes[1:], idxes[:-1])])
        is_reversed_sublist = all([y - x == 1 for x, y in zip(idxes[1:], idxes[:-1])])
        return is_sublist or bidirectional and is_reversed_sublist
    return False
