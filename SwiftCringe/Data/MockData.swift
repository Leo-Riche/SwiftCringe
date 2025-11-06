struct MockData {
    static let users: [User] = [
        User(id: 1, name: "Alice Dupont", email: "alice.dupont@example.com", age: 25, password: "alice123",
             photo: "https://randomuser.me/api/portraits/women/1.jpg",
             description: "Passionnée de design et de voyages, Alice adore découvrir de nouvelles cultures et s’inspirer de l’art local. Elle passe ses week-ends à explorer de nouveaux endroits, appareil photo à la main. Toujours curieuse, elle aime partager ses découvertes à travers des projets créatifs et des carnets illustrés. Son rêve ? Travailler à l’étranger pour allier création et aventure.",
             listLikes: [],
             interests: ["Design", "Voyage", "Culture", "Photographie"]),
        
        User(id: 2, name: "Bruno Martin", email: "bruno.martin@example.com", age: 30, password: "bruno456",
             photo: "https://randomuser.me/api/portraits/men/2.jpg",
             description: "Développeur backend passionné, Bruno trouve son équilibre entre le code, la nature et un bon café. Il aime partir en randonnée pour se déconnecter après une semaine passée devant son écran. Curieux de nouvelles technologies, il consacre aussi du temps à contribuer à des projets open source. Toujours partant pour un défi, il adore escalader les sommets autant que résoudre des bugs coriaces.",
             listLikes: [],
             interests: ["Café", "Randonnée", "Programmation", "Montagne"]),
        
        User(id: 3, name: "Claire Rousseau", email: "claire.rousseau@example.com", age: 27, password: "claire789",
             photo: "https://randomuser.me/api/portraits/women/3.jpg",
             description: "Graphiste et illustratrice, Claire aime donner vie aux idées à travers des visuels colorés et expressifs. Elle passe beaucoup de temps dans les musées à observer la lumière, les formes et les textures. Quand elle ne dessine pas, elle explore de nouvelles techniques d’aquarelle ou de motion design. Son univers mêle poésie visuelle et storytelling moderne.",
             listLikes: [],
             interests: ["Illustration", "Peinture", "Art", "Musées"]),
        
        User(id: 4, name: "David Lefèvre", email: "david.lefevre@example.com", age: 35, password: "david000",
             photo: "https://randomuser.me/api/portraits/men/4.jpg",
             description: "Chef de projet expérimenté, David aime orchestrer des équipes vers un objectif commun tout en gardant une touche humaine dans la gestion. Amateur de cinéma, il trouve souvent des parallèles entre la mise en scène d’un film et la gestion d’un projet. Il est aussi un grand joueur de jeux vidéo, où il cultive stratégie et réflexion. Toujours curieux, il s'intéresse aux innovations technologiques et à leur impact sur le travail collaboratif.",
             listLikes: [],
             interests: ["Cinéma", "Jeux vidéo", "Gestion", "Tech"]),
        
        User(id: 5, name: "Emma Petit", email: "emma.petit@example.com", age: 22, password: "emma123",
             photo: "https://randomuser.me/api/portraits/women/5.jpg",
             description: "Étudiante en marketing digital, Emma est une véritable passionnée de créativité et de communication. Elle adore analyser les tendances sur les réseaux sociaux et imaginer des campagnes innovantes. Toujours souriante et curieuse, elle puise son inspiration dans la mode, la musique et les rencontres. Son ambition ? Créer une marque qui allie authenticité et impact positif.",
             listLikes: [],
             interests: ["Marketing", "Réseaux sociaux", "Mode", "Musique"]),
        
        User(id: 6, name: "François Bernard", email: "francois.bernard@example.com", age: 28, password: "francois456",
             photo: "https://randomuser.me/api/portraits/men/6.jpg",
             description: "Photographe passionné de nature, François aime capturer la beauté brute du monde qui l’entoure. Lever de soleil, forêt enneigée ou océan déchaîné : chaque moment est une opportunité de figer l’émotion. En dehors de son appareil photo, il aime randonner et rencontrer d’autres voyageurs pour partager leurs histoires. Il rêve de publier un livre photo sur la nature sauvage.",
             listLikes: [],
             interests: ["Photographie", "Nature", "Voyage", "Animaux"]),
        
        User(id: 7, name: "Gabrielle Laurent", email: "gabrielle.laurent@example.com", age: 26, password: "gabrielle123",
             photo: "https://randomuser.me/api/portraits/women/7.jpg",
             description: "Professeure de yoga, Gabrielle vit selon une philosophie d’équilibre entre le corps et l’esprit. Elle anime des ateliers de méditation et de respiration consciente, qu’elle considère comme des outils de transformation. Lorsqu’elle ne donne pas de cours, elle aime cuisiner des plats végétariens et lire sur le développement personnel. Toujours à l’écoute, elle aspire à inspirer les autres à ralentir et se reconnecter à l’essentiel.",
             listLikes: [],
             interests: ["Yoga", "Méditation", "Bien-être", "Nutrition"]),
        
        User(id: 8, name: "Hugo Fontaine", email: "hugo.fontaine@example.com", age: 31, password: "hugo789",
             photo: "https://randomuser.me/api/portraits/men/8.jpg",
             description: "Ingénieur en mécanique, Hugo aime comprendre comment les choses fonctionnent, du moteur de voiture au design d’un vélo. Passionné de sports extrêmes, il consacre ses week-ends à faire du VTT ou du parapente. Il apprécie aussi les voyages dans des lieux reculés pour repousser ses limites. Toujours en quête d’adrénaline, il croit que l’aventure commence là où finit la zone de confort.",
             listLikes: [],
             interests: ["Sports extrêmes", "Mécanique", "Voyage", "VTT"]),
        
        User(id: 9, name: "Isabelle Caron", email: "isabelle.caron@example.com", age: 29, password: "isabelle123",
             photo: "https://randomuser.me/api/portraits/women/9.jpg",
             description: "Amoureuse de la mer, Isabelle trouve son équilibre entre lecture et balades en bord de plage. Elle adore cuisiner des plats italiens pour ses amis et passer des soirées à discuter autour d’un bon verre de vin. Bibliophile passionnée, elle dévore aussi bien des romans classiques que des essais modernes. Pour elle, la beauté réside dans les petits moments du quotidien.",
             listLikes: [],
             interests: ["Lecture", "Cuisine", "Mer", "Vin"]),
        
        User(id: 10, name: "Julien Moreau", email: "julien.moreau@example.com", age: 33, password: "julien000",
             photo: "https://randomuser.me/api/portraits/men/10.jpg",
             description: "Passionné par la technologie, Julien aime comprendre les innovations qui façonnent le monde d’aujourd’hui. Il adore aussi les jeux de société, qu’il considère comme un moyen de renforcer les liens entre amis. Curieux et créatif, il explore régulièrement de nouveaux outils et concepts en ligne. Son rêve : créer une start-up qui allie tech, créativité et impact social positif.",
             listLikes: [],
             interests: ["Technologie", "Jeux de société", "Lecture", "Innovation"])
    ]
}
