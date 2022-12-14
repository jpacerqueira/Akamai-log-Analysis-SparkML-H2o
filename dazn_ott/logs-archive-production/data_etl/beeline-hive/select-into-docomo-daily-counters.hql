set hive.execution.engine=spark;
set hive.optimize.reducededuplication.min.reducer=4;
set hive.optimize.reducededuplication=true;
set hive.merge.mapfiles=true;
set hive.merge.mapredfiles=false;
set hive.merge.smallfiles.avgsize=16000000;
set hive.merge.size.per.task=256000000;
set hive.merge.sparkfiles=true;
set hive.auto.convert.join=true;
set hive.auto.convert.join.noconditionaltask=true;
set hive.auto.convert.join.noconditionaltask.size=1024000000 ; #(might need to increase for Spark, 200M)
set hive.optimize.bucketmapjoin.sortedmerge=false;
set hive.map.aggr.hash.percentmemory=0.5;
set hive.map.aggr=true;
set hive.optimize.sort.dynamic.partition=false;
set hive.stats.autogather=true;
set hive.stats.fetch.column.stats=true;
set hive.compute.query.using.stats=true;
set hive.limit.pushdown.memory.usage=0.4; #(MR and Spark)
set hive.optimize.index.filter=true;
set hive.exec.reducers.bytes.per.reducer=67108864;
set hive.smbjoin.cache.rows=10000;
set hive.fetch.task.conversion=more;
set hive.fetch.task.conversion.threshold=1073741824;
set hive.optimize.ppd=true;
set hive.prewarm.enabled=true;
set hive.prewarm.numcontainers=136;
set spark.executor.instances=136;
USE published_ott_dazn ;
SHOW TABLES ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170201 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170202 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170203 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170204 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170205 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170206 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170207 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170208 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170209 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170210 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170211 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170212 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170213 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170214 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170215 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170216 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170217 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170218 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170219 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170220 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170221 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170222 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170223 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170224 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170225 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170226 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170227 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170228 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170301 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170302 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170303 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170304 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170305 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170306 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170307 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170308 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170309 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170310 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170311 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170312 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170313 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170314 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170315 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170316 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170317 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170318 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170319 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170320 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170321 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170322 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170323 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170324 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170325 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170326 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170327 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170328 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170329 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170330 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170331 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170401 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170402 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170403 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170404 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170405 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170406 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170407 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170408 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170409 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170410 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170411 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170412 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170413 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170414 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170415 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170416 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170417 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170418 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170419 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170420 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170421 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170422 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170423 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170424 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170425 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170426 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170427 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170428 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170429 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170430 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170501 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170502 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170503 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170504 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170505 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170506 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170507 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170508 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170509 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170510 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170511 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170512 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170513 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170514 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170515 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170516 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170517 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170518 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170519 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170520 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170521 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170522 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170523 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170524 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170525 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170526 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170527 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170528 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170529 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170530 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170531 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170601 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170602 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170603 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170604 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170605 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170606 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170607 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170608 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170609 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170610 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170611 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170612 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170613 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170614 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170615 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170616 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170617 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170618 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170619 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170620 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170621 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170622 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170623 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170624 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170625 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170626 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170627 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170628 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170629 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
 SELECT count(*) as counter, 'PinPair' as type_rec from published_ott_dazn.massive_elb_logs where dt=20170630 and message like '%/jp/v1/Docomo/PinPair%' group by dt ;
#
MSCK REPAIR TABLE published_ott_dazn.docomo_daily_counters ;
#
