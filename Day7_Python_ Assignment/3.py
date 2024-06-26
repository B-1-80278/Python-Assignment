# Write a Pandas program to convert a dictionary to a Pandas series.
# Sample dictionary: d1 = {'a': 100, 'b': 200, 'c':300, 'd':400, 'e':800}

import pandas as pd

d1 = {'a': 100, 'b': 200, 'c':300, 'd':400, 'e':800}

panda_series = pd.Series(d1.values(), index=d1.keys())
# or
# panda_series = pd.Series(d1)

print(panda_series)

