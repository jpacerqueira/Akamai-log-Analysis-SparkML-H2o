#
import findspark
findspark.init()
#
import pyspark
from pyspark.sql import functions as pfunc
from pyspark.sql import SQLContext
from pyspark.sql import Window, types
#
import re
import pandas as pd
import numpy as np
from pandas import DataFrame
from pyspark.sql.types import IntegerType
from pyspark.sql.types import FloatType
from pyspark.sql.functions import udf
from pyspark.sql.functions import *
from scipy.stats import kstest
from scipy import stats
#
from pyspark.ml.feature import Tokenizer
from pyspark.ml.feature import RegexTokenizer
#
#import org.apache.spark.ml.feature.NGram
from pyspark.ml.feature import NGram
#
from collections import Counter
#
from pyspark.ml.feature import NGram
#
from pyspark.ml.feature import NGram, CountVectorizer, VectorAssembler
from pyspark.ml import Pipeline
#
from pyspark.mllib.linalg import SparseVector, DenseVector
#
from pyspark.ml.feature import PCA
from pyspark.ml.linalg import Vectors
#
#  FILTER with PySpark SQL Functions F.
#
# Arguments
#
import argparse
## Parse date_of execution
parser = argparse.ArgumentParser()
parser.add_argument("--datev1", help="Execution Date")
args = parser.parse_args()
if args.datev1:
    processdate = args.datev1
# GENERAL PREPARATION SCRIPT
#
#  Date in format YYYYMMDD
process_date = processdate
if not process_date:
    process_date = "20181231"
#
sc = pyspark.SparkContext(appName="FraudCanada-AUTOML-Model-NGrams-CountVectorizer-KL-KS-Entropy")
sqlContext = SQLContext(sc)
#
input_most_frequent_df="hdfs:///data/staged/ott_dazn/advanced-model-data/the-most-frequent-fraud-hash_message/dt="+process_date
input_fraud="hdfs:///data/staged/ott_dazn/advanced-model-data/fraud-notfraud-canada-tokenizedwords-ngrams-5-features-85/dt="+process_date
#
input_file1="hdfs:///data/staged/ott_dazn/advanced-model-data/fraud-notfraud-canada-tokenizedwords-ngrams-5-features-85/dt="+process_date
output_file1="hdfs:///data/staged/ott_dazn/advanced-model-data/label-fraud-notfraud-data-model/dt="+process_date
preserve_training_input_file="hdfs:///data/staged/ott_dazn/advanced-model-data/preserve-training-output-automl-clean/dt="+process_date
#
output_h2o_tmp="hdfs:///tmp/advanced-model-data/dt="+process_date+"/"
#
import h2o
from h2o.automl import H2OAutoML
#
import subprocess
subprocess.run('unset http_proxy', shell=True)
#
import subprocess
subprocess.run('unset http_proxy', shell=True)
#
# Start an H2O virtual cluster that uses 6 gigs of RAM and 6 cores
h2o.init(ip="localhost",port=54321,max_mem_size = "6g", nthreads = 6) 
#
# Clean up the h2o cluster just in case
h2o.remove_all()
#
#  TRAINING PROCESS
#
print("Start Training Model NGrams Vectors KS KL Entropty")
#
# Horrible code :: close your eyes, is ugly
#
fraud_label_read_file=sqlContext.read.json(output_file1).repartition(1)
fraud_label_read_file.printSchema()
#
#
fraud_label_read_df=fraud_label_read_file\
.filter("hash_message IS NOT NULL")\
.filter("fraud_label IS NOT NULL")\
.filter("kl_fraud_words IS NOT NULL")\
.filter("ks_fraud_words IS NOT NULL")\
.filter("entropy_fraud_words IS NOT NULL")\
.filter("kl_notfraud_words IS NOT NULL")\
.filter("ks_notfraud_words IS NOT NULL")\
.filter("entropy_notfraud_words IS NOT NULL")\
.filter("features_85.type IS NOT NULL")\
.filter("features_85.size IS NOT NULL")\
.filter("features_85.indices IS NOT NULL")\
.filter("features_85.values IS NOT NULL")\
.filter("ngramscounts_7.type IS NOT NULL")\
.filter("ngramscounts_7.size IS NOT NULL")\
.filter("ngramscounts_7.indices IS NOT NULL")\
.filter("ngramscounts_7.values IS NOT NULL")\
.select(col('hash_message').cast('string'),col('fraud_label').cast('long'),\
        col('kl_fraud_words').cast('double'),col('ks_fraud_words').cast('double'),\
        col('entropy_fraud_words').cast('double'),\
        col('kl_notfraud_words').cast('double'), col('ks_notfraud_words').cast('double'),\
        col('entropy_notfraud_words').cast('double'),\
        col('features_85.type').alias('features85_type').cast('long'),\
        col('features_85.size').alias('features85_size').cast('long'),\
        col('features_85.indices').alias('features85_indices'),\
        col('features_85.values').alias('features85_values'),\
        col('ngramscounts_7.type').alias('ngramscounts7_type').cast('long'),\
        col('ngramscounts_7.size').alias('ngramscounts7_size').cast('long'),\
        col('ngramscounts_7.indices').alias('ngramscounts7_indices'),\
        col('ngramscounts_7.values').alias('ngramscounts7_values'))
