SELECT
judul,
count(*) as jumlahjudul
FROM buku_alvitarianikk.buku
group by id_kategori
