/*==============================================================*/
/* Nom de SGBD :  Sybase SQL Anywhere 11                        */
/* Date de cr�ation :  13/07/2023 14:06:13                      */
/*==============================================================*/
/*==============================================================*/
/* Table : CONCERNER                                            */
/*==============================================================*/
create table CONCERNER 
(
   IDTYPEPRODUIT        integer                        not null,
   IDPRODUITS           integer                        not null,
   constraint PK_CONCERNER primary key (IDTYPEPRODUIT, IDPRODUITS)
);

/*==============================================================*/
/* Table : PRODUITS                                             */
/*==============================================================*/
create table PRODUITS 
(
   IDPRODUITS           integer                        not null,
   IDUTILISATEUR        integer                        not null,
   LIBELLEPRODUIT       char(30)                       not null,
   IMAGE                char(25)                       not null,
   constraint PK_PRODUITS primary key (IDPRODUITS)
);

/*==============================================================*/
/* Table : PUBLICITER                                           */
/*==============================================================*/
create table PUBLICITER 
(
   IDPUBLICITER         integer                        not null,
   IDUTILISATEUR        integer                        not null,
   LIBELLEPUBLICITER    char(25)                       not null,
   VIDEO                char(30)                       not null,
   constraint PK_PUBLICITER primary key (IDPUBLICITER)
);

/*==============================================================*/
/* Table : TYPE                                                 */
/*==============================================================*/
create table TYPE 
(
   IDTYPEPRODUIT        integer                        not null,
   LIBELLETYPE          char(50)                       not null,
   constraint PK_TYPE primary key (IDTYPEPRODUIT)
);

/*==============================================================*/
/* Table : UTILISATEUR                                          */
/*==============================================================*/
create table UTILISATEUR 
(
   IDUTILISATEUR        integer                        not null,
   NOM                  char(15)                       not null,
   PRENOM               char(30)                       not null,
   EMAIL                integer                        not null,
   CNIB                 char(30)                       not null,
   constraint PK_UTILISATEUR primary key (IDUTILISATEUR)
);

alter table CONCERNER
   add constraint FK_CONCERNE_CONCERNER_TYPE foreign key (IDTYPEPRODUIT)
      references TYPE (IDTYPEPRODUIT)
      on update restrict
      on delete restrict;

alter table CONCERNER
   add constraint FK_CONCERNE_CONCERNER_PRODUITS foreign key (IDPRODUITS)
      references PRODUITS (IDPRODUITS)
      on update restrict
      on delete restrict;

alter table PRODUITS
   add constraint FK_PRODUITS_AFFICHER_UTILISAT foreign key (IDUTILISATEUR)
      references UTILISATEUR (IDUTILISATEUR)
      on update restrict
      on delete restrict;

alter table PUBLICITER
   add constraint FK_PUBLICIT_PUBLIER_UTILISAT foreign key (IDUTILISATEUR)
      references UTILISATEUR (IDUTILISATEUR)
      on update restrict
      on delete restrict;

