

import SwiftUI

// Struct for Identifiable Day
struct Day: Identifiable {
    let id = UUID()
    let number: Int
    let title: String
    let content: String
}

// Struct for Identifiable Devotional
struct Devotional: Identifiable {
    let id = UUID()
    let name: String
    let days: [Day]
}

struct DevotionalsPage: View {
    @State private var selectedDevo: Devotional? = nil // Tracks selected devotional
    @State private var selectedDay: Day? = nil // Tracks selected day
    @State private var isDayView: Bool = false // Tracks whether we are viewing a specific day

    // Devotionals with unique 7-day content
    let devotionals = [
        Devotional(
            name: "Keep Fighting",
            days: [
                Day(number: 1, title: "Trust the Bigger Picture", content: """
                Proverbs 3:5-6 (NIV)
                "Trust in the Lord with all your heart and lean not on your own understanding; in all your ways submit to him, and he will make your paths straight."
                
                Sometimes, life feels like one giant puzzle where the pieces don’t seem to fit. When I was in middle school, I tried out for the basketball team. I practiced for weeks but didn’t make the cut. I felt crushed. I questioned God, asking why He would let me fail at something I worked so hard for.
                
                But what I didn’t see then was the bigger picture. That year, I joined a youth group where I grew closer to God and made lifelong friends. God wasn’t rejecting me—He was redirecting me. Trusting God means believing He’s weaving a masterpiece in your life, even when the pieces seem out of place.
                
                Prayer:
                Lord, help me trust You with every part of my life, even when I don’t understand what’s happening. Teach me to rely on Your plan, not mine. Amen.
                """),
                
                Day(number: 2, title: "Fighting Temptation", content: """
                Fighting Temptation

                Bible Passage: 1 Corinthians 10:13 (NIV)
                "No temptation has overtaken you except what is common to mankind. And God is faithful; he will not let you be tempted beyond what you can bear. But when you are tempted, he will also provide a way out so that you can endure it."

                You’re sitting in the lunchroom, and someone starts talking about a classmate. Everyone laughs, and you feel that tug to join in. It’s easier to fit in than to stand out, right? But then you remember: God gives you the strength to choose better.

                Temptations come in all shapes and sizes, but they’re never too big for God to handle. He promises to give you an escape route. Maybe for you, that means changing the subject or standing up for someone. It’s not easy, but living for God rarely is—and it’s always worth it.

                Prayer:
                God, thank You for Your strength when I face temptation. Help me remember that You’re always with me, giving me a way out. Give me courage to make choices that honor You. Amen.
                """),
                Day(number: 3, title: "Faith Over Fear", content: """
                Faith Over Fear

                Bible Passage: Joshua 1:9 (NIV)
                "Have I not commanded you? Be strong and courageous. Do not be afraid; do not be discouraged, for the Lord your God will be with you wherever you go."

                Imagine standing on the edge of a high dive for the first time. Your heart races. Your legs feel like Jell-O. Fear tells you to back away, but something deep inside whispers, “You can do this.”

                Living out your faith can feel like that high dive. Maybe you’re nervous about praying in public or inviting a friend to church. But God calls us to courage. He’s the one standing in the water below, ready to catch you. Trust Him, and take the leap.

                Prayer:
                Lord, I’m scared sometimes. Help me choose faith over fear, knowing You’re always with me. Give me strength to take bold steps for You. Amen.
                """),
                Day(number: 4, title: "TChoosing Joy in Trials", content: """
                Choosing Joy in Trials

                Bible Passage: James 1:2-4 (NIV)"Consider it pure joy, my brothers and sisters, whenever you face trials of many kinds, because you know that the testing of your faith produces perseverance."

                It’s hard to imagine joy when things go wrong. When I failed my math test last year, I felt defeated. But my teacher offered to help, and through her support, I not only improved my grade but learned perseverance.

                God uses trials to grow us. It’s not about pretending everything’s okay—it’s about trusting that God is working in the mess. Joy doesn’t come from perfect circumstances but from knowing God is always shaping us.

                Prayer:Jesus, help me find joy in every situation, even when life feels tough. Remind me that You are making me stronger through every trial. Amen.
                """),
                Day(number: 5, title: "Living Differently", content: """
                Living Differently

                Bible Passage: Romans 12:2 (NIV)"Do not conform to the pattern of this world, but be transformed by the renewing of your mind. Then you will be able to test and approve what God’s will is—his good, pleasing and perfect will."

                Being different isn’t always easy. In a world where popularity often means blending in, standing out for God can feel lonely. Maybe you’re the only one in your class who doesn’t cheat on homework or who says “no” to a party that doesn’t honor God.

                But here’s the thing: living differently means reflecting Jesus. People will notice, and it may even inspire them. God didn’t call you to blend in—He called you to stand out.

                Prayer:God, renew my mind and help me live differently. Give me the courage to stand out and reflect Your light in a world that needs You. Amen.
                """),
                Day(number: 6, title: "Forgiveness is Freedom", content: """
                Forgiveness Is Freedom

                Bible Passage: Matthew 6:14-15 (NIV)"For if you forgive other people when they sin against you, your heavenly Father will also forgive you. But if you do not forgive others their sins, your Father will not forgive your sins."

                I’ll never forget when my best friend said something behind my back. I felt betrayed and didn’t want to forgive her. But holding onto that grudge weighed me down. When I finally forgave her, I felt free.

                Forgiveness isn’t about letting the other person off the hook—it’s about letting God take care of the situation. When you forgive, you’re the one who heals.

                Prayer:Lord, help me forgive those who hurt me, just as You have forgiven me. Teach me to let go of grudges and trust You with my heart. Amen.
                """),
                Day(number: 7, title: "God's Purpose for You", content: """
                God’s Purpose for You

                Bible Passage: Jeremiah 29:11 (NIV)"For I know the plans I have for you," declares the Lord, "plans to prosper you and not to harm you, plans to give you hope and a future."

                Have you ever felt like you don’t know what your purpose is? Maybe you’ve wondered if God really has a plan for you. Let me tell you—He does. Think about a GPS. You might take wrong turns, but the GPS recalculates to get you back on track. God does the same in our lives.

                Your journey may not look like anyone else’s, and that’s okay. Trust that God is guiding you toward something amazing.

                Prayer:God, thank You for creating me with a purpose. Help me trust Your plan, even when I don’t see the full picture. Lead me in Your will. Amen.
                """)
            ]
        ),
        Devotional(
            name: "You're More Than",
            days: [
                Day(number: 1, title: "You're More Than a Winner", content: """
                You Are More Than a Winner

                Bible Passage: Romans 8:35-39 (NIV)Who shall separate us from the love of Christ? Shall trouble or hardship or persecution or famine or nakedness or danger or sword? No, in all these things we are more than conquerors through him who loved us.

                Story:Have you ever felt like giving up? Maybe it was during a big test, a tough sports game, or even a personal challenge at home. There was this one time when I tried out for the basketball team, and I missed almost every shot during tryouts. I thought, "This isn’t for me. I’m just not good enough." But a friend reminded me, "It’s not about being perfect; it’s about giving your best and trusting God for the rest." That moment taught me that no failure can separate us from God’s love. Even when we feel defeated, Jesus has already won the ultimate victory for us. We’re not just winners—we’re conquerors!

                Prayer:Jesus, thank You for loving me even when I feel like a failure. Help me to remember that I’m more than a conqueror through You. When life gets tough, remind me that nothing can separate me from Your love. Amen.
                """),
                Day(number: 2, title: "Facing the Giants", content: """
                Facing the Giants

                Bible Passage: 1 Samuel 17:45-50 (NIV)David said to the Philistine, “You come against me with sword and spear and javelin, but I come against you in the name of the Lord Almighty, the God of the armies of Israel, whom you have defied.”

                Story:Have you ever faced something that seemed impossible? Maybe it’s a bully at school, a tough subject, or even a personal fear. David was just a teenager when he faced Goliath, a giant no one thought he could defeat. But David wasn’t afraid because he knew God was on his side. I remember a time when I had to give a speech in front of the whole school. I was terrified! But then, I prayed and remembered David’s courage. With God’s help, I faced my "giant" and made it through. You can too!

                Prayer:God, thank You for giving me the courage to face my fears. Just like David, help me to trust You when I feel small compared to my problems. Remind me that with You, all things are possible. Amen.
                """),
                Day(number: 3, title: "Strength in Weakness", content: """
                Strength in Weakness

                Bible Passage: 2 Corinthians 12:9-10 (NIV)But he said to me, “My grace is sufficient for you, for my power is made perfect in weakness.” Therefore I will boast all the more gladly about my weaknesses, so that Christ’s power may rest on me.

                Story:Do you ever feel like you’re not enough? Maybe you’re not the fastest, the smartest, or the most popular. Paul felt weak too, but he learned that God’s power works best in weakness. One time, I completely bombed a math test. I was embarrassed and felt like a failure. But instead of giving up, I asked God for strength and started studying harder. I realized that God’s grace is enough—even in our weakest moments.

                Prayer:Jesus, thank You for being strong when I feel weak. Teach me to rely on Your grace and power instead of trying to do everything on my own. Help me see that my weaknesses can bring You glory. Amen.
                """),
                Day(number: 4, title: "Run Your Race", content: """
                Run Your Race

                Bible Passage: Hebrews 12:1-3 (NIV)Let us run with perseverance the race marked out for us, fixing our eyes on Jesus, the pioneer and perfecter of faith.

                Story:Have you ever run a race? I’ll never forget my first 5K. Halfway through, I wanted to quit. My legs hurt, and I felt like I couldn’t go any further. But then I saw a friend cheering me on at the finish line, and I kept going. Life is like that race. There will be times when you want to give up, but Jesus is your biggest cheerleader, encouraging you to keep going. Don’t quit—the finish line is worth it!

                Prayer:Lord, help me to run the race You’ve set before me with perseverance. When I feel tired or discouraged, remind me to fix my eyes on You. Thank You for being my strength and my encourager. Amen.
                """),
                Day(number: 5, title: "Armor Up", content: """
                Armor Up

                Bible Passage: Ephesians 6:10-18 (NIV)Put on the full armor of God, so that you can take your stand against the devil’s schemes.

                Story:Every superhero has their gear, right? Batman has his utility belt, Iron Man has his suit, and you have the armor of God! Life is full of battles—temptations, peer pressure, doubts. But God doesn’t leave us unprotected. One time, I was tempted to lie to get out of trouble, but I remembered the "belt of truth" and chose honesty instead. God’s armor helps us stand firm no matter what we face.

                Prayer:God, thank You for giving me Your armor to stand strong. Help me to put on truth, righteousness, faith, and salvation every day. Teach me to rely on Your Word and prayer to fight life’s battles. Amen.

                """),
                Day(number: 6, title: "Unshakable Faith", content: """
                Unshakable Faith

                Bible Passage: Matthew 7:24-27 (NIV)Therefore everyone who hears these words of mine and puts them into practice is like a wise man who built his house on the rock.

                Story:Imagine building a sandcastle at the beach. It looks great until the waves come and wash it away. That’s what life is like when we don’t build it on Jesus. I remember a time when a close friendship fell apart, and I felt lost. But because my faith was built on Jesus, I didn’t fall apart. I stood strong because He is my rock. Is your faith built on something unshakable?

                Prayer:Jesus, thank You for being my solid foundation. Help me to hear Your words and put them into practice. Teach me to trust You, even when life feels like shifting sand. Amen.
                """),
                Day(number: 7, title: "Victory is Yours", content: """
                Victory is Yours

                Bible Passage: 1 John 5:4-5 (NIV)For everyone born of God overcomes the world. This is the victory that has overcome the world, even our faith.

                Story:Have you ever played on a winning team? There’s no better feeling than victory! As believers, we’re already on the winning team because of Jesus. I remember playing a board game with my family and knowing I was going to win because I had the best card. That’s how it is with Jesus—He’s already secured the victory for us. All we have to do is trust Him.

                Prayer:Lord, thank You for giving me victory through Jesus. Help me to walk in faith, knowing that You’ve already overcome the world. Teach me to live as a conqueror every day. Amen.

                """)
            ]
        ),
        Devotional(
            name: "When Life Gives You Lemons",
            days: [
                Day(number: 1, title: "Peace in the Storm", content: """
                Peace in the Storm

                Bible Passage: Mark 4:35-41 (NIV)
                “He got up, rebuked the wind and said to the waves, ‘Quiet! Be still!’ Then the wind died down, and it was completely calm.”

                Story:
                Imagine it’s the night before a big exam, and you’re sitting at your desk feeling overwhelmed. No matter how much you study, your brain feels foggy, and anxiety creeps in. You start thinking, “What if I fail?” That’s exactly how the disciples felt when they were caught in a storm on the lake. They thought they were doomed, even though Jesus was right there with them. But what did Jesus do? He spoke peace into the chaos.

                In the same way, God can calm the storms in your life. Maybe your storm is family drama, a health struggle, or feeling like you don’t measure up. Whatever it is, God is powerful enough to bring peace. Trust Him, even when things feel out of control.

                Prayer:
                Dear Jesus, when life feels overwhelming, remind me that You are bigger than my storms. Help me to trust You to bring peace and calm, even when everything around me feels chaotic. Thank You for always being with me. Amen.
                """),
                Day(number: 2, title: "Strength in Weakness", content: """
                Strength in Weakness

                Bible Passage: 2 Corinthians 12:9-10 (NIV)

                But he said to me, "My grace is sufficient for you, for my power is made perfect in weakness." Therefore I will boast all the more gladly about my weaknesses, so that Christ’s power may rest on me. That is why, for Christ’s sake, I delight in weaknesses, in insults, in hardships, in persecutions, in difficulties. For when I am weak, then I am strong.

                Story:
                Have you ever felt like you’re not enough? Maybe you didn’t make the team, or you bombed that solo you practiced for weeks. When we hit those moments of weakness, it’s easy to feel defeated. But Paul reminds us that God’s strength shows up best when we feel weakest. A friend of mine once shared how they felt unqualified to speak in front of a group, but when they did, God’s message came through clearly. God uses our weaknesses to show His strength. So don’t be afraid to admit you can’t do it all—that’s when God steps in.

                Prayer:
                God, I don’t like feeling weak, but I’m so grateful that Your strength is enough. Help me to rely on You when I feel like I can’t go on. Use my weaknesses to show Your glory. Amen.
                """),
                Day(number: 3, title: "Unshakable Faith", content: """
                Unshakable Faith

                Bible Passage: Psalm 46:1-3 (NIV)

                God is our refuge and strength, an ever-present help in trouble. Therefore we will not fear, though the earth give way and the mountains fall into the heart of the sea, though its waters roar and foam and the mountains quake with their surging.

                Story:
                There’s a story about a girl whose family lost everything in a house fire. She shared how she could’ve let fear and anger take over, but instead, she turned to God. She found comfort knowing that even though she lost all her stuff, she still had God as her refuge. Life will throw tough things at us, but God never changes. He’s the rock you can stand on when everything else feels like it’s falling apart.

                Prayer:
                Father, thank You for being my refuge and strength. When everything around me feels shaky, help me to remember that You are unshakable. Give me faith to trust You in every situation. Amen.
                """),
                Day(number: 4, title: "Light in the Darkness", content: """
                Light in the Darkness

                Bible Passage: John 8:12 (NIV)

                When Jesus spoke again to the people, he said, "I am the light of the world. Whoever follows me will never walk in darkness, but will have the light of life."

                Story:
                Have you ever walked into a dark room and couldn’t find the light switch? It’s scary until you find the light and can see again. Life can feel like that sometimes—like you’re walking in darkness with no direction. Jesus promises to be our light. A friend of mine was struggling with depression and felt like there was no way out. But when they started reading God’s Word and praying, it was like a light started shining in their life, giving them hope. Jesus can do the same for you.

                Prayer:
                Jesus, thank You for being the light in my darkness. Help me to follow You and trust that You will guide me, even when I can’t see what’s ahead. Amen.
                """),
                Day(number: 5, title: "Peace Beyond Understanding", content: """
                Peace Beyond Understanding

                Bible Passage: Philippians 4:6-7 (NIV)

                Do not be anxious about anything, but in every situation, by prayer and petition, with thanksgiving, present your requests to God. And the peace of God, which transcends all understanding, will guard your hearts and your minds in Christ Jesus.

                Story:
                Before a big exam, it’s easy to feel overwhelmed. A classmate of mine once said they pray before every test. It’s not about magically getting the answers but about finding peace in knowing God is with them no matter the outcome. When you bring your worries to God, He replaces them with peace—a peace that doesn’t make sense to the world but fills your heart and mind.

                Prayer:
                Lord, I bring my worries to You today. Thank You for offering peace that goes beyond what I can understand. Help me to trust You with every part of my life. Amen.
                """),
                Day(number: 6, title: "Victory in Christ", content: """
                Victory in Christ

                Bible Passage: Romans 8:37-39 (NIV)

                No, in all these things we are more than conquerors through him who loved us. For I am convinced that neither death nor life, neither angels nor demons, neither the present nor the future, nor any powers, neither height nor depth, nor anything else in all creation, will be able to separate us from the love of God that is in Christ Jesus our Lord.

                Story:
                There’s a high school football player who always shares his faith after every game, win or lose. He knows his identity isn’t tied to the scoreboard but to Christ’s victory. Life’s battles can feel like we’re losing, but Jesus’ love makes us conquerors. No matter what you face, God’s love is bigger and stronger.

                Prayer:
                God, thank You that nothing can separate me from Your love. Help me to live as a conqueror, knowing that I have victory through You. Amen.
                """),
                Day(number: 7, title: "Hope in the Waiting", content: """
                Hope in the Waiting

                Bible Passage: Isaiah 40:31 (NIV)

                But those who hope in the Lord will renew their strength. They will soar on wings like eagles; they will run and not grow weary, they will walk and not be faint.

                Story:
                Waiting is hard. Whether it’s waiting for a prayer to be answered or for life to get better, it can feel like God is taking too long. A friend once waited months to find out if they’d gotten into their dream college. During that time, they clung to this verse. Waiting isn’t wasted time when you put your hope in God. He’s renewing your strength and preparing you for what’s next.

                Prayer:
                Lord, waiting is tough, but I know Your timing is perfect. Help me to trust in You and find strength and hope while I wait. Amen.
                """)
            ]
        ),
        Devotional(
            name: "You Belong Here",
            days: [
                Day(number: 1, title: "Who Am I", content: """
                Who Am I?

                Bible Passage: Psalm 139:13-18 (NIV)
                “For you created my inmost being; you knit me together in my mother’s womb. I praise you because I am fearfully and wonderfully made…”

                Story:
                Have you ever stood in front of a mirror and asked, “Who am I, really?” Maybe you’ve been called names at school or scrolled through social media comparing yourself to people who seem to have it all together. There’s this constant pressure to measure up, but the truth is, God isn’t asking you to fit into anyone else’s mold. He handcrafted you with purpose, from the way you laugh to the things you dream about.

                I remember my friend Jake—he felt like he was invisible at school. He wasn’t great at sports or music, and he always felt like he didn’t matter. One day, he came across Psalm 139, and something clicked. Jake realized that if God spent time creating him so intricately, then his value didn’t depend on others’ opinions. That truth changed everything for him.

                Prayer:
                God, thank You for creating me with care and purpose. Help me to see myself the way You see me—not through the lens of comparison, but through Your love. Teach me to walk in confidence, knowing I am fearfully and wonderfully made. Amen.
                """),
                Day(number: 2, title: "You Are More than Your Mistakes", content: """
                You Are More Than Your Mistakes

                Bible Passage: 2 Corinthians 5:17-21 (NIV)
                “Therefore, if anyone is in Christ, the new creation has come: The old has gone, the new is here!”

                Story:
                Have you ever felt defined by a mistake? Maybe you failed a test, hurt a friend, or did something you deeply regret. Sometimes, it feels like those moments stick to us like permanent markers. But here’s the truth: Jesus didn’t die on the cross for us to live in shame.

                A girl named Mia in my youth group once shared her story. She had made a big mistake that left her feeling like she could never face her friends or church again. But when she read 2 Corinthians 5:17, she realized that in Christ, she was a new creation. Her past didn’t define her; God’s grace did. Slowly, she began to rebuild her life with that truth as her foundation.

                Prayer:
                Jesus, thank You for making me new. When I feel trapped by my mistakes, remind me of Your forgiveness and love. Help me to live in the freedom that comes from being a new creation in You. Amen.
                """),
                Day(number: 3, title: "Finding your Worth in Christ", content: """
                Finding Your Worth in Christ

                Bible Passage: Ephesians 2:8-10 (NIV)
                “For we are God’s handiwork, created in Christ Jesus to do good works, which God prepared in advance for us to do.”

                Story:
                Do you ever feel like you’re not good enough? Maybe you try to prove your worth by getting good grades, winning competitions, or being popular. But here’s the thing: Your worth doesn’t come from what you do; it comes from who God says you are.

                A guy named Alex struggled with this. He was a straight-A student and a soccer star, but every time he failed, even a little, he felt like a total failure. When his youth leader shared Ephesians 2:10, Alex realized his worth wasn’t tied to his achievements. He was God’s masterpiece, and that truth gave him peace.

                Prayer:
                Lord, help me to see my worth in You and not in what I do. Remind me that I am Your handiwork, created for good works that glorify You. Teach me to rest in the identity You’ve given me. Amen.
                """),
                Day(number: 4, title: "Loved No Matter What", content: """
                Loved, No Matter What

                Bible Passage: Romans 8:35-39 (NIV)
                “Who shall separate us from the love of Christ? Shall trouble or hardship or persecution or famine or nakedness or danger or sword? … No, in all these things we are more than conquerors through him who loved us.”

                Story:
                Sophia felt unloved after her parents got divorced. She thought, If the people who are supposed to love me forever can’t, how can anyone else? But one night, her small group leader read Romans 8:35-39, and Sophia learned that nothing—not her parents’ divorce, not her fears, not even her own doubts—could separate her from God’s love. That love became her anchor.

                No matter how alone you feel, God’s love for you is unshakable. It’s not based on what you do or don’t do—it’s who He is.

                Prayer:
                God, thank You for loving me with a love that nothing can take away. Help me to trust in Your love, even when life feels hard. Remind me that I am always secure in You. Amen.
                """),
                Day(number: 5, title: "Be Who God Made You to Be", content: """
                Be Who God Made You to Be

                Bible Passage: 1 Peter 2:9-10 (NIV)
                “But you are a chosen people, a royal priesthood, a holy nation, God’s special possession…”

                Story:
                Josh was always trying to fit in. He acted one way with his church friends and completely different with his school friends. Deep down, he didn’t know who he really was. One day, his pastor told him, “Josh, God didn’t create you to be a copy of someone else. You’re His special possession.”

                That was a game-changer for Josh. Instead of trying to fit in, he started leaning into who God made him to be—a kind, funny, Jesus-loving guy.

                Prayer:
                Lord, thank You for choosing me and making me Your special possession. Help me to stop trying to fit in with the world and instead embrace who You’ve called me to be. Amen.
                """),
                Day(number: 6, title: "When You Feel Invisible", content: """
                When You Feel Invisible

                Bible Passage: Matthew 10:29-31 (NIV)
                “Are not two sparrows sold for a penny? Yet not one of them will fall to the ground outside your Father’s care… So don’t be afraid; you are worth more than many sparrows.”

                Story:
                Ever feel like no one notices you? Like if you disappeared, no one would even care? That’s how Emma felt. But one day, her youth leader read Matthew 10:29-31 and explained that if God cares about tiny sparrows, He definitely cares about her.

                That truth gave Emma hope. She wasn’t invisible to God, and neither are you. He knows your name, your struggles, and your dreams.

                Prayer:
                God, when I feel unseen, remind me that You see me and care deeply for me. Help me to trust in Your love and know that I matter to You. Amen.
                """),
                Day(number: 7, title: "Living Out Your Identity", content: """
                Living Out Your Identity

                Bible Passage: Galatians 2:20 (NIV)
                “I have been crucified with Christ and I no longer live, but Christ lives in me…”

                Story:
                Tyler was shy about sharing his faith at school. He was afraid people would think he was weird. But when he read Galatians 2:20, he realized his identity wasn’t about what others thought of him. It was about living for Christ.

                One day, Jimmy invited a classmate to youth group. That classmate ended up giving his life to Jesus. Tyler learned that living out his identity in Christ wasn’t always easy, but it was worth it.

                Prayer:
                Jesus, thank You for living in me. Help me to live boldly for You, even when it’s hard. Let my life reflect Your love and truth. Amen.
                """)  ]
        ),
        // Add other devotionals here
    ]

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Black Header with Image
                ZStack {
                    Color.black
                        .ignoresSafeArea(edges: .top)
                        .frame(height: 130)

                    Image("kingdom devo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: UIScreen.main.bounds.width * 1.9, maxHeight: 90)
                        .multilineTextAlignment(.center)
                }

                // Devotionals List with Background
                ZStack {
                    Image("cost bkg")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()

                    VStack(spacing: 1) {
                    // Devotional Buttons with Images
                    devoButton(imageName: "keep fighting",
                    devo: devotionals[0])
                    devoButton(imageName: "more than", devo: devotionals[1])
                    devoButton(imageName: "lemons", devo: devotionals[2])
                    devoButton(imageName: "belong", devo: devotionals[3])
                    }
                    .padding()
                
                }
            }
            .navigationBarHidden(true)
            .sheet(item: $selectedDevo) { devo in
                VStack {
                    if isDayView, let day = selectedDay {
                        Text("Day \(day.number): \(day.title)")
                            .font(.largeTitle)
                            .bold()
                            .padding()

                        Text(day.content) // Display the content for the selected day
                            .padding()
                            .multilineTextAlignment(.center)

                        HStack {
                            Button("Back") {
                                isDayView = false // Go back to the devotional selector
                                selectedDay = nil
                            }
                            .padding()
                            .frame(width: 100)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(8)

                            Button("Close") {
                                selectedDevo = nil // Dismiss the modal
                            }
                            .padding()
                            .frame(width: 100)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        }
                        .padding(.top)
                    } else {
                        Text(devo.name)
                            .font(.largeTitle)
                            .bold()
                            .padding()

                        Text("Select a Day")
                            .font(.title2)
                            .padding(.bottom)

                        // Days for the Selected Devotional
                        VStack(spacing: 10) {
                            ForEach(devo.days) { day in
                                Button(action: {
                                    selectedDay = day // Set selected day
                                    isDayView = true // Move to the day view
                                }) {
                                    Text("Day \(day.number): \(day.title)")
                                        .font(.headline)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.black)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                        .padding(.horizontal)
                                }
                            }
                        }

                        Button("Close") {
                            selectedDevo = nil // Dismiss the modal
                        }
                        .padding()
                        .frame(width: 100)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 248 / 255, green: 232 / 255, blue: 7 / 255)) // Yellow background
                .cornerRadius(10)
                .shadow(radius: 10)
            }
        }
    }

    // Function for devotional buttons
    @ViewBuilder
    private func devoButton(imageName: String, devo: Devotional) -> some View {
        Button(action: {
            selectedDevo = devo // Set the selected devotional
            isDayView = false // Ensure starting from the devotional selector
        }) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 100) // Adjust the button size
                .cornerRadius(10)
        }
    }
}

#Preview {
    DevotionalsPage()
}
