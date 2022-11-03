insert into clients (Cname, CPF, Adress) values
					('Mari', '12345678977', 'Rua das Alfafas'),
                    ('Claudio', '45678934811', 'Rua do lado de lá'),
                    ('Clara', '32648496855', 'Rua das Camélias'),
                    ('Douglas', '11223344559', 'Rua Lomba debaixo'),
                    ('Vanessa', '98765432199', 'Alameda passarela'),
                    ('Clédio', '99551133772', 'Largo do centro');
                    
select * from service_order;

insert into vehicle (VClientId, Lplate, Model, Color) values
					('7', 'JSH-4659', 'Telda', 'Verde'),
                    ('8', 'IWD-8763', 'Bonolla', 'Verde'),
                    ('9', 'LAS-2136', 'Tivit', 'Verde'),
                    ('10', 'OQW-7895', 'Tolo', 'Verde'),
                    ('11', 'DFO-9682', 'Algo', 'Verde'),
                    ('8', 'LKA-6583', 'Pandero', 'Verde'),
                    ('12', 'REG-2318', 'Plastic', 'Verde'),
                    ('7', 'OPR-3218', 'Binux', 'Verde');
                    
insert into team (Tname) values
				('Motor'),
                ('Susp e Freios'),
                ('Pintura e Lataria'),
                ('Elétrica');
                    
insert into mechanic (MTeamId, Mname, Speciality, Adress) values
			('3', 'Matheus', 'Pintura', 'Rua das couves'),
            ('2', 'Nelson', 'Suspensão', null),
            ('3', 'Claudio', 'Lataria', 'Rua Terdes'),
            ('1', 'Cleiton', 'Válvulas', 'Rua Calvis'),
            ('1', 'José', 'Cabeçote', 'Rua das Nordis'),
            ('4', 'Bruno', 'Ar-condicionado', 'Rua Novis fora'),
            ('2', 'João', 'Freio', 'Rua Setembro'),
            ('4', 'Mario', 'Módulos', 'Rua 14 de maio');
            
            
insert into service_order (OVehicleId, OTeamId, OrderStatus, Price, ConcluisonDate) values
							('6', '1', 'Concluído', '500.00', '2022-10-28'),
                            ('8', '4', 'Em Andamento', '350.00', '2022-11-05'),
                            ('3', '2', 'Em Análise', '450.00', '2022-11-12'),
                            ('5', '1', 'Em Análise', '1200.00', '2022-11-11');
                            
                            
insert into works (Descript, Price) values
					('Troca da correia dentada', '500.00'),
                    ('Revisão geral Elétrica', '350.00'),
                    ('Rev e manut dos freios', '450.00'),
                    ('Troca da junta do cabeçote', '1200.00'),
                    ('Pintura porta', '500.00'),
                    ('Troca filtro ar-condicionado', '350.00');
                    
                    
select * from service_order;

insert into works_in_service (WOrderId, WWorksId) values
								('1', '7'),
                                ('2', '8'),
                                ('3', '9'),
                                ('4', '10');
                                
insert into parts (Pname, Descript, Price, Origen) values
					('PastFreio', 'Pastilha de freio', '120', null),
                    ('Filtro', 'Filtro ar-condcionado', '70', null),
                    ('KitCorr', 'Kit Correia dentada', '350', null),
                    ('LampFarol', 'Lampada do Farol', '45', null),
                    ('Susp', 'Amortecedores', '750', null);
                    
select Mname as name, Speciality from mechanic where MTeam = 2;

delete from mechanic where MechanicId > 8;

select OrderStatus, ConcluisonDate, Price, Price * 0.85 as Desconto from service_order where OrderStatus = 'Em Análise';

select * from works order by Price asc;

select * from parts order by Price asc;

select * from works having Price < 499;

select Cname, Model, Lplate, Adress from clients inner join vehicle on ClientId = VClientId;