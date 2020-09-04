import math
import pickle
from bokeh.io import export_svgs
from bokeh.models import (
    BasicTickFormatter,
    ColumnDataSource,
)
from bokeh.plotting import figure
from collections import Counter

with open('stats.pkl', 'rb') as f:
    stats = pickle.load(f)

for h, stat in stats.items():
    print(h, stat)

ratios = {h: stat['total'] and stat['passed']/stat['total']
          for h, stat in stats.items()}
scenario = [str(k) + ' hops' for k in ratios.keys()]

p = figure(x_range=scenario, toolbar_location=None, tools='')
p.yaxis.axis_label = "Ratio"
p.xaxis.axis_label = "Scenario"
source = ColumnDataSource(data=dict(scenario=scenario,
                                    ratio=list(ratios.values())))
p.vbar(x='scenario', top='ratio', source=source, width=0.5)

p.xgrid.grid_line_color = None

p.output_backend = "svg"
p.xaxis.axis_label_text_font_size = '20pt'
p.xaxis.major_label_orientation = math.pi/2
p.xaxis.major_label_text_font_size = '20pt'
p.yaxis.axis_label_text_font_size = '20pt'
p.yaxis.major_label_text_font_size = '20pt'
p.yaxis.formatter = BasicTickFormatter(power_limit_low=-5)
p.x_range.range_padding = 0.1
p.y_range.start = 0
p.y_range.end = 0.0065
export_svgs(p, filename='./fig/proof_of_assumption.svg')
