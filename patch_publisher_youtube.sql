-- ============================================
-- BiroTech — PATCH: Publisher + YouTube Fix
-- Egzekite sa nan phpMyAdmin → SQL
-- ============================================

USE birotech_db;

-- === PUBLISHER COURSES ===
-- Verifye si pa gen kou Publisher deja
DELETE FROM cours WHERE categorie_id = (SELECT id FROM categories WHERE slug='publisher');

INSERT INTO cours (categorie_id, titre, titre_en, contenu, contenu_en, numero_cours, est_gratuit, duree_minutes, ordre)
SELECT c.id, titre, titre_en, contenu, contenu_en, numero_cours, est_gratuit, 40, numero_cours
FROM categories c, (VALUES
  ROW('Leçon 1 — Introduction à Microsoft Publisher',
      'Lesson 1 — Introduction to Microsoft Publisher',
      '<h2>🖨️ Qu''est-ce que Microsoft Publisher ?</h2><p>Microsoft Publisher est un logiciel de <strong>publication assistée par ordinateur (PAO)</strong>. Contrairement à Word qui est orienté texte, Publisher est conçu pour créer des documents visuellement complexes : flyers, brochures, bulletins, cartes de visite, affiches, calendriers et magazines.</p><p>Publisher fait partie de Microsoft Office et est particulièrement apprécié pour créer des documents prêts à imprimer ou à partager en PDF professionnel.</p><h2>🖥️ Interface Publisher</h2><ul><li><strong>Zone de travail</strong> : Représente votre page avec règles et repères</li><li><strong>Ruban</strong> : Onglets Accueil, Insertion, Mise en page, Révision, Affichage</li><li><strong>Volet de tâches</strong> : Panneau latéral avec options contextuelles</li><li><strong>Repères de mise en page</strong> : Lignes bleues pour aligner les éléments</li></ul><h2>📄 Créer un nouveau document</h2><ol><li>Fichier → Nouveau</li><li>Choisir un modèle (flyer, brochure, carte...) ou Document vierge</li><li>Définir la taille : A4, Letter, personnalisée</li></ol><h2>🔲 Les Zones de texte Publisher</h2><p>Dans Publisher, tout le texte se place dans des <strong>zones de texte</strong>. Pour créer une zone : Insertion → Zone de texte → Cliquer-glisser. Vous pouvez les déplacer, redimensionner et formater indépendamment.</p><div style="background:rgba(0,176,255,.08);border-left:4px solid #00B0FF;padding:1rem;border-radius:0 8px 8px 0;margin-top:1rem;">💡 Différence clé : Dans Word, le texte coule sur la page. Dans Publisher, <strong>chaque élément est dans sa propre boîte</strong> que vous placez librement.</div>',
      '<h2>🖨️ What is Microsoft Publisher?</h2><p>Publisher is a desktop publishing software for creating visual documents: flyers, brochures, cards, posters. Unlike Word, every element is placed in independent boxes you can position freely.</p><h2>🖥️ Interface</h2><p>Work area, Ribbon (Home, Insert, Page Design, Review, View), Task Pane, Layout guides.</p><h2>📄 Creating a Document</h2><p>File → New → Choose template or Blank. Everything in Publisher uses text boxes: Insert → Text Box → Click and drag.</p>',
      1, 1, 40, 1),
  ROW('Leçon 2 — Créer un Flyer publicitaire professionnel',
      'Lesson 2 — Create a Professional Advertising Flyer',
      '<h2>📢 Qu''est-ce qu''un Flyer ?</h2><p>Un flyer (ou tract) est un document d''une seule page conçu pour attirer l''attention et transmettre un message rapidement. On l''utilise pour les événements, promotions, annonces commerciales.</p><h2>🎨 Étapes de création d''un Flyer</h2><h3>1. Choisir le format</h3><p>Format standard : A5 (la moitié d''un A4) ou A4 portrait/paysage selon l''utilisation.</p><h3>2. Définir la couleur de fond</h3><p>Mise en page → Remplissage du fond → Choisir une couleur ou dégradé.</p><h3>3. Insérer une image d''accroche</h3><p>Insertion → Image → Choisir une image percutante. L''image principale doit occuper 40 à 60% de l''espace.</p><h3>4. Titre principal (accrocheur)</h3><p>Zone de texte grande → Titre en majuscules, police grande (48-72pt), couleur contrastée avec le fond.</p><h3>5. Texte informatif</h3><p>Zone de texte plus petite → Détails : date, lieu, contact, prix. Police plus petite (12-16pt).</p><h3>6. Appel à l''action</h3><p>Bouton ou bannière : "Appelez maintenant!", "Visitez notre site!", "Places limitées!"</p><h2>🎯 Règles du bon design</h2><ul><li>Maximum 2-3 couleurs complémentaires</li><li>Maximum 2 polices différentes</li><li>Beaucoup d''espace blanc (ne pas surcharger)</li><li>Texte lisible : contraste fort entre texte et fond</li><li>Logo et coordonnées toujours visibles</li></ul><div style="background:rgba(255,215,0,.08);border-left:4px solid #FFD700;padding:1rem;border-radius:0 8px 8px 0;margin-top:1rem;">💡 Conseil : Avant d''imprimer, exportez en PDF (Fichier → Enregistrer sous → PDF) et vérifiez sur écran.</div>',
      '<h2>📢 Creating a Flyer</h2><p>Steps: 1) Choose A5 or A4 format. 2) Set background color. 3) Insert main image (40-60% of space). 4) Add headline (48-72pt, uppercase). 5) Add info text (12-16pt). 6) Add call-to-action. Rules: max 3 colors, max 2 fonts, lots of white space.</p>',
      2, 1, 45, 2),
  ROW('Leçon 3 — Brochure et Bulletin d''information',
      'Lesson 3 — Brochure and Newsletter',
      '<h2>📋 Les types de publications Publisher</h2><h3>La Brochure (3 volets)</h3><p>Une brochure classique est une feuille A4 pliée en 3 parties (volets). Chaque volet a un rôle :<br>• <strong>Volet recto extérieur (couverture)</strong> : Titre, logo, image accrocheuse<br>• <strong>Volet intérieur gauche</strong> : Introduction, présentation<br>• <strong>Volet intérieur centre</strong> : Contenu principal, services<br>• <strong>Volet intérieur droite</strong> : Avantages, témoignages<br>• <strong>Volet verso gauche</strong> : Contact, adresse, réseaux sociaux<br>• <strong>Volet verso droite (dos)</strong> : Étiquette adresse pour envoi postal</p><h3>Créer une brochure dans Publisher</h3><ol><li>Fichier → Nouveau → Brochures</li><li>Choisir un modèle à 3 volets</li><li>Remplacer les textes et images d''exemple</li><li>Ajuster les couleurs selon votre charte graphique</li></ol><h3>Le Bulletin d''information (Newsletter)</h3><p>Format multi-pages avec colonnes pour un aspect journal. Idéal pour les associations, écoles, entreprises.</p><h2>📊 Travailler avec les colonnes</h2><p>Mise en page → Repères → Repères de colonnes → Définir 2 ou 3 colonnes. Les zones de texte s''adaptent aux colonnes définies.</p><div style="background:rgba(0,230,118,.08);border-left:4px solid #00E676;padding:1rem;border-radius:0 8px 8px 0;margin-top:1rem;">✅ Modèles gratuits : Publisher propose des dizaines de modèles professionnels prêts à personnaliser. Utilisez-les comme base de travail !</div>',
      '<h2>📋 Brochure (3 panels)</h2><p>Classic brochure: fold A4 into 3 panels. Cover panel: title, logo, image. Inside panels: intro, content, benefits. Back: contact info. File → New → Brochures → Choose template → Replace text and images.</p><h2>📰 Newsletter</h2><p>Multi-page with columns. Page Design → Guides → Column Guides → Set 2-3 columns.</p>',
      3, 0, 50, 3),
  ROW('Leçon 4 — Cartes de visite et Affiches',
      'Lesson 4 — Business Cards and Posters',
      '<h2>💼 Créer des Cartes de Visite</h2><p>La carte de visite est un document petit (85×54mm standard) mais très important pour le networking professionnel.</p><h3>Dans Publisher :</h3><ol><li>Fichier → Nouveau → Cartes de visite</li><li>Choisir un modèle horizontal ou vertical</li><li>Informations obligatoires : Nom complet, Titre/Poste, Téléphone, Email, Adresse/Site web</li><li>Optionnel : Logo, Photo, QR Code, Réseaux sociaux</li></ol><h3>Règles de design carte de visite</h3><ul><li>Police minimum 8pt pour être lisible une fois imprimée</li><li>Fond blanc ou couleur sobre</li><li>Laisser une marge de sécurité de 3mm au bord</li><li>Résolution images : minimum 300 DPI pour impression</li></ul><h2>🎭 Créer une Affiche (Poster)</h2><p>L''affiche est un grand format (A3, A2 ou A1) conçu pour être vue de loin. Règles :</p><ul><li><strong>Titre géant</strong> : Lisible à 5 mètres de distance — minimum 60pt</li><li><strong>Image forte</strong> : Occupe 50-70% de l''espace</li><li><strong>Informations essentielles seulement</strong> : Date, lieu, contact</li><li><strong>Une seule couleur dominante</strong> : Plus frappant</li></ul><h2>🖨️ Préparer pour l''impression</h2><p>Fichier → Imprimer → Propriétés de l''imprimante → Choisir la qualité "Haute résolution". Pour une imprimerie professionnelle : exporter en PDF avec résolution 300 DPI.</p>',
      '<h2>💼 Business Cards</h2><p>Standard size: 85×54mm. File → New → Business Cards → Choose template. Required info: Full name, title, phone, email. Design rules: min 8pt font, 3mm safety margin, 300 DPI images.</p><h2>🎭 Posters</h2><p>Large format (A3/A2/A1). Rules: 60pt+ title (readable at 5m), image covers 50-70%, essential info only, one dominant color. Export as 300 DPI PDF for professional printing.</p>',
      4, 0, 45, 4),
  ROW('Leçon 5 — Mise en page avancée et Export PDF',
      'Lesson 5 — Advanced Layout and PDF Export',
      '<h2>🎨 Maîtriser la mise en page Publisher</h2><h3>Les repères (guides)</h3><p>Les repères sont des lignes non imprimables qui aident à aligner vos éléments. Types :<br>• Repères de marges (bordures de la zone imprimable)<br>• Repères de colonnes (diviser la page en bandes)<br>• Repères de lignes de base (aligner le texte horizontalement)<br>• Repères personnalisés (cliquer-glisser depuis les règles)</p><h3>Aligner et distribuer les objets</h3><p>Accueil → Organiser → Aligner : alignez plusieurs objets sélectionnés. Ctrl+clic pour sélectionner plusieurs éléments. "Distribuer horizontalement/verticalement" pour espacer régulièrement.</p><h3>Grouper les objets</h3><p>Sélectionner plusieurs objets → Clic droit → Grouper. Le groupe se déplace et se redimensionne comme un seul objet.</p><h2>📤 Export et publication</h2><h3>Exporter en PDF haute qualité</h3><ol><li>Fichier → Enregistrer sous → Type : PDF</li><li>Options → Qualité d''impression → Haute résolution</li><li>Cocher "Inclure les polices incorporées"</li></ol><h3>Envoyer par email</h3><p>Fichier → Partager → Envoyer par email → En tant que PDF joint</p><h3>Imprimer commercialement</h3><p>Fichier → Exporter → Enregistrer pour un prestataire d''impression → Suivre l''assistant</p><div style="background:rgba(0,176,255,.08);border-left:4px solid #00B0FF;padding:1rem;border-radius:0 8px 8px 0;margin-top:1rem;">💡 Publisher vs Word : Pour un document avec beaucoup d''images et de design (flyer, brochure, affiche) → utilisez Publisher. Pour un document essentiellement textuel (rapport, lettre, contrat) → utilisez Word.</div>',
      '<h2>🎨 Advanced Layout</h2><p>Guides: margin guides, column guides, baseline guides, custom guides (drag from rulers). Align objects: Home → Arrange → Align. Group objects: select multiple → Right-click → Group.</p><h2>📤 Export</h2><p>File → Save As → PDF → Options → High print quality → Include embedded fonts. For commercial printing: File → Export → Save for a Print Provider.</p>',
      5, 0, 50, 5)
) AS vals(titre, titre_en, contenu, contenu_en, numero_cours, est_gratuit, duree_minutes, ordre)
WHERE c.slug = 'publisher';

