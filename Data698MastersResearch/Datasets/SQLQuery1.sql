

    select count(*) from testquery
	select count(*) from testquery2
	select count(*) from testquery3
  
  select t3.DateTime,t3.ManagedEntityGuid,t3.Alert, t1.Objectname, t1.CounterName, t1.SampleValue, t3.Priority, t3.Severity
	   from TestQuery t1 left outer join
	   TestQuery3 t3 on t1.ManagedEntityGuid = t3.ManagedEntityGuid
	   and t1.DateTime = t3.DateTime


