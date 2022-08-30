LinearRegression.R is the main script for this linear regression mini-project

The data used for this project is student-mat.csv and the seperator for the file is semi-colons (;)

PS: I didn't do any normalization for this mini-project but this can be added

All the visualisation made in the script will be added here with the descriptions and can be found in the graphs folder

First I checked the correlations between columns using the library corrplot and corrgram 
Related corrplot graph is:

![image](https://github.com/bahaozsahin/machine-learning-with-R/blob/main/linear-regression/graphs/correlation_plot.png?raw=true)

Related corrgram graph is:

![image](https://github.com/bahaozsahin/machine-learning-with-R/blob/main/linear-regression/graphs/corrgram_plot.png?raw=true)

Then, we checked the histogram for G3 values since this column is the column we will predict

![image](https://github.com/bahaozsahin/machine-learning-with-R/blob/main/linear-regression/graphs/hist_g3.png?raw=true)

After creating the model I graphed the residuals

![image](https://github.com/bahaozsahin/machine-learning-with-R/blob/main/linear-regression/graphs/residual_hist.png?raw=true)

Then I used built in plot(model) function to plot residuals for regression validation

![image](https://github.com/bahaozsahin/machine-learning-with-R/blob/main/linear-regression/graphs/res_plot1.png?raw=true)
![image](https://github.com/bahaozsahin/machine-learning-with-R/blob/main/linear-regression/graphs/res_plot2.png?raw=true)
![image](https://github.com/bahaozsahin/machine-learning-with-R/blob/main/linear-regression/graphs/res_plot3.png?raw=true)
![image](https://github.com/bahaozsahin/machine-learning-with-R/blob/main/linear-regression/graphs/res_plot4.png?raw=true)
