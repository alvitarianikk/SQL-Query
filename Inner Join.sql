/* Inner Join merupakan perintah untuk menggabungkan data dengan kata kunci kolom yang memiliki nilai sama, 
kita bisa lihat pada perintah ON b.id_kategori = kat_id_kategori memiliki nilai yang sama, 
baik di tabel buku maupun tabel kategori . Berikut adalah hasil dari Inner Join tabel. */

SELECT 
id_buku,
judul,
kategori 
	FROM 
	buku_alvitarianikk.buku b inner join
	buku_alvitarianikk.kategori kat ON b.id_kategori=kat.id_kategori;
