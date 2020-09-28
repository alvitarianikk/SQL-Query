SELECT
judul,
count(*) as jumlahjudul
FROM buku.buku
group by id_kategori
