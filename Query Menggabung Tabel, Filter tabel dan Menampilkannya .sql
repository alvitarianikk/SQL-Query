SELECT d.*, s.*, buku.description 
FROM perpus.judul d, perpus.genre s, perpus.buku buku 
	where d.id = s.perpus_id and buku.id = s.buku_id and d.upload_at in ("2020-04-05","2020-04-08") and d.id in ('272143','272160','272274','272282','272296','272309','278045','278046','278069','278070','278073','278074');