fraud_label_read_df.printSchema()
#
# ABOVE ARE CASE ISSUES on struct Struct of features_85 and ngramscounts_7 
# Both cares conversion to DF valide type list
# Flat vars for each, individually and seperately from the original struct
#
# https://stackoverflow.com/questions/47401418/pyspark-conversion-to-array-types?rq=1 
#
#
fraud_fraud_label_read1_df=fraud_label_read_df.filter("fraud_label=1").repartition(1)\
.filter("hash_message IS NOT NULL")\
.filter("fraud_label IS NOT NULL")\
.filter("kl_fraud_words IS NOT NULL")\
.filter("ks_fraud_words IS NOT NULL")\
.filter("entropy_fraud_words IS NOT NULL")\
.filter("kl_notfraud_words IS NOT NULL")\
.filter("ks_notfraud_words IS NOT NULL")\
.filter("entropy_notfraud_words IS NOT NULL")\
.filter("features85_indices IS NOT NULL")\
.filter("features85_values IS NOT NULL")\
.filter("features85_type IS NOT NULL")\
.filter("features85_size IS NOT NULL")\
.filter("ngramscounts7_indices IS NOT NULL")\
.filter("ngramscounts7_values IS NOT NULL")\
.filter("ngramscounts7_type IS NOT NULL")\
.filter("ngramscounts7_size IS NOT NULL")\
.select(col('hash_message').cast('string'),col('fraud_label').cast('long'),\
        col('kl_fraud_words').cast('double'),col('ks_fraud_words').cast('double'),\
        col('entropy_fraud_words').cast('double'),\
        col('kl_notfraud_words').cast('double'), col('ks_notfraud_words').cast('double'),\
        col('entropy_notfraud_words').cast('double'),\
        col('features85_type').cast('long'),col('features85_size').cast('long'),\
        col('features85_indices'),col('features85_values'),\
        col('ngramscounts7_indices'),col('ngramscounts7_values'),\
        col('ngramscounts7_type').cast('long'),col('ngramscounts7_size').cast('long'))\
.persist(pyspark.StorageLevel.MEMORY_AND_DISK_2)
#
#
notfraud_fraud_label_read1_df=fraud_label_read_df.filter("fraud_label=0").repartition(1)\
.filter("hash_message IS NOT NULL")\
.filter("fraud_label IS NOT NULL")\
.filter("kl_fraud_words IS NOT NULL")\
.filter("ks_fraud_words IS NOT NULL")\
.filter("entropy_fraud_words IS NOT NULL")\
.filter("kl_notfraud_words IS NOT NULL")\
.filter("ks_notfraud_words IS NOT NULL")\
.filter("features85_indices IS NOT NULL")\
.filter("features85_values IS NOT NULL")\
.filter("features85_type IS NOT NULL")\
.filter("features85_size IS NOT NULL")\
.filter("ngramscounts7_indices IS NOT NULL")\
.filter("ngramscounts7_values IS NOT NULL")\
.filter("ngramscounts7_type IS NOT NULL")\
.filter("ngramscounts7_size IS NOT NULL")\
.select(col('hash_message').cast('string'),col('fraud_label').cast('long'),\
        col('kl_fraud_words').cast('double'),col('ks_fraud_words').cast('double'),\
        col('entropy_fraud_words').cast('double'),\
        col('kl_notfraud_words').cast('double'), col('ks_notfraud_words').cast('double'),\
        col('entropy_notfraud_words').cast('double'),\
        col('features85_type').cast('long'),col('features85_size').cast('long'),\
        col('features85_indices'),col('features85_values'),\
        col('ngramscounts7_indices'),col('ngramscounts7_values'),\
        col('ngramscounts7_type').cast('long'),col('ngramscounts7_size').cast('long'))\
