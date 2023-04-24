--introducere unor procente asa incat sa avem un procent al produsului finit < sau > decat 100
savepoint a;
select * from produs_finit;
select * from reteta;

--procent final > 100
insert into Produs_finit values(null, 'Laptisor de matca capsule', 'Intarire sistem imunitar',27,131, (select id_ambalaj from Ambalaj where marime=75));

insert into Reteta values(206,(select id_mp from materia_prima where nume_produs='laptisor de matca'),80);
insert into Reteta values(206,(select id_mp from materia_prima where nume_produs='ulei de floarea soarelui'), 30);

--procent final<100
insert into Produs_finit values(null, 'Unguent','Antiinflamator',50, 120,(select id_ambalaj from Ambalaj where marime=100));
insert into Reteta values(207,(select id_mp from materia_prima where nume_produs='ceara'),50);
insert into Reteta values(207,(select id_mp from materia_prima where nume_produs='ulei de masline'), 5);
insert into Reteta values(207,(select id_mp from materia_prima where nume_produs='galbenele'),10);

select pf.denumire, sum(r.procent) "Procent total", case when sum(r.procent) > 100 then 'Reteta Gresita, procent>100' 
                                                         when sum(r.procent) < 100 then 'Reteta Gresita, procent<100'
                                                         else 'Reteta Corecta' end "Rezultat" 
                                                         from produs_finit pf, materia_prima mp, reteta r 
                                                         where pf.id_produs=r.produs_finit_id_produs and mp.id_mp=r.materia_prima_id_mp group by pf.denumire, pf.id_produs;


rollback to a;

alter sequence produs_finit_id_produs_seq restart start with 206;

