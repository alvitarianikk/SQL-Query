SELECT 
id_buku,
judul,
kategori 
	FROM 
	buku_alvitarianikk.buku b inner join
	buku_alvitarianikk.kategori kat ON b.id_kategori=kat.id_kategori;
