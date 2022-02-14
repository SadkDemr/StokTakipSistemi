CREATE DATABASE STOK_TAKIP
create table Urun(
UrunID   int IDENTITY(1,1) ,  
CalisanID int ,
MarkaID int , 
UrunIsim  nvarchar(20) not null,
UrunModel  nvarchar(50) not null,
UrunSeriNo  int not null,--deðiþtir
UrunAdedi   int not null,
UrunTarihi   int not null,---year yap
UrunGelisFiyati  float not null,---smallmoney
UrunPerakendeSatisFiyati  float not null,--smallmoney
UrunTopranSatisFiyati   float not null,--smallmoney
UrunPerakendeKar   float not null,---sil cümle olarak yazdýr
UrunToptanKar  float not null---sil""""

constraint pk_UrunId primary key (UrunID)

);

--Urun TABLOSU ALTER CÜMLELERÝ
ALTER TABLE Urun add FOREIGN key (CalisanID) REFERENCES Calisan(CalisanID) ON DELETE NO ACTION
ALTER TABLE Urun add FOREIGN key (MarkaID) REFERENCES Marka(MarkaID) ON DELETE NO ACTION
ALTER TABLE Urun ALTER COLUMN UrunTarihi date not null;
ALTER TABLE Urun ALTER COLUMN UrunSeriNo nvarchar(6) not null;
ALTER TABLE Urun ALTER COLUMN UrunGelisFiyati smallmoney not null;
ALTER TABLE Urun ALTER COLUMN UrunTopranSatisFiyati smallmoney not null;
ALTER TABLE Urun ALTER COLUMN UrunPerakendeSatisFiyati smallmoney not null;
ALTER TABLE Urun DROP COLUMN UrunPerakendeKar;
ALTER TABLE Urun DROP COLUMN UrunToptanKar;
-------------------------------------------------------------------------
insert into Urun ([UrunIsim],[UrunModel],[UrunSeriNo],[UrunAdedi],[UrunTarihi],[UrunGelisFiyati],
[UrunPerakendeSatisFiyati],[UrunTopranSatisFiyati]) values ('Next','Uydu',000001,5,'2021-02-16',80,120,100)

insert into Urun ([UrunIsim],[UrunModel],[UrunSeriNo],[UrunAdedi],[UrunTarihi],[UrunGelisFiyati],
[UrunPerakendeSatisFiyati],[UrunTopranSatisFiyati]) values ('Botech','Uydu',000012,10,'2021-02-16',90,130,110)

SELECT*FROM Urun UPDATE Urun SET UrunIsim='Yumatu' WHERE UrunID = 1;
SELECT*FROM Urun UPDATE Urun SET UrunModel='Kumanda' WHERE UrunID=2;
SELECT*FROM Urun UPDATE Urun SET [UrunAdedi]=10 WHERE UrunID=2;
SELECT*FROM Urun UPDATE Urun SET [UrunGelisFiyati]=10 WHERE UrunID=2;


create table Customers(
CustomerID int IDENTITY(1,1) ,
CityID tinyint ,
CustomerTypID  int ,
IndirimID      int ,     
BayiID  int ,
UrunID   int ,
CustomerFirstName           nvarchar(20) not null,
CustomerLastName           nvarchar(20)not null,
CustomerEmail                  nvarchar(25)not null,
CustomerHomePhone       nvarchar(10),
CustomerWorkPhone         nvarchar(10),
CustomerCellPhone           nvarchar(10)not null,
CustomerAddress              nvarchar(300)not null, 
CustomerBirthDate            smalldatetime not null,----date yap
CustomerGender               nvarchar(6) not null
constraint pk_CustomerID primary key (CustomerID)
);
ALTER TABLE Customers add FOREIGN key (CityID) REFERENCES City(CityID)ON DELETE NO ACTION
ALTER TABLE Customers add FOREIGN key (CustomerTypID) REFERENCES CustomerTyp(CustomerTypID)ON DELETE NO ACTION
ALTER TABLE Customers add FOREIGN key (IndirimID) REFERENCES Indirimler(IndirimID)ON DELETE NO ACTION
ALTER TABLE Customers add FOREIGN key (BayiID) REFERENCES Bayi(BayiID)ON DELETE NO ACTION
ALTER TABLE Customers add FOREIGN key (UrunID) REFERENCES Urun(UrunID)ON DELETE NO ACTION
ALTER TABLE Customers ALTER COLUMN CustomerBirthDate date not null;


create table Indirimler(
IndirimID      int IDENTITY(1,1) ,    
UrunID   int ,
IndirimKodu   nvarchar(5) not null,
IndirimYuzdesi    float not null,
IndirimTarihi  nvarchar(20) not null,---date yap
IndirimliFiyat   float not null,
IndirimliFiyatKar float  not null--yazdýr

constraint pk_IndirimID  primary key (IndirimID)
);
ALTER TABLE Indirimler add FOREIGN key (UrunID) REFERENCES Urun(UrunID)ON DELETE NO ACTION
ALTER TABLE Indirimler ALTER COLUMN IndirimTarihi date not null;
ALTER TABLE Indirimler ALTER COLUMN IndirimliFiyat smallmoney not null;
ALTER TABLE Indirimler DROP COLUMN IndirimliFiyatKar;
ALTER TABLE Indirimler DROP COLUMN IndirimliFiyat;
------------------------------------------------------------------------------------
insert into Indirimler (IndirimKodu,IndirimYuzdesi,IndirimTarihi) 
values (12345,20.0,'2021-12-12')
insert into Indirimler (IndirimKodu,IndirimYuzdesi,IndirimTarihi) 
values (13345,10.0,'2021-12-12')
SELECT*FROM Indirimler UPDATE Indirimler SET IndirimYuzdesi=10.0; 

create table Calisan(
CalisanID    int IDENTITY(1,1) ,
CityID  tinyint ,
CalisanFirstName   nvarchar(20)not null,
CalisanLastName   nvarchar(20)not null,
CalisanEmail nvarchar(25)not null,
CalisanPassword    nvarchar(8)not null,
CalisanHomePhone  nvarchar(10),
CalisanCellPhone nvarchar(10)not null,
CalisanAddress  nvarchar(300) not null,                   
CalisanBirthDate   nvarchar(20)not null---date yap

constraint pk_CalisanID   primary key (CalisanID )
);
ALTER TABLE Calisan add FOREIGN key (CityID) REFERENCES City(CityID)ON DELETE NO ACTION
ALTER TABLE Calisan ALTER COLUMN CalisanBirthDate date not null;

create table Marka(
MarkaID  int  IDENTITY(1,1) ,
CityID  tinyint ,
MarkAdi  nvarchar(50)not null,
MarkaNumarasi nvarchar(50)not null,
MarkaAdress nvarchar(50)not null,
MarkaPazarlamaci nvarchar(50)not null,
MarkaCountry nvarchar(50)not null---deðiþ

constraint pk_MarkaID  primary key (MarkaID)
);
ALTER TABLE Marka add FOREIGN key (CityID) REFERENCES City(CityID)ON DELETE NO ACTION
ALTER TABLE Marka ALTER COLUMN MarkaCountry nvarchar(20) not null;
ALTER TABLE Marka DROP COLUMN MarkaNumarasi;
ALTER TABLE Marka ADD MarkaPhone nvarchar(10);
UPDATE Marka SET MarkaCountry='TÜRKÝYE'
----------------------------------------------
insert into Marka (MarkaID,CityID,MarkAdi,MarkaAdress,MarkaPhone,MarkaPazarlamaci,MarkaCountry)
values (3,4,'elifTic','bursa osmangazi',5432620180,'Sadýk','Türkiye')

create table CustomerTyp(
CustomerTypID  int IDENTITY(1,1),
CustomerTyp int---bit yap

constraint pk_CustomerTypID  primary key (CustomerTypID)
);
ALTER TABLE CustomerTyp ALTER COLUMN CustomerTyp bit not null;

create table Complaints(
ComplaintsID int IDENTITY(1,1),
CustomerID int ,
CustomerTypID  int,
ComplaintDate nvarchar(200)not null,
ComplaintDetails nvarchar(20)not null,
ComplaintStatus nvarchar(200)

constraint pk_ComplaintsID  primary key (ComplaintsID)
);
ALTER TABLE Complaints add FOREIGN key (CustomerID) REFERENCES Customers(CustomerID)ON DELETE NO ACTION
ALTER TABLE Complaints add FOREIGN key (CustomerTypID) REFERENCES CustomerTyp(CustomerTypID)ON DELETE NO ACTION
ALTER TABLE Complaints ALTER COLUMN ComplaintDate date not null;
ALTER TABLE Complaints ALTER COLUMN ComplaintDetails nvarchar(200) not null;
ALTER TABLE Complaints DROP COLUMN ComplaintStatus;


create table UrunIade(
UrunIadeID  int IDENTITY(1,1) ,
CustomerID int ,
UrunID   int ,
IndirimID      int , 
MarkaID  int   ,
UrunIadeSebebi  nvarchar(500)not null

constraint pk_UrunIadeID  primary key (UrunIadeID)
);
ALTER TABLE UrunIade add FOREIGN key (CustomerID) REFERENCES Customers(CustomerID)ON DELETE NO ACTION
ALTER TABLE UrunIade add FOREIGN key (UrunID) REFERENCES Urun(UrunID)ON DELETE NO ACTION
ALTER TABLE UrunIade add FOREIGN key (IndirimID) REFERENCES Indirimler(IndirimID)ON DELETE NO ACTION
ALTER TABLE UrunIade add FOREIGN key (MarkaID) REFERENCES Marka(MarkaID)ON DELETE NO ACTION




create table Bayi(
BayiID  int IDENTITY(1,1) ,
CityID  tinyint ,
CustomerTypID  int,
BayiFirstName nvarchar(20)not null,
BayiLastName nvarchar(20)not null,
BayiCompanyName  nvarchar(25)not null,
BayiAdress nvarchar(300)not null,
BayiWorkPhone nvarchar(10),
BayiCellPhone  nvarchar(10)not null
constraint pk_BayiID primary key (BayiID)
);
ALTER TABLE Bayi add FOREIGN key (CityID) REFERENCES City(CityID)ON DELETE NO ACTION
ALTER TABLE Bayi add FOREIGN key (CustomerTypID) REFERENCES CustomerTyp(CustomerTypID)ON DELETE NO ACTION

create table City(
CityID  tinyint IDENTITY(1,1) ,
CityName nchar(20)not null

constraint pk_CityID primary key (CityID)
);

create table Satis(
SatisID int IDENTITY(1,1),
CustomerID int ,
CalisanID int ,
SatisAdet int not null
constraint pk_SatisID primary key (SatisID)
);
ALTER TABLE Satis add FOREIGN key (CustomerID) REFERENCES Customers(CustomerID)ON DELETE NO ACTION
ALTER TABLE Satis add FOREIGN key (CalisanID) REFERENCES Calisan(CalisanID)ON DELETE NO ACTION
ALTER TABLE Satis ADD UrunID int;

-----------------------------------------------------------
SELECT CustomerGender,MAX(CustomerBirthDate) AS MAXYAS,MIN (CustomerBirthDate) AS MINYAS FROM Customers
GROUP BY CustomerGender
ORDER BY CustomerGender

SELECT UrunIsim, MIN(UrunGelisFiyati), MAX(UrunGelisFiyati),SUM(UrunGelisFiyati) FROM Urun
GROUP BY UrunIsim
ORDER BY UrunIsim

SELECT UrunIsim, MIN(UrunPerakendeSatisFiyati), MAX(UrunPerakendeSatisFiyati),SUM(UrunPerakendeSatisFiyati) FROM Urun
GROUP BY UrunIsim
ORDER BY UrunIsim

SELECT COUNT(CustomerID), CustomerBirthDate
FROM Customers
GROUP BY CustomerBirthDate
HAVING COUNT(CustomerID) <10;

SELECT CustomerBirthDate
FROM Customers
WHERE EXISTS
(SELECT UrunIsim FROM Urun);

SELECT S.CityName,C.CustomerFirstName,C.CustomerLastName,U.UrunIsim FROM City S
JOIN Customers C ON C.CustomerID=S.CityID
JOIN Urun U ON U.UrunID=S.CityID

SELECT U.UrunIsim,C.CustomerFirstName,C.CustomerLastName FROM Urun U
LEFT JOIN Customers C ON C.CustomerID=U.UrunID

SELECT C.CustomerFirstName,C.CustomerLastName,U.UrunIsim,U.UrunModel,U.UrunPerakendeSatisFiyati FROM Customers C
INNER JOIN Urun U ON U.UrunID=C.CustomerID

SELECT C.ComplaintDetails,S.CustomerFirstName,S.CustomerLastName FROM Complaints C
INNER JOIN Customers S ON S.CustomerID=C.ComplaintsID

SELECT U.UrunIsim,U.UrunModel,I.IndirimYuzdesi FROM Urun U
INNER JOIN Indirimler I ON U.UrunID=I.IndirimID

-------TRIGGERS------------------
CREATE TRIGGER Ekle
ON Marka
AFTER INSERT
AS
BEGIN
	SELECT 'YENÝ KAYIT YAPILDI'
END
insert into Marka (MarkAdi,MarkaAdress,MarkaPhone,MarkaPazarlamaci,MarkaCountry)
values ('EkleTic','istanbul osmangazi',5435624180,'mehmet','Türkiye')

insert into Marka (MarkAdi,MarkaAdress,MarkaPhone,MarkaPazarlamaci,MarkaCountry)
values ('ELÝFtÝC','osmangazi',5435424180,'Sadýk','Türkiye')


CREATE TRIGGER Ekle2
ON Urun
AFTER INSERT
AS
BEGIN
	SELECT 'YENÝ URUN EKLENDÝ'
END
insert into Urun ([UrunIsim],[UrunModel],[UrunSeriNo],[UrunAdedi],[UrunTarihi],[UrunGelisFiyati],
[UrunPerakendeSatisFiyati],[UrunTopranSatisFiyati]) values ('Pogitech','Fare',045501,5,'2022',120,180,200)
--------------------------------------------------------------------------------------------------------------------------------------------

---------STORED PROCEDURE-----------
CREATE PROCEDURE Fiyat
as
SELECT UrunIsim, MIN(UrunGelisFiyati) as MINFIYAT, MAX(UrunGelisFiyati) MAXFIYAT,SUM(UrunGelisFiyati) AS TOPLAM FROM Urun
GROUP BY UrunIsim

execute Fiyat


CREATE PROCEDURE Musteri
as
SELECT S.CityName,C.CustomerFirstName,C.CustomerLastName,U.UrunIsim FROM City S
JOIN Customers C ON C.CustomerID=S.CityID
JOIN Urun U ON U.UrunID=S.CityID

execute Musteri
----------------------------------------------------------------------------
----------------------VIEWS-------------------------------------------------
CREATE VIEW Calisanlar
AS
SELECT CalisanFirstName,CalisanLastName,UrunIsim FROM Calisan
INNER JOIN Urun ON Urun.UrunID=Calisan.CalisanID

SELECT * FROM Calisanlar

CREATE VIEW Urunler
AS
SELECT C.CustomerFirstName,C.CustomerLastName,U.UrunIsim,U.UrunModel,U.UrunPerakendeSatisFiyati FROM Customers C
INNER JOIN Urun U ON U.UrunID=C.CustomerID

SELECT * FROM Urunler

CREATE VIEW Customer
AS
SELECT U.UrunIsim,C.CustomerFirstName,C.CustomerLastName FROM Urun U
LEFT JOIN Customers C ON C.CustomerID=U.UrunID

SELECT * FROM Customer

CREATE VIEW ComplaintDetail
AS
SELECT C.ComplaintDetails,S.CustomerFirstName,S.CustomerLastName FROM Complaints C
INNER JOIN Customers S ON S.CustomerID=C.ComplaintsID

SELECT * FROM ComplaintDetail

CREATE VIEW Indirim
AS
SELECT U.UrunIsim,U.UrunModel,I.IndirimYuzdesi FROM Urun U
INNER JOIN Indirimler I ON U.UrunID=I.IndirimID

SELECT * FROM Indirim

-----------INDEX----------------------
CREATE INDEX Musteri ON Customers(CustomerFirstName,CustomerLastName,CustomerCellPhone,CustomerGender)

SELECT * FROM Customers

DROP INDEX Customers.Musteri;

--------- transaction------------
BEGIN TRANSACTION Urun1
insert into Urun ([UrunIsim],[UrunModel],[UrunSeriNo],[UrunAdedi],[UrunTarihi],[UrunGelisFiyati],
[UrunPerakendeSatisFiyati],[UrunTopranSatisFiyati]) values ('Samsung','Telefon',034199,100,'2021',5000,5500,10000)
COMMIT;
SELECT*FROM Urun;
ROLLBACK ;
