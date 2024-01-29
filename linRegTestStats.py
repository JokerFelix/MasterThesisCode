import statsmodels.api as sm
import pandas as pd

# Import the data from excel and only relevant cols
data = pd.read_excel("TestStats.xlsx", usecols=["GMAF Plugin ms",
                                                "yolov7 ms avg",
                                                "HumanDetections count",
                                                "NonHumanDetections count"])

# Get summary stats of the dataset.
print("Show first values of data: ")
print(data.head())

print("\nShow summary stats: ")
print(data.describe())

print("\nShow missing values: ")
print(data.isnull().sum())

# Select dependent and independent features
X = data[["HumanDetections count", "NonHumanDetections count"]]
X = sm.add_constant(X, prepend=False)
yInf = data["yolov7 ms avg"]
yPlug = data["GMAF Plugin ms"]

# Fit regression model of raw inference
modelInf = sm.OLS(yInf, X)
resultInf = modelInf.fit()

# Fir regression model of plugin
modelPlug = sm.OLS(yPlug, X)
resultPlug = modelPlug.fit()

# Output of regression for raw inference
print(resultInf.summary())
print(resultInf.summary().as_latex())

# Output of regression for plugin
print(resultPlug.summary())
print(resultPlug.summary().as_latex())
