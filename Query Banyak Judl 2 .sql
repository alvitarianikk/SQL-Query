SELECT
judul,
count(*) as jumlahjudul
FROM buku.bukuku
group by id_kategori
