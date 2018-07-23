//
//  ViewController.swift
//  LearnJapanese
//
//  Created by Thomas Chaboud on 07/08/2017.
//  Copyright © 2017 Thomas Chaboud. All rights reserved.
//

import UIKit
import CoreData

struct WordModel {
    var motFR: String
    var motJPKana: String
    var motJPKanji: String
    var motJPRomaji: String
}

//words to load for the first launch of the app
var wordsModel: [WordModel] = [
    WordModel(motFR: "le Temple", motJPKana: "てら", motJPKanji: "寺", motJPRomaji: "tera"),
    WordModel(motFR: "le Parc", motJPKana: "コウエン", motJPKanji: "公園", motJPRomaji: "kouen"),
    WordModel(motFR: "le Musée", motJPKana: "びじゅつかん", motJPKanji: "美術館", motJPRomaji: "bijutsukan"),
    WordModel(motFR: "la Gare", motJPKana: "えき", motJPKanji: "駅", motJPRomaji: "eki"),
    WordModel(motFR: "le Poste de Police", motJPKana: "けいさつしょ", motJPKanji: "警察署", motJPRomaji: "keisatsusho"),
    WordModel(motFR: "la Bibliothèque", motJPKana: "としょかん", motJPKanji: "図書館", motJPRomaji: "toshokan"),
    WordModel(motFR: "la Mairie", motJPKana: "しやくしょ", motJPKanji: "市役所", motJPRomaji: "shiyakusho"),
    WordModel(motFR: "l'Hôpital", motJPKana: "びよういん", motJPKanji: "病院", motJPRomaji: "byouin"),
    WordModel(motFR: "le Cinéma", motJPKana: "えいがかん", motJPKanji: "映画館", motJPRomaji: "eigakan"),
    WordModel(motFR: "La Poste", motJPKana: "ゆうびんきょく", motJPKanji: "郵便局", motJPRomaji: "yuubinkyoku"),
    WordModel(motFR: "la Banque", motJPKana: "ぎんこう", motJPKanji: "銀行", motJPRomaji: "ginkou"),
    WordModel(motFR: "la Pharmacie", motJPKana: "くすりや", motJPKanji: "薬屋", motJPRomaji: "kusuriya"),
    WordModel(motFR: "le Port", motJPKana: "みなと", motJPKanji: "港", motJPRomaji: "minato"),
    WordModel(motFR: "l'Aéroport", motJPKana: "くうこう", motJPKanji: "空港", motJPRomaji: "kuukou"),
    WordModel(motFR: "Le Rouge", motJPKana: "あか", motJPKanji: "赤", motJPRomaji: "aka"),
    WordModel(motFR: "Le Bleu", motJPKana: "あお", motJPKanji: "青", motJPRomaji: "ao"),
    WordModel(motFR: "le Gris", motJPKana: "はいいろ", motJPKanji: "灰色", motJPRomaji: "haiiro"),
    WordModel(motFR: "Le Vert", motJPKana: "みどり", motJPKanji: "緑", motJPRomaji: "midori"),
    WordModel(motFR: "le Noir", motJPKana: "くろ", motJPKanji: "黒", motJPRomaji: "kuro"),
    WordModel(motFR: "le Bleu Clair", motJPKana: "みずいろ", motJPKanji: "水色", motJPRomaji: "mizuiro"),
    WordModel(motFR: "le Blanc", motJPKana: "しろ", motJPKanji: "白", motJPRomaji: "shiro"),
    WordModel(motFR: "le Jaune", motJPKana: "きいろ", motJPKanji: "黄色", motJPRomaji: "kiiro"),
    WordModel(motFR: "le Violet", motJPKana: "むらさき", motJPKanji: "紫", motJPRomaji: "murasaki"),
    WordModel(motFR: "le Marron", motJPKana: "ちゃいろ", motJPKanji: "茶色", motJPRomaji: "chairo"),
    WordModel(motFR: "la couleur Or", motJPKana: "きんいろ", motJPKanji: "金色", motJPRomaji: "kiniro"),
    WordModel(motFR: "la couleur Arc-en-Ciel", motJPKana: "にじいろ", motJPKanji: "虹色", motJPRomaji: "nijiiro"),
    WordModel(motFR: "lundi", motJPKana: "げつようび", motJPKanji: "月曜日", motJPRomaji: "getsuyoubi"),
    WordModel(motFR: "mardi", motJPKana: "かようび", motJPKanji: "火曜日", motJPRomaji: "kayoubi"),
    WordModel(motFR: "mercredi", motJPKana: "すいようび", motJPKanji: "水曜日", motJPRomaji: "suiyoubi"),
    WordModel(motFR: "jeudi", motJPKana: "もくようび", motJPKanji: "木曜日", motJPRomaji: "mokuyoubi"),
    WordModel(motFR: "vendredi", motJPKana: "きんようび", motJPKanji: "金曜日", motJPRomaji: "kinyoubi"),
    WordModel(motFR: "samedi", motJPKana: "どようび", motJPKanji: "土曜日", motJPRomaji: "douyoubi"),
    WordModel(motFR: "dimanche", motJPKana: "にちようび", motJPKanji: "日曜日", motJPRomaji: "nichiyoubi"),
    WordModel(motFR: "parler", motJPKana: "はなす", motJPKanji: "話す", motJPRomaji: "hanasu"),
    WordModel(motFR: "manger", motJPKana: "たべる", motJPKanji: "食べる", motJPRomaji: "taberu"),
    WordModel(motFR: "faire", motJPKana: "する", motJPKanji: "する", motJPRomaji: "suru"),
    WordModel(motFR: "venir", motJPKana: "くる", motJPKanji: "来る", motJPRomaji: "kuru"),
    WordModel(motFR: "aller", motJPKana: "いく", motJPKanji: "行く", motJPRomaji: "iku"),
    WordModel(motFR: "regarder", motJPKana: "みる", motJPKanji: "見る", motJPRomaji: "miru"),
    WordModel(motFR: "être de présence", motJPKana: "", motJPKanji: "いる/ある", motJPRomaji: "iru/aru"),
    WordModel(motFR: "être de description", motJPKana: "", motJPKanji: "だ", motJPRomaji: "da"),
    WordModel(motFR: "lire", motJPKana: "よむ", motJPKanji: "読む", motJPRomaji: "yomu"),
    WordModel(motFR: "boire", motJPKana: "のむ", motJPKanji: "飲む", motJPRomaji: "nomu"),
    WordModel(motFR: "dormir", motJPKana: "ねる", motJPKanji: "寝る", motJPRomaji: "neru"),
    WordModel(motFR: "écouter", motJPKana: "きく", motJPKanji: "聞く", motJPRomaji: "kiku"),
    WordModel(motFR: "écrire", motJPKana: "かく", motJPKanji: "書く", motJPRomaji: "kaku"),
    WordModel(motFR: "marcher", motJPKana: "あるく", motJPKanji: "歩く", motJPRomaji: "aruku"),
    WordModel(motFR: "savoir", motJPKana: "しる", motJPKanji: "知る", motJPRomaji: "shiru"),
    WordModel(motFR: "comprendre", motJPKana: "わかる", motJPKanji: "分かる", motJPRomaji: "wakaru"),
    WordModel(motFR: "penser", motJPKana: "おもえ", motJPKanji: "思え", motJPRomaji: "omou"),
    WordModel(motFR: "dire", motJPKana: "いう", motJPKanji: "言う", motJPRomaji: "iu"),
    WordModel(motFR: "la Pomme", motJPKana: "リンゴ", motJPKanji: "林檎", motJPRomaji: "ringo"),
    WordModel(motFR: "la Poire", motJPKana: "なし", motJPKanji: "梨", motJPRomaji: "nashi"),
    WordModel(motFR: "la Pêche", motJPKana: "もも", motJPKanji: "桃", motJPRomaji: "momo"),
    WordModel(motFR: "la Prune", motJPKana: "うめ", motJPKanji: "梅", motJPRomaji: "ume"),
    WordModel(motFR: "le Raisin", motJPKana: "ブドウ", motJPKanji: "葡萄", motJPRomaji: "budou"),
    WordModel(motFR: "La Cerise", motJPKana: "さくらんぼ", motJPKanji: "桜桃", motJPRomaji: "sakuranbo"),
    WordModel(motFR: "la Mandarine", motJPKana: "ミカン", motJPKanji: "蜜柑", motJPRomaji: "mikan"),
    WordModel(motFR: "Le Yuzu", motJPKana: "ユズ", motJPKanji: "柚子", motJPRomaji: "yuzu"),
    WordModel(motFR: "l'Abricot", motJPKana: "アンズ", motJPKanji: "杏子", motJPRomaji: "anzu"),
    WordModel(motFR: "la Figue", motJPKana: "いちじく", motJPKanji: "無花果", motJPRomaji: "ichijiku"),
    WordModel(motFR: "la Pastèque", motJPKana: "スイカ", motJPKanji: "西瓜", motJPRomaji: "suika"),
    WordModel(motFR: "la Fraise", motJPKana: "いちご", motJPKanji: "苺", motJPRomaji: "ichigo"),
    WordModel(motFR: "S'il vous plaît", motJPKana: "おねがいします", motJPKanji: "お願いします", motJPRomaji: "onegaishimasu"),
    WordModel(motFR: "Il n'y a pas de quoi", motJPKana: "", motJPKanji: "どういたしまして", motJPRomaji: "douitashimashite"),
    WordModel(motFR: "Comment allez-vous ?", motJPKana: "おゲンキですか", motJPKanji: "お元気ですか", motJPRomaji: "ogenki desu ka"),
    WordModel(motFR: "je vais bien", motJPKana: "はい、げんきです", motJPKanji: "はい、元気です", motJPRomaji: "hai, genki desu"),
    WordModel(motFR: "au revoir", motJPKana: "またね", motJPKanji: "またね", motJPRomaji: "matane"),
    WordModel(motFR: "à demain", motJPKana: "またあした", motJPKanji: "また明日", motJPRomaji: "mata ashita"),
    WordModel(motFR: "enchanté", motJPKana: "はじめまして", motJPKanji: "初めまして", motJPRomaji: "hajimemashite"),
    WordModel(motFR: "ravie de faire votre connaissance", motJPKana: "どうぞよろしくおねがいします", motJPKanji: "どうぞよろしくおねがいします", motJPRomaji: "douzo yoroshiku onegaishimasu"),
    WordModel(motFR: "je vous en prie", motJPKana: "", motJPKanji: "どうぞ", motJPRomaji: "douzo"),
    WordModel(motFR: "excusez-moi", motJPKana: "", motJPKanji: "すみません", motJPRomaji: "sumimasen"),
    WordModel(motFR: "pardonnez-moi", motJPKana: "", motJPKanji: "ごめんなさい", motJPRomaji: "gomennasai"),
    WordModel(motFR: "le nord", motJPKana: "きた", motJPKanji: "北", motJPRomaji: "kita"),
    WordModel(motFR: "le sud", motJPKana: "みなみ", motJPKanji: "南", motJPRomaji: "minami"),
    WordModel(motFR: "l'est", motJPKana: "ひがし", motJPKanji: "東", motJPRomaji: "higashi"),
    WordModel(motFR: "l'ouest", motJPKana: "にし", motJPKanji: "西", motJPRomaji: "nishi"),
    WordModel(motFR: "la droite", motJPKana: "みぎ", motJPKanji: "右", motJPRomaji: "migi"),
    WordModel(motFR: "la gauche", motJPKana: "ひだり", motJPKanji: "左", motJPRomaji: "hidari"),
    WordModel(motFR: "le dessus", motJPKana: "うえ", motJPKanji: "上", motJPRomaji: "ue"),
    WordModel(motFR: "le dessous", motJPKana: "した", motJPKanji: "下", motJPRomaji: "shita"),
    WordModel(motFR: "le devant", motJPKana: "まえ", motJPKanji: "前", motJPRomaji: "mae"),
    WordModel(motFR: "l'arrière", motJPKana: "うしろ", motJPKanji: "後ろ", motJPRomaji: "ushiro"),
    WordModel(motFR: "l'intérieur", motJPKana: "なか", motJPKanji: "中", motJPRomaji: "naka"),
    WordModel(motFR: "l'extérieur", motJPKana: "そと", motJPKanji: "外", motJPRomaji: "soto"),
    WordModel(motFR: "l'intervalle", motJPKana: "あいだ", motJPKanji: "間", motJPRomaji: "aida"),
    WordModel(motFR: "le fond", motJPKana: "おく", motJPKanji: "奥", motJPRomaji: "oku"),
    WordModel(motFR: "l'endroit", motJPKana: "おもて", motJPKanji: "表", motJPRomaji: "omote"),
    WordModel(motFR: "l'envers", motJPKana: "うら", motJPKanji: "裏", motJPRomaji: "ura"),
    WordModel(motFR: "le côté", motJPKana: "よこ", motJPKanji: "横", motJPRomaji: "yoko"),
    WordModel(motFR: "la proximité", motJPKana: "側", motJPKanji: "そば", motJPRomaji: "soba"),
    WordModel(motFR: "le voisinage", motJPKana: "となり", motJPKanji: "隣", motJPRomaji: "tonari"),
    WordModel(motFR: "les alentours", motJPKana: "まわり", motJPKanji: "周り", motJPRomaji: "mawari"),
    WordModel(motFR: "l'année", motJPKana: "とし (ネン)", motJPKanji: "年", motJPRomaji: "toshi"),
    WordModel(motFR: "la lune", motJPKana: "つき (ガツ)", motJPKanji: "月", motJPRomaji: "tsuki"),
    WordModel(motFR: "le soleil", motJPKana: "ひ (ニチ)", motJPKanji: "日", motJPRomaji: "hi"),
    WordModel(motFR: "l'heure", motJPKana: "とき (ジ)", motJPKanji: "時", motJPRomaji: "toki"),
    WordModel(motFR: "avant midi", motJPKana: "ゴゼン", motJPKanji: "午前", motJPRomaji: "gozen"),
    WordModel(motFR: "après midi", motJPKana: "ゴゴ", motJPKanji: "午後", motJPRomaji: "gogo"),
    WordModel(motFR: "midi", motJPKana: "ショゴ", motJPKanji: "正午", motJPRomaji: "shougo"),
    WordModel(motFR: "minuit", motJPKana: "まよなか", motJPKanji: "真夜中", motJPRomaji: "mayonaka"),
    WordModel(motFR: "la minute", motJPKana: "フン", motJPKanji: "分", motJPRomaji: "fun"),
    WordModel(motFR: "le zéro", motJPKana: "レイ", motJPKanji: "零", motJPRomaji: "rei"),
    WordModel(motFR: "le présent", motJPKana: "ゲンザイ", motJPKanji: "現在", motJPRomaji: "genzai"),
    WordModel(motFR: "le passé", motJPKana: "カコ", motJPKanji: "過去", motJPRomaji: "kako"),
    WordModel(motFR: "le futur", motJPKana: "ミライ", motJPKanji: "未来", motJPRomaji: "mirai"),
    WordModel(motFR: "maintenant", motJPKana: "いま", motJPKanji: "今", motJPRomaji: "ima"),
    WordModel(motFR: "aujourd'hui", motJPKana: "きょう", motJPKanji: "今日", motJPRomaji: "kyou"),
    WordModel(motFR: "hier", motJPKana: "きのう", motJPKanji: "昨日", motJPRomaji: "kinou")
]

