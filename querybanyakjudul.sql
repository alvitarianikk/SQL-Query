SELECT
judul,
count(*) as banyakjudul
FROM buku_alvitarianikk.buku
group by id_kategori