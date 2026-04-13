-- ============================================
-- BiroTech — MIGRATION v2 → v3
-- Si ou te deja importe yon vye database.sql
-- Egzekite fichye SQL sa a nan phpMyAdmin
-- ============================================

USE birotech_db;

-- 1. Ajoute kolonn ki manke nan categories
ALTER TABLE categories
  ADD COLUMN IF NOT EXISTS nom_en VARCHAR(100) NOT NULL DEFAULT '' AFTER nom,
  ADD COLUMN IF NOT EXISTS description_en TEXT AFTER description;

-- 2. Ajoute kolonn ki manke nan cours
ALTER TABLE cours
  ADD COLUMN IF NOT EXISTS titre_en VARCHAR(255) NOT NULL DEFAULT '' AFTER titre,
  ADD COLUMN IF NOT EXISTS contenu_en LONGTEXT AFTER contenu,
  ADD COLUMN IF NOT EXISTS duree_minutes INT DEFAULT 30 AFTER numero_cours;

-- 3. Ajoute kolonn ki manke nan examens
ALTER TABLE examens
  ADD COLUMN IF NOT EXISTS titre_en VARCHAR(255) NOT NULL DEFAULT '' AFTER titre;

-- 4. Ajoute kolonn ki manke nan questions
ALTER TABLE questions
  ADD COLUMN IF NOT EXISTS texte_en TEXT AFTER texte,
  ADD COLUMN IF NOT EXISTS option_a_en VARCHAR(300) DEFAULT '' AFTER option_a,
  ADD COLUMN IF NOT EXISTS option_b_en VARCHAR(300) DEFAULT '' AFTER option_b,
  ADD COLUMN IF NOT EXISTS option_c_en VARCHAR(300) DEFAULT '' AFTER option_c,
  ADD COLUMN IF NOT EXISTS option_d_en VARCHAR(300) DEFAULT '' AFTER option_d;

-- 5. Modifye messages_prives (retire sujet si obligatwa)
ALTER TABLE messages_prives
  MODIFY COLUMN IF EXISTS sujet VARCHAR(255) DEFAULT 'Message';

-- 6. Kreye tab coupons si pa egziste
CREATE TABLE IF NOT EXISTS coupons (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(30) NOT NULL UNIQUE,
    description VARCHAR(200) DEFAULT '',
    type ENUM('acces_gratuit','reduction') DEFAULT 'acces_gratuit',
    valeur INT DEFAULT 100,
    max_utilisations INT DEFAULT 1,
    utilisations INT DEFAULT 0,
    actif TINYINT(1) DEFAULT 1,
    date_expiration DATE DEFAULT NULL,
    date_creation DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS coupon_utilisations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    coupon_id INT NOT NULL,
    user_id INT NOT NULL,
    date_utilisation DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uk (coupon_id, user_id)
);

-- 7. Verifye si admin egziste, sinon kreye li
-- Modpas: password (CHANJE LI APRE!)
INSERT IGNORE INTO users (nom, prenom, email, telephone, password, role, statut, acces_complet)
VALUES ('Ritchy','Derinard','admin@birotech.ht','+509 3322-5312',
'$2y$10$v5Jjtn/Z2ijP8EGK4W0.LOywfPuFv8OrGHny6Im5O/x4nYMCe7CQe','admin','actif',1);

SELECT 'Migration BiroTech v3 reyisi!' AS Rezilta;

INSERT INTO users (nom, prenom, email, telephone, password, role, statut, acces_complet)
VALUES ('Ritchy','Derinard','admin@birotech.ht','+509 3322-5312',
'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uye29tyyK','admin','actif',1);
