SELECT d.*, s.*, rc.description 
FROM autodebet_new.payment_due d, autodebet_new.payment_success s, autodebet_new.rc rc 
	where d.id = s.payment_due_id and rc.id = s.rc_id and d.executed_at in ("2020-04-05","2020-04-08") and d.id in ('272143','272160','272274','272282','272296','272309','278045','278046','278069','278070','278073','278074');