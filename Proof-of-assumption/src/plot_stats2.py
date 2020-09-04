import math
import pandas as pd
import pickle
from bokeh.core.properties import value
from bokeh.io import export_svgs
from bokeh.models import (
    ColumnDataSource,
    LabelSet,
)
from bokeh.palettes import (
    Blues,
    Oranges,
)
from bokeh.plotting import figure
from bokeh.transform import dodge
from collections import Counter
from pathlib import Path


RATES = {
    'attackers-hop-limit1': 0.00009854158454867954,
    'attackers-hop-limit2': 0.0006377551020408164,
    'attackers-hop-limit3': 0.001349527665317139,
    'attackers-hop-limit4': 0.0016181229773462782,
    'attackers-hop-limit5': 0.0016366612111292962,
    'attackers-hop-limit6': 0.0016863406408094434,
    'legitimate-users': 0.0014144271570014144,
}

stats = []
path = Path('./simulations/')
for path in sorted(path.glob('*')):
    with path.open('rb') as f:
        stats.append(
            dict(
                sender_type=path.stem,
                data=pickle.load(f)
            ))

max_hop = max([max(stat['data']) for stat in stats])
hops = list(range(max_hop))
row_values = {}
for stat in stats:
    sender_type = stat['sender_type']
    rate = RATES[sender_type]
    row_value = [stat['data'][hop]['passed'] * rate if hop in stat['data'] else 0 for hop in hops]
    row_value.append(sum(row_value))
    row_values[sender_type] = row_value

df = pd.DataFrame(row_values, columns=[stat['sender_type'] for stat in stats])
df['scheme'] = ['Proposed'] * 6 + ['Conventional']
df['hop'] = [f'{h} hops' for h in range(max_hop)] + ['not classified']
group = df.groupby(['scheme', 'hop'])

p = figure(x_range=group, y_range=(0, 1), plot_width=685, plot_height=635, toolbar_location=None, tools="")
p.circle(0, 0, size=0.00000001, color= "#ffffff", legend='Destination')
for i, colmun in enumerate(df.columns[:-3]):
    x = dodge('scheme_hop', 0 - 0.12 * (math.floor(len(df.columns[:-2])/2) - i), range=p.x_range)
    y = colmun + '_mean'
    p.vbar(x=x, top=y, width=0.05, source=group, color=Oranges[9][i], legend=value(f'within {i+1}hops from TL (attackers)'))
p.vbar(x=dodge('scheme_hop',  0 - 0.12 * (math.floor(len(stats)/2) - 6), range=p.x_range), top='legitimate-users_mean', width=0.05, source=group, color=Blues[9][4], legend=value("random (legitimate users)"))

p.legend.label_text_font_size = '14pt'
p.legend.location = "top_right"
p.output_backend = "svg"
p.xaxis.axis_label_text_font_size = '20pt'
p.xaxis.group_text_font_size = '20pt'
p.yaxis.axis_label = "Ratio"
p.yaxis.axis_label_text_font_size = '20pt'
p.xaxis.major_label_orientation = math.pi/2
p.xaxis.major_label_text_font_size = '20pt'
p.yaxis.major_label_text_font_size = '20pt'
p.xgrid.grid_line_color = None
p.x_range.range_padding = 0.05
p.y_range.end = 1.05
export_svgs(p, filename='./fig/proof_of_assumption2.svg')