.persist(pyspark.StorageLevel.MEMORY_AND_DISK_2)
#
fraud_fraud_label_read1_df.printSchema()
notfraud_fraud_label_read1_df.printSchema()
#
#
# Apply Quartiles over KL Function 
# https://stackoverflow.com/questions/51506820/pyspark-calculate-quartiles-based-on-id-and-classify-based-on-the-quartile-range
#
#fraud_fraud_label_read1_df.registerTempTable("fraud_fraud_label_read1_df_tb")
#quartile_f_df = sqlContext.sql("select hash_message, percentile_approx(cast(kl_fraud_words as double), 0.25) as Q1_value, percentile_approx(cast(kl_fraud_words as double), 0.5) as Q2_value, percentile_approx(cast(kl_fraud_words as double), 0.75) as Q3_value from fraud_fraud_label_read1_df_tb group by hash_message")
#
#fraud_fraud_label_read1_df=fraud_fraud_label_read1_df.join(quartile_f_df, fraud_fraud_label_read1_df.hash_message == quartile_f_df.hash_message, 'left_outer')
#fraud_label_qt_rand=fraud_fraud_label_read1_df.select(F.when(fraud_fraud_label_read1_df.kl_fraud_words < fraud_fraud_label_read1_df.Q1_value, '25').when(fraud_fraud_label_read1_df.kl_fraud_words.between(fraud_fraud_label_read1_df.Q1_value, fraud_fraud_label_read1_df.Q3_value), '50').when(fraud_fraud_label_read1_df.kl_fraud_words > fraud_fraud_label_read1_df.Q3_value, '75').alias('kl_fraud_words_quartile')).limit(200000)\
#.persist(pyspark.StorageLevel.MEMORY_AND_DISK_SER)
#
#notfraud_fraud_label_read1_df.registerTempTable("notfraud_fraud_label_read1_df_tb")
#quartile_nf_df = sqlContext.sql("select hash_message, percentile_approx(cast(kl_notfraud_words as double), 0.25) as Q1_value, percentile_approx(cast(kl_notfraud_words as double), 0.5) as Q2_value, percentile_approx(cast(kl_notfraud_words as double), 0.75) as Q3_value from notfraud_fraud_label_read1_df_tb group by hash_message")
#
#notfraud_fraud_label_read1_df=notfraud_fraud_label_read1_df.join(quartile_nf_df, notfraud_fraud_label_read1_df.hash_message == quartile_nf_df.hash_message, 'left_outer')
#notfraud_label_qt_rand=notfraud_fraud_label_read1_df.select(F.when(notfraud_fraud_label_read1_df.kl_fraud_words < notfraud_fraud_label_read1_df.Q1_value, '25').when(notfraud_fraud_label_read1_df.kl_fraud_words.between(notfraud_fraud_label_read1_df.Q1_value, notfraud_fraud_label_read1_df.Q3_value), '50').when(notfraud_fraud_label_read1_df.kl_fraud_words > notfraud_fraud_label_read1_df.Q3_value, '75').alias('kl_fraud_words_quartile')).limit(200000)\
#.persist(pyspark.StorageLevel.MEMORY_AND_DISK_SER)
#
#fraud_label_qt_rand.printSchema()
#notfraud_label_qt_rand.printSchema()
#
drop_list_cols=['features85_indices','features85_values','ngramscounts7_indices','ngramscounts7_values']
#
### 1.) https://stackoverflow.com/questions/38610559/convert-spark-dataframe-column-to-python-list
###    list(spark_df.select('mvv').toPandas()['mvv'])
### 2.) http://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.assign.html
###    df.assign(temp_f=lambda x: x['temp_c'] * 9 / 5 + 32,temp_k=lambda x: (x['temp_f'] +  459.67) * 5 / 9)
### 3.) https://stackoverflow.com/questions/43216411/pandas-flatten-a-list-of-list-within-a-column
###    df['var2'] = df['var2'].apply(np.ravel)
### 4.) Random xxx rows
###    df.orderBy(rand()).limit(n)
from pyspark.sql.functions import rand
#
#
fraud_label_train_pd_rand=fraud_fraud_label_read1_df\
.coalesce(1).filter("kl_fraud_words >= 0.0 AND kl_notfraud_words >= 0.0 ").orderBy(col('kl_fraud_words'))\
.limit(50000).persist(pyspark.StorageLevel.MEMORY_AND_DISK_SER)
#
fraud_label_train_pd_rand.printSchema()
#
ct1=fraud_label_train_pd_rand.count()
print("ct1="+str(ct1))
#
fraud_label_train_pd=fraud_label_train_pd_rand.limit(3600).toPandas()\
.assign(features85_list_indices=lambda x: x['features85_indices'].apply(np.ravel),\
        features85_list_values=lambda x: x['features85_values'].apply(np.ravel),\
        ngramscounts7_list_indices=lambda x: x['ngramscounts7_indices'].apply(np.ravel),\
        ngramscounts7_list_values=lambda x: x['ngramscounts7_values'].apply(np.ravel))\
