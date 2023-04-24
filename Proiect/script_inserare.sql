insert into Materia_prima values (null, 'miere', 1, 130);
insert into Materia_prima values (null, 'ceara', 1, 230);
insert into Materia_prima values (null, 'propolis', 1, 160);   
insert into Materia_prima values (null, 'laptisor de matca', 1, 230); 
insert into Materia_prima values (null, 'alcool etilic', 0, 232);
insert into Materia_prima values (null, 'unt de shea',0,126);
insert into Materia_prima values (null, 'acid hialuronic', 0, 218);
insert into Materia_prima values (null, 'ulei de floarea soarelui',0, 327);
insert into Materia_prima values (null, 'ghimbir',0,273);
insert into Materia_prima values (null, 'acid lactic', 0, 311);
insert into Materia_prima values (null, 'ulei de masline',0, 243);
insert into Materia_prima values (null, 'galbenele', 0, 269);
select * from materia_prima;


insert into Tipuri_Ambalaje values (null, 'Sticla');
insert into Tipuri_Ambalaje values (null, 'Borcan sticla');
insert into Tipuri_Ambalaje values (null, 'Tub'); 
insert into Tipuri_Ambalaje values (null, 'Borcan plastic');
select * from Tipuri_ambalaje;


insert into Ambalaj values(null, 30, 240, (select id_tip from tipuri_ambalaje where denumire='Sticla'));
insert into Ambalaj values(null, 250, 173, (select id_tip from tipuri_ambalaje where denumire='Sticla'));
insert into Ambalaj values(null, 75, 159 ,(select id_tip from tipuri_ambalaje where denumire='Tub'));
insert into Ambalaj values(null, 300, 221,(select id_tip from tipuri_ambalaje where denumire='Borcan plastic'));
insert into Ambalaj values(null, 100, 322,(select id_tip from tipuri_ambalaje where denumire='Sticla'));
insert into Ambalaj values(null, 50, 240,(select id_tip from tipuri_ambalaje where denumire='Borcan sticla'));
select * from ambalaj;

insert into Produs_finit values(null, 'Tinctura de propolis', 'Efect analgezic',21, 120, (select id_ambalaj from Ambalaj where marime=30));
insert into Produs_finit values(null, 'Tinctura de propolis', 'Efect analgezic', 71, 100,(select id_ambalaj from Ambalaj where marime=250));
insert into Produs_finit values(null, 'Crema maini','Hidratarea pielii',10, 139, (select id_ambalaj from Ambalaj where marime=75));
insert into Produs_finit values(null, 'Laptisor de matca capsule', 'Intarire sistem imunitar',75,13, (select id_ambalaj from Ambalaj where marime=300));
insert into Produs_finit values(null, 'Sirop','Tonic imunitar', 24, 191, (select id_ambalaj from Ambalaj where marime=100));
insert into Produs_finit values(null, 'Unguent','Antiinflamator',38, 170,(select id_ambalaj from Ambalaj where marime=50));
select * from produs_finit;

insert into Reteta values(200, (select id_mp from materia_prima where nume_produs='propolis'), 65);
insert into Reteta values((select id_produs from produs_finit where denumire='Tinctura de propolis' and ambalaj_id_ambalaj=(select id_ambalaj from Ambalaj where marime=30)), (select id_mp from materia_prima where nume_produs='alcool etilic'), 35);
insert into Reteta values((select id_produs from produs_finit where denumire='Tinctura de propolis' and ambalaj_id_ambalaj=(select id_ambalaj from Ambalaj where marime=250)), (select id_mp from materia_prima where nume_produs='propolis'), 70);
insert into Reteta values((select id_produs from produs_finit where denumire='Tinctura de propolis' and ambalaj_id_ambalaj=(select id_ambalaj from Ambalaj where marime=250)), (select id_mp from materia_prima where nume_produs='alcool etilic'), 30);
insert into Reteta values((select id_produs from produs_finit where denumire='Crema maini'), (select id_mp from materia_prima where nume_produs='miere'),30);
insert into Reteta values((select id_produs from produs_finit where denumire='Crema maini'),(select id_mp from materia_prima where nume_produs='unt de shea'),27);
insert into Reteta values((select id_produs from produs_finit where denumire='Crema maini'),(select id_mp from materia_prima where nume_produs='acid hialuronic'),21);
insert into Reteta values((select id_produs from produs_finit where denumire='Crema maini'),(select id_mp from materia_prima where nume_produs='propolis'), 22);
insert into Reteta values((select id_produs from produs_finit where denumire='Laptisor de matca capsule'),(select id_mp from materia_prima where nume_produs='laptisor de matca'),70);
insert into Reteta values((select id_produs from produs_finit where denumire='Laptisor de matca capsule'),(select id_mp from materia_prima where nume_produs='ulei de floarea soarelui'), 30);
insert into Reteta values((select id_produs from produs_finit where denumire='Sirop'),(select id_mp from materia_prima where nume_produs='miere'),40);
insert into Reteta values((select id_produs from produs_finit where denumire='Sirop'), (select id_mp from materia_prima where nume_produs='propolis'), 25);
insert into Reteta values((select id_produs from produs_finit where denumire='Sirop'),(select id_mp from materia_prima where nume_produs='ghimbir'),15);
insert into Reteta values((select id_produs from produs_finit where denumire='Sirop'),(select id_mp from materia_prima where nume_produs='acid lactic'), 20);
insert into Reteta values((select id_produs from produs_finit where denumire='Unguent'),(select id_mp from materia_prima where nume_produs='ceara'),50);
insert into Reteta values((select id_produs from produs_finit where denumire='Unguent'),(select id_mp from materia_prima where nume_produs='ulei de masline'), 25);
insert into Reteta values((select id_produs from produs_finit where denumire='Unguent'),(select id_mp from materia_prima where nume_produs='galbenele'),25);
select * from reteta;

insert into Etichete values (null, to_date('11.10.2022', 'DD.MM.YYYY'), 200, (select id_ambalaj from Ambalaj where marime=30),200);
insert into Etichete values (null, to_date('09.09.2022', 'DD.MM.YYYY'), 150, (select id_ambalaj from Ambalaj where marime=250), 201);
insert into Etichete values (null, to_date('13.11.2022','DD.MM.YYYY'), 317, (select id_ambalaj from Ambalaj where marime=75),(select id_produs from produs_finit where denumire='Crema maini'));
insert into Etichete values (null, to_date('21.12.2022','DD.MM.YYYY'), 215, (select id_ambalaj from Ambalaj where marime=300), (select id_produs from produs_finit where denumire='Laptisor de matca capsule'));
insert into Etichete values (null, to_date('12.12.2022','DD.MM.YYYY'),132,(select id_ambalaj from Ambalaj where marime=100), (select id_produs from produs_finit where denumire='Sirop'));
insert into Etichete values (null, to_date('25.11.2022','DD.MM.YYYY'), 240,(select id_ambalaj from Ambalaj where marime=50),(select id_produs from produs_finit where denumire='Unguent'));
select * from etichete;

insert into Termen values (to_date('11.02.2024','DD.MM.YYYY'),1);
insert into Termen values (to_date('08.07.2025','DD.MM.YYYY'),2);
insert into Termen values (to_date('06.10.2024','DD.MM.YYYY'),3);
insert into Termen values (to_date('14.01.2025','DD.MM.YYYY'),4);
insert into Termen values (to_date('05.07.2024','DD.MM.YYYY'),5);
insert into Termen values (to_date('24.12.2025','DD.MM.YYYY'),6);
select * from termen;
