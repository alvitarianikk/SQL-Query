/* Inner Join merupakan perintah untuk menggabungkan data dengan kata kunci kolom yang memiliki nilai sama, 
kita bisa lihat pada perintah ON b.id_kategori = kat_id_kategori memiliki nilai yang sama, 
baik di tabel buku maupun tabel kategori */

SELECT 
id_buku,
judul,
kategori 
	FROM 
	buku.bukuku b inner join
	buku.kategori kat ON b.id_kategori=kat.id_kategori;