.drop(drop_list_cols, axis=1, inplace=False)
#
fraud_label_train=h2o.H2OFrame(fraud_label_train_pd)
#
fraud_label_test_pd_rand=fraud_fraud_label_read1_df\
.coalesce(1).filter("kl_fraud_words >= 0.0 AND kl_notfraud_words >= 0.0 ").orderBy(col('kl_notfraud_words'))\
.limit(50000).persist(pyspark.StorageLevel.MEMORY_AND_DISK_SER)
#
fraud_label_test_pd_rand.printSchema()
#
ct2=fraud_label_test_pd_rand.count()
print("ct2="+str(ct2))
#
fraud_label_test_pd=fraud_label_test_pd_rand.limit(500).toPandas()\
.assign(features85_list_indices=lambda x: x['features85_indices'].apply(np.ravel),\
        features85_list_values=lambda x: x['features85_values'].apply(np.ravel),\
        ngramscounts7_list_indices=lambda x: x['ngramscounts7_indices'].apply(np.ravel),\
        ngramscounts7_list_values=lambda x: x['ngramscounts7_values'].apply(np.ravel))\
.drop(drop_list_cols, axis=1, inplace=False)
#
fraud_label_test=h2o.H2OFrame(fraud_label_test_pd)
#
not_fraud_label_train_pd_rand=notfraud_fraud_label_read1_df\
.coalesce(1).filter("kl_fraud_words >= 0.0 AND kl_notfraud_words >= 0.0 ").orderBy(col('kl_fraud_words'))\
.limit(50000).persist(pyspark.StorageLevel.MEMORY_AND_DISK_SER)
#
not_fraud_label_train_pd_rand.printSchema()
#
ct3=not_fraud_label_train_pd_rand.count()
print("ct3="+str(ct3))
#
not_fraud_label_train_pd=not_fraud_label_train_pd_rand.limit(3600).toPandas()\
.assign(features85_list_indices=lambda x: x['features85_indices'].apply(np.ravel),\
        features85_list_values=lambda x: x['features85_values'].apply(np.ravel),\
        ngramscounts7_list_indices=lambda x: x['ngramscounts7_indices'].apply(np.ravel),\
        ngramscounts7_list_values=lambda x: x['ngramscounts7_values'].apply(np.ravel))\
.drop(drop_list_cols, axis=1, inplace=False)
#
not_fraud_label_train=h2o.H2OFrame(not_fraud_label_train_pd)
#
not_fraud_label_test_pd_rand=notfraud_fraud_label_read1_df\
.coalesce(1).filter("kl_fraud_words >= 0.0 AND kl_notfraud_words >= 0.0  ").orderBy(col('kl_notfraud_words'))\
.limit(50000).persist(pyspark.StorageLevel.MEMORY_AND_DISK_SER)
#
not_fraud_label_test_pd_rand.printSchema()
#
ct4=not_fraud_label_test_pd_rand.count()
print("ct4="+str(ct4))
#
not_fraud_label_test_pd=not_fraud_label_test_pd_rand.limit(3500).toPandas()\
.assign(features85_list_indices=lambda x: x['features85_indices'].apply(np.ravel),\
        features85_list_values=lambda x: x['features85_values'].apply(np.ravel),\
        ngramscounts7_list_indices=lambda x: x['ngramscounts7_indices'].apply(np.ravel),\
        ngramscounts7_list_values=lambda x: x['ngramscounts7_values'].apply(np.ravel))\
