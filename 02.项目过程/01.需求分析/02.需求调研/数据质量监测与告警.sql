--明细
SELECT A2.Task_Name                                ---检核规则名称
,A1.Error_Level_Cd                                  ---错误级别：0正常 1警告 2错误 3严重错误 9异常
,A1.Tx_Date                                         ---检核数据日期                               
,A1.TaskRunTime                                     ---检核规则运行时间
,A2.DQID                                            ---检核规则ID
FROM M07_CHECKRESULT A1
INNER JOIN M07_CHECKLIST A2  
ON A1.DQID = A2.DQID
WHERE A1.Error_Level_Cd in (1,2,3,9)
  AND A1.tx_date = '2017-05-02'
  AND A2.Start_Dt <= A1.TaskRunTime  
  AND A2.End_Dt > A1.TaskRunTime
  
--汇总
SELECT 
 A1.Error_Level_Cd                                  ---错误级别：0正常 1警告 2错误 3严重错误 9异常
,count(*)
FROM M07_CHECKRESULT A1
INNER JOIN M07_CHECKLIST A2  
ON A1.DQID = A2.DQID
WHERE A1.Error_Level_Cd in (1,2,3,9)
  AND A1.tx_date = '2017-05-02'
  AND A2.Start_Dt <= A1.TaskRunTime  
  AND A2.End_Dt > A1.TaskRunTime
 GROUP by A1.Error_Level_Cd
