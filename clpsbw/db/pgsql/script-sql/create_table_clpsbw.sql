-- sql script pour cplsbw
-- by affinitic
-- 17-02-10

drop table link_experience_institution_porteur;
drop table link_experience_institution_ressource;
drop table link_experience_institution_partenaire;
drop table link_experience_commune;
drop table link_experience_ressource;
drop table link_experience_theme;
drop table experience;

drop table institution;
drop table link_institution_commune;

drop table ressource;
drop table link_ressource_mot_cle;
drop table link_ressource_theme;

drop table recit;
drop table link_outil_recit;

drop table mot_cle cascade;
drop table theme cascade;
drop table link_mot_cle_theme;

--PROVINCE--
create table province(
prov_pk serial primary key not null,
prov_nom varchar
);


--MOTCLE--
create table mot_cle(
motcle_pk serial primary key not null,
motcle_mot varchar,
motcle_actif boolean,
motcle_creation_date timestamp,
motcle_modification_date timestamp,
motcle_modification_employe varchar
);

create table link_mot_cle_theme(
mot_cle_fk integer,
theme_fk integer
);


--THEME--
create table theme(
theme_pk serial primary key not null,
theme_nom varchar,
theme_actif boolean,
theme_creation_date timestamp,
theme_modification_date timestamp,
theme_modification_employe varchar
);




--EXPERIENCE--
create table experience(
experience_pk serial primary key not null,
experience_titre varchar,
experience_resume varchar,
experience_personne_contact varchar,
experience_personne_contact_email varchar,
experience_personne_contact_telephone varchar,
experience_element_contexte varchar,
experience_objectif varchar,
experience_public_vise varchar,
experience_demarche_actions varchar,
experience_periode_deroulement varchar,
experience_moyens varchar,
experience_evaluation_enseignement varchar,
experience_perspective_envisagee varchar,
experience_institution_porteur_autre varchar,
experience_institution_partenaire_autre varchar,
experience_institution_ressource_autre varchar,
experience_institution_ouvrage_autre varchar,
experience_institution_outil_autre varchar,
experience_formation_suivie varchar,
experience_autres_ressources varchar,
experience_aller_plus_loin varchar,
experience_plate_forme_sante_ecole boolean,
experience_plate_forme_assuetude boolean,
experience_plate_forme_sante_famille boolean,
experience_plate_forme_sante_environnement boolean,
experience_mission1 boolean,
experience_mission2 boolean,
experience_mission3 boolean,
experience_etat varchar default 'privé',
experience_creation_date timestamp,
experience_creation_employe varchar
);

create table link_experience_ressource(
experience_fk integer,
ressource_fk integer
);

create table link_experience_theme(
ressource_fk integer,
theme_fk integer
);

create table link_experience_institution_ressource(
experience_fk integer not null,
institution_fk integer not null
);

create table link_experience_institution_partenaire(
experience_fk integer not null,
institution_fk integer not null
);

create table link_experience_institution_porteur(
experience_fk integer not null,
institution_fk integer not null
);

create table link_experience_commune(
experience_fk integer not null,
commune_fk integer not null
);





--INSTITUTION--
create table institution(
institution_pk serial primary key not null,
institution_nom varchar,
institution_adresse varchar,
institution_nom_contact varchar,
institution_email_contact varchar,
institution_tel_contact varchar,
institution_url_site varchar,
institution_lien_siss varchar,
institution_lien_autre varchar,
institution_autre_info varchar,
institution_mission varchar,
institution_activite varchar,
institution_public varchar,
institution_etat varchar default 'privé',
institution_creation_date timestamp,
institution_modification_date timestamp,
institution_modification_employe varchar,
institution_zone_internationale boolean,
institution_zone_internationale_info varchar,
institution_zone_belgique boolean,
institution_zone_cfwb boolean,
institution_zone_rw boolean,
institution_zone_brxl boolean,
institution_comune_fk integer
);



--RESSOURCE--
create table ressource(
ressource_pk serial primary key not null,
ressource_titre varchar,
ressource_description varchar,
ressource_auteur varchar,
ressource_collection varchar,
ressource_edition varchar,
ressource_date_edition date,
ressource_lieu_edition varchar,
ressource_public varchar,
ressource_autre_info varchar,
ressource_lien_pipsa varchar,
ressource_autre_lien varchar,
ressource_objectif varchar,
ressource_disponible_clps boolean,
ressource_disponible_autre varchar,
ressource_etat varchar default 'privé',
ressource_plate_forme_sante_ecole boolean,
ressource_plate_forme_assuetude boolean,
ressource_plate_forme_sante_famille boolean,
ressource_plate_forme_sante_environnement boolean,
ressource_mission1 boolean,
ressource_mission2 boolean,
ressource_mission3 boolean,
ressource_creation_date timestamp,
ressource_modification_date timestamp,
ressource_creation_employe varchar,
ressource_photo varchar
);

create table link_ressource_mot_cle(
ressource_fk integer not null,
motcle_fk integer not null
);

create table link_ressource_theme(
ressource_fk integer not null,
theme_fk integer not null
);






--createt table recit(
--recit_pk serial primary key not null,
--recit_description varchar
--);

--create table link_outil_recit(
--outil_fk integer not null,
--recit_fk integer not null
--);

--create table commune(
--com_pk serial primary key not null,
--com_nom varchar,
--com_cp varchar,
--com_prov_fk integer
--);

--create table province(
--prov_pk serial primary key not null,
--prov_nom varchar
--);

