import streamlit as st
import os
import pandas as pd
import numpy as np

PATH = os.path.join(os.path.dirname(__file__), 'data', 'train.csv')

df = pd.read_csv(PATH)      

st.dataframe(df[['PassengerId', 'Age']])