-- === FIX YOUTUBE VIDEOS PHOTOSHOP ===
-- Mete ID video YouTube ki reyèlman disponib an français sou Photoshop
UPDATE cours SET video_url = 'https://www.youtube.com/embed/8UoFBbFqKhc'
WHERE categorie_id = (SELECT id FROM categories WHERE slug='photoshop') AND numero_cours = 1;

UPDATE cours SET video_url = 'https://www.youtube.com/embed/8gSFbYHqe50'
WHERE categorie_id = (SELECT id FROM categories WHERE slug='photoshop') AND numero_cours = 2;

UPDATE cours SET video_url = 'https://www.youtube.com/embed/1FLiMMkEZNQ'
WHERE categorie_id = (SELECT id FROM categories WHERE slug='photoshop') AND numero_cours = 3;

UPDATE cours SET video_url = 'https://www.youtube.com/embed/HVJA_xXNF2Y'
WHERE categorie_id = (SELECT id FROM categories WHERE slug='photoshop') AND numero_cours = 4;

UPDATE cours SET video_url = 'https://www.youtube.com/embed/wjpE8GU_Q3U'
WHERE categorie_id = (SELECT id FROM categories WHERE slug='photoshop') AND numero_cours = 5;

UPDATE cours SET video_url = 'https://www.youtube.com/embed/sgnPcxeQ6wo'
WHERE categorie_id = (SELECT id FROM categories WHERE slug='photoshop') AND numero_cours = 6;

UPDATE cours SET video_url = 'https://www.youtube.com/embed/MFH4h4eMnUs'
WHERE categorie_id = (SELECT id FROM categories WHERE slug='photoshop') AND numero_cours = 7;

UPDATE cours SET video_url = 'https://www.youtube.com/embed/4X7M2IBZFOA'
WHERE categorie_id = (SELECT id FROM categories WHERE slug='photoshop') AND numero_cours = 8;

-- Examen pou Publisher Leçon 1
INSERT IGNORE INTO examens (cours_id, titre, titre_en, score_minimum)
SELECT c.id, 'Examen — Leçon 1: Introduction à Publisher', 'Exam — Lesson 1: Introduction to Publisher', 70
FROM cours c JOIN categories cat ON c.categorie_id=cat.id WHERE cat.slug='publisher' AND c.numero_cours=1;

SELECT 'Patch Publisher + YouTube appliqué!' AS Rezilta;
