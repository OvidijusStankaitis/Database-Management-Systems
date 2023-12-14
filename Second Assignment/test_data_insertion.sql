INSERT INTO klientas (kliento_id, vardas, pavarde, miestas, gatve, namas, telefonas, email, slaptazodis, statusas) 
VALUES
(1, 'Jonas', 'Jonaitis', 'Vilnius', 'Gedimino pr.', '5A', '861234567', 'jonas@example.com', 'c789e1771c5bf1b6245ebb85b5d0ed883f1adedb49e86fe37c2c60c9ec0654ad', 'Aktyvus'),
(2, 'Petras', 'Petraitis', 'Kaunas', 'Laisvės al.', '99', '869876543', 'petras@example.com', '6d1d8812d805a2c48a7f099279df40f156637cb3dca365781509c3489e0e16ac', 'Neaktyvus'),
(3, 'Ona', 'Onaitė', 'Klaipėda', 'Taikos pr.', '10B', '867891234', 'ona@example.com', '15f0b1cf493524a6b263064ebc906c8c1ef4353d4cd4a1c6b592698c5d0a352e', 'Suspenduotas');

INSERT INTO darbuotojas (darbuotojo_id, vardas, pavarde, email, slaptazodis, departamentas, pareigos) 
VALUES
(1, 'admin', 'admin', 'admin@example.com', '749f09bade8aca755660eeb17792da880218d4fbdc4e25fbec279d7fe9f65d70', 'Informacinės Technologijos', 'Administratorius'),
(2, 'Aldona', 'Aldonaitė', 'aldona@example.com', 'c789e1771c5bf1b6245ebb85b5d0ed883f1adedb49e86fe37c2c60c9ec0654ad', 'Vadyba', 'Vadovė'),
(3, 'Tomas', 'Tomaitis', 'tomas@example.com', '6d1d8812d805a2c48a7f099279df40f156637cb3dca365781509c3489e0e16ac', 'Apskaita', 'Buhalteris'),
(4, 'Ieva', 'Ievaitė', 'ieva@example.com', '15f0b1cf493524a6b263064ebc906c8c1ef4353d4cd4a1c6b592698c5d0a352e', 'Pardavimai', 'Pardavėja');

INSERT INTO saskaita (saskaitos_id, kliento_id, darbuotojo_id, tipas, balansas, atidarymo_data, uzdarymo_data) 
VALUES
(1, 1, 2, 'Taupomoji', 1000.00, '2023-01-01', NULL),
(2, 2, 3, 'Einamoji', 2500.50, '2023-01-15', NULL),
(3, 3, 4, 'Indėlio', 530.20, '2023-02-20', '2024-02-20');

INSERT INTO transakcija (transakcijos_id, out_saskaitos_id, in_saskaitos_id, suma, data, paskirtis, statusas) 
VALUES
(1, 1, 2, 200.00, '2023-03-01', 'Pavedimas už paslaugas', 'Įvykdytas'),
(2, 2, NULL, 150.00, '2023-03-05', 'Grynųjų išėmimas', 'Sulaikytas'),
(3, NULL, 3, 50.00, '2023-03-10', 'Grynųjų įnešimas', 'Nepavykęs');