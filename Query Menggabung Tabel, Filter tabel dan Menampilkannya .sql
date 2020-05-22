SELECT 
d.*, s.*, pinjam.description 
FROM 
perpus.koleksi d, perpus.genre s, perpus.pinjam pinjam 
	where 
	d.id = s.koleksi_id 
	and
	pinjam.id = s.pinjam_id 
	and 
	d.upload_at in ("2020-04-05","2020-04-08") 
	and 
	d.id in ('272143','272160','272274','272282','272296','272309','278045','278046','278069','278070','278073','278074');
