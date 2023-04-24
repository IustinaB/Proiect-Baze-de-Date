--validare constrangere nume_produs din materia_prima
update materia_prima set nume_produs='1Ab' where id_mp=300;

--validare constragere unicitate
insert into materia_prima values (null, 'miere', 1, 235);

--validare constrangere stoc
update materia_prima set stoc=-3 where id_mp=300;

--validare constrangere pret
insert into produs_finit values (null, 'Sirop','Tonic imunitar', -24, 191, (select id_ambalaj from Ambalaj where marime=100));

--validare constrangere cantitate_pf
insert into produs_finit values (null, 'Unguent','Antiinflamator', 29, -11, (select id_ambalaj from Ambalaj where marime=100));

--validare constrangere cantitate_am
insert into ambalaj values(null, 300, -1,(select id_tip from tipuri_ambalaje where denumire='Borcan plastic'));

--validare unicitate denumire in tipuri_ambalaje
insert into tipuri_ambalaje values(null, 'Sticla');

--validare constrangere check denumire in tipuri_ambalaje
update tipuri_ambalaje set denumire='Sticla1' where id_tip=400;

--validare constrangere nr bucati din etichete
insert into etichete values (null, to_date('01.10.2022', 'DD.MM.YYYY'), -20, (select id_ambalaj from Ambalaj where marime=30),200);


--verificare daca se pot introduce procente mai mari de 99 in retete
insert into Reteta values((select id_produs from produs_finit where denumire='Unguent'),(select id_mp from materia_prima where nume_produs='ceara'),112);

--vizualizarea denumirii si a utilizarii produselor finite
select denumire, utilizare from produs_finit;

--vizualizare produselor din materia_prima si a retetelor din care fac parte 
select mp.nume_produs, r.produs_finit_id_produs from materia_prima mp inner join reteta r on mp.id_mp=r.materia_prima_id_mp ;

--vizualizare produs finit si marimea ambalajului in care urmeaza sa fie impachetat
select pf.denumire, a.marime from ambalaj a inner join produs_finit pf on a.id_ambalaj=pf.ambalaj_id_ambalaj;

--vizualizare denumire produs, utilizare si data fabricarii
select pf.denumire,pf.utilizare,e.data_fabricare from etichete e inner join produs_finit pf on e.produs_finit_id_produs=pf.id_produs;

--vizualizare denumire tipuri_ambalaje, marimea acestora si cantitatea 
select ta.denumire,a.marime,a.cantitate_am from tipuri_ambalaje ta inner join ambalaj a on ta.id_tip=a.tipuri_ambalaje_id_tip;

--vizualizarea tuturor produselor finite
select * from produs_finit;

--vizualizarea tuturor retetelor
select * from reteta;

--vizualizarea tipurilor de ambalaje
select * from tipuri_ambalaje;

--vizualizarea termenului
select * from termen;

--vizualizare materie prima
select * from materia_prima;

--vizualizarea produselor provenite din apicultura
select * from materia_prima where isApicol=1;

--vizualizarea tipurilor de sticle 
select ta.denumire, a.marime from ambalaj a, tipuri_ambalaje ta where a.tipuri_ambalaje_id_tip=400 and ta.id_tip=400;

--vizualizare etichete cu termen de valabilitate
select e.data_fabricare, t.data_expirarii from etichete e, termen t where e.etichete_id=t.etichete_etichete_id;

--vizualizare produs_final de o anumita cantitate
select * from produs_finit where denumire='Tinctura de propolis' and ambalaj_id_ambalaj=(select id_ambalaj from ambalaj where marime=250);

--vizualizarea numelui produselor finite, a ingredientelor care o compun si a procentelor acestora;
select pf.denumire, mp.nume_produs, r.procent from produs_finit pf, materia_prima mp, reteta r where pf.id_produs=r.produs_finit_id_produs and mp.id_mp=r.materia_prima_id_mp;

--vizualizarea unui produs finit, a ingredientelor ce il compun si procentele acestora
select pf.denumire, mp.nume_produs, r.procent from produs_finit pf, materia_prima mp, reteta r where pf.denumire='Crema maini' and pf.id_produs=r.produs_finit_id_produs and mp.id_mp=r.materia_prima_id_mp;

--vizualizarea denumirii produsului finit si a sumei procentelor ingredientelor ce ii apartin 
select pf.denumire, sum(r.procent) from produs_finit pf, materia_prima mp, reteta r where pf.id_produs=r.produs_finit_id_produs and mp.id_mp=r.materia_prima_id_mp group by denumire, id_produs;

--vizualizare denumire produs, data fabricarii si marimea ambalajului in care urmeaza sa fie ambalat produsul final
select pf.denumire, e.data_fabricare, a.marime from etichete e, produs_finit pf, ambalaj a where e.Produs_finit_ID_produs=pf.ID_produs and e.Ambalaj_ID_ambalaj=a.id_ambalaj;

--vizualizare denumire produs, data fabricarii, a expirarii tipul de ambalaj si marimea acestuia pentru produsul final
select pf.denumire, e.data_fabricare, t.data_expirarii, ta.denumire as "Tip ambalaj" , a.marime from etichete e, produs_finit pf, termen t, tipuri_ambalaje ta, ambalaj a where e.Produs_finit_ID_produs=pf.ID_produs and e.Ambalaj_ID_ambalaj=a.id_ambalaj and t.Etichete_Etichete_id=e.etichete_id and a.tipuri_ambalaje_id_tip=ta.id_tip;

--actualizare cantitate ingredient
update materia_prima set stoc=340 where id_mp=303;
select * from materia_prima;

--actualizare pret
update produs_finit set pret=30 where id_produs=200;
select * from produs_finit;

--produse bio
select pf.denumire, case when sum(r.procent)>=65 then 'Bio' else 'Nu este bio' end "Tip ingredient" from materia_prima mp, reteta r, produs_finit pf where mp.isApicol=1 and 
                                                        pf.id_produs=r.produs_finit_id_produs and mp.id_mp=r.materia_prima_id_mp
                                                        group by pf.denumire, pf.id_produs; 
                                                        
--stergere termen
savepoint a;
delete from termen where termen.etichete_etichete_id=6;
select * from termen;
rollback to a;

