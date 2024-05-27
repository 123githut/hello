import '../providers/card_model.dart';
import '../models/advisor_model.dart';

List<CardModel> cardList = [
  CardModel(
      "lib/assets/images/pic_tarot/ace_of_cups.png",
      "cups",
      "Peaceful Harmoniously Warm",
      "The sun was setting behind the distant hills, casting a warm golden glow across the tranquil valley. As evening descended, the chirping of crickets filled the air, blending harmoniously with the gentle rustle of leaves in the breeze. It was a peaceful scene, a moment of serenity amid the chaos of the world.",
      true),
  CardModel(
      "lib/assets/images/pic_tarot/ace_of_pentacles.png",
      "pentacles",
      "Grounded Stability ",
      "Pentacles signifies new opportunities for financial growth and stability. It represents the start of a journey toward material prosperity, urging you to seize practical opportunities for success. This card advises you to stay grounded, focus on financial security, and make wise investments for the future.",
      true),
  CardModel(
      "lib/assets/images/pic_tarot/ace_of_swords.png",
      "swords",
      "Truth Insight Justice",
      "Swords symbolizes mental clarity, breakthroughs, and new ideas. It represents a fresh start in matters of the mind, urging you to embrace truth, clarity, and insight. This card encourages clear communication, intellectual strength, and the pursuit of truth and justice.",
      true),
  CardModel(
      "lib/assets/images/pic_tarot/ace_of_wands.png",
      "wands",
      "Passion Enthusiasm Creativity",
      "Wands signifies new beginnings, creativity, and potential. It represents the spark of inspiration and the birth of creative projects or ideas. This card encourages you to embrace your passions, take bold action, and pursue your goals with enthusiasm.",
      true),
  CardModel(
      "lib/assets/images/pic_tarot/death.png",
      "death",
      "Transformation Growth Renewal",
      "Death card symbolizes transformation, endings, and new beginnings. It represents the natural cycle of change and growth, urging you to embrace change and let go of the past. This card signifies the end of a chapter in your life and the beginning of something new and transformative. It encourages you to release old habits, beliefs, or situations that no longer serve you, allowing space for growth and renewal.",
      true),
  CardModel(
      "lib/assets/images/pic_tarot/eight_of_cups.png",
      "eight cups",
      "Quest Transition Meaning",
      "Eight of Cups suggests a journey of emotional growth and self-discovery. It represents the need to leave behind something familiar or comfortable in search of deeper fulfillment. This card signifies a period of transition where you may feel compelled to walk away from situations, relationships, or environments that no longer serve your highest good",
      true),
  CardModel(
      "lib/assets/images/pic_tarot/eight_of_pentacles.png",
      "eight pentacles",
      "Discipline Mastery Dedication",
      "Eight of Pentacles signifies dedication, craftsmanship, and mastery. It represents a focus on hard work, skill development, and attention to detail in order to achieve long-term success. This card suggests that through diligence and perseverance, you can make significant progress in your endeavors and reach a level of proficiency in your craft. It encourages you to take pride in your work, be disciplined in your efforts, and strive for excellence. ",
      true),
  CardModel(
      "lib/assets/images/pic_tarot/eight_of_swords.png",
      "eight swords",
      "Restriction Fear Breaking free",
      "the Eight of Swords suggests feelings of restriction, limitation, and being trapped in a challenging situation. It represents a state of mental imprisonment, where you may feel powerless or paralyzed by fear, self-doubt, or external circumstances. This card often indicates a need to break free from negative thought patterns, self-imposed limitations, or situations that hold you back from reaching your full potential. ",
      true),
  CardModel(
      "lib/assets/images/pic_tarot/eight_of_wands.png",
      "eight wands",
      "Progress Momentum Messages",
      "Eight of Wands signifies rapid movement, progress, and communication. It represents swift developments, sudden opportunities, and a flurry of activity. This card suggests that things are moving forward quickly, and you may experience a burst of energy or excitement in your endeavors. The Eight of Wands encourages you to take advantage of the momentum and act decisively to achieve your goals. ",
      true),
  CardModel(
      "lib/assets/images/pic_tarot/five_of_cups.png",
      "five cups",
      "Grief Acceptance Reflection",
      "the Five of Cups represents loss, disappointment, and regret. It symbolizes a period of mourning or sadness over something that has been lost or didn't turn out as expected. This card suggests focusing on what went wrong or what is missing, often to the point of ignoring the positive aspects of a situation. However, it also encourages you to acknowledge your feelings of grief or disappointment and to recognize that while things may seem bleak now, there is still hope for a brighter future. ",
      true),
  CardModel(
      "lib/assets/images/pic_tarot/five_of_pentacles.png",
      "five pentacles",
      "Material loss Poverty",
      "Five of Pentacles symbolizes hardship, scarcity, and financial struggle. It represents a period of adversity, where you may be experiencing financial difficulties, material loss, or feelings of poverty. This card often suggests a sense of isolation or being left out in the cold, both literally and metaphorically. However, it also encourages you to remember that even in times of struggle, there is still hope and support available. ",
      true),
  CardModel(
      "lib/assets/images/pic_tarot/five_of_swords.png",
      "five  swords",
      "Deception Conflict Hurt",
      "Five of Swords suggests conflict, defeat, and disharmony. It represents a situation where there are winners and losers, but the victory may come at a cost. This card often indicates a sense of betrayal, manipulation, or deception, where one party may have used unfair tactics to achieve their goals. It can also signify arguments, disagreements, or power struggles that leave everyone feeling hurt or defeated. ",
      true),
  CardModel(
      "lib/assets/images/pic_tarot/five_of_wands.png",
      "five_of_wands.png",
      "Power struggles Cooperation",
      " Five of Wands represents competition, conflict, and challenges. It signifies a situation where there are multiple conflicting interests or ideas, and everyone is vying for dominance or recognition. This card suggests a period of tension, disagreement, or rivalry, where differences of opinion may lead to heated arguments or power struggles. However, it also encourages you to see this competition as an opportunity for growth and improvement. ",
      true),
  CardModel(
      "lib/assets/images/pic_tarot/four_of_cups.png",
      "four cups",
      "Dissatisfaction Boredom Reflection",
      "Four of Cups suggests introspection, contemplation, and apathy. It represents a period of discontentment, boredom, or feeling emotionally disconnected. This card often indicates a lack of interest or enthusiasm for the opportunities presented, as you may be too focused on what you perceive as missing or unsatisfactory. The Four of Cups urges you to look inward and examine your feelings and motivations.",
      true),
  CardModel(
      "lib/assets/images/pic_tarot/four_of_pentacles.png",
      "four pentacles",
      "Stability Clinging Growth",
      "Four of Pentacles suggests stability, security, and a focus on material possessions. It represents a desire for control, stability, and a sense of ownership. This card often indicates holding onto resources, whether it's money, possessions, or even emotions, out of fear of loss or change. ",
      true)
];


  List<Advisors> advisorList = [
  Advisors(
    advisorId: 'a1',
    advisorName: 'Advisor A',
    advisorAvatar: "https://img0.baidu.com/it/u=4203705147,1602011828&fm=253&fmt=auto&app=138&f=JPEG?w=400&h=400",
    advisorDesc: 'Description for Advisor A',
    services: [
      Services(
        serviceName: 'Service A1',
        serviceDesc: 'Service A1 description',
        servicePrice: 100,
      ),
      Services(
        serviceName: 'Service A2',
        serviceDesc: 'Service A2 description',
        servicePrice: 150,
      ),
    ],
  ),
  Advisors(
  advisorId: 'b2',
  advisorName: 'Advisor B',
  advisorAvatar: 'https://img0.baidu.com/it/u=1321140459,686498281&fm=253&fmt=auto&app=138&f=JPEG?w=400&h=400',
  advisorDesc: 'Description for Advisor B',
  services: [
  Services(
  serviceName: 'Service B1',
  serviceDesc: 'Service B1 description',
  servicePrice: 200,
  ),
  Services(
  serviceName: 'Service B2',
  serviceDesc: 'Service B2 description',
  servicePrice: 250,
  ),
  ],
  ),
  Advisors(
  advisorId: 'c3',
  advisorName: 'Advisor C',
  advisorAvatar: 'https://img2.baidu.com/it/u=266502902,2994849157&fm=253&fmt=auto&app=138&f=JPEG?w=400&h=400',
  advisorDesc: 'Description for Advisor C',
  services: [
  Services(
  serviceName: 'Service C1',
  serviceDesc: 'Service C1 description',
  servicePrice: 180,
  ),
  Services(
  serviceName: 'Service C2',
  serviceDesc: 'Service C2 description',
  servicePrice: 220,
  ),
  ],
  ),
  Advisors(
  advisorId: 'd4',
  advisorName: 'Advisor D',
  advisorAvatar: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfstdIs7-VqQuEvpqhi00ffkLx9klUMbN8ag&usqp=CAU',
  advisorDesc: 'Description for Advisor D',
  services: [
  Services(
  serviceName: 'Service D1',
  serviceDesc: 'Service D1 description',
  servicePrice: 210,
  ),
  Services(
  serviceName: 'Service D2',
  serviceDesc: 'Service D2 description',
  servicePrice: 260,
  ),
  ],
  ),
  Advisors(
  advisorId: 'e5',
  advisorName: 'Advisor E',
  advisorAvatar: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIjYTPGglGL57sbvoF2SOvD-fgM67Sod0KyA&usqp=CAU',
  advisorDesc: 'Description for Advisor E',
  services: [
  Services(
  serviceName: 'Service E1',
  serviceDesc: 'Service E1 description',
  servicePrice: 190,
  ),
  Services(
  serviceName: 'Service E2',
  serviceDesc: 'Service E2 description',
  servicePrice: 230,
  ),
  ],
  ),
  Advisors(
  advisorId: 'f6',
  advisorName: 'Advisor F',
  advisorAvatar: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVEFIbQJnBXZd9ZVTYtyAgkZ5JXsI-S-wcqq4LRlgyUhbFqg6qjGtEbw5LKpOuRR0HWaw&usqp=CAU',
  advisorDesc: 'Description for Advisor F',
  services: [
  Services(
  serviceName: 'Service F1',
  serviceDesc: 'Service F1 description',
  servicePrice: 220,
  ),
  Services(
  serviceName: 'Service F2',
  serviceDesc: 'Service F2 description',
  servicePrice: 270,
  ),
  ],
  ),
  Advisors(
  advisorId: 'g7',
  advisorName: 'Advisor G',
  advisorAvatar: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7o_ajG4Npg9kv9FNVH6XQX1qodcRW7Yz5tg&usqp=CAU',
  advisorDesc: 'Description for Advisor G',
  services: [
  Services(
  serviceName: 'Service G1',
  serviceDesc: 'Service G1 description',
  servicePrice: 200,
  ),
  Services(
  serviceName: 'Service G2',
  serviceDesc: 'Service G2 description',
  servicePrice: 240,
  ),
  ],
  ),
  Advisors(
  advisorId: 'h8',
  advisorName: 'Advisor H',
  advisorAvatar: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ20i09wjGYsh--Px2HVBx_aqAjzEi8kk2W3Q&usqp=CAU',
  advisorDesc: 'Description for Advisor H',
  services: [
  Services(
  serviceName: 'Service H1',
  serviceDesc: 'Service H1 description',
  servicePrice: 170,
  ),
  Services(
  serviceName: 'Service H2',
  serviceDesc: 'Service H2 description',
  servicePrice: 210,
  ),
  ],
  ),
  Advisors(
  advisorId: 'i9',
  advisorName: 'Advisor I',
  advisorAvatar: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq3gImUEj_E09pklOogL7UHEJEHt1LLFM3Zg&usqp=CAU',
  advisorDesc: 'Description for Advisor I',
  services: [
  Services(
  serviceName: 'Service I1',
  serviceDesc: 'Service I1 description',
  servicePrice: 250,
  ),
  Services(
  serviceName: 'Service I2',
  serviceDesc: 'Service I2 description',
  servicePrice: 290,
  ),
  ],
  ),
    Advisors(
      advisorId: 'i10',
      advisorName: 'Advisor J',
      advisorAvatar: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYqODBhVycHb7gk5HmDqLd5lHLaTWIaRjnmTCS1aqGaKoyPHavxXBFS-FZax_VcbyOA_Q&usqp=CAU',
      advisorDesc: 'Description for Advisor J',
      services: [
        Services(
          serviceName: 'Service J1',
          serviceDesc: 'Service J1 description',
          servicePrice: 250,
        ),
        Services(
          serviceName: 'Service J2',
          serviceDesc: 'Service J2 description',
          servicePrice: 290,
        ),
      ],
    ),
];
