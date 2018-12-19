program linkedlist;
uses crt;

const garis = ('-----------------------------');
pesan = 'Linked list masih kosong';

type simpul=^data;
     data=record
nama,alamat:string;
berikut:simpul
end;

var awal,
akhir:simpul;
pilih:char;
cacah:integer;

function menu:char;
var p:char;

begin

clrscr;

gotoxy(30,3);writeln('DAFTAR MENU PILIHAN');
gotoxy(20,4);writeln('A. TAMBAH DEPAN LINKED LIST');
gotoxy(20,9);writeln('B. TAMBAH BELAKANG LINKED LIST');
gotoxy(20,10);writeln('C. TAMPIL ISI LINKED LIST');
gotoxy(20,11);writeln('D. SELESAI');
repeat
gotoxy(48,15);writeln(' ':10);
gotoxy(30,20);writeln('PILIH SALAH SATU');
p:=upcase(readkey);
until p in ['A'..'D'];
menu:=p;
end;

function simpul_baru:simpul;
var b:simpul;
begin
new(b);
with b^ do
begin
writeln('Nama  : ' );readln(nama);
writeln('Alamat  : ' );readln(alamat);
berikut:=nil;
end;

simpul_baru:=b
end;

procedure tambah_awal (n:integer);
var baru:simpul;
begin
if n <> 0 then
begin
writeln('Tambah depan linked list');
writeln(copy(garis,1,45));
end;
writeln;
baru:=simpul_baru;
if awal = nil then
akhir:=baru;
end;

procedure tambah_akhir (n:integer);
var baru:simpul;
begin
clrscr;
if n <> 0 then
begin
writeln('Tambah akhir linked list');
writeln(copy(garis,1,46));
end;
writeln;
baru:=simpul_baru;
if awal = nil then
awal:=baru
else
akhir^.berikut:=baru;
akhir:=baru;
end;

procedure baca_linkedlist;
var bantu:simpul;
i:integer;
begin
i:=1;
writeln('Membaca isi linkedlist');
writeln('Tekan <enter> untuk kembali ke menu');
writeln(copy(garis,1,42));
writeln;
if bantu=nil then
writeln('Data masih kosong')
else
bantu:=awal;
while bantu <> nil do
begin
writeln('simpul : ', i:3 ,' -> nama : ',bantu^.nama);
writeln(' ':15,' alamat  : ',bantu^.alamat);
bantu:=bantu^.berikut;
inc(i);
end;
repeat until keypressed;
end;

begin
cacah:=0;
awal:=nil;
akhir:=nil;
repeat
pilih:=menu;
clrscr;
case pilih of 'A':tambah_awal(1);
'B':tambah_akhir(1);
'C':baca_linkedlist;
end;
if pilih in ['A','B'] then inc(cacah)
until pilih = 'D'
end.
