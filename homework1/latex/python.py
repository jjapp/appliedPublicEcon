import pandas as pd
import numpy as np

#import data visualization library
import plotly.plotly as py
import plotly.graph_objs as go
from plotly.offline import download_plotlyjs, init_notebook_mode, plot, iplot

#suppress warnings
import warnings
warnings.simplefilter("ignore")

#regression
import statsmodels.api as sm

#Read in the data
df=pd.read_stata('ps1.dta')

#Initial data munging

df['employed']=np.where(df['work']==1,1,0)
df['unemployed']=np.where(df['work']==0,1,0)
df['parent']=np.where(df['children']!=0,1,0)

#pivot by year and parent and then reset the index
df1=df.groupby(['year', 'parent']).sum()
df1=df1.reset_index()

#calculate the lfpr for both parents and no parents
df1['urate']=(df1['employed'])/(df1['employed']+df1['unemployed'])
parent=df1[df1['parent']==1]
nparent=df1[df1['parent']==0]

#Generate figure 1
# Add data
year = parent['year']
parentLMPR= parent['urate']
nparentLMPR = nparent['urate']


# Create and style traces
trace0 = go.Scatter(
    x = year,
    y = parentLMPR,
    name = 'W/ Children',
    line = dict(
        color = ('blue'),
        width = 2)
)
trace1 = go.Scatter(
    x = year,
    y = nparentLMPR,
    name = 'W/O Children',
    line = dict(
        color = ('red'),
        width = 2,)
)


data = [trace0, trace1]

# Edit the layout
layout = dict(title = 'Single Women Labor Market Participation Rates',
              xaxis = dict(title = 'Year'),
              yaxis = dict(title = 'LMPR'),
              )

fig = dict(data=data, layout=layout)
py.iplot(fig, filename='raw-plot')

#Reindexing to 1991
pBaseLevel=parent.iloc[0,3]
nBaseLevel=nparent.iloc[0,3]
parent['index']=parent['urate']/pBaseLevel
nparent['index']=nparent['urate']/nBaseLevel

#Generate figure 2
# Add data
year = parent['year']
piLMPR= parent['index']
niLMPR = nparent['index']


# Create and style traces
trace0 = go.Scatter(
    x = year,
    y = piLMPR,
    name = 'W/ Children',
    line = dict(
        color = ('blue'),
        width = 2)
)
trace1 = go.Scatter(
    x = year,
    y = niLMPR,
    name = 'W/O Children',
    line = dict(
        color = ('red'),
        width = 2,)
)


data = [trace0, trace1]

# Edit the layout
layout = dict(title = 'Single Women Labor Market 
			   Participation Rates, Indexed to 1991 rates',
              xaxis = dict(title = 'Year'),
              yaxis = dict(title = 'LMPR'),
              )

fig = dict(data=data, layout=layout)
py.iplot(fig, filename='index-plot')

#Calculating diff-in-diff
parent=df[df['parent']==1]
nparent=df[df['parent']!=1]

#calculate the average of the treatment group pre-1994
tc1=parent[parent['year']<1994]
tc1_empl=tc1['work'].sum()
tc1_mean=tc1_empl/len(tc1)

#calculate the average of the treatment group post-1994
tc2=parent[parent['year']>1993]
tc2_empl=tc2['work'].sum()
tc2_mean=tc2_empl/len(tc2)

#calculate the average of the control group pre-1994
cg1=nparent[nparent['year']<1994]
cg1_empl=cg1['work'].sum()
cg1_mean=cg1_empl/len(cg1)

#calculate the average of the control group post-1994
cg2=nparent[nparent['year']>1993]
cg2_empl=cg2['work'].sum()
cg2_mean=cg2_empl/len(cg2)

#calculate diffs
dif1=tc2_mean-tc1_mean
dif2=cg2_mean-cg1_mean
dif_dif=dif1-dif2

#print (tc1_mean, tc2_mean, cg1_mean, cg2_mean)

l1=["Treatment Group", len(parent), tc1_mean, tc2_mean, dif1, '']
l2=["Control Group", len(nparent), cg1_mean, cg2_mean, dif2, dif_dif]

table=[l1, l2]

headers=['Group', 'Sample Size', 'Pre-1993', 
		'Post-1993', 'Difference', 'Difference-in-differences']

table2=pd.DataFrame(table, columns=headers)

#table2

#diff-in-diff w/ one child and two children

one_child=df[df['children']==1]
two_child=df[df['children']>1]

#calculate the average of the treatment group with one child pre-1994
tg1c1=one_child[one_child['year']<1994]
tg1c1_empl=tg1c1['work'].sum()
tg1c1_mean=tg1c1_empl/len(tg1c1)

#calculate the average of the treatment group with one child post-1994
tg2c1=one_child[one_child['year']>1993]
tg2c1_empl=tg2c1['work'].sum()
tg2c1_mean=tg2c1_empl/len(tg2c1)

#calculate the average of the treatment group with two children pre-1994
tg1c2=two_child[two_child['year']<1994]
tg1c2_empl=tg1c2['work'].sum()
tg1c2_mean=tg1c2_empl/len(tg1c2)

#calculate the average of the treatment group with two child post-1994
tg2c2=two_child[two_child['year']>1993]
tg2c2_empl=tg2c2['work'].sum()
tg2c2_mean=tg2c2_empl/len(tg2c2)

#calculate diffs
dif3=tg1c2_mean-tg1c1_mean
dif4=tg2c2_mean-tg1c2_mean
dif_dif3=dif3-dif2
dif_dif4=dif4-dif2

l3=["One Child", len(one_child), tg1c1_mean, tg2c1_mean, dif3, '']
l4=["Control Group", len(nparent), cg1_mean, cg2_mean, dif2, dif_dif3]
l5=["Two Child", len(two_child), tg1c2_mean, tg2c2_mean, dif4, '']
l6=["Control Group", len(nparent), cg1_mean, cg2_mean, dif2, dif_dif4]

table=[l1, l2, l3, l4, l5, l6]

headers=['Group', 'Sample Size', 'Pre-1993', 'Post-1993', 
		'Difference', 'Difference-in-differences']

table2=pd.DataFrame(table, columns=headers)

#table2

#1st regression
df['Post1993']=np.where(df['year']<1994,0,1)
df['interact']=df['Post1993']*df['parent']
X=df[['parent', 'Post1993', 'interact']]
y=df['work']
mod=sm.OLS(y, sm.add_constant(X))
res=mod.fit()
print (res.summary())

#second regression
X=df[['parent', 'Post1993','urate', 
	'nonwhite', 'age', 'ed', 'interact']]
y=df['work']
mod=sm.OLS(y, sm.add_constant(X))
res=mod.fit()
print (res.summary())

#placebo regression

df2=df[df['year']<1994]
df2['Post1992']=np.where(df2['year']<1992,0,1)
df2['interact']=df2['Post1992']*df2['parent']
X=df2[['parent', 'Post1992','urate', 
	'nonwhite', 'age', 'ed', 'interact']]
y=df2['work']
mod=sm.OLS(y, sm.add_constant(X))
res=mod.fit()
print (res.summary())
\end{lstlisting}