.drop(drop_list_cols, axis=1, inplace=False)
#.orderBy(rand())\
#.sort(notfraud_fraud_label_read1_df.kl_notfraud_words.desc())\
not_fraud_label_test=h2o.H2OFrame(not_fraud_label_test_pd)
#
#
################# Use Two DataFrames ##################### - rbind() H2o Frames issue
#
#
###### TRAINING PROCESS ############
# RBIND "Merge" all of vars internal subset of data with fraud and with not_fraud
# function merge() doesn't work if both H2O/dataframes have same variables
#
train = fraud_label_train.rbind(not_fraud_label_train)
test = fraud_label_test.rbind(not_fraud_label_test)
#
#  Unpersist Dataframes indivilually releasing memmory from Cluster Nodes
#  While doing AUTOML use only memmory in the Driver Node and in H20 Cluster in gatewayNode
#
#fraud_label_train_pd_rand.unpersist() 
#fraud_label_test_pd_rand.unpersist() 
#not_fraud_label_train_pd_rand.unpersist() 
#not_fraud_label_test_pd_rand.unpersist() 
#
print("train")
print(train.head(10))
print("test")
print(test.head(10))
#
# Identify predictors and response
x = train.columns
#
# Fraud Label to be learned in the model from the atrributes of the ngram85 learned words
#
y= 'fraud_label'
x.remove(y)
#
# For binary classification, response should be a factor
train[y] = train[y].asfactor()
test[y] = test[y].asfactor()
#
#
# http://docs.h2o.ai/h2o/latest-stable/h2o-docs/automl.html
# Balance Classes to compensate unbalanced data
# Run AutoML for 50 base models (limited to 1 hour max runtime by default) 40min 2400secs // 3601 1h
aml = H2OAutoML(max_models=50, max_runtime_secs=2400 , seed=1999, exclude_algos=["DRF","GLM"])
aml.train(x=x, y=y, training_frame=train)
#
#preserve_training_output.write.json(preserve_training_output_file)
#
print("AutoML Modeling Done!")
#
# View the AutoML Leaderboard
lb = aml.leaderboard
lb.head(rows=lb.nrows)  # Print all rows instead of default (10 rows)
#
# The leader model is stored here
aml.leader
#
# Get model ids for all models in the AutoML Leaderboard
model_ids = list(aml.leaderboard['model_id'].as_data_frame().iloc[:,0])
print(model_ids)
# Get the "All Models" Stacked Ensemble model
se = h2o.get_model([mid for mid in model_ids if "StackedEnsemble_AllModels" in mid][0])
print(se)
# Get the Stacked Ensemble metalearner model
#metalearner = h2o.get_model(aml.leader.metalearner()['name'])
#metalearner.coef_norm()
#%matplotlib inline
#metalearner.std_coef_plot()
# If you need to generate predictions on a test set, you can make
# predictions directly on the `"H2OAutoML"` object, or on the leader
# model object directly

#preds = aml.predict(test)
# or:
preds = aml.leader.predict(test)
print("test")
print(test.head(10))
print("prediction")
print(preds.head(10))
#
#
print("Save Model For Future Usage")
aml.leader.download_mojo(path = "./projects/logs-archive-production/fraud-canada-tokenizedwords/notebooks/product_model_bin/ngrams7_features85_m50/v"+process_date+"/mojo", get_genmodel_jar = True)
# If you need to generate predictions on a test set, you can make
# predictions directly on the `"H2OAutoML"` object, or on the leader
# model object directly

#preds = aml.predict(test)
# or:
preds = aml.leader.predict(test)
print("test")
print(test.tail(10))
print("prediction")
print(preds.tail(10))
# If you need to generate predictions on a test set, you can make
# predictions directly on the `"H2OAutoML"` object, or on the leader
# model object directly

#preds = aml.predict(test)
# or:
preds_over_all_hf = aml.leader.predict(train)
path_out_file1="./projects/logs-archive-production/fraud-canada-tokenizedwords/notebooks/product_model_prediction/file_prediction_train_"+process_date+".csv"
output_pred_file=h2o.export_file(frame=preds_over_all_hf, path=path_out_file1, force=False)
#
train_over_all_hf = train
path_out_file2="./projects/logs-archive-production/fraud-canada-tokenizedwords/notebooks/product_model_prediction/file_train_"+process_date+".csv"
output_pred_file=h2o.export_file(frame=train_over_all_hf, path=path_out_file2, force=False)
#
preds_over_test_hf = aml.leader.predict(test)
path_out_file3="./projects/logs-archive-production/fraud-canada-tokenizedwords/notebooks/product_model_prediction/file_prediction_test_"+process_date+".csv"
output_pred_file=h2o.export_file(frame=preds_over_test_hf, path=path_out_file3, force=False)
#
train_over_tst_hf = test
path_out_file4="./projects/logs-archive-production/fraud-canada-tokenizedwords/notebooks/product_model_prediction/file_test_"+process_date+".csv"
output_pred_file=h2o.export_file(frame=train_over_tst_hf, path=path_out_file4, force=False)
#
sc.stop()
#