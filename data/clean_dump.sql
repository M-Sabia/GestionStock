-- --------------------------------------------------------
-- Hôte :                        localhost
-- Version du serveur:           5.7.28 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             9.5.0.5332
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour gestionstock
CREATE DATABASE IF NOT EXISTS `gestionstock` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `gestionstock`;

-- Listage de la structure de la table gestionstock. article
CREATE TABLE IF NOT EXISTS `article` (
  `ID_ARTICLES` bigint(8) NOT NULL AUTO_INCREMENT,
  `ID_FAMILLEARTICLE` bigint(8) NOT NULL,
  `NOM_ARTICLE` varchar(128) DEFAULT NULL,
  `CODE_ARTICLE` varchar(128) DEFAULT NULL,
  `DESACTIVER_ARTICLE` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID_ARTICLES`),
  KEY `I_FK_ARTICLE_FAMILLEARTICLE` (`ID_FAMILLEARTICLE`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`ID_FAMILLEARTICLE`) REFERENCES `famillearticle` (`ID_FAMILLEARTICLE`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.
-- Listage de la structure de la table gestionstock. catalogue
CREATE TABLE IF NOT EXISTS `catalogue` (
  `ID_CATALOGUE` bigint(8) NOT NULL AUTO_INCREMENT,
  `ID_ARTICLES` bigint(8) NOT NULL,
  `ID_FOURNISSEUR` bigint(8) NOT NULL,
  PRIMARY KEY (`ID_CATALOGUE`),
  KEY `I_FK_CATALOGUE_ARTICLE` (`ID_ARTICLES`),
  KEY `I_FK_CATALOGUE_FOURNISSEUR` (`ID_FOURNISSEUR`),
  CONSTRAINT `catalogue_ibfk_1` FOREIGN KEY (`ID_ARTICLES`) REFERENCES `article` (`ID_ARTICLES`),
  CONSTRAINT `catalogue_ibfk_2` FOREIGN KEY (`ID_FOURNISSEUR`) REFERENCES `fournisseur` (`ID_FOURNISSEUR`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.
-- Listage de la structure de la table gestionstock. codebarre
CREATE TABLE IF NOT EXISTS `codebarre` (
  `ID_CODEBARRE` bigint(8) NOT NULL AUTO_INCREMENT,
  `DESIGN_CODEBARRE` varchar(128) DEFAULT NULL,
  `DESACTIVER_CODEBARRE` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID_CODEBARRE`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.
-- Listage de la structure de la table gestionstock. commande
CREATE TABLE IF NOT EXISTS `commande` (
  `ID_COMMANDE` int(8) NOT NULL AUTO_INCREMENT,
  `DATE_COMMANDE` date DEFAULT NULL,
  `REFERENCE_COMMANDE` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID_COMMANDE`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.
-- Listage de la structure de la table gestionstock. deplacement
CREATE TABLE IF NOT EXISTS `deplacement` (
  `ID_DEPLACEMENT` int(8) NOT NULL AUTO_INCREMENT,
  `ID_ELEMENTUNIQUE` bigint(8) NOT NULL,
  `ID_UTILISATEUR` bigint(8) NOT NULL,
  `ETAT` varchar(128) DEFAULT NULL,
  `DATE_DEPLACEMENT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_DEPLACEMENT`),
  KEY `I_FK_DEPLACEMENT_ELEMENTUNIQUE` (`ID_ELEMENTUNIQUE`),
  KEY `I_FK_DEPLACEMENT_UTILISATEUR` (`ID_UTILISATEUR`),
  CONSTRAINT `deplacement_ibfk_1` FOREIGN KEY (`ID_ELEMENTUNIQUE`) REFERENCES `elementunique` (`ID_ELEMENTUNIQUE`),
  CONSTRAINT `deplacement_ibfk_2` FOREIGN KEY (`ID_UTILISATEUR`) REFERENCES `utilisateur` (`ID_UTILISATEUR`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.
-- Listage de la structure de la table gestionstock. elementunique
CREATE TABLE IF NOT EXISTS `elementunique` (
  `ID_ELEMENTUNIQUE` bigint(8) NOT NULL AUTO_INCREMENT,
  `ID_MOUVEMENT` bigint(8) NOT NULL,
  `ID_INFOSUPPLÉMENTAIRE` bigint(4) NOT NULL,
  `ID_COMMANDE` int(8) NOT NULL,
  `ID_CODEBARRE` bigint(8) DEFAULT NULL,
  `ID_EMPLACEMENT` bigint(8) NOT NULL,
  `NOTE` varchar(150) DEFAULT NULL,
  `DESACTIVER_ELEMENTUNIQUE` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID_ELEMENTUNIQUE`),
  UNIQUE KEY `I_FK_ELEMENTUNIQUE_INFOSUPPLÉMENTAIRE` (`ID_INFOSUPPLÉMENTAIRE`),
  KEY `I_FK_ELEMENTUNIQUE_MOUVEMENT` (`ID_MOUVEMENT`),
  KEY `I_FK_ELEMENTUNIQUE_COMMANDE` (`ID_COMMANDE`),
  KEY `I_FK_ELEMENTUNIQUE_CODEBARRE` (`ID_CODEBARRE`),
  KEY `I_FK_ELEMENTUNIQUE_EMPLACEMENT` (`ID_EMPLACEMENT`),
  CONSTRAINT `elementunique_ibfk_1` FOREIGN KEY (`ID_MOUVEMENT`) REFERENCES `mouvement` (`ID_MOUVEMENT`),
  CONSTRAINT `elementunique_ibfk_2` FOREIGN KEY (`ID_INFOSUPPLÉMENTAIRE`) REFERENCES `infosupplémentaire` (`ID_INFOSUPPLÉMENTAIRE`),
  CONSTRAINT `elementunique_ibfk_3` FOREIGN KEY (`ID_COMMANDE`) REFERENCES `commande` (`ID_COMMANDE`),
  CONSTRAINT `elementunique_ibfk_4` FOREIGN KEY (`ID_CODEBARRE`) REFERENCES `codebarre` (`ID_CODEBARRE`),
  CONSTRAINT `elementunique_ibfk_5` FOREIGN KEY (`ID_EMPLACEMENT`) REFERENCES `emplacement` (`ID_EMPLACEMENT`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.
-- Listage de la structure de la table gestionstock. emplacement
CREATE TABLE IF NOT EXISTS `emplacement` (
  `ID_EMPLACEMENT` bigint(8) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID_EMPLACEMENT`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.
-- Listage de la structure de la table gestionstock. famillearticle
CREATE TABLE IF NOT EXISTS `famillearticle` (
  `ID_FAMILLEARTICLE` bigint(8) NOT NULL AUTO_INCREMENT,
  `NOM_TYPEARTICLE` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID_FAMILLEARTICLE`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.
-- Listage de la structure de la table gestionstock. fournisseur
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `ID_FOURNISSEUR` bigint(8) NOT NULL AUTO_INCREMENT,
  `NOM_FOURNISSEUR` varchar(128) DEFAULT NULL,
  `TEL_FOURNISSEUR` varchar(128) DEFAULT NULL,
  `EMAIL_FOURNISSEUR` varchar(128) DEFAULT NULL,
  `ADRESSE_FOURNISSEUR` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID_FOURNISSEUR`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.
-- Listage de la structure de la table gestionstock. infosupplémentaire
CREATE TABLE IF NOT EXISTS `infosupplémentaire` (
  `ID_INFOSUPPLÉMENTAIRE` bigint(4) NOT NULL AUTO_INCREMENT,
  `NUMSERIE` varchar(255) DEFAULT NULL,
  `ETAT` varchar(255) DEFAULT NULL,
  `TYPEINVESTISSEMENT` varchar(255) DEFAULT NULL,
  `PRIXINVESTISSEMENT` varchar(128) DEFAULT NULL,
  `ANNEEINVESTISSEMENT` varchar(128) DEFAULT NULL,
  `NUMBDC` varchar(128) DEFAULT NULL,
  `TYPEASSURANCE` varchar(128) DEFAULT NULL,
  `NUMASSURANCE` varchar(128) DEFAULT NULL,
  `CONTRÔLESIPPT` varchar(128) DEFAULT NULL,
  `AVISSIPPT` varchar(128) DEFAULT NULL,
  `DATEAVISSIPPT` date DEFAULT NULL,
  `REMARQUESIPPT` char(255) DEFAULT NULL,
  `DATEENTRETIEN` date DEFAULT NULL,
  `NUMBDCENTRETIEN` varchar(128) DEFAULT NULL,
  `REMARQUEENTRETIEN` char(255) DEFAULT NULL,
  `DATELIVRAISON` date DEFAULT NULL,
  `DATEMISESERVICE` date DEFAULT NULL,
  `DATEDEMANDEDECLASSEMENT` date DEFAULT NULL,
  `DATEAVISFAVORABLE` date DEFAULT NULL,
  `DATEENLEVEMENT` date DEFAULT NULL,
  `RESPONSABLE` varchar(128) DEFAULT NULL,
  `PRIX` varchar(128) DEFAULT NULL,
  `MARQUE` varchar(128) DEFAULT NULL,
  `MODELE` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID_INFOSUPPLÉMENTAIRE`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.
-- Listage de la structure de la table gestionstock. mouvement
CREATE TABLE IF NOT EXISTS `mouvement` (
  `ID_MOUVEMENT` bigint(8) NOT NULL AUTO_INCREMENT,
  `ID_UTILISATEUR` bigint(8) NOT NULL,
  `ID_CATALOGUE` bigint(8) NOT NULL,
  `TYPE_MOUVEMENT` varchar(128) NOT NULL,
  `NOMBRE` bigint(4) DEFAULT NULL,
  `DATE_MOUVEMENT` date DEFAULT NULL,
  PRIMARY KEY (`ID_MOUVEMENT`),
  KEY `I_FK_MOUVEMENT_UTILISATEUR` (`ID_UTILISATEUR`),
  KEY `I_FK_MOUVEMENT_CATALOGUE` (`ID_CATALOGUE`),
  CONSTRAINT `mouvement_ibfk_1` FOREIGN KEY (`ID_UTILISATEUR`) REFERENCES `utilisateur` (`ID_UTILISATEUR`),
  CONSTRAINT `mouvement_ibfk_2` FOREIGN KEY (`ID_CATALOGUE`) REFERENCES `catalogue` (`ID_CATALOGUE`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.
-- Listage de la structure de la table gestionstock. roleutilisateur
CREATE TABLE IF NOT EXISTS `roleutilisateur` (
  `ID_ROLEUTILISATEUR` int(8) NOT NULL AUTO_INCREMENT,
  `NOM_ROLEUTILISATEUR` varchar(128) DEFAULT NULL,
  `DESACTIVER_ROLEUTILISATEUR` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID_ROLEUTILISATEUR`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.
-- Listage de la structure de la table gestionstock. utilisateur
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `ID_UTILISATEUR` bigint(8) NOT NULL AUTO_INCREMENT,
  `ID_ROLEUTILISATEUR` int(8) NOT NULL,
  `ID_CODEBARRE` bigint(8) DEFAULT NULL,
  `NOM_UTILISATEUR` varchar(128) DEFAULT NULL,
  `PRENOM_UTILISATEUR` varchar(128) DEFAULT NULL,
  `EMAIL_UTILISATEUR` varchar(128) DEFAULT NULL,
  `ADRESSE_UTILISATEUR` varchar(128) DEFAULT NULL,
  `TEL_UTILISATEUR` varchar(128) DEFAULT NULL,
  `USER_UTILISATEUR` varchar(128) DEFAULT NULL,
  `PASSWORD_UTILISATEUR` varchar(128) DEFAULT NULL,
  `DESACTIVER_UTILISATEUR` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID_UTILISATEUR`),
  KEY `I_FK_UTILISATEUR_ROLEUTILISATEUR` (`ID_ROLEUTILISATEUR`),
  KEY `I_FK_UTILISATEUR_CODEBARRE` (`ID_CODEBARRE`),
  CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`ID_ROLEUTILISATEUR`) REFERENCES `roleutilisateur` (`ID_ROLEUTILISATEUR`),
  CONSTRAINT `utilisateur_ibfk_2` FOREIGN KEY (`ID_CODEBARRE`) REFERENCES `codebarre` (`ID_CODEBARRE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.
-- Listage de la structure de la procédure gestionstock. alterInfosupp
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `alterInfosupp`(in idinfosupp int ,in numserie char(50),in etat char(50),in TYPEINVESTISSEMENT char(50),in PRIXINVESTISSEMENT char(50),
in ANNEEINVESTISSEMENT char(50),in NUMBDC char(50),in TYPEASSURANCE char(50),in NUMASSURANCE char(50),in CONTRÔLESIPPT char(50),in AVISSIPPT char(50),in DATEAVISSIPPT char(50),
in REMARQUESIPPT char(50),in DATEENTRETIEN char(50),in NUMBDCENTRETIEN char(50),in REMARQUEENTRETIEN char(50),in DATELIVRAISON char(50),in DATEMISESERVICE char(50),in DATEDEMANDEDECLASSEMENT char(50),in DATEAVISFAVORABLE char(50),
in DATEENLEVEMENT char(50),in RESPONSABLE char(50),in PRIX char(50),in MARQUE char(50),in MODELE char(50))
begin
update infosupplémentaire
set infosupplémentaire.NUMSERIE = NUMSERIE, 
    infosupplémentaire.ETAT = ETAT,
    infosupplémentaire.TYPEINVESTISSEMENT = TYPEINVESTISSEMENT,
    infosupplémentaire.PRIXINVESTISSEMENT = PRIXINVESTISSEMENT,
    infosupplémentaire.ANNEEINVESTISSEMENT = ANNEEINVESTISSEMENT,
    infosupplémentaire.NUMBDC = NUMBDC,
    infosupplémentaire.TYPEASSURANCE = TYPEASSURANCE,
    infosupplémentaire.NUMASSURANCE = NUMASSURANCE,
    infosupplémentaire.CONTRÔLESIPPT = CONTRÔLESIPPT,
    infosupplémentaire.AVISSIPPT = AVISSIPPT,
    infosupplémentaire.DATEAVISSIPPT = dateAVISSIPPT,
    infosupplémentaire.REMARQUESIPPT = REMARQUESIPPT,
    infosupplémentaire.DATEENTRETIEN = dateENTRETIEN,
    infosupplémentaire.NUMBDCENTRETIEN = NUMBDCENTRETIEN,
    infosupplémentaire.REMARQUEENTRETIEN = REMARQUEENTRETIEN,
    infosupplémentaire.DATELIVRAISON = dateLIVRAISON,
    infosupplémentaire.DATEMISESERVICE = dateMISESERVICE,
    infosupplémentaire.DATEDEMANDEDECLASSEMENT = dateDEMANDEDECLASSEMENT,
    infosupplémentaire.DATEAVISFAVORABLE = dateAVISFAVORABLE,
    infosupplémentaire.DATEENLEVEMENT = DATEENLEVEMENT,
    infosupplémentaire.RESPONSABLE = RESPONSABLE,
    infosupplémentaire.PRIX = PRIX,
    infosupplémentaire.MARQUE = MARQUE,
    infosupplémentaire.MODELE = MODELE
    where
    infosupplémentaire.ID_INFOSUPPLÉMENTAIRE = idinfosupp;
end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. checkUser
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `checkUser`(in username char(50))
begin
select *, roleutilisateur.NOM_ROLEUTILISATEUR from utilisateur
inner join roleutilisateur using (ID_ROLEUTILISATEUR)
where user_utilisateur = username;
end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. countBarCode
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `countBarCode`(in param1 char(50), out total int)
BEGIN
select count(design_codebarre) into total from codebarre
where DESIGN_CODEBARRE like concat(param1,'%');
END//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. createBarCode
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `createBarCode`(in codeProduct char(50),out idCodebarre int)
begin

call countBarCode(codeProduct,@total);
set @total = @total+1;
IF @total>0 && @total <10 then set @var = concat(codeProduct,"000") ;
elseif @total >=10 && @total <100 then set @var = concat(codeProduct,"00") ;
elseif @total >=100 && @total <1000 then set @var = concat(codeProduct,"0") ;
elseif @total >=1000 && @total <10000 then set @var = codeProduct;
end if;
insert into codebarre(design_codebarre,desactiver_codebarre) values(concat(@var,@total),0);
set idCodebarre = (select id_codebarre from codebarre where design_codebarre = concat(@var,@total));
end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. createCommande
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `createCommande`(in ref_commande char(50), out idCommande int)
begin
select id_commande into idCommande from commande
where commande.reference_commande = ref_commande;

if(idCommande is null) then
insert into commande (reference_commande) value (ref_commande);
select id_commande into idCommande from commande
where commande.reference_commande = ref_commande;
end if;

end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. createDeplacement
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `createDeplacement`(in codebare_utilisateur char(50),in codebarre_elementunique char(50))
begin
set @id_utilisateur = (select utilisateur.id_utilisateur from utilisateur inner join codebarre using(id_codebarre) where codebarre.DESIGN_CODEBARRE = codebare_utilisateur );
set @id_elementunique = (select elementunique.id_elementunique from elementunique inner join codebarre using(id_codebarre) where codebarre.DESIGN_CODEBARRE = codebarre_elementunique);
set @etat = (
select deplacement.etat from deplacement
where deplacement.ID_DEPLACEMENT in (select max(id_deplacement) from deplacement
where deplacement.ID_UTILISATEUR = @id_utilisateur and deplacement.id_elementunique = @id_elementunique));
if @etat = "Depart" then set @etat = "Retour";
    elseif @etat ="Retour" then set @etat = "Depart";
    elseif @etat is null then set @etat = "Depart";
end if;

insert into deplacement(ID_ELEMENTUNIQUE,ID_UTILISATEUR,ETAT,DATE_DEPLACEMENT) values(@id_elementunique,@id_utilisateur,@etat,now());
end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. createFamilyProduct
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `createFamilyProduct`(in familyProduct char (50))
begin
insert into famillearticle(nom_typearticle) values (familyProduct);
end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. createFournisseur
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `createFournisseur`(in nomFournisseur char(50),in telFournisseur char (50),in emailFournisseur char(50),in adresseFournisseur char (50))
begin
insert into fournisseur(nom_fournisseur,tel_fournisseur,email_fournisseur,adresse_fournisseur)values(nomFournisseur,telFournisseur,emailFournisseur,adresseFournisseur);
end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. createLocation
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `createLocation`(in location char (50))
begin
insert into emplacement(description) values (location);
end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. createMouvement
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `createMouvement`(in mouvementType char(50),in userName char(50),in fournisseurName char(50), in productName char(50), in nb int, in emplacement char(50), in ref char(50))
begin
set @iduser = (select utilisateur.ID_UTILISATEUR from utilisateur where utilisateur.User_UTILISATEUR = userName);
set @idProduct = (select article.ID_ARTICLES from article where article.NOM_ARTICLE = productName);
set @idFournisseur = (select fournisseur.ID_FOURNISSEUR from fournisseur where fournisseur.nom_fournisseur = fournisseurName);
set @idCatalogue = (select catalogue.ID_Catalogue from catalogue where catalogue.id_articles = @idProduct and catalogue.id_fournisseur = @idFournisseur);
IF @idCatalogue is null
	then insert into catalogue (id_articles,id_fournisseur) values (@idProduct,@idFournisseur); 
	set @idCatalogue = (select catalogue.ID_Catalogue from catalogue where catalogue.id_articles = @idProduct and catalogue.id_fournisseur = @idFournisseur);
 end if;
set @codeProduct = (select article.code_Article from article where article.NOM_ARTICLE = productName);
set @idEmplacement = (select emplacement.id_emplacement from emplacement where emplacement.description = emplacement);
insert into mouvement (id_utilisateur,id_catalogue,type_mouvement,nombre,date_mouvement) values (@iduser,@idCatalogue,mouvementType,nb,date(now()));
call createCommande(ref,@idCommande);
set @idMouvement = (select max(id_mouvement) from mouvement);
set @i = 0;
repeat
call createBarCode(@codeProduct,@idCodeBarre);
call createProductUnique(@idMouvement,@idCodeBarre,@idEmplacement,@idCommande);
set @i = @i+1;
until @i = nb end repeat;
end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. createProduct
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `createProduct`(in TypeArticle char(50), in nomArticle char(50))
begin
set @idTypeArticle = (select id_familleArticle from famillearticle where NOM_TYPEARTICLE = TypeArticle);
select @idTypeArticle;
if @idTypeArticle is NULL then insert into famillearticle (nom_typearticle) value(TypeArticle); end if;
set @idTypeArticle = (select id_familleArticle from famillearticle where NOM_TYPEARTICLE = TypeArticle);
set @nbArticle = (select count(id_articles) from article);
set @nbArticle = @nbArticle +1;
IF @nbArticle>0 && @nbArticle <10 then set @var = concat("000",@nbArticle) ;
elseif @nbArticle >=10 && @nbArticle <100 then set @var = concat("00",@nbArticle) ;
elseif @nbArticle >=100 && @nbArticle <1000 then set @var = concat("0",@nbArticle) ;
elseif @nbArticle >=1000 && @nbArticle <10000 then set @var = @nbArticle;
end if;
insert into article(id_famillearticle,nom_article,code_article,desactiver_article) values (@idTypeArticle,nomArticle,@var,0);
end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. createProductUnique
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `createProductUnique`(in idMouvement int,in idCodeBarre int,in idEmplacement int,in idCommande int)
begin
insert into infosupplémentaire() values();
set @id_infossuplementaire = (select count(ID_INFOSUPPLÉMENTAIRE) from infosupplémentaire);
insert into elementunique(id_Mouvement,id_Codebarre,id_Emplacement,ID_INFOSUPPLÉMENTAIRE,id_commande) values (idMouvement, idCodebarre,idEmplacement,@id_infossuplementaire,idCommande);
end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. createUtilisateur
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `createUtilisateur`(in role char(50),in nom char(50),in prenom char(50),in email char(50),addresseU char(50),in tel char(50),in userU char(50),in passwordU char(50))
begin
set @idRole = (select id_roleutilisateur from roleutilisateur where nom_roleutilisateur = role);
call createbarcode("User",@idcodebarre);
insert into utilisateur (id_roleUtilisateur,id_codebarre,nom_utilisateur,prenom_utilisateur,email_utilisateur,adresse_utilisateur,tel_utilisateur,user_utilisateur,password_utilisateur)
values(@idRole,@idcodebarre,nom,prenom,email,addresseU,tel,userU,passwordU);

end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. deleteElement
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteElement`(in idElement int)
begin
update elementunique
set elementunique.DESACTIVER_ELEMENTUNIQUE = 1
where elementunique.ID_ELEMENTUNIQUE = idElement;
end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. deleteuser
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteuser`(in utilisateur char(50))
begin
update utilisateur set utilisateur.desactiver_utilisateur = 1
where utilisateur.NOM_UTILISATEUR = utilisateur;

end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. deleteUtilisateur
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteUtilisateur`(in idUtilisateur int)
begin
update utilisateur
set utilisateur.DESACTIVER_UTILISATEUR = 1
where utilisateur.id_utilisateur = idUtilisateur;
end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. displayMouvement
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `displayMouvement`(idmouvement int )
begin
select elementunique.ID_ELEMENTUNIQUE from codebarre,elementunique,mouvement
where mouvement.ID_MOUVEMENT = elementunique.ID_MOUVEMENT
and elementunique.ID_CODEBARRE = codebarre.ID_CODEBARRE
and mouvement.ID_MOUVEMENT = idmouvement;
end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. getAllUsers
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllUsers`()
begin
select * from utilisateur
inner join roleutilisateur using (ID_ROLEUTILISATEUR)
inner join codebarre using (ID_CODEBARRE);
end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. infosupp
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `infosupp`(in id_infosupp int)
begin
select infosupplémentaire.*, emplacement.DESCRIPTION, commande.REFERENCE_COMMANDE, codebarre.DESIGN_CODEBARRE, famillearticle.NOM_TYPEARTICLE from elementunique
inner join mouvement using (id_mouvement)
inner join emplacement using (id_emplacement)
inner join catalogue using(id_catalogue)
inner join article using (id_articles)
inner join famillearticle using(id_famillearticle)
inner join codebarre using (id_codebarre)
inner join infosupplémentaire using(id_infosupplémentaire)
inner join commande using(id_commande)
where id_infosupplémentaire = id_infosupp;
end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. selectArticle
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectArticle`(in NomArticle char(50),out idArticle int)
begin
select id_Articles into idArticle from article
where nom_article = NomArticle;
end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. selectCumstomDeplacement
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectCumstomDeplacement`(in codebarre char(50),in nomProduct char(50),in nomUser char(50),in etat char(50),in date_deplacement char(50))
begin
select codebarre.DESIGN_CODEBARRE,article.NOM_ARTICLE,utilisateur.NOM_UTILISATEUR,deplacement.ETAT,deplacement.DATE_DEPLACEMENT from deplacement
inner join utilisateur on utilisateur.id_utilisateur = deplacement.id_utilisateur
inner join elementunique using(id_elementunique)
inner join codebarre on codebarre.id_codebarre = elementunique.id_codebarre
inner join mouvement using(id_mouvement)
inner join catalogue using(id_catalogue)
inner join article using(id_articles)

where (codebarre.DESIGN_CODEBARRE =codebarre or codebarre IS NULL) 
         AND (article.NOM_ARTICLE = nomProduct or nomProduct IS NULL) 
         AND (utilisateur.NOM_UTILISATEUR  = nomUser or nomUser IS NULL)
         AND (deplacement.ETAT  = etat or etat IS NULL)
         AND (date(deplacement.DATE_DEPLACEMENT) = date_deplacement or date_deplacement IS NULL);
end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. selectionBarcode
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectionBarcode`(in id int)
begin
 select codebarre.DESIGN_CODEBARRE from codebarre
 where codebarre.ID_CODEBARRE = id;
end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. selectionCustom
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectionCustom`(in param1 char(50),in param2 char (50),in param3 char(50), in param4 char(50),in param5 char(50))
begin
select * from elementunique
inner join emplacement using (id_emplacement)
inner join codebarre using (id_codebarre)
inner join mouvement using(id_mouvement) 
inner join catalogue using(id_catalogue)
inner join article using(id_articles) 
inner join famillearticle using(id_famillearticle)
inner join commande using(id_commande)
where   (emplacement.description =param1 or param1 IS NULL) 
		 AND (famillearticle.NOM_TYPEARTICLE = param2 or param2 IS NULL) 
		 AND (article.nom_article  = param3 or param3 IS NULL)
		 AND (commande.reference_commande  = param4 or param4 IS NULL)
		 AND (codebarre.design_codebarre = param5 or param5 IS NULL);
end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. selectionProduct
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectionProduct`(in barcode char(50))
begin
	select elementunique.NOTE,famillearticle.NOM_TYPEARTICLE,article.NOM_ARTICLE ,emplacement.description,barcode,fournisseur.nom_fournisseur,commande.reference_commande,infosupplémentaire.ETAT,infosupplémentaire.PRIX from elementunique
    inner join mouvement using (id_mouvement)
    inner join emplacement using (id_emplacement)
    inner join catalogue using(id_catalogue)
    inner join fournisseur using(id_fournisseur)
    inner join article using (id_articles)
    inner join famillearticle using(id_famillearticle)
    inner join codebarre using (id_codebarre)
    inner join infosupplémentaire using(id_infosupplémentaire)
    inner join commande using(id_commande)
    where codebarre.DESIGN_CODEBARRE = barcode;
end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. selectMouvement
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectMouvement`(in DateMouvement Date,in NomArticle char(50),in NomFournisseur char(50),in TypeArticle char(50),in RefCommande char(50))
begin
call selectArticle(NomArticle,@idArticle);
select mouvement.id_mouvement,nom_article,nom_typearticle,nom_fournisseur,date_mouvement,reference_commande,nombre from article
inner join famillearticle using(id_famillearticle)
inner join catalogue using(id_articles)
inner join fournisseur using(id_fournisseur)
inner join mouvement using(id_catalogue)
inner join elementunique using(id_mouvement)
inner join commande using (id_commande)
where (nom_article = NomArticle or NomArticle is null)
    and (mouvement.date_mouvement = DateMouvement or DateMouvement is null)
    and (fournisseur.nom_fournisseur = NomFournisseur or NomFournisseur is null)
    and (famillearticle.nom_typearticle = TypeArticle or TypeArticle is null)
    and (commande.reference_commande = RefCommande or RefCommande is null)
    group by (id_mouvement);
end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. selectMouvementBarcode
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectMouvementBarcode`(in idMouvement int)
begin
select codebarre.DESIGN_CODEBARRE from codebarre 
inner join elementunique using(id_codebarre)
inner join mouvement using(id_mouvement)
where ID_MOUVEMENT = idMouvement;
end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. selectMouvementByUser
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectMouvementByUser`(nomUser char(50))
begin
call selectUser(nomUser,@idUser);
select id_mouvement,nom_article,nombre from mouvement 
inner join article using(id_articles)
where mouvement.ID_UTILISATEUR = @idUser;
end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. selectUser
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectUser`(in pseudo char(50),in mdp char(50))
begin
select * from utilisateur
inner join roleutilisateur using (ID_ROLEUTILISATEUR)
inner join codebarre using (ID_CODEBARRE)
where USER_UTILISATEUR = pseudo AND PASSWORD_UTILISATEUR = mdp;
end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. stillNotReturned
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `stillNotReturned`()
begin
select codebarre.design_codebarre,article.nom_article,utilisateur.nom_utilisateur,deplacement.etat,deplacement.date_deplacement from deplacement
inner join utilisateur using(id_utilisateur)
inner join elementunique using(id_elementunique)
inner join codebarre on codebarre.id_codebarre = elementunique.id_codebarre
inner join mouvement using(id_mouvement)
inner join catalogue using(id_catalogue)
inner join article using(id_articles) where id_deplacement in (select max(id_deplacement)  from deplacement
group by (id_elementunique)) and etat = "depart";
end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. unDeleteUtilisateur
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `unDeleteUtilisateur`(in idUtilisateur int)
begin
update utilisateur
set utilisateur.DESACTIVER_UTILISATEUR = 0
where utilisateur.id_utilisateur = idUtilisateur;
end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. updateLocationArticle
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateLocationArticle`(in idInfoSupp int,in location char(50))
begin
update elementunique
inner join emplacement using (ID_EMPLACEMENT)
set elementunique.ID_EMPLACEMENT = (select emplacement.ID_EMPLACEMENT from emplacement where emplacement.DESCRIPTION = location)
where elementunique.ID_INFOSUPPLÉMENTAIRE = idInfoSupp;
end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. updateNote
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateNote`(in idElement int, in str char(150))
begin
update elementunique
set elementunique.NOTE = str
where elementunique.ID_ELEMENTUNIQUE = idElement;
end//
DELIMITER ;

-- Listage de la structure de la procédure gestionstock. updateUtilisateur
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUtilisateur`(
	IN `idUtilisateur` int,
	IN `roleUtilisateur` char(50),
	IN `nomUtilisateur` char(50),
	IN `prenomUtilisateur` char(50),
	IN `emailUtilisateur` char(50),
	IN `addresseUtilisateur` char(50),
	IN `telUtilisateur` char(50),
	IN `userUtilisateur` char(50),
	IN `passwordUtilisateur` char(50)


)
begin
set @idRole = (select id_roleutilisateur from roleutilisateur where nom_roleutilisateur = `roleUtilisateur`);
update utilisateur
set utilisateur.NOM_UTILISATEUR = nomUtilisateur,
    utilisateur.PRENOM_UTILISATEUR = prenomUtilisateur,
    utilisateur.EMAIL_UTILISATEUR = emailUtilisateur,
    utilisateur.ADRESSE_UTILISATEUR = addresseUtilisateur,
    utilisateur.TEL_UTILISATEUR = telUtilisateur,
    utilisateur.USER_UTILISATEUR = userUtilisateur,
    utilisateur.PASSWORD_UTILISATEUR = passwordUtilisateur,
    utilisateur.ID_ROLEUTILISATEUR = @idRole
where utilisateur.id_utilisateur = idUtilisateur;
end//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