/*let motsFR = ["le Temple", "le Parc", "le Musée", "la Gare", "le Poste de Police", "la Bibliothèque", "la Mairie", "l'Hôpital", "le Cinéma", "La Poste", "la Banque", "la Pharmacie", "le Port", "l'Aéroport", "Le Rouge", "Le Bleu", "le Gris", "Le Vert", "le Noir", "le Bleu Clair", "le Blanc", "le Jaune", "le Violet", "le Marron", "la couleur Or", "la couleur Arc-en-Ciel", "lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi", "dimanche", "parler", "manger", "faire", "venir", "aller", "regarder", "être de présence", "être de description", "lire", "boire", "dormir", "écouter", "écrire", "marcher", "savoir", "comprendre", "penser", "dire", "la Pomme", "la Poire", "la Pêche", "la Prune", "le Raisin", "La Cerise", "la Mandarine", "Le Yuzu", "l'Abricot", "la Figue", "la Pastèque", "la Fraise", "S'il vous plaît", "Il n'y a pas de quoi", "Comment allez-vous ?", "je vais bien", "au revoir", "à demain", "enchanté", "ravie de faire votre connaissance", "je vous en prie", "excusez-moi", "pardonnez-moi", "le nord", "le sud", "l'est", "l'ouest", "la droite", "la gauche", "le dessus", "le dessous", "le devant", "l'arrière", "l'intérieur", "l'extérieur", "l'intervalle", "le fond", "l'endroit", "l'envers", "le côté", "la proximité", "le voisinage", "les alentours", "l'année", "la lune", "le soleil", "l'heure", "avant midi", "après midi", "midi", "minuit", "la minute", "le zéro", "le présent", "le passé", "le futur", "maintenant", "aujourd'hui", "hier"]

let motsJPKanji = ["寺", "公園", "美術館", "駅", "警察署", "図書館", "市役所", "病院", "映画館", "郵便局", "銀行", "薬屋", "港", "空港", "赤", "青", "灰色", "緑", "黒", "水色", "白", "黄色", "紫", "茶色", "金色", "虹色", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日", "日曜日", "話す", "食べる", "する", "来る", "行く", "見る", "いる/ある", "だ", "読む", "飲む", "寝る", "聞く", "書く", "歩く", "知る", "分かる", "思え", "言う", "林檎", "梨", "桃", "梅", "葡萄", "桜桃", "蜜柑", "柚子", "杏子", "無花果", "西瓜", "苺", "お願いします", "どういたしまして", "お元気ですか", "はい、元気です", "またね", "また明日", "初めまして", "どうぞよろしくお願いします", "どうぞ", "すみません", "ごめんなさい", "北", "南", "東", "西", "右", "左", "上", "下", "前", "後ろ", "中", "外", "間", "奥", "表", "裏", "横", "そば", "隣", "周り", "年", "月", "日", "時", "午前", "午後", "正午", "真夜中", "分", "零", "現在", "過去", "未来", "今", "今日", "昨日"]

let motsJPKana = ["てら", "コウエン", "びじゅつかん", "えき", "けいさつしょ", "としょかん", "しやくしょ", "びよういん", "えいがかん", "ゆうびんきょく", "ぎんこう", "くすりや", "みなと", "くうこう", "あか", "あお", "はいいろ", "みどり", "くろ", "みずいろ", "しろ", "きいろ", "むらさき", "ちゃいろ", "きんいろ", "にじいろ", "げつようび", "かようび", "すいようび", "もくようび", "きんようび", "どようび", "にちようび", "はなす", "たべる", "する", "くる", "いく", "みる", "", "", "よむ", "のむ", "ねる", "きく", "かく", "あるく", "しる", "わかる", "おもえ", "いう", "リンゴ", "なし", "もも", "うめ", "ブドウ", "さくらんぼ", "ミカン", "ユズ", "アンズ", "いちじく", "スイカ", "いちご", "おねがいします", "", "おゲンキですか", "はい、げんきです", "またね", "またあした", "はじめまして", "どうぞよろしくおねがいします", "", "", "", "きた", "みなみ", "ひがし", "にし", "みぎ", "ひだり", "うえ", "した", "まえ", "うしろ", "なか", "そと", "あいだ", "おく", "おもて", "うら", "よこ", "側", "となり", "まわり", "とし (ネン)", "つき (ガツ)", "ひ (ニチ)", "とき (ジ)", "ゴゼン", "ゴゴ", "ショゴ", "まよなか", "フン", "レイ", "ゲンザイ", "カコ", "ミライ", "いま", "きょう", "きのう"]

let motsJPRomaji = ["tera", "kouen", "bijutsukan", "eki", "keisatsusho", "toshokan", "shiyakusho", "byouin", "eigakan", "yuubinkyoku", "ginkou", "kusuriya", "minato", "kuukou", "aka", "ao", "haiiro", "midori", "kuro", "mizuiro", "shiro", "kiiro", "murasaki", "chairo", "kiniro", "nijiiro", "getsuyoubi", "kayoubi", "suiyoubi", "mokuyoubi", "kinyoubi", "douyoubi", "nichiyoubi", "hanasu", "taberu", "suru", "kuru", "iku", "miru", "iru/aru", "da", "yomu", "nomu", "neru", "kiku", "kaku", "aruku", "shiru", "wakaru", "omou", "iu", "ringo", "nashi", "momo", "ume", "budou", "sakuranbo", "mikan", "yuzu", "anzu", "ichijiku", "suika", "ichigo", "onegaishimasu", "douitashimashite", "ogenki desu ka", "hai, genki desu", "matane", "mata ashita", "hajimemashite", "douzo yoroshiku onegaishimasu", "douzo", "sumimasen", "gomennasai", "kita", "minami", "higashi", "nishi", "migi", "hidari", "ue", "shita", "mae", "ushiro", "naka", "soto", "aida", "oku", "omote", "ura", "yoko", "soba", "tonari", "mawari", "toshi", "tsuki", "hi", "toki", "gozen", "gogo", "shougo", "mayonaka", "fun", "rei", "genzai", "kako", "mirai", "ima", "kyou", "kinou"]*/

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var labelRep: UILabel!
    @IBOutlet weak var labelMot: UILabel!
    @IBOutlet weak var btnChange: UIButton!
    @IBOutlet weak var rep: UITextField!
    @IBOutlet weak var labelKana: UILabel!
    
    var dataManager: DataManager = DataManager.sharedInstance //manager instance for accessing data
    var remainingWords: [Word] = [] //Array of remaining words
    
    var idBtn = true
    var kelTab = true //dans quel tableau on cherche le mot
    var empMotChoisi: Int = 0
    var randNumb: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (isAppAlreadyLaunchedOnce()){
            for wm in wordsModel{
                dataManager.addWord(motFR: wm.motFR, motJPKana: wm.motJPKana, motJPKanji: wm.motJPKanji, motJPRomaji: wm.motJPRomaji)
            }
            dataManager.saveWords()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataManager.loadWords()
        remainingWords = dataManager.cachedWords
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }

    @IBAction func changeWord(_ sender: Any) {
        if idBtn { // Appuie sur "Mot Suivant"
            let randChoiceLang = Int(arc4random_uniform(2))
            randNumb = Int(arc4random_uniform(UInt32(remainingWords.count)))
            labelRep.textColor = UIColor.white
            labelRep.text = "Traduisez"
            rep.text = ""
            labelKana.text = ""
            let word = remainingWords[randNumb]
            if randChoiceLang == 0 {
                kelTab = true
                labelMot.text = word.value(forKeyPath: "motFR") as? String
            }
            else {
                kelTab = false
                labelMot.text = word.value(forKeyPath: "motJPKanji") as? String
                labelKana.text = word.value(forKeyPath: "motJPKana") as? String
            }
            empMotChoisi = randNumb
            btnChange.setTitle("Valider", for: .normal)
            idBtn = false
         }
         else { // Appuie sur Valider
            let textRep = rep.text
            let word = remainingWords[randNumb]
            if kelTab { // Si on a afficher un mot en français
                if textRep?.caseInsensitiveCompare(word.value(forKeyPath: "motJPRomaji") as! String) == ComparisonResult.orderedSame {
                    labelRep.textColor = UIColor.green
                    labelRep.text = "Bonne Réponse !"
                    remainingWords.remove(at: randNumb)
                }
                else {
                    labelRep.textColor = UIColor.red
                    labelRep.text = "Mauvaise réponse: \n\nLa bonne réponse était: \(word.value(forKeyPath: "motJPRomaji") as! String)"
                }
            }
            else { // Si on a afficher un mot en japonais
                if textRep?.caseInsensitiveCompare(word.value(forKeyPath: "motFR") as! String) == ComparisonResult.orderedSame{
                    labelRep.textColor = UIColor.green
                    labelRep.text = "Bonne Réponse !"
                    remainingWords.remove(at: randNumb)
                }
                else {
                    labelRep.textColor = UIColor.red
                    labelRep.text = "Mauvaise réponse \n\nLa bonne réponse était: \(word.value(forKeyPath: "motFR") as! String)"
                }
            }
            if remainingWords.isEmpty {
                btnChange.setTitle("Recommencez", for: .normal)
                remainingWords = dataManager.cachedWords
            }
            else {
                btnChange.setTitle("Mot suivant", for: .normal)
            }
            idBtn = true
         }
    }
    
    //MARK: First Launch
    func isAppAlreadyLaunchedOnce()->Bool{
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if launchedBefore  {
            print("Not first launch.")
            return false
        } else {
            print("First launch, setting UserDefault.")
            UserDefaults.standard.set(true, forKey: "launchedBefore")
            return true
        }
    }

}

