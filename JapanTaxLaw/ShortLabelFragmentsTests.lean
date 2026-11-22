import JapanTaxLaw.ShortLabelFragments
import JapanTaxLaw.ShortLabelFragmentsSpec
set_option maxRecDepth 100000

/-!
# ShortLabelFragmentsTests — 全variantの短いラベル構造をカーネル検証

These units remain PROVED_SCOPE: only short-label structure is proven,
the substantive norm of the provision is NOT MODELLED.
-/
namespace JapanTaxLaw.ShortLabelFragmentsTests

open JapanTaxLaw.ShortLabelFragments

example : isShortLabel "''" = true := by native_decide
example : isShortLabel "''" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "''" := by native_decide
example : isShortLabel "'''" = true := by native_decide
example : isShortLabel "'''" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "'''" := by native_decide
example : isShortLabel "×（ｄ" = true := by native_decide
example : isShortLabel "×（ｄ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "×（ｄ" := by native_decide
example : isShortLabel "×Ｂ" = true := by native_decide
example : isShortLabel "×Ｂ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "×Ｂ" := by native_decide
example : isShortLabel "×ｂ" = true := by native_decide
example : isShortLabel "×ｂ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "×ｂ" := by native_decide
example : isShortLabel "×ｃ" = true := by native_decide
example : isShortLabel "×ｃ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "×ｃ" := by native_decide
example : isShortLabel "×ｄ" = true := by native_decide
example : isShortLabel "×ｄ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "×ｄ" := by native_decide
example : isShortLabel "×ｚ" = true := by native_decide
example : isShortLabel "×ｚ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "×ｚ" := by native_decide
example : isShortLabel "×｛（ｂ" = true := by native_decide
example : isShortLabel "×｛（ｂ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "×｛（ｂ" := by native_decide
example : isShortLabel "×｛（ｃ" = true := by native_decide
example : isShortLabel "×｛（ｃ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "×｛（ｃ" := by native_decide
example : isShortLabel "α" = true := by native_decide
example : isShortLabel "α" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "α" := by native_decide
example : isShortLabel "α　α" = true := by native_decide
example : isShortLabel "α　α" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "α　α" := by native_decide
example : isShortLabel "α　農道延長" = true := by native_decide
example : isShortLabel "α　農道延長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "α　農道延長" := by native_decide
example : isShortLabel "α　１．００" = true := by native_decide
example : isShortLabel "α　１．００" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "α　１．００" := by native_decide
example : isShortLabel "α＋β＋γ" = true := by native_decide
example : isShortLabel "α＋β＋γ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "α＋β＋γ" := by native_decide
example : isShortLabel "β" = true := by native_decide
example : isShortLabel "β" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "β" := by native_decide
example : isShortLabel "β　符号ｂ" = true := by native_decide
example : isShortLabel "β　符号ｂ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "β　符号ｂ" := by native_decide
example : isShortLabel "β　１．０２" = true := by native_decide
example : isShortLabel "β　１．０２" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "β　１．０２" := by native_decide
example : isShortLabel "ε" = true := by native_decide
example : isShortLabel "ε" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ε" := by native_decide
example : isShortLabel "ζ" = true := by native_decide
example : isShortLabel "ζ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ζ" := by native_decide
example : isShortLabel "η" = true := by native_decide
example : isShortLabel "η" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "η" := by native_decide
example : isShortLabel "―" = true := by native_decide
example : isShortLabel "―" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "―" := by native_decide
example : isShortLabel "、α" = true := by native_decide
example : isShortLabel "、α" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、α" := by native_decide
example : isShortLabel "、「を基礎" = true := by native_decide
example : isShortLabel "、「を基礎" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、「を基礎" := by native_decide
example : isShortLabel "、事業修習者" = true := by native_decide
example : isShortLabel "、事業修習者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、事業修習者" := by native_decide
example : isShortLabel "、二千頭" = true := by native_decide
example : isShortLabel "、二千頭" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、二千頭" := by native_decide
example : isShortLabel "、介護保険法" = true := by native_decide
example : isShortLabel "、介護保険法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、介護保険法" := by native_decide
example : isShortLabel "、個人番号" = true := by native_decide
example : isShortLabel "、個人番号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、個人番号" := by native_decide
example : isShortLabel "、入国の日" = true := by native_decide
example : isShortLabel "、入国の日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、入国の日" := by native_decide
example : isShortLabel "、前項" = true := by native_decide
example : isShortLabel "、前項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、前項" := by native_decide
example : isShortLabel "、千五百頭" = true := by native_decide
example : isShortLabel "、千五百頭" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、千五百頭" := by native_decide
example : isShortLabel "、又は" = true := by native_decide
example : isShortLabel "、又は" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、又は" := by native_decide
example : isShortLabel "、同号ロ" = true := by native_decide
example : isShortLabel "、同号ロ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、同号ロ" := by native_decide
example : isShortLabel "、同日" = true := by native_decide
example : isShortLabel "、同日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、同日" := by native_decide
example : isShortLabel "、同日前" = true := by native_decide
example : isShortLabel "、同日前" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、同日前" := by native_decide
example : isShortLabel "、同項" = true := by native_decide
example : isShortLabel "、同項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、同項" := by native_decide
example : isShortLabel "、同項に" = true := by native_decide
example : isShortLabel "、同項に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、同項に" := by native_decide
example : isShortLabel "、同項の" = true := by native_decide
example : isShortLabel "、同項の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、同項の" := by native_decide
example : isShortLabel "、同項中" = true := by native_decide
example : isShortLabel "、同項中" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、同項中" := by native_decide
example : isShortLabel "、地方法人税" = true := by native_decide
example : isShortLabel "、地方法人税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、地方法人税" := by native_decide
example : isShortLabel "、当該" = true := by native_decide
example : isShortLabel "、当該" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、当該" := by native_decide
example : isShortLabel "、指定日" = true := by native_decide
example : isShortLabel "、指定日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、指定日" := by native_decide
example : isShortLabel "、旅客数" = true := by native_decide
example : isShortLabel "、旅客数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、旅客数" := by native_decide
example : isShortLabel "、棚卸資産" = true := by native_decide
example : isShortLabel "、棚卸資産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、棚卸資産" := by native_decide
example : isShortLabel "、法人の" = true := by native_decide
example : isShortLabel "、法人の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、法人の" := by native_decide
example : isShortLabel "、法人税法" = true := by native_decide
example : isShortLabel "、法人税法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、法人税法" := by native_decide
example : isShortLabel "、相続税法" = true := by native_decide
example : isShortLabel "、相続税法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、相続税法" := by native_decide
example : isShortLabel "、第一項" = true := by native_decide
example : isShortLabel "、第一項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、第一項" := by native_decide
example : isShortLabel "、第七号" = true := by native_decide
example : isShortLabel "、第七号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、第七号" := by native_decide
example : isShortLabel "、第三項" = true := by native_decide
example : isShortLabel "、第三項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、第三項" := by native_decide
example : isShortLabel "、第三項又は" = true := by native_decide
example : isShortLabel "、第三項又は" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、第三項又は" := by native_decide
example : isShortLabel "、第九項" = true := by native_decide
example : isShortLabel "、第九項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、第九項" := by native_decide
example : isShortLabel "、第二十一項" = true := by native_decide
example : isShortLabel "、第二十一項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、第二十一項" := by native_decide
example : isShortLabel "、第二十六項" = true := by native_decide
example : isShortLabel "、第二十六項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、第二十六項" := by native_decide
example : isShortLabel "、第二十項" = true := by native_decide
example : isShortLabel "、第二十項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、第二十項" := by native_decide
example : isShortLabel "、第二項" = true := by native_decide
example : isShortLabel "、第二項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、第二項" := by native_decide
example : isShortLabel "、第五項後段" = true := by native_decide
example : isShortLabel "、第五項後段" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、第五項後段" := by native_decide
example : isShortLabel "、第八項" = true := by native_decide
example : isShortLabel "、第八項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、第八項" := by native_decide
example : isShortLabel "、第六項" = true := by native_decide
example : isShortLabel "、第六項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、第六項" := by native_decide
example : isShortLabel "、第十一項" = true := by native_decide
example : isShortLabel "、第十一項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、第十一項" := by native_decide
example : isShortLabel "、第十三項" = true := by native_decide
example : isShortLabel "、第十三項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、第十三項" := by native_decide
example : isShortLabel "、若しくは" = true := by native_decide
example : isShortLabel "、若しくは" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、若しくは" := by native_decide
example : isShortLabel "、Ｌ" = true := by native_decide
example : isShortLabel "、Ｌ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、Ｌ" := by native_decide
example : isShortLabel "、Ｔ" = true := by native_decide
example : isShortLabel "、Ｔ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "、Ｔ" := by native_decide
example : isShortLabel "。" = true := by native_decide
example : isShortLabel "。" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "。" := by native_decide
example : isShortLabel "〇パーセント" = true := by native_decide
example : isShortLabel "〇パーセント" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "〇パーセント" := by native_decide
example : isShortLabel "〇点" = true := by native_decide
example : isShortLabel "〇点" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "〇点" := by native_decide
example : isShortLabel "「" = true := by native_decide
example : isShortLabel "「" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "「" := by native_decide
example : isShortLabel "「を基礎" = true := by native_decide
example : isShortLabel "「を基礎" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "「を基礎" := by native_decide
example : isShortLabel "「同項第一号" = true := by native_decide
example : isShortLabel "「同項第一号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "「同項第一号" := by native_decide
example : isShortLabel "「対象配当等" = true := by native_decide
example : isShortLabel "「対象配当等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "「対象配当等" := by native_decide
example : isShortLabel "「法」" = true := by native_decide
example : isShortLabel "「法」" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "「法」" := by native_decide
example : isShortLabel "「特定配当等" = true := by native_decide
example : isShortLabel "「特定配当等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "「特定配当等" := by native_decide
example : isShortLabel "「第一項」" = true := by native_decide
example : isShortLabel "「第一項」" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "「第一項」" := by native_decide
example : isShortLabel "「配当等" = true := by native_decide
example : isShortLabel "「配当等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "「配当等" := by native_decide
example : isShortLabel "」と" = true := by native_decide
example : isShortLabel "」と" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "」と" := by native_decide
example : isShortLabel "」と、「" = true := by native_decide
example : isShortLabel "」と、「" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "」と、「" := by native_decide
example : isShortLabel "」を「" = true := by native_decide
example : isShortLabel "」を「" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "」を「" := by native_decide
example : isShortLabel "あつた日又は" = true := by native_decide
example : isShortLabel "あつた日又は" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "あつた日又は" := by native_decide
example : isShortLabel "あつては" = true := by native_decide
example : isShortLabel "あつては" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "あつては" := by native_decide
example : isShortLabel "あつては、" = true := by native_decide
example : isShortLabel "あつては、" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "あつては、" := by native_decide
example : isShortLabel "ある" = true := by native_decide
example : isShortLabel "ある" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ある" := by native_decide
example : isShortLabel "あること" = true := by native_decide
example : isShortLabel "あること" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "あること" := by native_decide
example : isShortLabel "あるのは" = true := by native_decide
example : isShortLabel "あるのは" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "あるのは" := by native_decide
example : isShortLabel "あるのは、" = true := by native_decide
example : isShortLabel "あるのは、" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "あるのは、" := by native_decide
example : isShortLabel "あるのは、「" = true := by native_decide
example : isShortLabel "あるのは、「" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "あるのは、「" := by native_decide
example : isShortLabel "いう" = true := by native_decide
example : isShortLabel "いう" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "いう" := by native_decide
example : isShortLabel "いう。）" = true := by native_decide
example : isShortLabel "いう。）" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "いう。）" := by native_decide
example : isShortLabel "いう。）、" = true := by native_decide
example : isShortLabel "いう。）、" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "いう。）、" := by native_decide
example : isShortLabel "うるう" = true := by native_decide
example : isShortLabel "うるう" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "うるう" := by native_decide
example : isShortLabel "おいて" = true := by native_decide
example : isShortLabel "おいて" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "おいて" := by native_decide
example : isShortLabel "おいて、" = true := by native_decide
example : isShortLabel "おいて、" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "おいて、" := by native_decide
example : isShortLabel "おける" = true := by native_decide
example : isShortLabel "おける" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "おける" := by native_decide
example : isShortLabel "かくたん" = true := by native_decide
example : isShortLabel "かくたん" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "かくたん" := by native_decide
example : isShortLabel "かし" = true := by native_decide
example : isShortLabel "かし" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "かし" := by native_decide
example : isShortLabel "からこれら" = true := by native_decide
example : isShortLabel "からこれら" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "からこれら" := by native_decide
example : isShortLabel "から六月以内" = true := by native_decide
example : isShortLabel "から六月以内" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "から六月以内" := by native_decide
example : isShortLabel "から同項" = true := by native_decide
example : isShortLabel "から同項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "から同項" := by native_decide
example : isShortLabel "かん" = true := by native_decide
example : isShortLabel "かん" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "かん" := by native_decide
example : isShortLabel "がある" = true := by native_decide
example : isShortLabel "がある" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "がある" := by native_decide
example : isShortLabel "がこれらの税" = true := by native_decide
example : isShortLabel "がこれらの税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "がこれらの税" := by native_decide
example : isShortLabel "が二千頭" = true := by native_decide
example : isShortLabel "が二千頭" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "が二千頭" := by native_decide
example : isShortLabel "が他の者" = true := by native_decide
example : isShortLabel "が他の者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "が他の者" := by native_decide
example : isShortLabel "が前項" = true := by native_decide
example : isShortLabel "が前項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "が前項" := by native_decide
example : isShortLabel "が千五百頭" = true := by native_decide
example : isShortLabel "が千五百頭" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "が千五百頭" := by native_decide
example : isShortLabel "が同項" = true := by native_decide
example : isShortLabel "が同項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "が同項" := by native_decide
example : isShortLabel "が同項後段" = true := by native_decide
example : isShortLabel "が同項後段" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "が同項後段" := by native_decide
example : isShortLabel "が当該外国" = true := by native_decide
example : isShortLabel "が当該外国" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "が当該外国" := by native_decide
example : isShortLabel "が当該所得税" = true := by native_decide
example : isShortLabel "が当該所得税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "が当該所得税" := by native_decide
example : isShortLabel "が消滅した" = true := by native_decide
example : isShortLabel "が消滅した" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "が消滅した" := by native_decide
example : isShortLabel "が督促" = true := by native_decide
example : isShortLabel "が督促" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "が督促" := by native_decide
example : isShortLabel "が第九項" = true := by native_decide
example : isShortLabel "が第九項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "が第九項" := by native_decide
example : isShortLabel "が第二十一項" = true := by native_decide
example : isShortLabel "が第二十一項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "が第二十一項" := by native_decide
example : isShortLabel "が第二十項" = true := by native_decide
example : isShortLabel "が第二十項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "が第二十項" := by native_decide
example : isShortLabel "が第八項" = true := by native_decide
example : isShortLabel "が第八項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "が第八項" := by native_decide
example : isShortLabel "が納税" = true := by native_decide
example : isShortLabel "が納税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "が納税" := by native_decide
example : isShortLabel "が行つていた" = true := by native_decide
example : isShortLabel "が行つていた" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "が行つていた" := by native_decide
example : isShortLabel "きよ" = true := by native_decide
example : isShortLabel "きよ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "きよ" := by native_decide
example : isShortLabel "ぎ" = true := by native_decide
example : isShortLabel "ぎ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ぎ" := by native_decide
example : isShortLabel "ぎよう" = true := by native_decide
example : isShortLabel "ぎよう" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ぎよう" := by native_decide
example : isShortLabel "くえん酸" = true := by native_decide
example : isShortLabel "くえん酸" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "くえん酸" := by native_decide
example : isShortLabel "こうじ" = true := by native_decide
example : isShortLabel "こうじ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "こうじ" := by native_decide
example : isShortLabel "ことができる" = true := by native_decide
example : isShortLabel "ことができる" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ことができる" := by native_decide
example : isShortLabel "この条" = true := by native_decide
example : isShortLabel "この条" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "この条" := by native_decide
example : isShortLabel "この表の附表" = true := by native_decide
example : isShortLabel "この表の附表" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "この表の附表" := by native_decide
example : isShortLabel "この項又は" = true := by native_decide
example : isShortLabel "この項又は" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "この項又は" := by native_decide
example : isShortLabel "これら" = true := by native_decide
example : isShortLabel "これら" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "これら" := by native_decide
example : isShortLabel "これらの事実" = true := by native_decide
example : isShortLabel "これらの事実" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "これらの事実" := by native_decide
example : isShortLabel "これらの号" = true := by native_decide
example : isShortLabel "これらの号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "これらの号" := by native_decide
example : isShortLabel "これらの日" = true := by native_decide
example : isShortLabel "これらの日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "これらの日" := by native_decide
example : isShortLabel "これらの税" = true := by native_decide
example : isShortLabel "これらの税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "これらの税" := by native_decide
example : isShortLabel "これらの規定" = true := by native_decide
example : isShortLabel "これらの規定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "これらの規定" := by native_decide
example : isShortLabel "これらの金額" = true := by native_decide
example : isShortLabel "これらの金額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "これらの金額" := by native_decide
example : isShortLabel "これらの項" = true := by native_decide
example : isShortLabel "これらの項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "これらの項" := by native_decide
example : isShortLabel "これらの項の" = true := by native_decide
example : isShortLabel "これらの項の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "これらの項の" := by native_decide
example : isShortLabel "これを" = true := by native_decide
example : isShortLabel "これを" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "これを" := by native_decide
example : isShortLabel "こん" = true := by native_decide
example : isShortLabel "こん" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "こん" := by native_decide
example : isShortLabel "こん包業" = true := by native_decide
example : isShortLabel "こん包業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "こん包業" := by native_decide
example : isShortLabel "ごう" = true := by native_decide
example : isShortLabel "ごう" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ごう" := by native_decide
example : isShortLabel "した法人税" = true := by native_decide
example : isShortLabel "した法人税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "した法人税" := by native_decide
example : isShortLabel "して移管が" = true := by native_decide
example : isShortLabel "して移管が" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "して移管が" := by native_decide
example : isShortLabel "しや" = true := by native_decide
example : isShortLabel "しや" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "しや" := by native_decide
example : isShortLabel "しゆん" = true := by native_decide
example : isShortLabel "しゆん" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "しゆん" := by native_decide
example : isShortLabel "じ" = true := by native_decide
example : isShortLabel "じ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "じ" := by native_decide
example : isShortLabel "じん" = true := by native_decide
example : isShortLabel "じん" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "じん" := by native_decide
example : isShortLabel "すべての取引" = true := by native_decide
example : isShortLabel "すべての取引" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "すべての取引" := by native_decide
example : isShortLabel "せき" = true := by native_decide
example : isShortLabel "せき" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "せき" := by native_decide
example : isShortLabel "せん" = true := by native_decide
example : isShortLabel "せん" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "せん" := by native_decide
example : isShortLabel "そう" = true := by native_decide
example : isShortLabel "そう" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "そう" := by native_decide
example : isShortLabel "その" = true := by native_decide
example : isShortLabel "その" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その" := by native_decide
example : isShortLabel "そのなつた日" = true := by native_decide
example : isShortLabel "そのなつた日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "そのなつた日" := by native_decide
example : isShortLabel "その事実" = true := by native_decide
example : isShortLabel "その事実" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その事実" := by native_decide
example : isShortLabel "その他" = true := by native_decide
example : isShortLabel "その他" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その他" := by native_decide
example : isShortLabel "その他のもの" = true := by native_decide
example : isShortLabel "その他のもの" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その他のもの" := by native_decide
example : isShortLabel "その他の事業" = true := by native_decide
example : isShortLabel "その他の事業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その他の事業" := by native_decide
example : isShortLabel "その他の区域" = true := by native_decide
example : isShortLabel "その他の区域" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その他の区域" := by native_decide
example : isShortLabel "その他の法人" = true := by native_decide
example : isShortLabel "その他の法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その他の法人" := by native_decide
example : isShortLabel "その他の資産" = true := by native_decide
example : isShortLabel "その他の資産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その他の資産" := by native_decide
example : isShortLabel "その他の雑酒" = true := by native_decide
example : isShortLabel "その他の雑酒" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その他の雑酒" := by native_decide
example : isShortLabel "その他他人" = true := by native_decide
example : isShortLabel "その他他人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その他他人" := by native_decide
example : isShortLabel "その債務者" = true := by native_decide
example : isShortLabel "その債務者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その債務者" := by native_decide
example : isShortLabel "その取得の日" = true := by native_decide
example : isShortLabel "その取得の日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その取得の日" := by native_decide
example : isShortLabel "その取得価額" = true := by native_decide
example : isShortLabel "その取得価額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その取得価額" := by native_decide
example : isShortLabel "その基準日" = true := by native_decide
example : isShortLabel "その基準日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その基準日" := by native_decide
example : isShortLabel "その変更の日" = true := by native_decide
example : isShortLabel "その変更の日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その変更の日" := by native_decide
example : isShortLabel "その実施場所" = true := by native_decide
example : isShortLabel "その実施場所" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その実施場所" := by native_decide
example : isShortLabel "その就任の日" = true := by native_decide
example : isShortLabel "その就任の日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その就任の日" := by native_decide
example : isShortLabel "その居所地" = true := by native_decide
example : isShortLabel "その居所地" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その居所地" := by native_decide
example : isShortLabel "その年" = true := by native_decide
example : isShortLabel "その年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その年" := by native_decide
example : isShortLabel "その年中" = true := by native_decide
example : isShortLabel "その年中" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その年中" := by native_decide
example : isShortLabel "その廃止の日" = true := by native_decide
example : isShortLabel "その廃止の日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その廃止の日" := by native_decide
example : isShortLabel "その後" = true := by native_decide
example : isShortLabel "その後" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その後" := by native_decide
example : isShortLabel "その提出の日" = true := by native_decide
example : isShortLabel "その提出の日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その提出の日" := by native_decide
example : isShortLabel "その提出後" = true := by native_decide
example : isShortLabel "その提出後" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その提出後" := by native_decide
example : isShortLabel "その提出期限" = true := by native_decide
example : isShortLabel "その提出期限" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その提出期限" := by native_decide
example : isShortLabel "その支払" = true := by native_decide
example : isShortLabel "その支払" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その支払" := by native_decide
example : isShortLabel "その支払を" = true := by native_decide
example : isShortLabel "その支払を" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その支払を" := by native_decide
example : isShortLabel "その支給総額" = true := by native_decide
example : isShortLabel "その支給総額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その支給総額" := by native_decide
example : isShortLabel "その旨" = true := by native_decide
example : isShortLabel "その旨" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その旨" := by native_decide
example : isShortLabel "その死亡の日" = true := by native_decide
example : isShortLabel "その死亡の日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その死亡の日" := by native_decide
example : isShortLabel "その生じた日" = true := by native_decide
example : isShortLabel "その生じた日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その生じた日" := by native_decide
example : isShortLabel "その生じた時" = true := by native_decide
example : isShortLabel "その生じた時" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その生じた時" := by native_decide
example : isShortLabel "その納税地" = true := by native_decide
example : isShortLabel "その納税地" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その納税地" := by native_decide
example : isShortLabel "その給付金額" = true := by native_decide
example : isShortLabel "その給付金額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その給付金額" := by native_decide
example : isShortLabel "その者の親族" = true := by native_decide
example : isShortLabel "その者の親族" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その者の親族" := by native_decide
example : isShortLabel "その解散の日" = true := by native_decide
example : isShortLabel "その解散の日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その解散の日" := by native_decide
example : isShortLabel "その設立の日" = true := by native_decide
example : isShortLabel "その設立の日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その設立の日" := by native_decide
example : isShortLabel "その設立国" = true := by native_decide
example : isShortLabel "その設立国" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その設立国" := by native_decide
example : isShortLabel "その認めた日" = true := by native_decide
example : isShortLabel "その認めた日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その認めた日" := by native_decide
example : isShortLabel "その資産" = true := by native_decide
example : isShortLabel "その資産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その資産" := by native_decide
example : isShortLabel "その還付" = true := by native_decide
example : isShortLabel "その還付" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その還付" := by native_decide
example : isShortLabel "その還付を" = true := by native_decide
example : isShortLabel "その還付を" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その還付を" := by native_decide
example : isShortLabel "その還付金等" = true := by native_decide
example : isShortLabel "その還付金等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "その還付金等" := by native_decide
example : isShortLabel "そば又はごま" = true := by native_decide
example : isShortLabel "そば又はごま" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "そば又はごま" := by native_decide
example : isShortLabel "たい" = true := by native_decide
example : isShortLabel "たい" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "たい" := by native_decide
example : isShortLabel "たて" = true := by native_decide
example : isShortLabel "たて" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "たて" := by native_decide
example : isShortLabel "たばこ税" = true := by native_decide
example : isShortLabel "たばこ税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "たばこ税" := by native_decide
example : isShortLabel "たん" = true := by native_decide
example : isShortLabel "たん" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "たん" := by native_decide
example : isShortLabel "だな" = true := by native_decide
example : isShortLabel "だな" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "だな" := by native_decide
example : isShortLabel "ちゆう" = true := by native_decide
example : isShortLabel "ちゆう" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ちゆう" := by native_decide
example : isShortLabel "ついては" = true := by native_decide
example : isShortLabel "ついては" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ついては" := by native_decide
example : isShortLabel "ついて法" = true := by native_decide
example : isShortLabel "ついて法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ついて法" := by native_decide
example : isShortLabel "つき同号" = true := by native_decide
example : isShortLabel "つき同号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "つき同号" := by native_decide
example : isShortLabel "つき同号イ" = true := by native_decide
example : isShortLabel "つき同号イ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "つき同号イ" := by native_decide
example : isShortLabel "つき同項" = true := by native_decide
example : isShortLabel "つき同項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "つき同項" := by native_decide
example : isShortLabel "つり" = true := by native_decide
example : isShortLabel "つり" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "つり" := by native_decide
example : isShortLabel "てい" = true := by native_decide
example : isShortLabel "てい" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "てい" := by native_decide
example : isShortLabel "でん" = true := by native_decide
example : isShortLabel "でん" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "でん" := by native_decide
example : isShortLabel "で同表の各号" = true := by native_decide
example : isShortLabel "で同表の各号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "で同表の各号" := by native_decide
example : isShortLabel "で同項" = true := by native_decide
example : isShortLabel "で同項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "で同項" := by native_decide
example : isShortLabel "で決定" = true := by native_decide
example : isShortLabel "で決定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "で決定" := by native_decide
example : isShortLabel "で法人税法" = true := by native_decide
example : isShortLabel "で法人税法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "で法人税法" := by native_decide
example : isShortLabel "とあるのは" = true := by native_decide
example : isShortLabel "とあるのは" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "とあるのは" := by native_decide
example : isShortLabel "とあるのは、" = true := by native_decide
example : isShortLabel "とあるのは、" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "とあるのは、" := by native_decide
example : isShortLabel "とう" = true := by native_decide
example : isShortLabel "とう" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "とう" := by native_decide
example : isShortLabel "とし、" = true := by native_decide
example : isShortLabel "とし、" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "とし、" := by native_decide
example : isShortLabel "となるもの" = true := by native_decide
example : isShortLabel "となるもの" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "となるもの" := by native_decide
example : isShortLabel "との" = true := by native_decide
example : isShortLabel "との" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "との" := by native_decide
example : isShortLabel "とびら" = true := by native_decide
example : isShortLabel "とびら" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "とびら" := by native_decide
example : isShortLabel "と他の" = true := by native_decide
example : isShortLabel "と他の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "と他の" := by native_decide
example : isShortLabel "ない" = true := by native_decide
example : isShortLabel "ない" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ない" := by native_decide
example : isShortLabel "ないこと" = true := by native_decide
example : isShortLabel "ないこと" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ないこと" := by native_decide
example : isShortLabel "なつた日まで" = true := by native_decide
example : isShortLabel "なつた日まで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "なつた日まで" := by native_decide
example : isShortLabel "ならば第一項" = true := by native_decide
example : isShortLabel "ならば第一項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ならば第一項" := by native_decide
example : isShortLabel "なるべき額" = true := by native_decide
example : isShortLabel "なるべき額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "なるべき額" := by native_decide
example : isShortLabel "なる日" = true := by native_decide
example : isShortLabel "なる日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "なる日" := by native_decide
example : isShortLabel "なる日の前日" = true := by native_decide
example : isShortLabel "なる日の前日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "なる日の前日" := by native_decide
example : isShortLabel "にあつては" = true := by native_decide
example : isShortLabel "にあつては" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "にあつては" := by native_decide
example : isShortLabel "において" = true := by native_decide
example : isShortLabel "において" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "において" := by native_decide
example : isShortLabel "において、" = true := by native_decide
example : isShortLabel "において、" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "において、" := by native_decide
example : isShortLabel "における" = true := by native_decide
example : isShortLabel "における" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "における" := by native_decide
example : isShortLabel "について" = true := by native_decide
example : isShortLabel "について" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "について" := by native_decide
example : isShortLabel "について令" = true := by native_decide
example : isShortLabel "について令" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "について令" := by native_decide
example : isShortLabel "につき" = true := by native_decide
example : isShortLabel "につき" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "につき" := by native_decide
example : isShortLabel "につきこの条" = true := by native_decide
example : isShortLabel "につきこの条" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "につきこの条" := by native_decide
example : isShortLabel "には、" = true := by native_decide
example : isShortLabel "には、" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "には、" := by native_decide
example : isShortLabel "により、当該" = true := by native_decide
example : isShortLabel "により、当該" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "により、当該" := by native_decide
example : isShortLabel "による" = true := by native_decide
example : isShortLabel "による" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "による" := by native_decide
example : isShortLabel "による申告書" = true := by native_decide
example : isShortLabel "による申告書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "による申告書" := by native_decide
example : isShortLabel "による給与" = true := by native_decide
example : isShortLabel "による給与" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "による給与" := by native_decide
example : isShortLabel "に他の者" = true := by native_decide
example : isShortLabel "に他の者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "に他の者" := by native_decide
example : isShortLabel "に任意提供" = true := by native_decide
example : isShortLabel "に任意提供" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "に任意提供" := by native_decide
example : isShortLabel "に係る" = true := by native_decide
example : isShortLabel "に係る" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "に係る" := by native_decide
example : isShortLabel "に係る消費税" = true := by native_decide
example : isShortLabel "に係る消費税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "に係る消費税" := by native_decide
example : isShortLabel "に係る第一項" = true := by native_decide
example : isShortLabel "に係る第一項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "に係る第一項" := by native_decide
example : isShortLabel "に受理された" = true := by native_decide
example : isShortLabel "に受理された" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "に受理された" := by native_decide
example : isShortLabel "に同じ。" = true := by native_decide
example : isShortLabel "に同じ。" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "に同じ。" := by native_decide
example : isShortLabel "に定める期間" = true := by native_decide
example : isShortLabel "に定める期間" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "に定める期間" := by native_decide
example : isShortLabel "に対して" = true := by native_decide
example : isShortLabel "に対して" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "に対して" := by native_decide
example : isShortLabel "に所在する" = true := by native_decide
example : isShortLabel "に所在する" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "に所在する" := by native_decide
example : isShortLabel "に法人税法" = true := by native_decide
example : isShortLabel "に法人税法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "に法人税法" := by native_decide
example : isShortLabel "に納付" = true := by native_decide
example : isShortLabel "に納付" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "に納付" := by native_decide
example : isShortLabel "に限る。" = true := by native_decide
example : isShortLabel "に限る。" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "に限る。" := by native_decide
example : isShortLabel "に限る。）" = true := by native_decide
example : isShortLabel "に限る。）" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "に限る。）" := by native_decide
example : isShortLabel "のうち" = true := by native_decide
example : isShortLabel "のうち" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "のうち" := by native_decide
example : isShortLabel "のうち同項" = true := by native_decide
example : isShortLabel "のうち同項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "のうち同項" := by native_decide
example : isShortLabel "のうち第一項" = true := by native_decide
example : isShortLabel "のうち第一項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "のうち第一項" := by native_decide
example : isShortLabel "のもの" = true := by native_decide
example : isShortLabel "のもの" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "のもの" := by native_decide
example : isShortLabel "のり" = true := by native_decide
example : isShortLabel "のり" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "のり" := by native_decide
example : isShortLabel "の上" = true := by native_decide
example : isShortLabel "の上" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の上" := by native_decide
example : isShortLabel "の介助" = true := by native_decide
example : isShortLabel "の介助" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の介助" := by native_decide
example : isShortLabel "の保険期間" = true := by native_decide
example : isShortLabel "の保険期間" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の保険期間" := by native_decide
example : isShortLabel "の前項" = true := by native_decide
example : isShortLabel "の前項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の前項" := by native_decide
example : isShortLabel "の同項" = true := by native_decide
example : isShortLabel "の同項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の同項" := by native_decide
example : isShortLabel "の名称、" = true := by native_decide
example : isShortLabel "の名称、" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の名称、" := by native_decide
example : isShortLabel "の名称及び" = true := by native_decide
example : isShortLabel "の名称及び" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の名称及び" := by native_decide
example : isShortLabel "の対価の額" = true := by native_decide
example : isShortLabel "の対価の額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の対価の額" := by native_decide
example : isShortLabel "の対象配当等" = true := by native_decide
example : isShortLabel "の対象配当等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の対象配当等" := by native_decide
example : isShortLabel "の当該承認" = true := by native_decide
example : isShortLabel "の当該承認" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の当該承認" := by native_decide
example : isShortLabel "の当該許可" = true := by native_decide
example : isShortLabel "の当該許可" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の当該許可" := by native_decide
example : isShortLabel "の当該認定" = true := by native_decide
example : isShortLabel "の当該認定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の当該認定" := by native_decide
example : isShortLabel "の徴収" = true := by native_decide
example : isShortLabel "の徴収" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の徴収" := by native_decide
example : isShortLabel "の徴収上" = true := by native_decide
example : isShortLabel "の徴収上" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の徴収上" := by native_decide
example : isShortLabel "の徴収）" = true := by native_decide
example : isShortLabel "の徴収）" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の徴収）" := by native_decide
example : isShortLabel "の数" = true := by native_decide
example : isShortLabel "の数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の数" := by native_decide
example : isShortLabel "の日" = true := by native_decide
example : isShortLabel "の日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の日" := by native_decide
example : isShortLabel "の日の前日" = true := by native_decide
example : isShortLabel "の日の前日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の日の前日" := by native_decide
example : isShortLabel "の時" = true := by native_decide
example : isShortLabel "の時" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の時" := by native_decide
example : isShortLabel "の死亡の" = true := by native_decide
example : isShortLabel "の死亡の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の死亡の" := by native_decide
example : isShortLabel "の法人" = true := by native_decide
example : isShortLabel "の法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の法人" := by native_decide
example : isShortLabel "の法人の" = true := by native_decide
example : isShortLabel "の法人の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の法人の" := by native_decide
example : isShortLabel "の法人税割" = true := by native_decide
example : isShortLabel "の法人税割" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の法人税割" := by native_decide
example : isShortLabel "の滞納がある" = true := by native_decide
example : isShortLabel "の滞納がある" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の滞納がある" := by native_decide
example : isShortLabel "の特定受託者" = true := by native_decide
example : isShortLabel "の特定受託者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の特定受託者" := by native_decide
example : isShortLabel "の納税地" = true := by native_decide
example : isShortLabel "の納税地" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の納税地" := by native_decide
example : isShortLabel "の給付" = true := by native_decide
example : isShortLabel "の給付" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の給付" := by native_decide
example : isShortLabel "の総所得金額" = true := by native_decide
example : isShortLabel "の総所得金額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の総所得金額" := by native_decide
example : isShortLabel "の罪" = true := by native_decide
example : isShortLabel "の罪" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の罪" := by native_decide
example : isShortLabel "の翌日から" = true := by native_decide
example : isShortLabel "の翌日から" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の翌日から" := by native_decide
example : isShortLabel "の規定、" = true := by native_decide
example : isShortLabel "の規定、" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の規定、" := by native_decide
example : isShortLabel "の規定により" = true := by native_decide
example : isShortLabel "の規定により" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の規定により" := by native_decide
example : isShortLabel "の規定の" = true := by native_decide
example : isShortLabel "の規定の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の規定の" := by native_decide
example : isShortLabel "の規定を" = true := by native_decide
example : isShortLabel "の規定を" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の規定を" := by native_decide
example : isShortLabel "の計算" = true := by native_decide
example : isShortLabel "の計算" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の計算" := by native_decide
example : isShortLabel "の課税済金額" = true := by native_decide
example : isShortLabel "の課税済金額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の課税済金額" := by native_decide
example : isShortLabel "の譲渡" = true := by native_decide
example : isShortLabel "の譲渡" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の譲渡" := by native_decide
example : isShortLabel "の輸入数量" = true := by native_decide
example : isShortLabel "の輸入数量" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の輸入数量" := by native_decide
example : isShortLabel "の配当等" = true := by native_decide
example : isShortLabel "の配当等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の配当等" := by native_decide
example : isShortLabel "の金額" = true := by native_decide
example : isShortLabel "の金額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の金額" := by native_decide
example : isShortLabel "の額" = true := by native_decide
example : isShortLabel "の額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の額" := by native_decide
example : isShortLabel "の額、" = true := by native_decide
example : isShortLabel "の額、" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の額、" := by native_decide
example : isShortLabel "の額として" = true := by native_decide
example : isShortLabel "の額として" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "の額として" := by native_decide
example : isShortLabel "は、同項" = true := by native_decide
example : isShortLabel "は、同項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "は、同項" := by native_decide
example : isShortLabel "は、法人税法" = true := by native_decide
example : isShortLabel "は、法人税法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "は、法人税法" := by native_decide
example : isShortLabel "はい" = true := by native_decide
example : isShortLabel "はい" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "はい" := by native_decide
example : isShortLabel "はち" = true := by native_decide
example : isShortLabel "はち" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "はち" := by native_decide
example : isShortLabel "ばい" = true := by native_decide
example : isShortLabel "ばい" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ばい" := by native_decide
example : isShortLabel "ばつ" = true := by native_decide
example : isShortLabel "ばつ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ばつ" := by native_decide
example : isShortLabel "ばつき装置" = true := by native_decide
example : isShortLabel "ばつき装置" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ばつき装置" := by native_decide
example : isShortLabel "ぱ" = true := by native_decide
example : isShortLabel "ぱ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ぱ" := by native_decide
example : isShortLabel "ひとり親" = true := by native_decide
example : isShortLabel "ひとり親" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ひとり親" := by native_decide
example : isShortLabel "び" = true := by native_decide
example : isShortLabel "び" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "び" := by native_decide
example : isShortLabel "ふっ素ゴム" = true := by native_decide
example : isShortLabel "ふっ素ゴム" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ふっ素ゴム" := by native_decide
example : isShortLabel "ふるい" = true := by native_decide
example : isShortLabel "ふるい" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ふるい" := by native_decide
example : isShortLabel "ぶどう糖" = true := by native_decide
example : isShortLabel "ぶどう糖" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ぶどう糖" := by native_decide
example : isShortLabel "べん" = true := by native_decide
example : isShortLabel "べん" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "べん" := by native_decide
example : isShortLabel "ぺい" = true := by native_decide
example : isShortLabel "ぺい" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ぺい" := by native_decide
example : isShortLabel "ほう" = true := by native_decide
example : isShortLabel "ほう" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ほう" := by native_decide
example : isShortLabel "ほうろう" = true := by native_decide
example : isShortLabel "ほうろう" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ほうろう" := by native_decide
example : isShortLabel "ほか、当該" = true := by native_decide
example : isShortLabel "ほか、当該" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ほか、当該" := by native_decide
example : isShortLabel "まず同項" = true := by native_decide
example : isShortLabel "まず同項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "まず同項" := by native_decide
example : isShortLabel "まつ" = true := by native_decide
example : isShortLabel "まつ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "まつ" := by native_decide
example : isShortLabel "まで" = true := by native_decide
example : isShortLabel "まで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "まで" := by native_decide
example : isShortLabel "までに" = true := by native_decide
example : isShortLabel "までに" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "までに" := by native_decide
example : isShortLabel "まで又は" = true := by native_decide
example : isShortLabel "まで又は" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "まで又は" := by native_decide
example : isShortLabel "まで若しくは" = true := by native_decide
example : isShortLabel "まで若しくは" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "まで若しくは" := by native_decide
example : isShortLabel "みりん" = true := by native_decide
example : isShortLabel "みりん" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "みりん" := by native_decide
example : isShortLabel "もの" = true := by native_decide
example : isShortLabel "もの" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "もの" := by native_decide
example : isShortLabel "ものに限る" = true := by native_decide
example : isShortLabel "ものに限る" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ものに限る" := by native_decide
example : isShortLabel "ものの譲渡" = true := by native_decide
example : isShortLabel "ものの譲渡" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ものの譲渡" := by native_decide
example : isShortLabel "ものをいう" = true := by native_decide
example : isShortLabel "ものをいう" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ものをいう" := by native_decide
example : isShortLabel "もろみ" = true := by native_decide
example : isShortLabel "もろみ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "もろみ" := by native_decide
example : isShortLabel "よう" = true := by native_decide
example : isShortLabel "よう" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "よう" := by native_decide
example : isShortLabel "より" = true := by native_decide
example : isShortLabel "より" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "より" := by native_decide
example : isShortLabel "よる徴収" = true := by native_decide
example : isShortLabel "よる徴収" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "よる徴収" := by native_decide
example : isShortLabel "よる所得税" = true := by native_decide
example : isShortLabel "よる所得税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "よる所得税" := by native_decide
example : isShortLabel "よる納税" = true := by native_decide
example : isShortLabel "よる納税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "よる納税" := by native_decide
example : isShortLabel "りゆう" = true := by native_decide
example : isShortLabel "りゆう" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "りゆう" := by native_decide
example : isShortLabel "りよう" = true := by native_decide
example : isShortLabel "りよう" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "りよう" := by native_decide
example : isShortLabel "り災世帯数" = true := by native_decide
example : isShortLabel "り災世帯数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "り災世帯数" := by native_decide
example : isShortLabel "ろう" = true := by native_decide
example : isShortLabel "ろう" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ろう" := by native_decide
example : isShortLabel "をいい" = true := by native_decide
example : isShortLabel "をいい" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "をいい" := by native_decide
example : isShortLabel "をいう" = true := by native_decide
example : isShortLabel "をいう" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "をいう" := by native_decide
example : isShortLabel "をいう。" = true := by native_decide
example : isShortLabel "をいう。" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "をいう。" := by native_decide
example : isShortLabel "をその督促状" = true := by native_decide
example : isShortLabel "をその督促状" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "をその督促状" := by native_decide
example : isShortLabel "を交付する" = true := by native_decide
example : isShortLabel "を交付する" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "を交付する" := by native_decide
example : isShortLabel "を交付する日" = true := by native_decide
example : isShortLabel "を交付する日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "を交付する日" := by native_decide
example : isShortLabel "を入力して" = true := by native_decide
example : isShortLabel "を入力して" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "を入力して" := by native_decide
example : isShortLabel "を前項" = true := by native_decide
example : isShortLabel "を前項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "を前項" := by native_decide
example : isShortLabel "を同項" = true := by native_decide
example : isShortLabel "を同項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "を同項" := by native_decide
example : isShortLabel "を含む" = true := by native_decide
example : isShortLabel "を含む" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "を含む" := by native_decide
example : isShortLabel "を完納せず" = true := by native_decide
example : isShortLabel "を完納せず" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "を完納せず" := by native_decide
example : isShortLabel "を当該各号" = true := by native_decide
example : isShortLabel "を当該各号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "を当該各号" := by native_decide
example : isShortLabel "を施すこと。" = true := by native_decide
example : isShortLabel "を施すこと。" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "を施すこと。" := by native_decide
example : isShortLabel "を滞納した" = true := by native_decide
example : isShortLabel "を滞納した" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "を滞納した" := by native_decide
example : isShortLabel "を第一項" = true := by native_decide
example : isShortLabel "を第一項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "を第一項" := by native_decide
example : isShortLabel "を納付させる" = true := by native_decide
example : isShortLabel "を納付させる" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "を納付させる" := by native_decide
example : isShortLabel "を納付する" = true := by native_decide
example : isShortLabel "を納付する" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "を納付する" := by native_decide
example : isShortLabel "を送信する" = true := by native_decide
example : isShortLabel "を送信する" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "を送信する" := by native_decide
example : isShortLabel "ア　従来分" = true := by native_decide
example : isShortLabel "ア　従来分" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ア　従来分" := by native_decide
example : isShortLabel "ア　独立校" = true := by native_decide
example : isShortLabel "ア　独立校" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ア　独立校" := by native_decide
example : isShortLabel "アルコール分" = true := by native_decide
example : isShortLabel "アルコール分" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "アルコール分" := by native_decide
example : isShortLabel "アルゼンチン" = true := by native_decide
example : isShortLabel "アルゼンチン" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "アルゼンチン" := by native_decide
example : isShortLabel "アンモニア" = true := by native_decide
example : isShortLabel "アンモニア" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "アンモニア" := by native_decide
example : isShortLabel "イ　併設校" = true := by native_decide
example : isShortLabel "イ　併設校" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "イ　併設校" := by native_decide
example : isShortLabel "イ　営業用" = true := by native_decide
example : isShortLabel "イ　営業用" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "イ　営業用" := by native_decide
example : isShortLabel "イ　拡大分" = true := by native_decide
example : isShortLabel "イ　拡大分" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "イ　拡大分" := by native_decide
example : isShortLabel "イからカまで" = true := by native_decide
example : isShortLabel "イからカまで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "イからカまで" := by native_decide
example : isShortLabel "イからソまで" = true := by native_decide
example : isShortLabel "イからソまで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "イからソまで" := by native_decide
example : isShortLabel "イからタまで" = true := by native_decide
example : isShortLabel "イからタまで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "イからタまで" := by native_decide
example : isShortLabel "イからチまで" = true := by native_decide
example : isShortLabel "イからチまで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "イからチまで" := by native_decide
example : isShortLabel "イからツまで" = true := by native_decide
example : isShortLabel "イからツまで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "イからツまで" := by native_decide
example : isShortLabel "イからナまで" = true := by native_decide
example : isShortLabel "イからナまで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "イからナまで" := by native_decide
example : isShortLabel "イからヌまで" = true := by native_decide
example : isShortLabel "イからヌまで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "イからヌまで" := by native_decide
example : isShortLabel "イからネまで" = true := by native_decide
example : isShortLabel "イからネまで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "イからネまで" := by native_decide
example : isShortLabel "イからムまで" = true := by native_decide
example : isShortLabel "イからムまで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "イからムまで" := by native_decide
example : isShortLabel "イからヨまで" = true := by native_decide
example : isShortLabel "イからヨまで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "イからヨまで" := by native_decide
example : isShortLabel "イからリまで" = true := by native_decide
example : isShortLabel "イからリまで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "イからリまで" := by native_decide
example : isShortLabel "イからルまで" = true := by native_decide
example : isShortLabel "イからルまで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "イからルまで" := by native_decide
example : isShortLabel "イからレまで" = true := by native_decide
example : isShortLabel "イからレまで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "イからレまで" := by native_decide
example : isShortLabel "イからワまで" = true := by native_decide
example : isShortLabel "イからワまで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "イからワまで" := by native_decide
example : isShortLabel "イからヲまで" = true := by native_decide
example : isShortLabel "イからヲまで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "イからヲまで" := by native_decide
example : isShortLabel "インド" = true := by native_decide
example : isShortLabel "インド" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "インド" := by native_decide
example : isShortLabel "イ～ヘ" = true := by native_decide
example : isShortLabel "イ～ヘ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "イ～ヘ" := by native_decide
example : isShortLabel "イ～リ" = true := by native_decide
example : isShortLabel "イ～リ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "イ～リ" := by native_decide
example : isShortLabel "ウイスキー" = true := by native_decide
example : isShortLabel "ウイスキー" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ウイスキー" := by native_decide
example : isShortLabel "エキス分" = true := by native_decide
example : isShortLabel "エキス分" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "エキス分" := by native_decide
example : isShortLabel "オ　総合学科" = true := by native_decide
example : isShortLabel "オ　総合学科" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "オ　総合学科" := by native_decide
example : isShortLabel "カナダ" = true := by native_decide
example : isShortLabel "カナダ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "カナダ" := by native_decide
example : isShortLabel "カンボジア" = true := by native_decide
example : isShortLabel "カンボジア" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "カンボジア" := by native_decide
example : isShortLabel "ガス" = true := by native_decide
example : isShortLabel "ガス" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ガス" := by native_decide
example : isShortLabel "ガスの供給" = true := by native_decide
example : isShortLabel "ガスの供給" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ガスの供給" := by native_decide
example : isShortLabel "ガス設備" = true := by native_decide
example : isShortLabel "ガス設備" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ガス設備" := by native_decide
example : isShortLabel "キシロール" = true := by native_decide
example : isShortLabel "キシロール" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "キシロール" := by native_decide
example : isShortLabel "キロメートル" = true := by native_decide
example : isShortLabel "キロメートル" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "キロメートル" := by native_decide
example : isShortLabel "ギリシャ" = true := by native_decide
example : isShortLabel "ギリシャ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ギリシャ" := by native_decide
example : isShortLabel "グループ分離" = true := by native_decide
example : isShortLabel "グループ分離" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "グループ分離" := by native_decide
example : isShortLabel "グループ結合" = true := by native_decide
example : isShortLabel "グループ結合" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "グループ結合" := by native_decide
example : isShortLabel "コンゴ共和国" = true := by native_decide
example : isShortLabel "コンゴ共和国" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "コンゴ共和国" := by native_decide
example : isShortLabel "コンテナー" = true := by native_decide
example : isShortLabel "コンテナー" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "コンテナー" := by native_decide
example : isShortLabel "ゴムの溶剤用" = true := by native_decide
example : isShortLabel "ゴムの溶剤用" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ゴムの溶剤用" := by native_decide
example : isShortLabel "ゴルフ場" = true := by native_decide
example : isShortLabel "ゴルフ場" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ゴルフ場" := by native_decide
example : isShortLabel "シロップ類" = true := by native_decide
example : isShortLabel "シロップ類" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "シロップ類" := by native_decide
example : isShortLabel "シンガポール" = true := by native_decide
example : isShortLabel "シンガポール" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "シンガポール" := by native_decide
example : isShortLabel "スキー場" = true := by native_decide
example : isShortLabel "スキー場" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "スキー場" := by native_decide
example : isShortLabel "スケート場" = true := by native_decide
example : isShortLabel "スケート場" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "スケート場" := by native_decide
example : isShortLabel "スピリッツ" = true := by native_decide
example : isShortLabel "スピリッツ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "スピリッツ" := by native_decide
example : isShortLabel "スポーツ施設" = true := by native_decide
example : isShortLabel "スポーツ施設" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "スポーツ施設" := by native_decide
example : isShortLabel "スロバキア" = true := by native_decide
example : isShortLabel "スロバキア" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "スロバキア" := by native_decide
example : isShortLabel "タカン装置" = true := by native_decide
example : isShortLabel "タカン装置" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "タカン装置" := by native_decide
example : isShortLabel "ダム、" = true := by native_decide
example : isShortLabel "ダム、" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ダム、" := by native_decide
example : isShortLabel "ダム使用権" = true := by native_decide
example : isShortLabel "ダム使用権" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ダム使用権" := by native_decide
example : isShortLabel "チェコ" = true := by native_decide
example : isShortLabel "チェコ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "チェコ" := by native_decide
example : isShortLabel "デザイン業" = true := by native_decide
example : isShortLabel "デザイン業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "デザイン業" := by native_decide
example : isShortLabel "トルオール" = true := by native_decide
example : isShortLabel "トルオール" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "トルオール" := by native_decide
example : isShortLabel "トーゴ" = true := by native_decide
example : isShortLabel "トーゴ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "トーゴ" := by native_decide
example : isShortLabel "ニ〇〇" = true := by native_decide
example : isShortLabel "ニ〇〇" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ニ〇〇" := by native_decide
example : isShortLabel "ニジェール" = true := by native_decide
example : isShortLabel "ニジェール" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ニジェール" := by native_decide
example : isShortLabel "ヌからワまで" = true := by native_decide
example : isShortLabel "ヌからワまで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ヌからワまで" := by native_decide
example : isShortLabel "ヌからヲまで" = true := by native_decide
example : isShortLabel "ヌからヲまで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ヌからヲまで" := by native_decide
example : isShortLabel "ハからチまで" = true := by native_decide
example : isShortLabel "ハからチまで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ハからチまで" := by native_decide
example : isShortLabel "ハからツまで" = true := by native_decide
example : isShortLabel "ハからツまで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ハからツまで" := by native_decide
example : isShortLabel "ハからヌまで" = true := by native_decide
example : isShortLabel "ハからヌまで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ハからヌまで" := by native_decide
example : isShortLabel "ハからリまで" = true := by native_decide
example : isShortLabel "ハからリまで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ハからリまで" := by native_decide
example : isShortLabel "ハからルまで" = true := by native_decide
example : isShortLabel "ハからルまで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ハからルまで" := by native_decide
example : isShortLabel "ハからワまで" = true := by native_decide
example : isShortLabel "ハからワまで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ハからワまで" := by native_decide
example : isShortLabel "パイプたばこ" = true := by native_decide
example : isShortLabel "パイプたばこ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "パイプたばこ" := by native_decide
example : isShortLabel "ビール" = true := by native_decide
example : isShortLabel "ビール" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ビール" := by native_decide
example : isShortLabel "ブタジエン" = true := by native_decide
example : isShortLabel "ブタジエン" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ブタジエン" := by native_decide
example : isShortLabel "ブラジル" = true := by native_decide
example : isShortLabel "ブラジル" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ブラジル" := by native_decide
example : isShortLabel "ブランデー" = true := by native_decide
example : isShortLabel "ブランデー" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ブランデー" := by native_decide
example : isShortLabel "プロボクサー" = true := by native_decide
example : isShortLabel "プロボクサー" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "プロボクサー" := by native_decide
example : isShortLabel "プロレスラー" = true := by native_decide
example : isShortLabel "プロレスラー" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "プロレスラー" := by native_decide
example : isShortLabel "ヘからツまで" = true := by native_decide
example : isShortLabel "ヘからツまで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ヘからツまで" := by native_decide
example : isShortLabel "ヘからリまで" = true := by native_decide
example : isShortLabel "ヘからリまで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ヘからリまで" := by native_decide
example : isShortLabel "ヘクタール" = true := by native_decide
example : isShortLabel "ヘクタール" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ヘクタール" := by native_decide
example : isShortLabel "ベナン" = true := by native_decide
example : isShortLabel "ベナン" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ベナン" := by native_decide
example : isShortLabel "ベネズエラ" = true := by native_decide
example : isShortLabel "ベネズエラ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ベネズエラ" := by native_decide
example : isShortLabel "ベンゾール" = true := by native_decide
example : isShortLabel "ベンゾール" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ベンゾール" := by native_decide
example : isShortLabel "ボイラー" = true := by native_decide
example : isShortLabel "ボイラー" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ボイラー" := by native_decide
example : isShortLabel "ボーリング場" = true := by native_decide
example : isShortLabel "ボーリング場" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ボーリング場" := by native_decide
example : isShortLabel "マダガスカル" = true := by native_decide
example : isShortLabel "マダガスカル" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "マダガスカル" := by native_decide
example : isShortLabel "メートル" = true := by native_decide
example : isShortLabel "メートル" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "メートル" := by native_decide
example : isShortLabel "リキュール" = true := by native_decide
example : isShortLabel "リキュール" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "リキュール" := by native_decide
example : isShortLabel "リキュール類" = true := by native_decide
example : isShortLabel "リキュール類" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "リキュール類" := by native_decide
example : isShortLabel "リース期間" = true := by native_decide
example : isShortLabel "リース期間" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "リース期間" := by native_decide
example : isShortLabel "リース譲渡" = true := by native_decide
example : isShortLabel "リース譲渡" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "リース譲渡" := by native_decide
example : isShortLabel "リース資産" = true := by native_decide
example : isShortLabel "リース資産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "リース資産" := by native_decide
example : isShortLabel "レバノン" = true := by native_decide
example : isShortLabel "レバノン" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "レバノン" := by native_decide
example : isShortLabel "ロ　自家用" = true := by native_decide
example : isShortLabel "ロ　自家用" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ロ　自家用" := by native_decide
example : isShortLabel "ロからヌまで" = true := by native_decide
example : isShortLabel "ロからヌまで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ロからヌまで" := by native_decide
example : isShortLabel "一" = true := by native_decide
example : isShortLabel "一" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一" := by native_decide
example : isShortLabel "一　人口" = true := by native_decide
example : isShortLabel "一　人口" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一　人口" := by native_decide
example : isShortLabel "一　消防費" = true := by native_decide
example : isShortLabel "一　消防費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一　消防費" := by native_decide
example : isShortLabel "一　港湾費" = true := by native_decide
example : isShortLabel "一　港湾費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一　港湾費" := by native_decide
example : isShortLabel "一　警察費" = true := by native_decide
example : isShortLabel "一　警察費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一　警察費" := by native_decide
example : isShortLabel "一　配合飼料" = true := by native_decide
example : isShortLabel "一　配合飼料" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一　配合飼料" := by native_decide
example : isShortLabel "一、七二五" = true := by native_decide
example : isShortLabel "一、七二五" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一、七二五" := by native_decide
example : isShortLabel "一、九〇〇円" = true := by native_decide
example : isShortLabel "一、九〇〇円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一、九〇〇円" := by native_decide
example : isShortLabel "一、五〇〇" = true := by native_decide
example : isShortLabel "一、五〇〇" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一、五〇〇" := by native_decide
example : isShortLabel "一、五〇〇円" = true := by native_decide
example : isShortLabel "一、五〇〇円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一、五〇〇円" := by native_decide
example : isShortLabel "一、八〇〇" = true := by native_decide
example : isShortLabel "一、八〇〇" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一、八〇〇" := by native_decide
example : isShortLabel "一〇〇枚" = true := by native_decide
example : isShortLabel "一〇〇枚" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一〇〇枚" := by native_decide
example : isShortLabel "一〇〇点" = true := by native_decide
example : isShortLabel "一〇〇点" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一〇〇点" := by native_decide
example : isShortLabel "一〇点" = true := by native_decide
example : isShortLabel "一〇点" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一〇点" := by native_decide
example : isShortLabel "一〇％" = true := by native_decide
example : isShortLabel "一〇％" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一〇％" := by native_decide
example : isShortLabel "一グラム" = true := by native_decide
example : isShortLabel "一グラム" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一グラム" := by native_decide
example : isShortLabel "一パーセント" = true := by native_decide
example : isShortLabel "一パーセント" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一パーセント" := by native_decide
example : isShortLabel "一二〇点" = true := by native_decide
example : isShortLabel "一二〇点" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一二〇点" := by native_decide
example : isShortLabel "一二・五％" = true := by native_decide
example : isShortLabel "一二・五％" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一二・五％" := by native_decide
example : isShortLabel "一五〇" = true := by native_decide
example : isShortLabel "一五〇" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一五〇" := by native_decide
example : isShortLabel "一五〇点" = true := by native_decide
example : isShortLabel "一五〇点" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一五〇点" := by native_decide
example : isShortLabel "一五点" = true := by native_decide
example : isShortLabel "一五点" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一五点" := by native_decide
example : isShortLabel "一人" = true := by native_decide
example : isShortLabel "一人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一人" := by native_decide
example : isShortLabel "一個" = true := by native_decide
example : isShortLabel "一個" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一個" := by native_decide
example : isShortLabel "一八〇点" = true := by native_decide
example : isShortLabel "一八〇点" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一八〇点" := by native_decide
example : isShortLabel "一切の取引（" = true := by native_decide
example : isShortLabel "一切の取引（" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一切の取引（" := by native_decide
example : isShortLabel "一四〇点" = true := by native_decide
example : isShortLabel "一四〇点" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一四〇点" := by native_decide
example : isShortLabel "一年" = true := by native_decide
example : isShortLabel "一年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一年" := by native_decide
example : isShortLabel "一時に" = true := by native_decide
example : isShortLabel "一時に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一時に" := by native_decide
example : isShortLabel "一月" = true := by native_decide
example : isShortLabel "一月" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一月" := by native_decide
example : isShortLabel "一月一日" = true := by native_decide
example : isShortLabel "一月一日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一月一日" := by native_decide
example : isShortLabel "一月三十一日" = true := by native_decide
example : isShortLabel "一月三十一日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一月三十一日" := by native_decide
example : isShortLabel "一月及び二月" = true := by native_decide
example : isShortLabel "一月及び二月" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一月及び二月" := by native_decide
example : isShortLabel "一点" = true := by native_decide
example : isShortLabel "一点" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一点" := by native_decide
example : isShortLabel "一級" = true := by native_decide
example : isShortLabel "一級" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一級" := by native_decide
example : isShortLabel "一級地" = true := by native_decide
example : isShortLabel "一級地" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一級地" := by native_decide
example : isShortLabel "一般住宅用地" = true := by native_decide
example : isShortLabel "一般住宅用地" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一般住宅用地" := by native_decide
example : isShortLabel "一般社団法人" = true := by native_decide
example : isShortLabel "一般社団法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一般社団法人" := by native_decide
example : isShortLabel "一般財団法人" = true := by native_decide
example : isShortLabel "一般財団法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "一般財団法人" := by native_decide
example : isShortLabel "七" = true := by native_decide
example : isShortLabel "七" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "七" := by native_decide
example : isShortLabel "七　事業所税" = true := by native_decide
example : isShortLabel "七　事業所税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "七　事業所税" := by native_decide
example : isShortLabel "七　小学校費" = true := by native_decide
example : isShortLabel "七　小学校費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "七　小学校費" := by native_decide
example : isShortLabel "七　衛生費" = true := by native_decide
example : isShortLabel "七　衛生費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "七　衛生費" := by native_decide
example : isShortLabel "七、一〇〇円" = true := by native_decide
example : isShortLabel "七、一〇〇円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "七、一〇〇円" := by native_decide
example : isShortLabel "七〇〇点" = true := by native_decide
example : isShortLabel "七〇〇点" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "七〇〇点" := by native_decide
example : isShortLabel "七五〇" = true := by native_decide
example : isShortLabel "七五〇" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "七五〇" := by native_decide
example : isShortLabel "七五グラム" = true := by native_decide
example : isShortLabel "七五グラム" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "七五グラム" := by native_decide
example : isShortLabel "七十分の二十" = true := by native_decide
example : isShortLabel "七十分の二十" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "七十分の二十" := by native_decide
example : isShortLabel "七年" = true := by native_decide
example : isShortLabel "七年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "七年" := by native_decide
example : isShortLabel "七月三十一日" = true := by native_decide
example : isShortLabel "七月三十一日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "七月三十一日" := by native_decide
example : isShortLabel "七月及び八月" = true := by native_decide
example : isShortLabel "七月及び八月" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "七月及び八月" := by native_decide
example : isShortLabel "万年筆" = true := by native_decide
example : isShortLabel "万年筆" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "万年筆" := by native_decide
example : isShortLabel "三" = true := by native_decide
example : isShortLabel "三" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "三" := by native_decide
example : isShortLabel "三　教育費" = true := by native_decide
example : isShortLabel "三　教育費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "三　教育費" := by native_decide
example : isShortLabel "三　旧ガス税" = true := by native_decide
example : isShortLabel "三　旧ガス税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "三　旧ガス税" := by native_decide
example : isShortLabel "三　港湾費" = true := by native_decide
example : isShortLabel "三　港湾費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "三　港湾費" := by native_decide
example : isShortLabel "三　落花生油" = true := by native_decide
example : isShortLabel "三　落花生油" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "三　落花生油" := by native_decide
example : isShortLabel "三　通風機" = true := by native_decide
example : isShortLabel "三　通風機" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "三　通風機" := by native_decide
example : isShortLabel "三、〇〇〇" = true := by native_decide
example : isShortLabel "三、〇〇〇" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "三、〇〇〇" := by native_decide
example : isShortLabel "三、〇〇〇円" = true := by native_decide
example : isShortLabel "三、〇〇〇円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "三、〇〇〇円" := by native_decide
example : isShortLabel "三、七五〇" = true := by native_decide
example : isShortLabel "三、七五〇" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "三、七五〇" := by native_decide
example : isShortLabel "三、九〇〇円" = true := by native_decide
example : isShortLabel "三、九〇〇円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "三、九〇〇円" := by native_decide
example : isShortLabel "三〇〇点" = true := by native_decide
example : isShortLabel "三〇〇点" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "三〇〇点" := by native_decide
example : isShortLabel "三〇世帯" = true := by native_decide
example : isShortLabel "三〇世帯" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "三〇世帯" := by native_decide
example : isShortLabel "三〇点" = true := by native_decide
example : isShortLabel "三〇点" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "三〇点" := by native_decide
example : isShortLabel "三七、五〇〇" = true := by native_decide
example : isShortLabel "三七、五〇〇" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "三七、五〇〇" := by native_decide
example : isShortLabel "三二五点" = true := by native_decide
example : isShortLabel "三二五点" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "三二五点" := by native_decide
example : isShortLabel "三分の一" = true := by native_decide
example : isShortLabel "三分の一" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "三分の一" := by native_decide
example : isShortLabel "三分の二" = true := by native_decide
example : isShortLabel "三分の二" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "三分の二" := by native_decide
example : isShortLabel "三十一単位" = true := by native_decide
example : isShortLabel "三十一単位" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "三十一単位" := by native_decide
example : isShortLabel "三十年" = true := by native_decide
example : isShortLabel "三十年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "三十年" := by native_decide
example : isShortLabel "三年" = true := by native_decide
example : isShortLabel "三年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "三年" := by native_decide
example : isShortLabel "三月三十一日" = true := by native_decide
example : isShortLabel "三月三十一日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "三月三十一日" := by native_decide
example : isShortLabel "三月十五日" = true := by native_decide
example : isShortLabel "三月十五日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "三月十五日" := by native_decide
example : isShortLabel "三点" = true := by native_decide
example : isShortLabel "三点" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "三点" := by native_decide
example : isShortLabel "三級地" = true := by native_decide
example : isShortLabel "三級地" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "三級地" := by native_decide
example : isShortLabel "三輪のもの" = true := by native_decide
example : isShortLabel "三輪のもの" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "三輪のもの" := by native_decide
example : isShortLabel "上場株式等" = true := by native_decide
example : isShortLabel "上場株式等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "上場株式等" := by native_decide
example : isShortLabel "上欄" = true := by native_decide
example : isShortLabel "上欄" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "上欄" := by native_decide
example : isShortLabel "下欄" = true := by native_decide
example : isShortLabel "下欄" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "下欄" := by native_decide
example : isShortLabel "下設備" = true := by native_decide
example : isShortLabel "下設備" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "下設備" := by native_decide
example : isShortLabel "不動産" = true := by native_decide
example : isShortLabel "不動産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "不動産" := by native_decide
example : isShortLabel "不動産売買業" = true := by native_decide
example : isShortLabel "不動産売買業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "不動産売買業" := by native_decide
example : isShortLabel "不動産業" = true := by native_decide
example : isShortLabel "不動産業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "不動産業" := by native_decide
example : isShortLabel "不動産貸付業" = true := by native_decide
example : isShortLabel "不動産貸付業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "不動産貸付業" := by native_decide
example : isShortLabel "不動産賃貸業" = true := by native_decide
example : isShortLabel "不動産賃貸業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "不動産賃貸業" := by native_decide
example : isShortLabel "不動産鑑定業" = true := by native_decide
example : isShortLabel "不動産鑑定業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "不動産鑑定業" := by native_decide
example : isShortLabel "世帯" = true := by native_decide
example : isShortLabel "世帯" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "世帯" := by native_decide
example : isShortLabel "世帯数" = true := by native_decide
example : isShortLabel "世帯数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "世帯数" := by native_decide
example : isShortLabel "両替業" = true := by native_decide
example : isShortLabel "両替業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "両替業" := by native_decide
example : isShortLabel "並びに" = true := by native_decide
example : isShortLabel "並びに" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "並びに" := by native_decide
example : isShortLabel "並びに当該" = true := by native_decide
example : isShortLabel "並びに当該" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "並びに当該" := by native_decide
example : isShortLabel "並びに法" = true := by native_decide
example : isShortLabel "並びに法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "並びに法" := by native_decide
example : isShortLabel "並びに第三項" = true := by native_decide
example : isShortLabel "並びに第三項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "並びに第三項" := by native_decide
example : isShortLabel "中「添付した" = true := by native_decide
example : isShortLabel "中「添付した" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "中「添付した" := by native_decide
example : isShortLabel "中和装置" = true := by native_decide
example : isShortLabel "中和装置" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "中和装置" := by native_decide
example : isShortLabel "中国海運局長" = true := by native_decide
example : isShortLabel "中国海運局長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "中国海運局長" := by native_decide
example : isShortLabel "中国運輸局長" = true := by native_decide
example : isShortLabel "中国運輸局長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "中国運輸局長" := by native_decide
example : isShortLabel "中学校費" = true := by native_decide
example : isShortLabel "中学校費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "中学校費" := by native_decide
example : isShortLabel "中小事業者" = true := by native_decide
example : isShortLabel "中小事業者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "中小事業者" := by native_decide
example : isShortLabel "中小企業者" = true := by native_decide
example : isShortLabel "中小企業者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "中小企業者" := by native_decide
example : isShortLabel "中核市の区域" = true := by native_decide
example : isShortLabel "中核市の区域" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "中核市の区域" := by native_decide
example : isShortLabel "中欄" = true := by native_decide
example : isShortLabel "中欄" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "中欄" := by native_decide
example : isShortLabel "中部運輸局長" = true := by native_decide
example : isShortLabel "中部運輸局長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "中部運輸局長" := by native_decide
example : isShortLabel "中間期間" = true := by native_decide
example : isShortLabel "中間期間" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "中間期間" := by native_decide
example : isShortLabel "中間申告書" = true := by native_decide
example : isShortLabel "中間申告書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "中間申告書" := by native_decide
example : isShortLabel "中間納付額" = true := by native_decide
example : isShortLabel "中間納付額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "中間納付額" := by native_decide
example : isShortLabel "中間親会社等" = true := by native_decide
example : isShortLabel "中間親会社等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "中間親会社等" := by native_decide
example : isShortLabel "主務省令" = true := by native_decide
example : isShortLabel "主務省令" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "主務省令" := by native_decide
example : isShortLabel "主文" = true := by native_decide
example : isShortLabel "主文" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "主文" := by native_decide
example : isShortLabel "主要原材料" = true := by native_decide
example : isShortLabel "主要原材料" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "主要原材料" := by native_decide
example : isShortLabel "乗ずる額" = true := by native_decide
example : isShortLabel "乗ずる額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "乗ずる額" := by native_decide
example : isShortLabel "乗率" = true := by native_decide
example : isShortLabel "乗率" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "乗率" := by native_decide
example : isShortLabel "乗用" = true := by native_decide
example : isShortLabel "乗用" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "乗用" := by native_decide
example : isShortLabel "九" = true := by native_decide
example : isShortLabel "九" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "九" := by native_decide
example : isShortLabel "九　中学校費" = true := by native_decide
example : isShortLabel "九　中学校費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "九　中学校費" := by native_decide
example : isShortLabel "九　福島県" = true := by native_decide
example : isShortLabel "九　福島県" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "九　福島県" := by native_decide
example : isShortLabel "九　鉱区税" = true := by native_decide
example : isShortLabel "九　鉱区税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "九　鉱区税" := by native_decide
example : isShortLabel "九〇、〇〇〇" = true := by native_decide
example : isShortLabel "九〇、〇〇〇" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "九〇、〇〇〇" := by native_decide
example : isShortLabel "九〇点" = true := by native_decide
example : isShortLabel "九〇点" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "九〇点" := by native_decide
example : isShortLabel "九七、五〇〇" = true := by native_decide
example : isShortLabel "九七、五〇〇" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "九七、五〇〇" := by native_decide
example : isShortLabel "九十リットル" = true := by native_decide
example : isShortLabel "九十リットル" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "九十リットル" := by native_decide
example : isShortLabel "九十三億円" = true := by native_decide
example : isShortLabel "九十三億円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "九十三億円" := by native_decide
example : isShortLabel "九十二億円" = true := by native_decide
example : isShortLabel "九十二億円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "九十二億円" := by native_decide
example : isShortLabel "九州海運局長" = true := by native_decide
example : isShortLabel "九州海運局長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "九州海運局長" := by native_decide
example : isShortLabel "九州運輸局長" = true := by native_decide
example : isShortLabel "九州運輸局長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "九州運輸局長" := by native_decide
example : isShortLabel "九年" = true := by native_decide
example : isShortLabel "九年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "九年" := by native_decide
example : isShortLabel "九年以内" = true := by native_decide
example : isShortLabel "九年以内" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "九年以内" := by native_decide
example : isShortLabel "九月" = true := by native_decide
example : isShortLabel "九月" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "九月" := by native_decide
example : isShortLabel "九月三十日" = true := by native_decide
example : isShortLabel "九月三十日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "九月三十日" := by native_decide
example : isShortLabel "九月中" = true := by native_decide
example : isShortLabel "九月中" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "九月中" := by native_decide
example : isShortLabel "九百リットル" = true := by native_decide
example : isShortLabel "九百リットル" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "九百リットル" := by native_decide
example : isShortLabel "予定利率" = true := by native_decide
example : isShortLabel "予定利率" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "予定利率" := by native_decide
example : isShortLabel "予定昇給率" = true := by native_decide
example : isShortLabel "予定昇給率" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "予定昇給率" := by native_decide
example : isShortLabel "予定死亡率" = true := by native_decide
example : isShortLabel "予定死亡率" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "予定死亡率" := by native_decide
example : isShortLabel "予定申告法人" = true := by native_decide
example : isShortLabel "予定申告法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "予定申告法人" := by native_decide
example : isShortLabel "予定納税額" = true := by native_decide
example : isShortLabel "予定納税額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "予定納税額" := by native_decide
example : isShortLabel "事務所" = true := by native_decide
example : isShortLabel "事務所" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "事務所" := by native_decide
example : isShortLabel "事務服" = true := by native_decide
example : isShortLabel "事務服" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "事務服" := by native_decide
example : isShortLabel "事実が" = true := by native_decide
example : isShortLabel "事実が" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "事実が" := by native_decide
example : isShortLabel "事後設立法人" = true := by native_decide
example : isShortLabel "事後設立法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "事後設立法人" := by native_decide
example : isShortLabel "事案の概要" = true := by native_decide
example : isShortLabel "事案の概要" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "事案の概要" := by native_decide
example : isShortLabel "事案の要旨" = true := by native_decide
example : isShortLabel "事案の要旨" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "事案の要旨" := by native_decide
example : isShortLabel "事業" = true := by native_decide
example : isShortLabel "事業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "事業" := by native_decide
example : isShortLabel "事業の概要" = true := by native_decide
example : isShortLabel "事業の概要" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "事業の概要" := by native_decide
example : isShortLabel "事業修習者" = true := by native_decide
example : isShortLabel "事業修習者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "事業修習者" := by native_decide
example : isShortLabel "事業所" = true := by native_decide
example : isShortLabel "事業所" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "事業所" := by native_decide
example : isShortLabel "事業所得又は" = true := by native_decide
example : isShortLabel "事業所得又は" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "事業所得又は" := by native_decide
example : isShortLabel "事業所用家屋" = true := by native_decide
example : isShortLabel "事業所用家屋" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "事業所用家屋" := by native_decide
example : isShortLabel "事業所税" = true := by native_decide
example : isShortLabel "事業所税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "事業所税" := by native_decide
example : isShortLabel "事業所等の数" = true := by native_decide
example : isShortLabel "事業所等の数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "事業所等の数" := by native_decide
example : isShortLabel "事業税の額" = true := by native_decide
example : isShortLabel "事業税の額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "事業税の額" := by native_decide
example : isShortLabel "事業者" = true := by native_decide
example : isShortLabel "事業者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "事業者" := by native_decide
example : isShortLabel "事業規模" = true := by native_decide
example : isShortLabel "事業規模" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "事業規模" := by native_decide
example : isShortLabel "事業費補正" = true := by native_decide
example : isShortLabel "事業費補正" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "事業費補正" := by native_decide
example : isShortLabel "事項" = true := by native_decide
example : isShortLabel "事項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "事項" := by native_decide
example : isShortLabel "事項を" = true := by native_decide
example : isShortLabel "事項を" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "事項を" := by native_decide
example : isShortLabel "二" = true := by native_decide
example : isShortLabel "二" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二" := by native_decide
example : isShortLabel "二　下水道費" = true := by native_decide
example : isShortLabel "二　下水道費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二　下水道費" := by native_decide
example : isShortLabel "二　中学校費" = true := by native_decide
example : isShortLabel "二　中学校費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二　中学校費" := by native_decide
example : isShortLabel "二　事業税" = true := by native_decide
example : isShortLabel "二　事業税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二　事業税" := by native_decide
example : isShortLabel "二　保税工場" = true := by native_decide
example : isShortLabel "二　保税工場" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二　保税工場" := by native_decide
example : isShortLabel "二　単体飼料" = true := by native_decide
example : isShortLabel "二　単体飼料" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二　単体飼料" := by native_decide
example : isShortLabel "二　土木費" = true := by native_decide
example : isShortLabel "二　土木費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二　土木費" := by native_decide
example : isShortLabel "二　旧電気税" = true := by native_decide
example : isShortLabel "二　旧電気税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二　旧電気税" := by native_decide
example : isShortLabel "二　河川費" = true := by native_decide
example : isShortLabel "二　河川費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二　河川費" := by native_decide
example : isShortLabel "二　港湾費" = true := by native_decide
example : isShortLabel "二　港湾費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二　港湾費" := by native_decide
example : isShortLabel "二、七〇〇" = true := by native_decide
example : isShortLabel "二、七〇〇" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二、七〇〇" := by native_decide
example : isShortLabel "二、七七五" = true := by native_decide
example : isShortLabel "二、七七五" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二、七七五" := by native_decide
example : isShortLabel "二、三二五" = true := by native_decide
example : isShortLabel "二、三二五" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二、三二五" := by native_decide
example : isShortLabel "二、九二五" = true := by native_decide
example : isShortLabel "二、九二五" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二、九二五" := by native_decide
example : isShortLabel "二、二五〇" = true := by native_decide
example : isShortLabel "二、二五〇" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二、二五〇" := by native_decide
example : isShortLabel "二、八〇〇円" = true := by native_decide
example : isShortLabel "二、八〇〇円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二、八〇〇円" := by native_decide
example : isShortLabel "二、八五〇" = true := by native_decide
example : isShortLabel "二、八五〇" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二、八五〇" := by native_decide
example : isShortLabel "二、六二五" = true := by native_decide
example : isShortLabel "二、六二五" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二、六二五" := by native_decide
example : isShortLabel "二〇〇点" = true := by native_decide
example : isShortLabel "二〇〇点" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二〇〇点" := by native_decide
example : isShortLabel "二〇世帯" = true := by native_decide
example : isShortLabel "二〇世帯" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二〇世帯" := by native_decide
example : isShortLabel "二〇％" = true := by native_decide
example : isShortLabel "二〇％" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二〇％" := by native_decide
example : isShortLabel "二オンス" = true := by native_decide
example : isShortLabel "二オンス" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二オンス" := by native_decide
example : isShortLabel "二グラム" = true := by native_decide
example : isShortLabel "二グラム" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二グラム" := by native_decide
example : isShortLabel "二・五％" = true := by native_decide
example : isShortLabel "二・五％" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二・五％" := by native_decide
example : isShortLabel "二一〇点" = true := by native_decide
example : isShortLabel "二一〇点" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二一〇点" := by native_decide
example : isShortLabel "二九九" = true := by native_decide
example : isShortLabel "二九九" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二九九" := by native_decide
example : isShortLabel "二二〇点" = true := by native_decide
example : isShortLabel "二二〇点" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二二〇点" := by native_decide
example : isShortLabel "二五点" = true := by native_decide
example : isShortLabel "二五点" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二五点" := by native_decide
example : isShortLabel "二人" = true := by native_decide
example : isShortLabel "二人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二人" := by native_decide
example : isShortLabel "二分の三" = true := by native_decide
example : isShortLabel "二分の三" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二分の三" := by native_decide
example : isShortLabel "二分の九" = true := by native_decide
example : isShortLabel "二分の九" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二分の九" := by native_decide
example : isShortLabel "二十一分の十" = true := by native_decide
example : isShortLabel "二十一分の十" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二十一分の十" := by native_decide
example : isShortLabel "二十三年" = true := by native_decide
example : isShortLabel "二十三年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二十三年" := by native_decide
example : isShortLabel "二十二分の十" = true := by native_decide
example : isShortLabel "二十二分の十" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二十二分の十" := by native_decide
example : isShortLabel "二十五分の三" = true := by native_decide
example : isShortLabel "二十五分の三" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二十五分の三" := by native_decide
example : isShortLabel "二十億円で" = true := by native_decide
example : isShortLabel "二十億円で" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二十億円で" := by native_decide
example : isShortLabel "二十八年" = true := by native_decide
example : isShortLabel "二十八年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二十八年" := by native_decide
example : isShortLabel "二十分の一" = true := by native_decide
example : isShortLabel "二十分の一" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二十分の一" := by native_decide
example : isShortLabel "二十分の三" = true := by native_decide
example : isShortLabel "二十分の三" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二十分の三" := by native_decide
example : isShortLabel "二十分の十七" = true := by native_decide
example : isShortLabel "二十分の十七" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二十分の十七" := by native_decide
example : isShortLabel "二十四月" = true := by native_decide
example : isShortLabel "二十四月" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二十四月" := by native_decide
example : isShortLabel "二十年" = true := by native_decide
example : isShortLabel "二十年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二十年" := by native_decide
example : isShortLabel "二年" = true := by native_decide
example : isShortLabel "二年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二年" := by native_decide
example : isShortLabel "二月" = true := by native_decide
example : isShortLabel "二月" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二月" := by native_decide
example : isShortLabel "二月以内" = true := by native_decide
example : isShortLabel "二月以内" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二月以内" := by native_decide
example : isShortLabel "二点" = true := by native_decide
example : isShortLabel "二点" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二点" := by native_decide
example : isShortLabel "二百万円未満" = true := by native_decide
example : isShortLabel "二百万円未満" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二百万円未満" := by native_decide
example : isShortLabel "二百五十億円" = true := by native_decide
example : isShortLabel "二百五十億円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二百五十億円" := by native_decide
example : isShortLabel "二百億円" = true := by native_decide
example : isShortLabel "二百億円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二百億円" := by native_decide
example : isShortLabel "二級" = true := by native_decide
example : isShortLabel "二級" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二級" := by native_decide
example : isShortLabel "二級地" = true := by native_decide
example : isShortLabel "二級地" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二級地" := by native_decide
example : isShortLabel "二輪のもの" = true := by native_decide
example : isShortLabel "二輪のもの" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "二輪のもの" := by native_decide
example : isShortLabel "互助年金信託" = true := by native_decide
example : isShortLabel "互助年金信託" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "互助年金信託" := by native_decide
example : isShortLabel "五" = true := by native_decide
example : isShortLabel "五" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "五" := by native_decide
example : isShortLabel "五　下水道費" = true := by native_decide
example : isShortLabel "五　下水道費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "五　下水道費" := by native_decide
example : isShortLabel "五　中学校費" = true := by native_decide
example : isShortLabel "五　中学校費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "五　中学校費" := by native_decide
example : isShortLabel "五　公園費" = true := by native_decide
example : isShortLabel "五　公園費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "五　公園費" := by native_decide
example : isShortLabel "五　塔及び" = true := by native_decide
example : isShortLabel "五　塔及び" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "五　塔及び" := by native_decide
example : isShortLabel "五　鉱産税" = true := by native_decide
example : isShortLabel "五　鉱産税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "五　鉱産税" := by native_decide
example : isShortLabel "五、一七五" = true := by native_decide
example : isShortLabel "五、一七五" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "五、一七五" := by native_decide
example : isShortLabel "五、二〇〇円" = true := by native_decide
example : isShortLabel "五、二〇〇円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "五、二〇〇円" := by native_decide
example : isShortLabel "五、四〇〇" = true := by native_decide
example : isShortLabel "五、四〇〇" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "五、四〇〇" := by native_decide
example : isShortLabel "五〇〇点" = true := by native_decide
example : isShortLabel "五〇〇点" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "五〇〇点" := by native_decide
example : isShortLabel "五〇世帯" = true := by native_decide
example : isShortLabel "五〇世帯" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "五〇世帯" := by native_decide
example : isShortLabel "五三〇点" = true := by native_decide
example : isShortLabel "五三〇点" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "五三〇点" := by native_decide
example : isShortLabel "五億円" = true := by native_decide
example : isShortLabel "五億円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "五億円" := by native_decide
example : isShortLabel "五分の一" = true := by native_decide
example : isShortLabel "五分の一" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "五分の一" := by native_decide
example : isShortLabel "五分の三" = true := by native_decide
example : isShortLabel "五分の三" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "五分の三" := by native_decide
example : isShortLabel "五分の四" = true := by native_decide
example : isShortLabel "五分の四" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "五分の四" := by native_decide
example : isShortLabel "五年" = true := by native_decide
example : isShortLabel "五年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "五年" := by native_decide
example : isShortLabel "五月" = true := by native_decide
example : isShortLabel "五月" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "五月" := by native_decide
example : isShortLabel "五月三十一日" = true := by native_decide
example : isShortLabel "五月三十一日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "五月三十一日" := by native_decide
example : isShortLabel "五点" = true := by native_decide
example : isShortLabel "五点" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "五点" := by native_decide
example : isShortLabel "五百億円" = true := by native_decide
example : isShortLabel "五百億円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "五百億円" := by native_decide
example : isShortLabel "五％" = true := by native_decide
example : isShortLabel "五％" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "五％" := by native_decide
example : isShortLabel "交付した" = true := by native_decide
example : isShortLabel "交付した" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "交付した" := by native_decide
example : isShortLabel "交付時期" = true := by native_decide
example : isShortLabel "交付時期" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "交付時期" := by native_decide
example : isShortLabel "交付月" = true := by native_decide
example : isShortLabel "交付月" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "交付月" := by native_decide
example : isShortLabel "交付要求" = true := by native_decide
example : isShortLabel "交付要求" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "交付要求" := by native_decide
example : isShortLabel "交換取得資産" = true := by native_decide
example : isShortLabel "交換取得資産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "交換取得資産" := by native_decide
example : isShortLabel "人数" = true := by native_decide
example : isShortLabel "人数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "人数" := by native_decide
example : isShortLabel "仏像、位" = true := by native_decide
example : isShortLabel "仏像、位" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "仏像、位" := by native_decide
example : isShortLabel "他の信託" = true := by native_decide
example : isShortLabel "他の信託" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "他の信託" := by native_decide
example : isShortLabel "他の法人" = true := by native_decide
example : isShortLabel "他の法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "他の法人" := by native_decide
example : isShortLabel "他の準組合" = true := by native_decide
example : isShortLabel "他の準組合" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "他の準組合" := by native_decide
example : isShortLabel "他の組合" = true := by native_decide
example : isShortLabel "他の組合" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "他の組合" := by native_decide
example : isShortLabel "他の者" = true := by native_decide
example : isShortLabel "他の者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "他の者" := by native_decide
example : isShortLabel "他人" = true := by native_decide
example : isShortLabel "他人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "他人" := by native_decide
example : isShortLabel "付加価値割" = true := by native_decide
example : isShortLabel "付加価値割" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "付加価値割" := by native_decide
example : isShortLabel "仙台陸運局長" = true := by native_decide
example : isShortLabel "仙台陸運局長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "仙台陸運局長" := by native_decide
example : isShortLabel "代替住宅等" = true := by native_decide
example : isShortLabel "代替住宅等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "代替住宅等" := by native_decide
example : isShortLabel "代替資産" = true := by native_decide
example : isShortLabel "代替資産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "代替資産" := by native_decide
example : isShortLabel "代理人の選任" = true := by native_decide
example : isShortLabel "代理人の選任" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "代理人の選任" := by native_decide
example : isShortLabel "代理業" = true := by native_decide
example : isShortLabel "代理業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "代理業" := by native_decide
example : isShortLabel "代理親会社等" = true := by native_decide
example : isShortLabel "代理親会社等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "代理親会社等" := by native_decide
example : isShortLabel "以前" = true := by native_decide
example : isShortLabel "以前" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "以前" := by native_decide
example : isShortLabel "以外の所得税" = true := by native_decide
example : isShortLabel "以外の所得税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "以外の所得税" := by native_decide
example : isShortLabel "以後" = true := by native_decide
example : isShortLabel "以後" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "以後" := by native_decide
example : isShortLabel "以後の" = true := by native_decide
example : isShortLabel "以後の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "以後の" := by native_decide
example : isShortLabel "仲立業" = true := by native_decide
example : isShortLabel "仲立業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "仲立業" := by native_decide
example : isShortLabel "任意提供" = true := by native_decide
example : isShortLabel "任意提供" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "任意提供" := by native_decide
example : isShortLabel "任意提供に" = true := by native_decide
example : isShortLabel "任意提供に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "任意提供に" := by native_decide
example : isShortLabel "任意提供の日" = true := by native_decide
example : isShortLabel "任意提供の日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "任意提供の日" := by native_decide
example : isShortLabel "任意提供を" = true := by native_decide
example : isShortLabel "任意提供を" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "任意提供を" := by native_decide
example : isShortLabel "企業グループ" = true := by native_decide
example : isShortLabel "企業グループ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "企業グループ" := by native_decide
example : isShortLabel "休養施設" = true := by native_decide
example : isShortLabel "休養施設" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "休養施設" := by native_decide
example : isShortLabel "会社の分割" = true := by native_decide
example : isShortLabel "会社の分割" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "会社の分割" := by native_decide
example : isShortLabel "会社等" = true := by native_decide
example : isShortLabel "会社等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "会社等" := by native_decide
example : isShortLabel "会計年度" = true := by native_decide
example : isShortLabel "会計年度" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "会計年度" := by native_decide
example : isShortLabel "会計監査論" = true := by native_decide
example : isShortLabel "会計監査論" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "会計監査論" := by native_decide
example : isShortLabel "会議場施設" = true := by native_decide
example : isShortLabel "会議場施設" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "会議場施設" := by native_decide
example : isShortLabel "住宅" = true := by native_decide
example : isShortLabel "住宅" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "住宅" := by native_decide
example : isShortLabel "住宅借入金等" = true := by native_decide
example : isShortLabel "住宅借入金等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "住宅借入金等" := by native_decide
example : isShortLabel "住宅取得" = true := by native_decide
example : isShortLabel "住宅取得" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "住宅取得" := by native_decide
example : isShortLabel "住宅用地" = true := by native_decide
example : isShortLabel "住宅用地" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "住宅用地" := by native_decide
example : isShortLabel "住宅用地等" = true := by native_decide
example : isShortLabel "住宅用地等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "住宅用地等" := by native_decide
example : isShortLabel "住宅用家屋" = true := by native_decide
example : isShortLabel "住宅用家屋" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "住宅用家屋" := by native_decide
example : isShortLabel "住民基本台帳" = true := by native_decide
example : isShortLabel "住民基本台帳" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "住民基本台帳" := by native_decide
example : isShortLabel "体育館" = true := by native_decide
example : isShortLabel "体育館" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "体育館" := by native_decide
example : isShortLabel "作成年月日" = true := by native_decide
example : isShortLabel "作成年月日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "作成年月日" := by native_decide
example : isShortLabel "作業服" = true := by native_decide
example : isShortLabel "作業服" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "作業服" := by native_decide
example : isShortLabel "使用予定期間" = true := by native_decide
example : isShortLabel "使用予定期間" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "使用予定期間" := by native_decide
example : isShortLabel "使用料の" = true := by native_decide
example : isShortLabel "使用料の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "使用料の" := by native_decide
example : isShortLabel "供託書の正本" = true := by native_decide
example : isShortLabel "供託書の正本" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "供託書の正本" := by native_decide
example : isShortLabel "依頼書又は" = true := by native_decide
example : isShortLabel "依頼書又は" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "依頼書又は" := by native_decide
example : isShortLabel "価額" = true := by native_decide
example : isShortLabel "価額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "価額" := by native_decide
example : isShortLabel "価額）" = true := by native_decide
example : isShortLabel "価額）" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "価額）" := by native_decide
example : isShortLabel "係る」と" = true := by native_decide
example : isShortLabel "係る」と" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "係る」と" := by native_decide
example : isShortLabel "係る令" = true := by native_decide
example : isShortLabel "係る令" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "係る令" := by native_decide
example : isShortLabel "係る受贈者" = true := by native_decide
example : isShortLabel "係る受贈者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "係る受贈者" := by native_decide
example : isShortLabel "係る地方税法" = true := by native_decide
example : isShortLabel "係る地方税法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "係る地方税法" := by native_decide
example : isShortLabel "係る外国" = true := by native_decide
example : isShortLabel "係る外国" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "係る外国" := by native_decide
example : isShortLabel "係る法" = true := by native_decide
example : isShortLabel "係る法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "係る法" := by native_decide
example : isShortLabel "係る法人税" = true := by native_decide
example : isShortLabel "係る法人税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "係る法人税" := by native_decide
example : isShortLabel "係る法人税法" = true := by native_decide
example : isShortLabel "係る法人税法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "係る法人税法" := by native_decide
example : isShortLabel "係る石油税" = true := by native_decide
example : isShortLabel "係る石油税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "係る石油税" := by native_decide
example : isShortLabel "係る第一項" = true := by native_decide
example : isShortLabel "係る第一項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "係る第一項" := by native_decide
example : isShortLabel "係る還付金等" = true := by native_decide
example : isShortLabel "係る還付金等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "係る還付金等" := by native_decide
example : isShortLabel "係る配当等" = true := by native_decide
example : isShortLabel "係る配当等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "係る配当等" := by native_decide
example : isShortLabel "保健衛生費" = true := by native_decide
example : isShortLabel "保健衛生費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "保健衛生費" := by native_decide
example : isShortLabel "保存義務者" = true := by native_decide
example : isShortLabel "保存義務者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "保存義務者" := by native_decide
example : isShortLabel "保安通信設備" = true := by native_decide
example : isShortLabel "保安通信設備" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "保安通信設備" := by native_decide
example : isShortLabel "保税地域" = true := by native_decide
example : isShortLabel "保税地域" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "保税地域" := by native_decide
example : isShortLabel "保税展示場" = true := by native_decide
example : isShortLabel "保税展示場" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "保税展示場" := by native_decide
example : isShortLabel "保税工場" = true := by native_decide
example : isShortLabel "保税工場" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "保税工場" := by native_decide
example : isShortLabel "保税蔵置場" = true := by native_decide
example : isShortLabel "保税蔵置場" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "保税蔵置場" := by native_decide
example : isShortLabel "保育所" = true := by native_decide
example : isShortLabel "保育所" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "保育所" := by native_decide
example : isShortLabel "保育機能施設" = true := by native_decide
example : isShortLabel "保育機能施設" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "保育機能施設" := by native_decide
example : isShortLabel "保証団体" = true := by native_decide
example : isShortLabel "保証団体" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "保証団体" := by native_decide
example : isShortLabel "保証期間" = true := by native_decide
example : isShortLabel "保証期間" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "保証期間" := by native_decide
example : isShortLabel "保険" = true := by native_decide
example : isShortLabel "保険" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "保険" := by native_decide
example : isShortLabel "保険会社" = true := by native_decide
example : isShortLabel "保険会社" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "保険会社" := by native_decide
example : isShortLabel "保険会社等" = true := by native_decide
example : isShortLabel "保険会社等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "保険会社等" := by native_decide
example : isShortLabel "保険業" = true := by native_decide
example : isShortLabel "保険業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "保険業" := by native_decide
example : isShortLabel "保険業法" = true := by native_decide
example : isShortLabel "保険業法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "保険業法" := by native_decide
example : isShortLabel "保険金" = true := by native_decide
example : isShortLabel "保険金" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "保険金" := by native_decide
example : isShortLabel "信号保安設備" = true := by native_decide
example : isShortLabel "信号保安設備" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "信号保安設備" := by native_decide
example : isShortLabel "信用保証協会" = true := by native_decide
example : isShortLabel "信用保証協会" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "信用保証協会" := by native_decide
example : isShortLabel "信用協同組合" = true := by native_decide
example : isShortLabel "信用協同組合" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "信用協同組合" := by native_decide
example : isShortLabel "信用金庫" = true := by native_decide
example : isShortLabel "信用金庫" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "信用金庫" := by native_decide
example : isShortLabel "信託" = true := by native_decide
example : isShortLabel "信託" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "信託" := by native_decide
example : isShortLabel "信託の業務" = true := by native_decide
example : isShortLabel "信託の業務" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "信託の業務" := by native_decide
example : isShortLabel "信託会社" = true := by native_decide
example : isShortLabel "信託会社" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "信託会社" := by native_decide
example : isShortLabel "信託契約" = true := by native_decide
example : isShortLabel "信託契約" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "信託契約" := by native_decide
example : isShortLabel "信託業" = true := by native_decide
example : isShortLabel "信託業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "信託業" := by native_decide
example : isShortLabel "信託（" = true := by native_decide
example : isShortLabel "信託（" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "信託（" := by native_decide
example : isShortLabel "修正帳簿価額" = true := by native_decide
example : isShortLabel "修正帳簿価額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "修正帳簿価額" := by native_decide
example : isShortLabel "修正申告書" = true := by native_decide
example : isShortLabel "修正申告書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "修正申告書" := by native_decide
example : isShortLabel "修正申告書に" = true := by native_decide
example : isShortLabel "修正申告書に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "修正申告書に" := by native_decide
example : isShortLabel "修正申告書を" = true := by native_decide
example : isShortLabel "修正申告書を" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "修正申告書を" := by native_decide
example : isShortLabel "倉庫" = true := by native_decide
example : isShortLabel "倉庫" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "倉庫" := by native_decide
example : isShortLabel "倉庫の用" = true := by native_decide
example : isShortLabel "倉庫の用" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "倉庫の用" := by native_decide
example : isShortLabel "倉庫業" = true := by native_decide
example : isShortLabel "倉庫業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "倉庫業" := by native_decide
example : isShortLabel "倉庫用の建物" = true := by native_decide
example : isShortLabel "倉庫用の建物" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "倉庫用の建物" := by native_decide
example : isShortLabel "個人" = true := by native_decide
example : isShortLabel "個人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "個人" := by native_decide
example : isShortLabel "個人につき" = true := by native_decide
example : isShortLabel "個人につき" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "個人につき" := by native_decide
example : isShortLabel "個人事業税" = true := by native_decide
example : isShortLabel "個人事業税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "個人事業税" := by native_decide
example : isShortLabel "個人事業者" = true := by native_decide
example : isShortLabel "個人事業者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "個人事業者" := by native_decide
example : isShortLabel "個人番号" = true := by native_decide
example : isShortLabel "個人番号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "個人番号" := by native_decide
example : isShortLabel "個別財務諸表" = true := by native_decide
example : isShortLabel "個別財務諸表" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "個別財務諸表" := by native_decide
example : isShortLabel "借地権" = true := by native_decide
example : isShortLabel "借地権" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "借地権" := by native_decide
example : isShortLabel "借地権等" = true := by native_decide
example : isShortLabel "借地権等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "借地権等" := by native_decide
example : isShortLabel "借船料の額" = true := by native_decide
example : isShortLabel "借船料の額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "借船料の額" := by native_decide
example : isShortLabel "健康相談所" = true := by native_decide
example : isShortLabel "健康相談所" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "健康相談所" := by native_decide
example : isShortLabel "傭" = true := by native_decide
example : isShortLabel "傭" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "傭" := by native_decide
example : isShortLabel "債務免除等" = true := by native_decide
example : isShortLabel "債務免除等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "債務免除等" := by native_decide
example : isShortLabel "債務処理計画" = true := by native_decide
example : isShortLabel "債務処理計画" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "債務処理計画" := by native_decide
example : isShortLabel "償却保証額" = true := by native_decide
example : isShortLabel "償却保証額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "償却保証額" := by native_decide
example : isShortLabel "償却資産" = true := by native_decide
example : isShortLabel "償却資産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "償却資産" := by native_decide
example : isShortLabel "償還金" = true := by native_decide
example : isShortLabel "償還金" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "償還金" := by native_decide
example : isShortLabel "元売業者" = true := by native_decide
example : isShortLabel "元売業者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "元売業者" := by native_decide
example : isShortLabel "充当" = true := by native_decide
example : isShortLabel "充当" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "充当" := by native_decide
example : isShortLabel "児童数" = true := by native_decide
example : isShortLabel "児童数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "児童数" := by native_decide
example : isShortLabel "入港届" = true := by native_decide
example : isShortLabel "入港届" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "入港届" := by native_decide
example : isShortLabel "入湯税" = true := by native_decide
example : isShortLabel "入湯税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "入湯税" := by native_decide
example : isShortLabel "全ての取引" = true := by native_decide
example : isShortLabel "全ての取引" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "全ての取引" := by native_decide
example : isShortLabel "全ての所得" = true := by native_decide
example : isShortLabel "全ての所得" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "全ての所得" := by native_decide
example : isShortLabel "全国連合会" = true := by native_decide
example : isShortLabel "全国連合会" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "全国連合会" := by native_decide
example : isShortLabel "全額" = true := by native_decide
example : isShortLabel "全額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "全額" := by native_decide
example : isShortLabel "八" = true := by native_decide
example : isShortLabel "八" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "八" := by native_decide
example : isShortLabel "八　ダスト貯" = true := by native_decide
example : isShortLabel "八　ダスト貯" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "八　ダスト貯" := by native_decide
example : isShortLabel "八　中学校費" = true := by native_decide
example : isShortLabel "八　中学校費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "八　中学校費" := by native_decide
example : isShortLabel "八　小学校費" = true := by native_decide
example : isShortLabel "八　小学校費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "八　小学校費" := by native_decide
example : isShortLabel "八　激" = true := by native_decide
example : isShortLabel "八　激" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "八　激" := by native_decide
example : isShortLabel "八　自動車税" = true := by native_decide
example : isShortLabel "八　自動車税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "八　自動車税" := by native_decide
example : isShortLabel "八、一〇〇" = true := by native_decide
example : isShortLabel "八、一〇〇" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "八、一〇〇" := by native_decide
example : isShortLabel "八〇点" = true := by native_decide
example : isShortLabel "八〇点" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "八〇点" := by native_decide
example : isShortLabel "八十九人" = true := by native_decide
example : isShortLabel "八十九人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "八十九人" := by native_decide
example : isShortLabel "八十九億円" = true := by native_decide
example : isShortLabel "八十九億円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "八十九億円" := by native_decide
example : isShortLabel "八十五分の五" = true := by native_decide
example : isShortLabel "八十五分の五" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "八十五分の五" := by native_decide
example : isShortLabel "八十分の十" = true := by native_decide
example : isShortLabel "八十分の十" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "八十分の十" := by native_decide
example : isShortLabel "八月" = true := by native_decide
example : isShortLabel "八月" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "八月" := by native_decide
example : isShortLabel "公共法人" = true := by native_decide
example : isShortLabel "公共法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "公共法人" := by native_decide
example : isShortLabel "公告の方法" = true := by native_decide
example : isShortLabel "公告の方法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "公告の方法" := by native_decide
example : isShortLabel "公売の方法" = true := by native_decide
example : isShortLabel "公売の方法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "公売の方法" := by native_decide
example : isShortLabel "公布の" = true := by native_decide
example : isShortLabel "公布の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "公布の" := by native_decide
example : isShortLabel "公布の日前" = true := by native_decide
example : isShortLabel "公布の日前" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "公布の日前" := by native_decide
example : isShortLabel "公布の日（" = true := by native_decide
example : isShortLabel "公布の日（" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "公布の日（" := by native_decide
example : isShortLabel "公正証書" = true := by native_decide
example : isShortLabel "公正証書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "公正証書" := by native_decide
example : isShortLabel "公的年金等" = true := by native_decide
example : isShortLabel "公的年金等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "公的年金等" := by native_decide
example : isShortLabel "公益信託等" = true := by native_decide
example : isShortLabel "公益信託等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "公益信託等" := by native_decide
example : isShortLabel "公益法人等" = true := by native_decide
example : isShortLabel "公益法人等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "公益法人等" := by native_decide
example : isShortLabel "公益法人等が" = true := by native_decide
example : isShortLabel "公益法人等が" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "公益法人等が" := by native_decide
example : isShortLabel "公益法人等と" = true := by native_decide
example : isShortLabel "公益法人等と" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "公益法人等と" := by native_decide
example : isShortLabel "公益法人等の" = true := by native_decide
example : isShortLabel "公益法人等の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "公益法人等の" := by native_decide
example : isShortLabel "公社債" = true := by native_decide
example : isShortLabel "公社債" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "公社債" := by native_decide
example : isShortLabel "公立大学法人" = true := by native_decide
example : isShortLabel "公立大学法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "公立大学法人" := by native_decide
example : isShortLabel "公衆便所" = true := by native_decide
example : isShortLabel "公衆便所" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "公衆便所" := by native_decide
example : isShortLabel "公証人業" = true := by native_decide
example : isShortLabel "公証人業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "公証人業" := by native_decide
example : isShortLabel "公認会計士業" = true := by native_decide
example : isShortLabel "公認会計士業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "公認会計士業" := by native_decide
example : isShortLabel "公課" = true := by native_decide
example : isShortLabel "公課" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "公課" := by native_decide
example : isShortLabel "六" = true := by native_decide
example : isShortLabel "六" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "六" := by native_decide
example : isShortLabel "六　リジン" = true := by native_decide
example : isShortLabel "六　リジン" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "六　リジン" := by native_decide
example : isShortLabel "六　下水道費" = true := by native_decide
example : isShortLabel "六　下水道費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "六　下水道費" := by native_decide
example : isShortLabel "六　事業所税" = true := by native_decide
example : isShortLabel "六　事業所税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "六　事業所税" := by native_decide
example : isShortLabel "六　総務費" = true := by native_decide
example : isShortLabel "六　総務費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "六　総務費" := by native_decide
example : isShortLabel "六〇点" = true := by native_decide
example : isShortLabel "六〇点" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "六〇点" := by native_decide
example : isShortLabel "六八〇点" = true := by native_decide
example : isShortLabel "六八〇点" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "六八〇点" := by native_decide
example : isShortLabel "六分の五" = true := by native_decide
example : isShortLabel "六分の五" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "六分の五" := by native_decide
example : isShortLabel "六年" = true := by native_decide
example : isShortLabel "六年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "六年" := by native_decide
example : isShortLabel "六月" = true := by native_decide
example : isShortLabel "六月" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "六月" := by native_decide
example : isShortLabel "六月」" = true := by native_decide
example : isShortLabel "六月」" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "六月」" := by native_decide
example : isShortLabel "六月中" = true := by native_decide
example : isShortLabel "六月中" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "六月中" := by native_decide
example : isShortLabel "六月以内" = true := by native_decide
example : isShortLabel "六月以内" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "六月以内" := by native_decide
example : isShortLabel "六月経過日" = true := by native_decide
example : isShortLabel "六月経過日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "六月経過日" := by native_decide
example : isShortLabel "共助対象者" = true := by native_decide
example : isShortLabel "共助対象者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "共助対象者" := by native_decide
example : isShortLabel "共同住宅等" = true := by native_decide
example : isShortLabel "共同住宅等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "共同住宅等" := by native_decide
example : isShortLabel "共同施設税" = true := by native_decide
example : isShortLabel "共同施設税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "共同施設税" := by native_decide
example : isShortLabel "内の預入等" = true := by native_decide
example : isShortLabel "内の預入等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "内の預入等" := by native_decide
example : isShortLabel "内国法人" = true := by native_decide
example : isShortLabel "内国法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "内国法人" := by native_decide
example : isShortLabel "内国法人から" = true := by native_decide
example : isShortLabel "内国法人から" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "内国法人から" := by native_decide
example : isShortLabel "内国法人が" = true := by native_decide
example : isShortLabel "内国法人が" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "内国法人が" := by native_decide
example : isShortLabel "内容" = true := by native_decide
example : isShortLabel "内容" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "内容" := by native_decide
example : isShortLabel "内閣総理大臣" = true := by native_decide
example : isShortLabel "内閣総理大臣" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "内閣総理大臣" := by native_decide
example : isShortLabel "円滑化法認定" = true := by native_decide
example : isShortLabel "円滑化法認定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "円滑化法認定" := by native_decide
example : isShortLabel "再生計画" = true := by native_decide
example : isShortLabel "再生計画" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "再生計画" := by native_decide
example : isShortLabel "写真" = true := by native_decide
example : isShortLabel "写真" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "写真" := by native_decide
example : isShortLabel "写真業" = true := by native_decide
example : isShortLabel "写真業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "写真業" := by native_decide
example : isShortLabel "冠婚葬祭業" = true := by native_decide
example : isShortLabel "冠婚葬祭業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "冠婚葬祭業" := by native_decide
example : isShortLabel "冷却装置" = true := by native_decide
example : isShortLabel "冷却装置" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "冷却装置" := by native_decide
example : isShortLabel "冷房装置" = true := by native_decide
example : isShortLabel "冷房装置" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "冷房装置" := by native_decide
example : isShortLabel "凝" = true := by native_decide
example : isShortLabel "凝" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "凝" := by native_decide
example : isShortLabel "凝縮器" = true := by native_decide
example : isShortLabel "凝縮器" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "凝縮器" := by native_decide
example : isShortLabel "出国" = true := by native_decide
example : isShortLabel "出国" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "出国" := by native_decide
example : isShortLabel "出版業" = true := by native_decide
example : isShortLabel "出版業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "出版業" := by native_decide
example : isShortLabel "出資の受入れ" = true := by native_decide
example : isShortLabel "出資の受入れ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "出資の受入れ" := by native_decide
example : isShortLabel "出資金" = true := by native_decide
example : isShortLabel "出資金" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "出資金" := by native_decide
example : isShortLabel "分し、当該" = true := by native_decide
example : isShortLabel "分し、当該" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "分し、当該" := by native_decide
example : isShortLabel "分する。" = true := by native_decide
example : isShortLabel "分する。" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "分する。" := by native_decide
example : isShortLabel "分割型分割" = true := by native_decide
example : isShortLabel "分割型分割" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "分割型分割" := by native_decide
example : isShortLabel "分割後資産" = true := by native_decide
example : isShortLabel "分割後資産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "分割後資産" := by native_decide
example : isShortLabel "分割承継法人" = true := by native_decide
example : isShortLabel "分割承継法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "分割承継法人" := by native_decide
example : isShortLabel "分割法人" = true := by native_decide
example : isShortLabel "分割法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "分割法人" := by native_decide
example : isShortLabel "分割法人等" = true := by native_decide
example : isShortLabel "分割法人等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "分割法人等" := by native_decide
example : isShortLabel "分収育林契約" = true := by native_decide
example : isShortLabel "分収育林契約" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "分収育林契約" := by native_decide
example : isShortLabel "分収造林契約" = true := by native_decide
example : isShortLabel "分収造林契約" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "分収造林契約" := by native_decide
example : isShortLabel "分社型分割" = true := by native_decide
example : isShortLabel "分社型分割" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "分社型分割" := by native_decide
example : isShortLabel "分納期間" = true := by native_decide
example : isShortLabel "分納期間" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "分納期間" := by native_decide
example : isShortLabel "分離器" = true := by native_decide
example : isShortLabel "分離器" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "分離器" := by native_decide
example : isShortLabel "分）" = true := by native_decide
example : isShortLabel "分）" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "分）" := by native_decide
example : isShortLabel "判定期間" = true := by native_decide
example : isShortLabel "判定期間" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "判定期間" := by native_decide
example : isShortLabel "別荘" = true := by native_decide
example : isShortLabel "別荘" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "別荘" := by native_decide
example : isShortLabel "別表第七" = true := by native_decide
example : isShortLabel "別表第七" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "別表第七" := by native_decide
example : isShortLabel "別表第七の表" = true := by native_decide
example : isShortLabel "別表第七の表" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "別表第七の表" := by native_decide
example : isShortLabel "別表第二" = true := by native_decide
example : isShortLabel "別表第二" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "別表第二" := by native_decide
example : isShortLabel "別表第八" = true := by native_decide
example : isShortLabel "別表第八" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "別表第八" := by native_decide
example : isShortLabel "別表第八九号" = true := by native_decide
example : isShortLabel "別表第八九号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "別表第八九号" := by native_decide
example : isShortLabel "利子" = true := by native_decide
example : isShortLabel "利子" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "利子" := by native_decide
example : isShortLabel "利子で" = true := by native_decide
example : isShortLabel "利子で" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "利子で" := by native_decide
example : isShortLabel "利子の" = true := by native_decide
example : isShortLabel "利子の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "利子の" := by native_decide
example : isShortLabel "利用形態" = true := by native_decide
example : isShortLabel "利用形態" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "利用形態" := by native_decide
example : isShortLabel "利用者" = true := by native_decide
example : isShortLabel "利用者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "利用者" := by native_decide
example : isShortLabel "利益の配当" = true := by native_decide
example : isShortLabel "利益の配当" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "利益の配当" := by native_decide
example : isShortLabel "利益積立金額" = true := by native_decide
example : isShortLabel "利益積立金額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "利益積立金額" := by native_decide
example : isShortLabel "制服" = true := by native_decide
example : isShortLabel "制服" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "制服" := by native_decide
example : isShortLabel "制限税率" = true := by native_decide
example : isShortLabel "制限税率" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "制限税率" := by native_decide
example : isShortLabel "刻みたばこ" = true := by native_decide
example : isShortLabel "刻みたばこ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "刻みたばこ" := by native_decide
example : isShortLabel "削除／第三款" = true := by native_decide
example : isShortLabel "削除／第三款" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "削除／第三款" := by native_decide
example : isShortLabel "前三条の規定" = true := by native_decide
example : isShortLabel "前三条の規定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前三条の規定" := by native_decide
example : isShortLabel "前三項" = true := by native_decide
example : isShortLabel "前三項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前三項" := by native_decide
example : isShortLabel "前九年以内" = true := by native_decide
example : isShortLabel "前九年以内" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前九年以内" := by native_decide
example : isShortLabel "前二号" = true := by native_decide
example : isShortLabel "前二号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前二号" := by native_decide
example : isShortLabel "前二号の理由" = true := by native_decide
example : isShortLabel "前二号の理由" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前二号の理由" := by native_decide
example : isShortLabel "前二年以内" = true := by native_decide
example : isShortLabel "前二年以内" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前二年以内" := by native_decide
example : isShortLabel "前二条" = true := by native_decide
example : isShortLabel "前二条" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前二条" := by native_decide
example : isShortLabel "前二条の規定" = true := by native_decide
example : isShortLabel "前二条の規定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前二条の規定" := by native_decide
example : isShortLabel "前二項" = true := by native_decide
example : isShortLabel "前二項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前二項" := by native_decide
example : isShortLabel "前二項の帳簿" = true := by native_decide
example : isShortLabel "前二項の帳簿" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前二項の帳簿" := by native_decide
example : isShortLabel "前十年以内" = true := by native_decide
example : isShortLabel "前十年以内" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前十年以内" := by native_decide
example : isShortLabel "前号に掲げる" = true := by native_decide
example : isShortLabel "前号に掲げる" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前号に掲げる" := by native_decide
example : isShortLabel "前号の理由" = true := by native_decide
example : isShortLabel "前号の理由" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前号の理由" := by native_decide
example : isShortLabel "前号の規定" = true := by native_decide
example : isShortLabel "前号の規定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前号の規定" := by native_decide
example : isShortLabel "前各項" = true := by native_decide
example : isShortLabel "前各項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前各項" := by native_decide
example : isShortLabel "前年度三月" = true := by native_decide
example : isShortLabel "前年度三月" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前年度三月" := by native_decide
example : isShortLabel "前年度中" = true := by native_decide
example : isShortLabel "前年度中" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前年度中" := by native_decide
example : isShortLabel "前年度十月" = true := by native_decide
example : isShortLabel "前年度十月" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前年度十月" := by native_decide
example : isShortLabel "前日" = true := by native_decide
example : isShortLabel "前日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前日" := by native_decide
example : isShortLabel "前項に" = true := by native_decide
example : isShortLabel "前項に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前項に" := by native_decide
example : isShortLabel "前項の" = true := by native_decide
example : isShortLabel "前項の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前項の" := by native_decide
example : isShortLabel "前項の帳簿" = true := by native_decide
example : isShortLabel "前項の帳簿" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前項の帳簿" := by native_decide
example : isShortLabel "前項の承認" = true := by native_decide
example : isShortLabel "前項の承認" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前項の承認" := by native_decide
example : isShortLabel "前項の通知" = true := by native_decide
example : isShortLabel "前項の通知" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前項の通知" := by native_decide
example : isShortLabel "前項中" = true := by native_decide
example : isShortLabel "前項中" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前項中" := by native_decide
example : isShortLabel "前項後段" = true := by native_decide
example : isShortLabel "前項後段" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前項後段" := by native_decide
example : isShortLabel "前項第一号" = true := by native_decide
example : isShortLabel "前項第一号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前項第一号" := by native_decide
example : isShortLabel "前項第二号" = true := by native_decide
example : isShortLabel "前項第二号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前項第二号" := by native_decide
example : isShortLabel "前項第六号" = true := by native_decide
example : isShortLabel "前項第六号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前項第六号" := by native_decide
example : isShortLabel "前項第四号" = true := by native_decide
example : isShortLabel "前項第四号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "前項第四号" := by native_decide
example : isShortLabel "剰余金の配当" = true := by native_decide
example : isShortLabel "剰余金の配当" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "剰余金の配当" := by native_decide
example : isShortLabel "割引債" = true := by native_decide
example : isShortLabel "割引債" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "割引債" := by native_decide
example : isShortLabel "割賦小売業等" = true := by native_decide
example : isShortLabel "割賦小売業等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "割賦小売業等" := by native_decide
example : isShortLabel "加える額" = true := by native_decide
example : isShortLabel "加える額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "加える額" := by native_decide
example : isShortLabel "加入の年月日" = true := by native_decide
example : isShortLabel "加入の年月日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "加入の年月日" := by native_decide
example : isShortLabel "加入者" = true := by native_decide
example : isShortLabel "加入者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "加入者" := by native_decide
example : isShortLabel "加熱器" = true := by native_decide
example : isShortLabel "加熱器" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "加熱器" := by native_decide
example : isShortLabel "加熱式たばこ" = true := by native_decide
example : isShortLabel "加熱式たばこ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "加熱式たばこ" := by native_decide
example : isShortLabel "加算した金額" = true := by native_decide
example : isShortLabel "加算した金額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "加算した金額" := by native_decide
example : isShortLabel "労働金庫" = true := by native_decide
example : isShortLabel "労働金庫" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "労働金庫" := by native_decide
example : isShortLabel "動物園" = true := by native_decide
example : isShortLabel "動物園" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "動物園" := by native_decide
example : isShortLabel "動産" = true := by native_decide
example : isShortLabel "動産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "動産" := by native_decide
example : isShortLabel "動産総合保険" = true := by native_decide
example : isShortLabel "動産総合保険" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "動産総合保険" := by native_decide
example : isShortLabel "勤労学生" = true := by native_decide
example : isShortLabel "勤労学生" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "勤労学生" := by native_decide
example : isShortLabel "化学工業" = true := by native_decide
example : isShortLabel "化学工業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "化学工業" := by native_decide
example : isShortLabel "北海海運局長" = true := by native_decide
example : isShortLabel "北海海運局長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "北海海運局長" := by native_decide
example : isShortLabel "区域" = true := by native_decide
example : isShortLabel "区域" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "区域" := by native_decide
example : isShortLabel "医業" = true := by native_decide
example : isShortLabel "医業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "医業" := by native_decide
example : isShortLabel "医療法人" = true := by native_decide
example : isShortLabel "医療法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "医療法人" := by native_decide
example : isShortLabel "医療費控除" = true := by native_decide
example : isShortLabel "医療費控除" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "医療費控除" := by native_decide
example : isShortLabel "十" = true := by native_decide
example : isShortLabel "十" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十" := by native_decide
example : isShortLabel "十　事業所税" = true := by native_decide
example : isShortLabel "十　事業所税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十　事業所税" := by native_decide
example : isShortLabel "十　削除" = true := by native_decide
example : isShortLabel "十　削除" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十　削除" := by native_decide
example : isShortLabel "十　福島県" = true := by native_decide
example : isShortLabel "十　福島県" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十　福島県" := by native_decide
example : isShortLabel "十一" = true := by native_decide
example : isShortLabel "十一" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十一" := by native_decide
example : isShortLabel "十一月" = true := by native_decide
example : isShortLabel "十一月" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十一月" := by native_decide
example : isShortLabel "十一月三十日" = true := by native_decide
example : isShortLabel "十一月三十日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十一月三十日" := by native_decide
example : isShortLabel "十七" = true := by native_decide
example : isShortLabel "十七" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十七" := by native_decide
example : isShortLabel "十七分の十" = true := by native_decide
example : isShortLabel "十七分の十" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十七分の十" := by native_decide
example : isShortLabel "十七単位" = true := by native_decide
example : isShortLabel "十七単位" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十七単位" := by native_decide
example : isShortLabel "十三" = true := by native_decide
example : isShortLabel "十三" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十三" := by native_decide
example : isShortLabel "十三の項" = true := by native_decide
example : isShortLabel "十三の項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十三の項" := by native_decide
example : isShortLabel "十三年" = true := by native_decide
example : isShortLabel "十三年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十三年" := by native_decide
example : isShortLabel "十九" = true := by native_decide
example : isShortLabel "十九" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十九" := by native_decide
example : isShortLabel "十二" = true := by native_decide
example : isShortLabel "十二" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十二" := by native_decide
example : isShortLabel "十二　清掃費" = true := by native_decide
example : isShortLabel "十二　清掃費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十二　清掃費" := by native_decide
example : isShortLabel "十二分の十" = true := by native_decide
example : isShortLabel "十二分の十" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十二分の十" := by native_decide
example : isShortLabel "十二月" = true := by native_decide
example : isShortLabel "十二月" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十二月" := by native_decide
example : isShortLabel "十五" = true := by native_decide
example : isShortLabel "十五" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十五" := by native_decide
example : isShortLabel "十五　削除" = true := by native_decide
example : isShortLabel "十五　削除" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十五　削除" := by native_decide
example : isShortLabel "十五億円" = true := by native_decide
example : isShortLabel "十五億円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十五億円" := by native_decide
example : isShortLabel "十五年" = true := by native_decide
example : isShortLabel "十五年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十五年" := by native_decide
example : isShortLabel "十億円" = true := by native_decide
example : isShortLabel "十億円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十億円" := by native_decide
example : isShortLabel "十八" = true := by native_decide
example : isShortLabel "十八" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十八" := by native_decide
example : isShortLabel "十六" = true := by native_decide
example : isShortLabel "十六" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十六" := by native_decide
example : isShortLabel "十六分の七" = true := by native_decide
example : isShortLabel "十六分の七" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十六分の七" := by native_decide
example : isShortLabel "十六分の十一" = true := by native_decide
example : isShortLabel "十六分の十一" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十六分の十一" := by native_decide
example : isShortLabel "十六分の十三" = true := by native_decide
example : isShortLabel "十六分の十三" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十六分の十三" := by native_decide
example : isShortLabel "十分の〇・二" = true := by native_decide
example : isShortLabel "十分の〇・二" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十分の〇・二" := by native_decide
example : isShortLabel "十分の〇・五" = true := by native_decide
example : isShortLabel "十分の〇・五" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十分の〇・五" := by native_decide
example : isShortLabel "十分の〇・四" = true := by native_decide
example : isShortLabel "十分の〇・四" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十分の〇・四" := by native_decide
example : isShortLabel "十分の一" = true := by native_decide
example : isShortLabel "十分の一" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十分の一" := by native_decide
example : isShortLabel "十分の一・五" = true := by native_decide
example : isShortLabel "十分の一・五" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十分の一・五" := by native_decide
example : isShortLabel "十分の一・四" = true := by native_decide
example : isShortLabel "十分の一・四" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十分の一・四" := by native_decide
example : isShortLabel "十分の七" = true := by native_decide
example : isShortLabel "十分の七" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十分の七" := by native_decide
example : isShortLabel "十分の三" = true := by native_decide
example : isShortLabel "十分の三" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十分の三" := by native_decide
example : isShortLabel "十分の九" = true := by native_decide
example : isShortLabel "十分の九" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十分の九" := by native_decide
example : isShortLabel "十分の二" = true := by native_decide
example : isShortLabel "十分の二" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十分の二" := by native_decide
example : isShortLabel "十分の五" = true := by native_decide
example : isShortLabel "十分の五" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十分の五" := by native_decide
example : isShortLabel "十分の八" = true := by native_decide
example : isShortLabel "十分の八" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十分の八" := by native_decide
example : isShortLabel "十分の六" = true := by native_decide
example : isShortLabel "十分の六" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十分の六" := by native_decide
example : isShortLabel "十分の十" = true := by native_decide
example : isShortLabel "十分の十" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十分の十" := by native_decide
example : isShortLabel "十分の四" = true := by native_decide
example : isShortLabel "十分の四" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十分の四" := by native_decide
example : isShortLabel "十四" = true := by native_decide
example : isShortLabel "十四" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十四" := by native_decide
example : isShortLabel "十四　国土強" = true := by native_decide
example : isShortLabel "十四　国土強" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十四　国土強" := by native_decide
example : isShortLabel "十四　清掃費" = true := by native_decide
example : isShortLabel "十四　清掃費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十四　清掃費" := by native_decide
example : isShortLabel "十四の項" = true := by native_decide
example : isShortLabel "十四の項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十四の項" := by native_decide
example : isShortLabel "十年" = true := by native_decide
example : isShortLabel "十年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十年" := by native_decide
example : isShortLabel "十年以内" = true := by native_decide
example : isShortLabel "十年以内" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "十年以内" := by native_decide
example : isShortLabel "千五百人未満" = true := by native_decide
example : isShortLabel "千五百人未満" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "千五百人未満" := by native_decide
example : isShortLabel "半製品" = true := by native_decide
example : isShortLabel "半製品" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "半製品" := by native_decide
example : isShortLabel "協同組合等" = true := by native_decide
example : isShortLabel "協同組合等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "協同組合等" := by native_decide
example : isShortLabel "協定銀行" = true := by native_decide
example : isShortLabel "協定銀行" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "協定銀行" := by native_decide
example : isShortLabel "協業化事業等" = true := by native_decide
example : isShortLabel "協業化事業等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "協業化事業等" := by native_decide
example : isShortLabel "単位費用" = true := by native_decide
example : isShortLabel "単位費用" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "単位費用" := by native_decide
example : isShortLabel "単位額" = true := by native_decide
example : isShortLabel "単位額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "単位額" := by native_decide
example : isShortLabel "単式蒸留焼酎" = true := by native_decide
example : isShortLabel "単式蒸留焼酎" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "単式蒸留焼酎" := by native_decide
example : isShortLabel "博覧会" = true := by native_decide
example : isShortLabel "博覧会" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "博覧会" := by native_decide
example : isShortLabel "博覧会協会" = true := by native_decide
example : isShortLabel "博覧会協会" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "博覧会協会" := by native_decide
example : isShortLabel "印刷業" = true := by native_decide
example : isShortLabel "印刷業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "印刷業" := by native_decide
example : isShortLabel "印刷製版業" = true := by native_decide
example : isShortLabel "印刷製版業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "印刷製版業" := by native_decide
example : isShortLabel "印紙税" = true := by native_decide
example : isShortLabel "印紙税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "印紙税" := by native_decide
example : isShortLabel "卸売業" = true := by native_decide
example : isShortLabel "卸売業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "卸売業" := by native_decide
example : isShortLabel "卸売販売業者" = true := by native_decide
example : isShortLabel "卸売販売業者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "卸売販売業者" := by native_decide
example : isShortLabel "卸小売業" = true := by native_decide
example : isShortLabel "卸小売業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "卸小売業" := by native_decide
example : isShortLabel "厚生労働大臣" = true := by native_decide
example : isShortLabel "厚生労働大臣" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "厚生労働大臣" := by native_decide
example : isShortLabel "原価法" = true := by native_decide
example : isShortLabel "原価法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "原価法" := by native_decide
example : isShortLabel "原価計算論" = true := by native_decide
example : isShortLabel "原価計算論" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "原価計算論" := by native_decide
example : isShortLabel "原動機の型式" = true := by native_decide
example : isShortLabel "原動機の型式" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "原動機の型式" := by native_decide
example : isShortLabel "原子力保険" = true := by native_decide
example : isShortLabel "原子力保険" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "原子力保険" := by native_decide
example : isShortLabel "原板校正機" = true := by native_decide
example : isShortLabel "原板校正機" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "原板校正機" := by native_decide
example : isShortLabel "原板洗浄機" = true := by native_decide
example : isShortLabel "原板洗浄機" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "原板洗浄機" := by native_decide
example : isShortLabel "原板溝付機" = true := by native_decide
example : isShortLabel "原板溝付機" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "原板溝付機" := by native_decide
example : isShortLabel "原板穿孔機" = true := by native_decide
example : isShortLabel "原板穿孔機" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "原板穿孔機" := by native_decide
example : isShortLabel "原油" = true := by native_decide
example : isShortLabel "原油" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "原油" := by native_decide
example : isShortLabel "参加人意見書" = true := by native_decide
example : isShortLabel "参加人意見書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "参加人意見書" := by native_decide
example : isShortLabel "参加国等" = true := by native_decide
example : isShortLabel "参加国等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "参加国等" := by native_decide
example : isShortLabel "参加者" = true := by native_decide
example : isShortLabel "参加者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "参加者" := by native_decide
example : isShortLabel "又はα" = true := by native_decide
example : isShortLabel "又はα" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "又はα" := by native_decide
example : isShortLabel "又はこれ" = true := by native_decide
example : isShortLabel "又はこれ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "又はこれ" := by native_decide
example : isShortLabel "又は世帯数" = true := by native_decide
example : isShortLabel "又は世帯数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "又は世帯数" := by native_decide
example : isShortLabel "又は同項" = true := by native_decide
example : isShortLabel "又は同項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "又は同項" := by native_decide
example : isShortLabel "又は当該" = true := by native_decide
example : isShortLabel "又は当該" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "又は当該" := by native_decide
example : isShortLabel "又は旅客数" = true := by native_decide
example : isShortLabel "又は旅客数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "又は旅客数" := by native_decide
example : isShortLabel "又は株式の数" = true := by native_decide
example : isShortLabel "又は株式の数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "又は株式の数" := by native_decide
example : isShortLabel "又は法" = true := by native_decide
example : isShortLabel "又は法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "又は法" := by native_decide
example : isShortLabel "又は法人税法" = true := by native_decide
example : isShortLabel "又は法人税法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "又は法人税法" := by native_decide
example : isShortLabel "又は石油税の" = true := by native_decide
example : isShortLabel "又は石油税の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "又は石油税の" := by native_decide
example : isShortLabel "又は第七項" = true := by native_decide
example : isShortLabel "又は第七項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "又は第七項" := by native_decide
example : isShortLabel "又は第九号" = true := by native_decide
example : isShortLabel "又は第九号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "又は第九号" := by native_decide
example : isShortLabel "又は第九項" = true := by native_decide
example : isShortLabel "又は第九項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "又は第九項" := by native_decide
example : isShortLabel "又は第二項" = true := by native_decide
example : isShortLabel "又は第二項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "又は第二項" := by native_decide
example : isShortLabel "又は第六号" = true := by native_decide
example : isShortLabel "又は第六号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "又は第六号" := by native_decide
example : isShortLabel "又は第十一号" = true := by native_decide
example : isShortLabel "又は第十一号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "又は第十一号" := by native_decide
example : isShortLabel "又は第十五号" = true := by native_decide
example : isShortLabel "又は第十五号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "又は第十五号" := by native_decide
example : isShortLabel "又は第四号" = true := by native_decide
example : isShortLabel "又は第四号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "又は第四号" := by native_decide
example : isShortLabel "又は第四項" = true := by native_decide
example : isShortLabel "又は第四項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "又は第四項" := by native_decide
example : isShortLabel "又は製造（" = true := by native_decide
example : isShortLabel "又は製造（" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "又は製造（" := by native_decide
example : isShortLabel "又は通知書" = true := by native_decide
example : isShortLabel "又は通知書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "又は通知書" := by native_decide
example : isShortLabel "又は（ｄ" = true := by native_decide
example : isShortLabel "又は（ｄ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "又は（ｄ" := by native_decide
example : isShortLabel "及び前項" = true := by native_decide
example : isShortLabel "及び前項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "及び前項" := by native_decide
example : isShortLabel "及び同号ロ" = true := by native_decide
example : isShortLabel "及び同号ロ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "及び同号ロ" := by native_decide
example : isShortLabel "及び同日" = true := by native_decide
example : isShortLabel "及び同日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "及び同日" := by native_decide
example : isShortLabel "及び均等割額" = true := by native_decide
example : isShortLabel "及び均等割額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "及び均等割額" := by native_decide
example : isShortLabel "及び旅客数" = true := by native_decide
example : isShortLabel "及び旅客数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "及び旅客数" := by native_decide
example : isShortLabel "及び法" = true := by native_decide
example : isShortLabel "及び法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "及び法" := by native_decide
example : isShortLabel "及び符号Ｈ２" = true := by native_decide
example : isShortLabel "及び符号Ｈ２" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "及び符号Ｈ２" := by native_decide
example : isShortLabel "及び符号Ｎ" = true := by native_decide
example : isShortLabel "及び符号Ｎ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "及び符号Ｎ" := by native_decide
example : isShortLabel "及び第三項" = true := by native_decide
example : isShortLabel "及び第三項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "及び第三項" := by native_decide
example : isShortLabel "及び第二項" = true := by native_decide
example : isShortLabel "及び第二項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "及び第二項" := by native_decide
example : isShortLabel "及び第八項" = true := by native_decide
example : isShortLabel "及び第八項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "及び第八項" := by native_decide
example : isShortLabel "及び第四項" = true := by native_decide
example : isShortLabel "及び第四項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "及び第四項" := by native_decide
example : isShortLabel "及びＧ" = true := by native_decide
example : isShortLabel "及びＧ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "及びＧ" := by native_decide
example : isShortLabel "及びＬ" = true := by native_decide
example : isShortLabel "及びＬ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "及びＬ" := by native_decide
example : isShortLabel "反論書" = true := by native_decide
example : isShortLabel "反論書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "反論書" := by native_decide
example : isShortLabel "収入の項目" = true := by native_decide
example : isShortLabel "収入の項目" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "収入の項目" := by native_decide
example : isShortLabel "収入割" = true := by native_decide
example : isShortLabel "収入割" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "収入割" := by native_decide
example : isShortLabel "収入割額" = true := by native_decide
example : isShortLabel "収入割額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "収入割額" := by native_decide
example : isShortLabel "収入等" = true := by native_decide
example : isShortLabel "収入等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "収入等" := by native_decide
example : isShortLabel "収入額に" = true := by native_decide
example : isShortLabel "収入額に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "収入額に" := by native_decide
example : isShortLabel "収支の見込み" = true := by native_decide
example : isShortLabel "収支の見込み" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "収支の見込み" := by native_decide
example : isShortLabel "収益の分配" = true := by native_decide
example : isShortLabel "収益の分配" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "収益の分配" := by native_decide
example : isShortLabel "収益事業" = true := by native_decide
example : isShortLabel "収益事業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "収益事業" := by native_decide
example : isShortLabel "収納未済額" = true := by native_decide
example : isShortLabel "収納未済額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "収納未済額" := by native_decide
example : isShortLabel "取引" = true := by native_decide
example : isShortLabel "取引" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "取引" := by native_decide
example : isShortLabel "取得件数" = true := by native_decide
example : isShortLabel "取得件数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "取得件数" := by native_decide
example : isShortLabel "取得指定期間" = true := by native_decide
example : isShortLabel "取得指定期間" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "取得指定期間" := by native_decide
example : isShortLabel "取立て" = true := by native_decide
example : isShortLabel "取立て" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "取立て" := by native_decide
example : isShortLabel "受けた" = true := by native_decide
example : isShortLabel "受けた" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "受けた" := by native_decide
example : isShortLabel "受入" = true := by native_decide
example : isShortLabel "受入" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "受入" := by native_decide
example : isShortLabel "受入れ" = true := by native_decide
example : isShortLabel "受入れ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "受入れ" := by native_decide
example : isShortLabel "受理された日" = true := by native_decide
example : isShortLabel "受理された日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "受理された日" := by native_decide
example : isShortLabel "受託法人" = true := by native_decide
example : isShortLabel "受託法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "受託法人" := by native_decide
example : isShortLabel "受贈宅地等" = true := by native_decide
example : isShortLabel "受贈宅地等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "受贈宅地等" := by native_decide
example : isShortLabel "受贈者" = true := by native_decide
example : isShortLabel "受贈者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "受贈者" := by native_decide
example : isShortLabel "台湾" = true := by native_decide
example : isShortLabel "台湾" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "台湾" := by native_decide
example : isShortLabel "台湾、" = true := by native_decide
example : isShortLabel "台湾、" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "台湾、" := by native_decide
example : isShortLabel "司法書士業" = true := by native_decide
example : isShortLabel "司法書士業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "司法書士業" := by native_decide
example : isShortLabel "各号" = true := by native_decide
example : isShortLabel "各号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "各号" := by native_decide
example : isShortLabel "各年の同項" = true := by native_decide
example : isShortLabel "各年の同項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "各年の同項" := by native_decide
example : isShortLabel "各期間（次項" = true := by native_decide
example : isShortLabel "各期間（次項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "各期間（次項" := by native_decide
example : isShortLabel "各種所得" = true := by native_decide
example : isShortLabel "各種所得" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "各種所得" := by native_decide
example : isShortLabel "合併" = true := by native_decide
example : isShortLabel "合併" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "合併" := by native_decide
example : isShortLabel "合併に限る" = true := by native_decide
example : isShortLabel "合併に限る" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "合併に限る" := by native_decide
example : isShortLabel "合併の日" = true := by native_decide
example : isShortLabel "合併の日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "合併の日" := by native_decide
example : isShortLabel "合併をする旨" = true := by native_decide
example : isShortLabel "合併をする旨" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "合併をする旨" := by native_decide
example : isShortLabel "合併法人" = true := by native_decide
example : isShortLabel "合併法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "合併法人" := by native_decide
example : isShortLabel "合併法人等" = true := by native_decide
example : isShortLabel "合併法人等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "合併法人等" := by native_decide
example : isShortLabel "合同会社" = true := by native_decide
example : isShortLabel "合同会社" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "合同会社" := by native_decide
example : isShortLabel "合同運用信託" = true := by native_decide
example : isShortLabel "合同運用信託" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "合同運用信託" := by native_decide
example : isShortLabel "合成清酒" = true := by native_decide
example : isShortLabel "合成清酒" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "合成清酒" := by native_decide
example : isShortLabel "合衆国軍隊" = true := by native_decide
example : isShortLabel "合衆国軍隊" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "合衆国軍隊" := by native_decide
example : isShortLabel "合計所得金額" = true := by native_decide
example : isShortLabel "合計所得金額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "合計所得金額" := by native_decide
example : isShortLabel "合計数で、" = true := by native_decide
example : isShortLabel "合計数で、" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "合計数で、" := by native_decide
example : isShortLabel "吊" = true := by native_decide
example : isShortLabel "吊" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "吊" := by native_decide
example : isShortLabel "同じ" = true := by native_decide
example : isShortLabel "同じ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "同じ" := by native_decide
example : isShortLabel "同じ。）" = true := by native_decide
example : isShortLabel "同じ。）" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "同じ。）" := by native_decide
example : isShortLabel "同令" = true := by native_decide
example : isShortLabel "同令" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "同令" := by native_decide
example : isShortLabel "同族会社" = true := by native_decide
example : isShortLabel "同族会社" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "同族会社" := by native_decide
example : isShortLabel "同族理事" = true := by native_decide
example : isShortLabel "同族理事" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "同族理事" := by native_decide
example : isShortLabel "同月三十一日" = true := by native_decide
example : isShortLabel "同月三十一日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "同月三十一日" := by native_decide
example : isShortLabel "同表の他の号" = true := by native_decide
example : isShortLabel "同表の他の号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "同表の他の号" := by native_decide
example : isShortLabel "同表の各号" = true := by native_decide
example : isShortLabel "同表の各号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "同表の各号" := by native_decide
example : isShortLabel "名称" = true := by native_decide
example : isShortLabel "名称" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "名称" := by native_decide
example : isShortLabel "含む" = true := by native_decide
example : isShortLabel "含む" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "含む" := by native_decide
example : isShortLabel "含む。）" = true := by native_decide
example : isShortLabel "含む。）" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "含む。）" := by native_decide
example : isShortLabel "含む。）は" = true := by native_decide
example : isShortLabel "含む。）は" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "含む。）は" := by native_decide
example : isShortLabel "周旋業" = true := by native_decide
example : isShortLabel "周旋業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "周旋業" := by native_decide
example : isShortLabel "品名" = true := by native_decide
example : isShortLabel "品名" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "品名" := by native_decide
example : isShortLabel "品目" = true := by native_decide
example : isShortLabel "品目" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "品目" := by native_decide
example : isShortLabel "商品取引業" = true := by native_decide
example : isShortLabel "商品取引業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "商品取引業" := by native_decide
example : isShortLabel "商工行政費" = true := by native_decide
example : isShortLabel "商工行政費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "商工行政費" := by native_decide
example : isShortLabel "商業地等" = true := by native_decide
example : isShortLabel "商業地等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "商業地等" := by native_decide
example : isShortLabel "商標権" = true := by native_decide
example : isShortLabel "商標権" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "商標権" := by native_decide
example : isShortLabel "問屋業" = true := by native_decide
example : isShortLabel "問屋業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "問屋業" := by native_decide
example : isShortLabel "喀痰" = true := by native_decide
example : isShortLabel "喀痰" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "喀痰" := by native_decide
example : isShortLabel "営業所等" = true := by native_decide
example : isShortLabel "営業所等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "営業所等" := by native_decide
example : isShortLabel "営業権" = true := by native_decide
example : isShortLabel "営業権" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "営業権" := by native_decide
example : isShortLabel "営業用" = true := by native_decide
example : isShortLabel "営業用" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "営業用" := by native_decide
example : isShortLabel "器" = true := by native_decide
example : isShortLabel "器" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "器" := by native_decide
example : isShortLabel "器具及び備品" = true := by native_decide
example : isShortLabel "器具及び備品" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "器具及び備品" := by native_decide
example : isShortLabel "四" = true := by native_decide
example : isShortLabel "四" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "四" := by native_decide
example : isShortLabel "四　事業所税" = true := by native_decide
example : isShortLabel "四　事業所税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "四　事業所税" := by native_decide
example : isShortLabel "四　公園費" = true := by native_decide
example : isShortLabel "四　公園費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "四　公園費" := by native_decide
example : isShortLabel "四　厚生費" = true := by native_decide
example : isShortLabel "四　厚生費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "四　厚生費" := by native_decide
example : isShortLabel "四　小学校費" = true := by native_decide
example : isShortLabel "四　小学校費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "四　小学校費" := by native_decide
example : isShortLabel "四、一二五" = true := by native_decide
example : isShortLabel "四、一二五" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "四、一二五" := by native_decide
example : isShortLabel "四、五〇〇" = true := by native_decide
example : isShortLabel "四、五〇〇" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "四、五〇〇" := by native_decide
example : isShortLabel "四、四二五" = true := by native_decide
example : isShortLabel "四、四二五" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "四、四二五" := by native_decide
example : isShortLabel "四〇〇点" = true := by native_decide
example : isShortLabel "四〇〇点" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "四〇〇点" := by native_decide
example : isShortLabel "四〇世帯" = true := by native_decide
example : isShortLabel "四〇世帯" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "四〇世帯" := by native_decide
example : isShortLabel "四分の三" = true := by native_decide
example : isShortLabel "四分の三" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "四分の三" := by native_decide
example : isShortLabel "四分の二十九" = true := by native_decide
example : isShortLabel "四分の二十九" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "四分の二十九" := by native_decide
example : isShortLabel "四十億円" = true := by native_decide
example : isShortLabel "四十億円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "四十億円" := by native_decide
example : isShortLabel "四十億円で" = true := by native_decide
example : isShortLabel "四十億円で" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "四十億円で" := by native_decide
example : isShortLabel "四十八月" = true := by native_decide
example : isShortLabel "四十八月" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "四十八月" := by native_decide
example : isShortLabel "四四九" = true := by native_decide
example : isShortLabel "四四九" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "四四九" := by native_decide
example : isShortLabel "四国海運局長" = true := by native_decide
example : isShortLabel "四国海運局長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "四国海運局長" := by native_decide
example : isShortLabel "四国運輸局長" = true := by native_decide
example : isShortLabel "四国運輸局長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "四国運輸局長" := by native_decide
example : isShortLabel "四年" = true := by native_decide
example : isShortLabel "四年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "四年" := by native_decide
example : isShortLabel "四月" = true := by native_decide
example : isShortLabel "四月" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "四月" := by native_decide
example : isShortLabel "四月一日" = true := by native_decide
example : isShortLabel "四月一日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "四月一日" := by native_decide
example : isShortLabel "四月三十日" = true := by native_decide
example : isShortLabel "四月三十日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "四月三十日" := by native_decide
example : isShortLabel "四月十五日" = true := by native_decide
example : isShortLabel "四月十五日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "四月十五日" := by native_decide
example : isShortLabel "四月及び五月" = true := by native_decide
example : isShortLabel "四月及び五月" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "四月及び五月" := by native_decide
example : isShortLabel "四月及び六月" = true := by native_decide
example : isShortLabel "四月及び六月" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "四月及び六月" := by native_decide
example : isShortLabel "四点" = true := by native_decide
example : isShortLabel "四点" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "四点" := by native_decide
example : isShortLabel "四百億円" = true := by native_decide
example : isShortLabel "四百億円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "四百億円" := by native_decide
example : isShortLabel "固定資産" = true := by native_decide
example : isShortLabel "固定資産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "固定資産" := by native_decide
example : isShortLabel "固有法人は" = true := by native_decide
example : isShortLabel "固有法人は" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "固有法人は" := by native_decide
example : isShortLabel "固有法人又は" = true := by native_decide
example : isShortLabel "固有法人又は" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "固有法人又は" := by native_decide
example : isShortLabel "国の" = true := by native_decide
example : isShortLabel "国の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国の" := by native_decide
example : isShortLabel "国の専売品" = true := by native_decide
example : isShortLabel "国の専売品" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国の専売品" := by native_decide
example : isShortLabel "国の補助金等" = true := by native_decide
example : isShortLabel "国の補助金等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国の補助金等" := by native_decide
example : isShortLabel "国内" = true := by native_decide
example : isShortLabel "国内" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国内" := by native_decide
example : isShortLabel "国内不動産" = true := by native_decide
example : isShortLabel "国内不動産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国内不動産" := by native_decide
example : isShortLabel "国内事業所等" = true := by native_decide
example : isShortLabel "国内事業所等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国内事業所等" := by native_decide
example : isShortLabel "国内事業者" = true := by native_decide
example : isShortLabel "国内事業者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国内事業者" := by native_decide
example : isShortLabel "国内又は国外" = true := by native_decide
example : isShortLabel "国内又は国外" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国内又は国外" := by native_decide
example : isShortLabel "国内証券口座" = true := by native_decide
example : isShortLabel "国内証券口座" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国内証券口座" := by native_decide
example : isShortLabel "国内雇用者" = true := by native_decide
example : isShortLabel "国内雇用者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国内雇用者" := by native_decide
example : isShortLabel "国外" = true := by native_decide
example : isShortLabel "国外" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国外" := by native_decide
example : isShortLabel "国外中古建物" = true := by native_decide
example : isShortLabel "国外中古建物" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国外中古建物" := by native_decide
example : isShortLabel "国外事業者" = true := by native_decide
example : isShortLabel "国外事業者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国外事業者" := by native_decide
example : isShortLabel "国外証券口座" = true := by native_decide
example : isShortLabel "国外証券口座" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国外証券口座" := by native_decide
example : isShortLabel "国外証券移管" = true := by native_decide
example : isShortLabel "国外証券移管" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国外証券移管" := by native_decide
example : isShortLabel "国外財産" = true := by native_decide
example : isShortLabel "国外財産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国外財産" := by native_decide
example : isShortLabel "国外送金" = true := by native_decide
example : isShortLabel "国外送金" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国外送金" := by native_decide
example : isShortLabel "国庫支出金" = true := by native_decide
example : isShortLabel "国庫支出金" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国庫支出金" := by native_decide
example : isShortLabel "国民年金勘定" = true := by native_decide
example : isShortLabel "国民年金勘定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国民年金勘定" := by native_decide
example : isShortLabel "国税" = true := by native_decide
example : isShortLabel "国税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国税" := by native_decide
example : isShortLabel "国税と" = true := by native_decide
example : isShortLabel "国税と" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国税と" := by native_decide
example : isShortLabel "国税に" = true := by native_decide
example : isShortLabel "国税に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国税に" := by native_decide
example : isShortLabel "国税の" = true := by native_decide
example : isShortLabel "国税の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国税の" := by native_decide
example : isShortLabel "国税の納期限" = true := by native_decide
example : isShortLabel "国税の納期限" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国税の納期限" := by native_decide
example : isShortLabel "国税副審判官" = true := by native_decide
example : isShortLabel "国税副審判官" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国税副審判官" := by native_decide
example : isShortLabel "国税審判官" = true := by native_decide
example : isShortLabel "国税審判官" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国税審判官" := by native_decide
example : isShortLabel "国税審査会" = true := by native_decide
example : isShortLabel "国税審査会" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国税審査会" := by native_decide
example : isShortLabel "国税局長" = true := by native_decide
example : isShortLabel "国税局長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国税局長" := by native_decide
example : isShortLabel "国税庁次長" = true := by native_decide
example : isShortLabel "国税庁次長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国税庁次長" := by native_decide
example : isShortLabel "国税庁長官" = true := by native_decide
example : isShortLabel "国税庁長官" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国税庁長官" := by native_decide
example : isShortLabel "国税徴収法" = true := by native_decide
example : isShortLabel "国税徴収法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国税徴収法" := by native_decide
example : isShortLabel "国税資金勘定" = true := by native_decide
example : isShortLabel "国税資金勘定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国税資金勘定" := by native_decide
example : isShortLabel "国税通則法" = true := by native_decide
example : isShortLabel "国税通則法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国税通則法" := by native_decide
example : isShortLabel "国税通則法の" = true := by native_decide
example : isShortLabel "国税通則法の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国税通則法の" := by native_decide
example : isShortLabel "国立大学法人" = true := by native_decide
example : isShortLabel "国立大学法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国立大学法人" := by native_decide
example : isShortLabel "国等" = true := by native_decide
example : isShortLabel "国等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国等" := by native_decide
example : isShortLabel "国道延長比率" = true := by native_decide
example : isShortLabel "国道延長比率" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国道延長比率" := by native_decide
example : isShortLabel "国際機関" = true := by native_decide
example : isShortLabel "国際機関" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国際機関" := by native_decide
example : isShortLabel "国際船舶等" = true := by native_decide
example : isShortLabel "国際船舶等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国際船舶等" := by native_decide
example : isShortLabel "国際運輸業" = true := by native_decide
example : isShortLabel "国際運輸業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "国際運輸業" := by native_decide
example : isShortLabel "土地" = true := by native_decide
example : isShortLabel "土地" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "土地" := by native_decide
example : isShortLabel "土地に" = true := by native_decide
example : isShortLabel "土地に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "土地に" := by native_decide
example : isShortLabel "土地の区分" = true := by native_decide
example : isShortLabel "土地の区分" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "土地の区分" := by native_decide
example : isShortLabel "土地の譲渡等" = true := by native_decide
example : isShortLabel "土地の譲渡等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "土地の譲渡等" := by native_decide
example : isShortLabel "土地又は建物" = true := by native_decide
example : isShortLabel "土地又は建物" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "土地又は建物" := by native_decide
example : isShortLabel "土地等" = true := by native_decide
example : isShortLabel "土地等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "土地等" := by native_decide
example : isShortLabel "土地課税台帳" = true := by native_decide
example : isShortLabel "土地課税台帳" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "土地課税台帳" := by native_decide
example : isShortLabel "土石採取業" = true := by native_decide
example : isShortLabel "土石採取業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "土石採取業" := by native_decide
example : isShortLabel "土砂防止林" = true := by native_decide
example : isShortLabel "土砂防止林" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "土砂防止林" := by native_decide
example : isShortLabel "圧縮機" = true := by native_decide
example : isShortLabel "圧縮機" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "圧縮機" := by native_decide
example : isShortLabel "地価税" = true := by native_decide
example : isShortLabel "地価税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "地価税" := by native_decide
example : isShortLabel "地価税の額" = true := by native_decide
example : isShortLabel "地価税の額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "地価税の額" := by native_decide
example : isShortLabel "地区" = true := by native_decide
example : isShortLabel "地区" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "地区" := by native_decide
example : isShortLabel "地域区分" = true := by native_decide
example : isShortLabel "地域区分" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "地域区分" := by native_decide
example : isShortLabel "地域振興費" = true := by native_decide
example : isShortLabel "地域振興費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "地域振興費" := by native_decide
example : isShortLabel "地方交付税" = true := by native_decide
example : isShortLabel "地方交付税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "地方交付税" := by native_decide
example : isShortLabel "地方公共団体" = true := by native_decide
example : isShortLabel "地方公共団体" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "地方公共団体" := by native_decide
example : isShortLabel "地方団体" = true := by native_decide
example : isShortLabel "地方団体" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "地方団体" := by native_decide
example : isShortLabel "地方団体の" = true := by native_decide
example : isShortLabel "地方団体の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "地方団体の" := by native_decide
example : isShortLabel "地方団体の長" = true := by native_decide
example : isShortLabel "地方団体の長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "地方団体の長" := by native_decide
example : isShortLabel "地方揮発油税" = true := by native_decide
example : isShortLabel "地方揮発油税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "地方揮発油税" := by native_decide
example : isShortLabel "地方法人税" = true := by native_decide
example : isShortLabel "地方法人税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "地方法人税" := by native_decide
example : isShortLabel "地方消費税" = true := by native_decide
example : isShortLabel "地方消費税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "地方消費税" := by native_decide
example : isShortLabel "地方税" = true := by native_decide
example : isShortLabel "地方税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "地方税" := by native_decide
example : isShortLabel "地方税法" = true := by native_decide
example : isShortLabel "地方税法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "地方税法" := by native_decide
example : isShortLabel "地方道路税" = true := by native_decide
example : isShortLabel "地方道路税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "地方道路税" := by native_decide
example : isShortLabel "地方道路税を" = true := by native_decide
example : isShortLabel "地方道路税を" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "地方道路税を" := by native_decide
example : isShortLabel "地目の変換" = true := by native_decide
example : isShortLabel "地目の変換" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "地目の変換" := by native_decide
example : isShortLabel "地目の変換等" = true := by native_decide
example : isShortLabel "地目の変換等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "地目の変換等" := by native_decide
example : isShortLabel "地震保険" = true := by native_decide
example : isShortLabel "地震保険" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "地震保険" := by native_decide
example : isShortLabel "均等割" = true := by native_decide
example : isShortLabel "均等割" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "均等割" := by native_decide
example : isShortLabel "均等割額" = true := by native_decide
example : isShortLabel "均等割額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "均等割額" := by native_decide
example : isShortLabel "型式" = true := by native_decide
example : isShortLabel "型式" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "型式" := by native_decide
example : isShortLabel "執行機関" = true := by native_decide
example : isShortLabel "執行機関" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "執行機関" := by native_decide
example : isShortLabel "基準" = true := by native_decide
example : isShortLabel "基準" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "基準" := by native_decide
example : isShortLabel "基準住居部分" = true := by native_decide
example : isShortLabel "基準住居部分" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "基準住居部分" := by native_decide
example : isShortLabel "基準年度" = true := by native_decide
example : isShortLabel "基準年度" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "基準年度" := by native_decide
example : isShortLabel "基準延長" = true := by native_decide
example : isShortLabel "基準延長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "基準延長" := by native_decide
example : isShortLabel "基準日" = true := by native_decide
example : isShortLabel "基準日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "基準日" := by native_decide
example : isShortLabel "基準日等" = true := by native_decide
example : isShortLabel "基準日等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "基準日等" := by native_decide
example : isShortLabel "基準時" = true := by native_decide
example : isShortLabel "基準時" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "基準時" := by native_decide
example : isShortLabel "基準期間" = true := by native_decide
example : isShortLabel "基準期間" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "基準期間" := by native_decide
example : isShortLabel "基準税率" = true := by native_decide
example : isShortLabel "基準税率" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "基準税率" := by native_decide
example : isShortLabel "基準部分" = true := by native_decide
example : isShortLabel "基準部分" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "基準部分" := by native_decide
example : isShortLabel "堆" = true := by native_decide
example : isShortLabel "堆" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "堆" := by native_decide
example : isShortLabel "堰" = true := by native_decide
example : isShortLabel "堰" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "堰" := by native_decide
example : isShortLabel "報酬等" = true := by native_decide
example : isShortLabel "報酬等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "報酬等" := by native_decide
example : isShortLabel "塗料の製造用" = true := by native_decide
example : isShortLabel "塗料の製造用" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "塗料の製造用" := by native_decide
example : isShortLabel "墓地" = true := by native_decide
example : isShortLabel "墓地" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "墓地" := by native_decide
example : isShortLabel "増改築等" = true := by native_decide
example : isShortLabel "増改築等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "増改築等" := by native_decide
example : isShortLabel "増築" = true := by native_decide
example : isShortLabel "増築" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "増築" := by native_decide
example : isShortLabel "壕" = true := by native_decide
example : isShortLabel "壕" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "壕" := by native_decide
example : isShortLabel "変動所得" = true := by native_decide
example : isShortLabel "変動所得" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "変動所得" := by native_decide
example : isShortLabel "変換取得資産" = true := by native_decide
example : isShortLabel "変換取得資産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "変換取得資産" := by native_decide
example : isShortLabel "変換後資産" = true := by native_decide
example : isShortLabel "変換後資産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "変換後資産" := by native_decide
example : isShortLabel "変更の内容" = true := by native_decide
example : isShortLabel "変更の内容" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "変更の内容" := by native_decide
example : isShortLabel "変更の理由" = true := by native_decide
example : isShortLabel "変更の理由" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "変更の理由" := by native_decide
example : isShortLabel "外国" = true := by native_decide
example : isShortLabel "外国" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "外国" := by native_decide
example : isShortLabel "外国人贈与者" = true := by native_decide
example : isShortLabel "外国人贈与者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "外国人贈与者" := by native_decide
example : isShortLabel "外国法人の" = true := by native_decide
example : isShortLabel "外国法人の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "外国法人の" := by native_decide
example : isShortLabel "外国法人は" = true := by native_decide
example : isShortLabel "外国法人は" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "外国法人は" := by native_decide
example : isShortLabel "外国法人を" = true := by native_decide
example : isShortLabel "外国法人を" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "外国法人を" := by native_decide
example : isShortLabel "外国組合契約" = true := by native_decide
example : isShortLabel "外国組合契約" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "外国組合契約" := by native_decide
example : isShortLabel "外国貨物" = true := by native_decide
example : isShortLabel "外国貨物" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "外国貨物" := by native_decide
example : isShortLabel "外国通貨" = true := by native_decide
example : isShortLabel "外国通貨" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "外国通貨" := by native_decide
example : isShortLabel "外国関係会社" = true := by native_decide
example : isShortLabel "外国関係会社" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "外国関係会社" := by native_decide
example : isShortLabel "外貨預金" = true := by native_decide
example : isShortLabel "外貨預金" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "外貨預金" := by native_decide
example : isShortLabel "大蔵省令" = true := by native_decide
example : isShortLabel "大蔵省令" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "大蔵省令" := by native_decide
example : isShortLabel "大規模資産" = true := by native_decide
example : isShortLabel "大規模資産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "大規模資産" := by native_decide
example : isShortLabel "大阪陸運局長" = true := by native_decide
example : isShortLabel "大阪陸運局長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "大阪陸運局長" := by native_decide
example : isShortLabel "大韓民国" = true := by native_decide
example : isShortLabel "大韓民国" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "大韓民国" := by native_decide
example : isShortLabel "天然ガス" = true := by native_decide
example : isShortLabel "天然ガス" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "天然ガス" := by native_decide
example : isShortLabel "天然資源" = true := by native_decide
example : isShortLabel "天然資源" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "天然資源" := by native_decide
example : isShortLabel "契約対象者" = true := by native_decide
example : isShortLabel "契約対象者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "契約対象者" := by native_decide
example : isShortLabel "契約者" = true := by native_decide
example : isShortLabel "契約者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "契約者" := by native_decide
example : isShortLabel "好飲料税" = true := by native_decide
example : isShortLabel "好飲料税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "好飲料税" := by native_decide
example : isShortLabel "娩" = true := by native_decide
example : isShortLabel "娩" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "娩" := by native_decide
example : isShortLabel "学校" = true := by native_decide
example : isShortLabel "学校" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "学校" := by native_decide
example : isShortLabel "学校、" = true := by native_decide
example : isShortLabel "学校、" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "学校、" := by native_decide
example : isShortLabel "学校又は" = true := by native_decide
example : isShortLabel "学校又は" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "学校又は" := by native_decide
example : isShortLabel "学校数" = true := by native_decide
example : isShortLabel "学校数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "学校数" := by native_decide
example : isShortLabel "学校法人" = true := by native_decide
example : isShortLabel "学校法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "学校法人" := by native_decide
example : isShortLabel "学級" = true := by native_decide
example : isShortLabel "学級" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "学級" := by native_decide
example : isShortLabel "学級数" = true := by native_decide
example : isShortLabel "学級数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "学級数" := by native_decide
example : isShortLabel "学術研究用品" = true := by native_decide
example : isShortLabel "学術研究用品" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "学術研究用品" := by native_decide
example : isShortLabel "宅地等" = true := by native_decide
example : isShortLabel "宅地等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "宅地等" := by native_decide
example : isShortLabel "宅地等の区分" = true := by native_decide
example : isShortLabel "宅地等の区分" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "宅地等の区分" := by native_decide
example : isShortLabel "宅地開発税" = true := by native_decide
example : isShortLabel "宅地開発税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "宅地開発税" := by native_decide
example : isShortLabel "完全子会社の" = true := by native_decide
example : isShortLabel "完全子会社の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "完全子会社の" := by native_decide
example : isShortLabel "完全支配関係" = true := by native_decide
example : isShortLabel "完全支配関係" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "完全支配関係" := by native_decide
example : isShortLabel "完納されない" = true := by native_decide
example : isShortLabel "完納されない" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "完納されない" := by native_decide
example : isShortLabel "完納しない" = true := by native_decide
example : isShortLabel "完納しない" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "完納しない" := by native_decide
example : isShortLabel "完納する" = true := by native_decide
example : isShortLabel "完納する" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "完納する" := by native_decide
example : isShortLabel "宗教法人" = true := by native_decide
example : isShortLabel "宗教法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "宗教法人" := by native_decide
example : isShortLabel "定める時" = true := by native_decide
example : isShortLabel "定める時" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "定める時" := by native_decide
example : isShortLabel "定める金額" = true := by native_decide
example : isShortLabel "定める金額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "定める金額" := by native_decide
example : isShortLabel "定員等" = true := by native_decide
example : isShortLabel "定員等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "定員等" := by native_decide
example : isShortLabel "定款の変更" = true := by native_decide
example : isShortLabel "定款の変更" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "定款の変更" := by native_decide
example : isShortLabel "定款等の写し" = true := by native_decide
example : isShortLabel "定款等の写し" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "定款等の写し" := by native_decide
example : isShortLabel "定率法" = true := by native_decide
example : isShortLabel "定率法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "定率法" := by native_decide
example : isShortLabel "定額法" = true := by native_decide
example : isShortLabel "定額法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "定額法" := by native_decide
example : isShortLabel "実用新案権" = true := by native_decide
example : isShortLabel "実用新案権" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "実用新案権" := by native_decide
example : isShortLabel "実績判定期間" = true := by native_decide
example : isShortLabel "実績判定期間" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "実績判定期間" := by native_decide
example : isShortLabel "実質支配関係" = true := by native_decide
example : isShortLabel "実質支配関係" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "実質支配関係" := by native_decide
example : isShortLabel "実質的支配者" = true := by native_decide
example : isShortLabel "実質的支配者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "実質的支配者" := by native_decide
example : isShortLabel "家屋" = true := by native_decide
example : isShortLabel "家屋" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "家屋" := by native_decide
example : isShortLabel "家屋課税台帳" = true := by native_decide
example : isShortLabel "家屋課税台帳" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "家屋課税台帳" := by native_decide
example : isShortLabel "家族" = true := by native_decide
example : isShortLabel "家族" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "家族" := by native_decide
example : isShortLabel "宿泊施設" = true := by native_decide
example : isShortLabel "宿泊施設" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "宿泊施設" := by native_decide
example : isShortLabel "宿舎" = true := by native_decide
example : isShortLabel "宿舎" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "宿舎" := by native_decide
example : isShortLabel "寄託先美術館" = true := by native_decide
example : isShortLabel "寄託先美術館" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "寄託先美術館" := by native_decide
example : isShortLabel "寄託契約" = true := by native_decide
example : isShortLabel "寄託契約" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "寄託契約" := by native_decide
example : isShortLabel "寄託相続人" = true := by native_decide
example : isShortLabel "寄託相続人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "寄託相続人" := by native_decide
example : isShortLabel "寄附金の額" = true := by native_decide
example : isShortLabel "寄附金の額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "寄附金の額" := by native_decide
example : isShortLabel "密度補正" = true := by native_decide
example : isShortLabel "密度補正" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "密度補正" := by native_decide
example : isShortLabel "寒冷補正" = true := by native_decide
example : isShortLabel "寒冷補正" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "寒冷補正" := by native_decide
example : isShortLabel "寡婦" = true := by native_decide
example : isShortLabel "寡婦" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "寡婦" := by native_decide
example : isShortLabel "審査請求人" = true := by native_decide
example : isShortLabel "審査請求人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "審査請求人" := by native_decide
example : isShortLabel "寮等所在地" = true := by native_decide
example : isShortLabel "寮等所在地" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "寮等所在地" := by native_decide
example : isShortLabel "寸法" = true := by native_decide
example : isShortLabel "寸法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "寸法" := by native_decide
example : isShortLabel "対する所得税" = true := by native_decide
example : isShortLabel "対する所得税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "対する所得税" := by native_decide
example : isShortLabel "対価の額" = true := by native_decide
example : isShortLabel "対価の額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "対価の額" := by native_decide
example : isShortLabel "対償取得資産" = true := by native_decide
example : isShortLabel "対償取得資産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "対償取得資産" := by native_decide
example : isShortLabel "対応するもの" = true := by native_decide
example : isShortLabel "対応するもの" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "対応するもの" := by native_decide
example : isShortLabel "対象会計年度" = true := by native_decide
example : isShortLabel "対象会計年度" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "対象会計年度" := by native_decide
example : isShortLabel "対象使用料" = true := by native_decide
example : isShortLabel "対象使用料" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "対象使用料" := by native_decide
example : isShortLabel "対象使用料の" = true := by native_decide
example : isShortLabel "対象使用料の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "対象使用料の" := by native_decide
example : isShortLabel "対象利子" = true := by native_decide
example : isShortLabel "対象利子" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "対象利子" := by native_decide
example : isShortLabel "対象利子で" = true := by native_decide
example : isShortLabel "対象利子で" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "対象利子で" := by native_decide
example : isShortLabel "対象利子の" = true := by native_decide
example : isShortLabel "対象利子の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "対象利子の" := by native_decide
example : isShortLabel "対象施設" = true := by native_decide
example : isShortLabel "対象施設" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "対象施設" := by native_decide
example : isShortLabel "対象株式" = true := by native_decide
example : isShortLabel "対象株式" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "対象株式" := by native_decide
example : isShortLabel "対象法人" = true := by native_decide
example : isShortLabel "対象法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "対象法人" := by native_decide
example : isShortLabel "対象法人に" = true := by native_decide
example : isShortLabel "対象法人に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "対象法人に" := by native_decide
example : isShortLabel "対象法人の" = true := by native_decide
example : isShortLabel "対象法人の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "対象法人の" := by native_decide
example : isShortLabel "対象租税" = true := by native_decide
example : isShortLabel "対象租税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "対象租税" := by native_decide
example : isShortLabel "対象設備" = true := by native_decide
example : isShortLabel "対象設備" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "対象設備" := by native_decide
example : isShortLabel "対象配当" = true := by native_decide
example : isShortLabel "対象配当" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "対象配当" := by native_decide
example : isShortLabel "対象配当に" = true := by native_decide
example : isShortLabel "対象配当に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "対象配当に" := by native_decide
example : isShortLabel "対象配当等" = true := by native_decide
example : isShortLabel "対象配当等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "対象配当等" := by native_decide
example : isShortLabel "対象配当等の" = true := by native_decide
example : isShortLabel "対象配当等の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "対象配当等の" := by native_decide
example : isShortLabel "対象配当等（" = true := by native_decide
example : isShortLabel "対象配当等（" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "対象配当等（" := by native_decide
example : isShortLabel "専有部分税額" = true := by native_decide
example : isShortLabel "専有部分税額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "専有部分税額" := by native_decide
example : isShortLabel "導管会社等" = true := by native_decide
example : isShortLabel "導管会社等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "導管会社等" := by native_decide
example : isShortLabel "小売業" = true := by native_decide
example : isShortLabel "小売業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "小売業" := by native_decide
example : isShortLabel "小売販売業者" = true := by native_decide
example : isShortLabel "小売販売業者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "小売販売業者" := by native_decide
example : isShortLabel "小学校費" = true := by native_decide
example : isShortLabel "小学校費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "小学校費" := by native_decide
example : isShortLabel "小麦粉" = true := by native_decide
example : isShortLabel "小麦粉" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "小麦粉" := by native_decide
example : isShortLabel "居住の用" = true := by native_decide
example : isShortLabel "居住の用" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "居住の用" := by native_decide
example : isShortLabel "居住地国" = true := by native_decide
example : isShortLabel "居住地国" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "居住地国" := by native_decide
example : isShortLabel "居所）" = true := by native_decide
example : isShortLabel "居所）" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "居所）" := by native_decide
example : isShortLabel "展示又は使用" = true := by native_decide
example : isShortLabel "展示又は使用" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "展示又は使用" := by native_decide
example : isShortLabel "展示施設" = true := by native_decide
example : isShortLabel "展示施設" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "展示施設" := by native_decide
example : isShortLabel "履歴書" = true := by native_decide
example : isShortLabel "履歴書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "履歴書" := by native_decide
example : isShortLabel "山林" = true := by native_decide
example : isShortLabel "山林" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "山林" := by native_decide
example : isShortLabel "工具" = true := by native_decide
example : isShortLabel "工具" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "工具" := by native_decide
example : isShortLabel "工場" = true := by native_decide
example : isShortLabel "工場" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "工場" := by native_decide
example : isShortLabel "差益金額" = true := by native_decide
example : isShortLabel "差益金額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "差益金額" := by native_decide
example : isShortLabel "差額" = true := by native_decide
example : isShortLabel "差額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "差額" := by native_decide
example : isShortLabel "市町村に" = true := by native_decide
example : isShortLabel "市町村に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "市町村に" := by native_decide
example : isShortLabel "市町村の区分" = true := by native_decide
example : isShortLabel "市町村の区分" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "市町村の区分" := by native_decide
example : isShortLabel "市町村は" = true := by native_decide
example : isShortLabel "市町村は" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "市町村は" := by native_decide
example : isShortLabel "市町村内" = true := by native_decide
example : isShortLabel "市町村内" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "市町村内" := by native_decide
example : isShortLabel "市町村民税で" = true := by native_decide
example : isShortLabel "市町村民税で" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "市町村民税で" := by native_decide
example : isShortLabel "市町村民税に" = true := by native_decide
example : isShortLabel "市町村民税に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "市町村民税に" := by native_decide
example : isShortLabel "市町村民税額" = true := by native_decide
example : isShortLabel "市町村民税額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "市町村民税額" := by native_decide
example : isShortLabel "市町村長" = true := by native_decide
example : isShortLabel "市町村長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "市町村長" := by native_decide
example : isShortLabel "市部人口" = true := by native_decide
example : isShortLabel "市部人口" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "市部人口" := by native_decide
example : isShortLabel "席貸業" = true := by native_decide
example : isShortLabel "席貸業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "席貸業" := by native_decide
example : isShortLabel "平均売上金額" = true := by native_decide
example : isShortLabel "平均売上金額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "平均売上金額" := by native_decide
example : isShortLabel "平均負債残高" = true := by native_decide
example : isShortLabel "平均負債残高" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "平均負債残高" := by native_decide
example : isShortLabel "平成七年" = true := by native_decide
example : isShortLabel "平成七年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "平成七年" := by native_decide
example : isShortLabel "平成七年度" = true := by native_decide
example : isShortLabel "平成七年度" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "平成七年度" := by native_decide
example : isShortLabel "平成九年" = true := by native_decide
example : isShortLabel "平成九年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "平成九年" := by native_decide
example : isShortLabel "平成九年度" = true := by native_decide
example : isShortLabel "平成九年度" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "平成九年度" := by native_decide
example : isShortLabel "平成二十一年" = true := by native_decide
example : isShortLabel "平成二十一年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "平成二十一年" := by native_decide
example : isShortLabel "平成二十八年" = true := by native_decide
example : isShortLabel "平成二十八年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "平成二十八年" := by native_decide
example : isShortLabel "平成五年度" = true := by native_decide
example : isShortLabel "平成五年度" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "平成五年度" := by native_decide
example : isShortLabel "平成五年度に" = true := by native_decide
example : isShortLabel "平成五年度に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "平成五年度に" := by native_decide
example : isShortLabel "平成八年" = true := by native_decide
example : isShortLabel "平成八年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "平成八年" := by native_decide
example : isShortLabel "平成八年度" = true := by native_decide
example : isShortLabel "平成八年度" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "平成八年度" := by native_decide
example : isShortLabel "平成六年度" = true := by native_decide
example : isShortLabel "平成六年度" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "平成六年度" := by native_decide
example : isShortLabel "平成十一年" = true := by native_decide
example : isShortLabel "平成十一年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "平成十一年" := by native_decide
example : isShortLabel "平成十七年" = true := by native_decide
example : isShortLabel "平成十七年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "平成十七年" := by native_decide
example : isShortLabel "平成十三年" = true := by native_decide
example : isShortLabel "平成十三年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "平成十三年" := by native_decide
example : isShortLabel "平成十二年" = true := by native_decide
example : isShortLabel "平成十二年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "平成十二年" := by native_decide
example : isShortLabel "平成十五年" = true := by native_decide
example : isShortLabel "平成十五年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "平成十五年" := by native_decide
example : isShortLabel "平成十八年" = true := by native_decide
example : isShortLabel "平成十八年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "平成十八年" := by native_decide
example : isShortLabel "平成十六年" = true := by native_decide
example : isShortLabel "平成十六年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "平成十六年" := by native_decide
example : isShortLabel "平成十四年" = true := by native_decide
example : isShortLabel "平成十四年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "平成十四年" := by native_decide
example : isShortLabel "平成十年" = true := by native_decide
example : isShortLabel "平成十年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "平成十年" := by native_decide
example : isShortLabel "年" = true := by native_decide
example : isShortLabel "年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "年" := by native_decide
example : isShortLabel "年の" = true := by native_decide
example : isShortLabel "年の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "年の" := by native_decide
example : isShortLabel "年の中途" = true := by native_decide
example : isShortLabel "年の中途" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "年の中途" := by native_decide
example : isShortLabel "年二千万円" = true := by native_decide
example : isShortLabel "年二千万円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "年二千万円" := by native_decide
example : isShortLabel "年分" = true := by native_decide
example : isShortLabel "年分" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "年分" := by native_decide
example : isShortLabel "年度の区分" = true := by native_decide
example : isShortLabel "年度の区分" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "年度の区分" := by native_decide
example : isShortLabel "年度及び税目" = true := by native_decide
example : isShortLabel "年度及び税目" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "年度及び税目" := by native_decide
example : isShortLabel "年金" = true := by native_decide
example : isShortLabel "年金" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "年金" := by native_decide
example : isShortLabel "年金保険者" = true := by native_decide
example : isShortLabel "年金保険者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "年金保険者" := by native_decide
example : isShortLabel "年金基金" = true := by native_decide
example : isShortLabel "年金基金" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "年金基金" := by native_decide
example : isShortLabel "年額　二万円" = true := by native_decide
example : isShortLabel "年額　二万円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "年額　二万円" := by native_decide
example : isShortLabel "年額　二千円" = true := by native_decide
example : isShortLabel "年額　二千円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "年額　二千円" := by native_decide
example : isShortLabel "年額　二百円" = true := by native_decide
example : isShortLabel "年額　二百円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "年額　二百円" := by native_decide
example : isShortLabel "年額　五万円" = true := by native_decide
example : isShortLabel "年額　五万円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "年額　五万円" := by native_decide
example : isShortLabel "年額　五千円" = true := by native_decide
example : isShortLabel "年額　五千円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "年額　五千円" := by native_decide
example : isShortLabel "年額　六千円" = true := by native_decide
example : isShortLabel "年額　六千円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "年額　六千円" := by native_decide
example : isShortLabel "年額　四百円" = true := by native_decide
example : isShortLabel "年額　四百円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "年額　四百円" := by native_decide
example : isShortLabel "広告業" = true := by native_decide
example : isShortLabel "広告業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "広告業" := by native_decide
example : isShortLabel "広島陸運局長" = true := by native_decide
example : isShortLabel "広島陸運局長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "広島陸運局長" := by native_decide
example : isShortLabel "床上" = true := by native_decide
example : isShortLabel "床上" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "床上" := by native_decide
example : isShortLabel "床下" = true := by native_decide
example : isShortLabel "床下" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "床下" := by native_decide
example : isShortLabel "庭球場" = true := by native_decide
example : isShortLabel "庭球場" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "庭球場" := by native_decide
example : isShortLabel "延滞金" = true := by native_decide
example : isShortLabel "延滞金" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "延滞金" := by native_decide
example : isShortLabel "延滞金の" = true := by native_decide
example : isShortLabel "延滞金の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "延滞金の" := by native_decide
example : isShortLabel "建物" = true := by native_decide
example : isShortLabel "建物" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "建物" := by native_decide
example : isShortLabel "建物附属設備" = true := by native_decide
example : isShortLabel "建物附属設備" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "建物附属設備" := by native_decide
example : isShortLabel "建築" = true := by native_decide
example : isShortLabel "建築" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "建築" := by native_decide
example : isShortLabel "建築士" = true := by native_decide
example : isShortLabel "建築士" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "建築士" := by native_decide
example : isShortLabel "建設工事保険" = true := by native_decide
example : isShortLabel "建設工事保険" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "建設工事保険" := by native_decide
example : isShortLabel "建設業" = true := by native_decide
example : isShortLabel "建設業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "建設業" := by native_decide
example : isShortLabel "建造物" = true := by native_decide
example : isShortLabel "建造物" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "建造物" := by native_decide
example : isShortLabel "弁理士業" = true := by native_decide
example : isShortLabel "弁理士業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "弁理士業" := by native_decide
example : isShortLabel "弁護士業" = true := by native_decide
example : isShortLabel "弁護士業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "弁護士業" := by native_decide
example : isShortLabel "弓場" = true := by native_decide
example : isShortLabel "弓場" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "弓場" := by native_decide
example : isShortLabel "引取りの目的" = true := by native_decide
example : isShortLabel "引取りの目的" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "引取りの目的" := by native_decide
example : isShortLabel "引継給付率" = true := by native_decide
example : isShortLabel "引継給付率" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "引継給付率" := by native_decide
example : isShortLabel "引自動車" = true := by native_decide
example : isShortLabel "引自動車" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "引自動車" := by native_decide
example : isShortLabel "引自動車）" = true := by native_decide
example : isShortLabel "引自動車）" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "引自動車）" := by native_decide
example : isShortLabel "弛" = true := by native_decide
example : isShortLabel "弛" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "弛" := by native_decide
example : isShortLabel "強制換価手続" = true := by native_decide
example : isShortLabel "強制換価手続" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "強制換価手続" := by native_decide
example : isShortLabel "当座預金通帳" = true := by native_decide
example : isShortLabel "当座預金通帳" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当座預金通帳" := by native_decide
example : isShortLabel "当該予定日" = true := by native_decide
example : isShortLabel "当該予定日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該予定日" := by native_decide
example : isShortLabel "当該事実" = true := by native_decide
example : isShortLabel "当該事実" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該事実" := by native_decide
example : isShortLabel "当該事業者" = true := by native_decide
example : isShortLabel "当該事業者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該事業者" := by native_decide
example : isShortLabel "当該事項" = true := by native_decide
example : isShortLabel "当該事項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該事項" := by native_decide
example : isShortLabel "当該他の場所" = true := by native_decide
example : isShortLabel "当該他の場所" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該他の場所" := by native_decide
example : isShortLabel "当該住宅用地" = true := by native_decide
example : isShortLabel "当該住宅用地" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該住宅用地" := by native_decide
example : isShortLabel "当該作成場所" = true := by native_decide
example : isShortLabel "当該作成場所" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該作成場所" := by native_decide
example : isShortLabel "当該使用料" = true := by native_decide
example : isShortLabel "当該使用料" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該使用料" := by native_decide
example : isShortLabel "当該取得の日" = true := by native_decide
example : isShortLabel "当該取得の日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該取得の日" := by native_decide
example : isShortLabel "当該各号" = true := by native_decide
example : isShortLabel "当該各号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該各号" := by native_decide
example : isShortLabel "当該合併の日" = true := by native_decide
example : isShortLabel "当該合併の日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該合併の日" := by native_decide
example : isShortLabel "当該土地" = true := by native_decide
example : isShortLabel "当該土地" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該土地" := by native_decide
example : isShortLabel "当該基準日" = true := by native_decide
example : isShortLabel "当該基準日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該基準日" := by native_decide
example : isShortLabel "当該報酬" = true := by native_decide
example : isShortLabel "当該報酬" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該報酬" := by native_decide
example : isShortLabel "当該場所" = true := by native_decide
example : isShortLabel "当該場所" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該場所" := by native_decide
example : isShortLabel "当該外国" = true := by native_decide
example : isShortLabel "当該外国" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該外国" := by native_decide
example : isShortLabel "当該外国法人" = true := by native_decide
example : isShortLabel "当該外国法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該外国法人" := by native_decide
example : isShortLabel "当該外国通貨" = true := by native_decide
example : isShortLabel "当該外国通貨" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該外国通貨" := by native_decide
example : isShortLabel "当該審査請求" = true := by native_decide
example : isShortLabel "当該審査請求" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該審査請求" := by native_decide
example : isShortLabel "当該小売業者" = true := by native_decide
example : isShortLabel "当該小売業者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該小売業者" := by native_decide
example : isShortLabel "当該居所地" = true := by native_decide
example : isShortLabel "当該居所地" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該居所地" := by native_decide
example : isShortLabel "当該市町村" = true := by native_decide
example : isShortLabel "当該市町村" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該市町村" := by native_decide
example : isShortLabel "当該市町村内" = true := by native_decide
example : isShortLabel "当該市町村内" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該市町村内" := by native_decide
example : isShortLabel "当該帳簿" = true := by native_decide
example : isShortLabel "当該帳簿" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該帳簿" := by native_decide
example : isShortLabel "当該年" = true := by native_decide
example : isShortLabel "当該年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該年" := by native_decide
example : isShortLabel "当該年度中" = true := by native_decide
example : isShortLabel "当該年度中" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該年度中" := by native_decide
example : isShortLabel "当該所在地" = true := by native_decide
example : isShortLabel "当該所在地" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該所在地" := by native_decide
example : isShortLabel "当該所得税" = true := by native_decide
example : isShortLabel "当該所得税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該所得税" := by native_decide
example : isShortLabel "当該承継の日" = true := by native_decide
example : isShortLabel "当該承継の日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該承継の日" := by native_decide
example : isShortLabel "当該承認" = true := by native_decide
example : isShortLabel "当該承認" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該承認" := by native_decide
example : isShortLabel "当該承認の日" = true := by native_decide
example : isShortLabel "当該承認の日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該承認の日" := by native_decide
example : isShortLabel "当該提出期限" = true := by native_decide
example : isShortLabel "当該提出期限" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該提出期限" := by native_decide
example : isShortLabel "当該支払を" = true := by native_decide
example : isShortLabel "当該支払を" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該支払を" := by native_decide
example : isShortLabel "当該支払総額" = true := by native_decide
example : isShortLabel "当該支払総額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該支払総額" := by native_decide
example : isShortLabel "当該支配関係" = true := by native_decide
example : isShortLabel "当該支配関係" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該支配関係" := by native_decide
example : isShortLabel "当該放棄" = true := by native_decide
example : isShortLabel "当該放棄" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該放棄" := by native_decide
example : isShortLabel "当該施設" = true := by native_decide
example : isShortLabel "当該施設" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該施設" := by native_decide
example : isShortLabel "当該期限" = true := by native_decide
example : isShortLabel "当該期限" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該期限" := by native_decide
example : isShortLabel "当該末日" = true := by native_decide
example : isShortLabel "当該末日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該末日" := by native_decide
example : isShortLabel "当該株式又は" = true := by native_decide
example : isShortLabel "当該株式又は" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該株式又は" := by native_decide
example : isShortLabel "当該決定の日" = true := by native_decide
example : isShortLabel "当該決定の日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該決定の日" := by native_decide
example : isShortLabel "当該法人" = true := by native_decide
example : isShortLabel "当該法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該法人" := by native_decide
example : isShortLabel "当該法人税" = true := by native_decide
example : isShortLabel "当該法人税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該法人税" := by native_decide
example : isShortLabel "当該法人（" = true := by native_decide
example : isShortLabel "当該法人（" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該法人（" := by native_decide
example : isShortLabel "当該法令" = true := by native_decide
example : isShortLabel "当該法令" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該法令" := by native_decide
example : isShortLabel "当該漁船" = true := by native_decide
example : isShortLabel "当該漁船" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該漁船" := by native_decide
example : isShortLabel "当該申告書" = true := by native_decide
example : isShortLabel "当該申告書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該申告書" := by native_decide
example : isShortLabel "当該異動事項" = true := by native_decide
example : isShortLabel "当該異動事項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該異動事項" := by native_decide
example : isShortLabel "当該相手国" = true := by native_decide
example : isShortLabel "当該相手国" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該相手国" := by native_decide
example : isShortLabel "当該相手国等" = true := by native_decide
example : isShortLabel "当該相手国等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該相手国等" := by native_decide
example : isShortLabel "当該移行期限" = true := by native_decide
example : isShortLabel "当該移行期限" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該移行期限" := by native_decide
example : isShortLabel "当該税務署長" = true := by native_decide
example : isShortLabel "当該税務署長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該税務署長" := by native_decide
example : isShortLabel "当該税関官署" = true := by native_decide
example : isShortLabel "当該税関官署" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該税関官署" := by native_decide
example : isShortLabel "当該税関支署" = true := by native_decide
example : isShortLabel "当該税関支署" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該税関支署" := by native_decide
example : isShortLabel "当該納付の日" = true := by native_decide
example : isShortLabel "当該納付の日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該納付の日" := by native_decide
example : isShortLabel "当該終了の日" = true := by native_decide
example : isShortLabel "当該終了の日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該終了の日" := by native_decide
example : isShortLabel "当該経費の額" = true := by native_decide
example : isShortLabel "当該経費の額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該経費の額" := by native_decide
example : isShortLabel "当該蔵置場" = true := by native_decide
example : isShortLabel "当該蔵置場" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該蔵置場" := by native_decide
example : isShortLabel "当該製造場" = true := by native_decide
example : isShortLabel "当該製造場" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該製造場" := by native_decide
example : isShortLabel "当該規定" = true := by native_decide
example : isShortLabel "当該規定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該規定" := by native_decide
example : isShortLabel "当該親族" = true := by native_decide
example : isShortLabel "当該親族" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該親族" := by native_decide
example : isShortLabel "当該設立の日" = true := by native_decide
example : isShortLabel "当該設立の日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該設立の日" := by native_decide
example : isShortLabel "当該許可" = true := by native_decide
example : isShortLabel "当該許可" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該許可" := by native_decide
example : isShortLabel "当該譲渡の日" = true := by native_decide
example : isShortLabel "当該譲渡の日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該譲渡の日" := by native_decide
example : isShortLabel "当該譲渡等" = true := by native_decide
example : isShortLabel "当該譲渡等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該譲渡等" := by native_decide
example : isShortLabel "当該財産等" = true := by native_decide
example : isShortLabel "当該財産等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該財産等" := by native_decide
example : isShortLabel "当該資産" = true := by native_decide
example : isShortLabel "当該資産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該資産" := by native_decide
example : isShortLabel "当該贈与者" = true := by native_decide
example : isShortLabel "当該贈与者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該贈与者" := by native_decide
example : isShortLabel "当該車両番号" = true := by native_decide
example : isShortLabel "当該車両番号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該車両番号" := by native_decide
example : isShortLabel "当該輸入数量" = true := by native_decide
example : isShortLabel "当該輸入数量" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該輸入数量" := by native_decide
example : isShortLabel "当該還付を" = true := by native_decide
example : isShortLabel "当該還付を" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該還付を" := by native_decide
example : isShortLabel "当該還付金等" = true := by native_decide
example : isShortLabel "当該還付金等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該還付金等" := by native_decide
example : isShortLabel "当該都民税" = true := by native_decide
example : isShortLabel "当該都民税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該都民税" := by native_decide
example : isShortLabel "当該配偶者" = true := by native_decide
example : isShortLabel "当該配偶者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該配偶者" := by native_decide
example : isShortLabel "当該配分額" = true := by native_decide
example : isShortLabel "当該配分額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該配分額" := by native_decide
example : isShortLabel "当該金銭の額" = true := by native_decide
example : isShortLabel "当該金銭の額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該金銭の額" := by native_decide
example : isShortLabel "当該金額" = true := by native_decide
example : isShortLabel "当該金額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "当該金額" := by native_decide
example : isShortLabel "役員" = true := by native_decide
example : isShortLabel "役員" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "役員" := by native_decide
example : isShortLabel "役員の親族" = true := by native_decide
example : isShortLabel "役員の親族" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "役員の親族" := by native_decide
example : isShortLabel "従業者の数" = true := by native_decide
example : isShortLabel "従業者の数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "従業者の数" := by native_decide
example : isShortLabel "従業者割" = true := by native_decide
example : isShortLabel "従業者割" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "従業者割" := by native_decide
example : isShortLabel "従業者数" = true := by native_decide
example : isShortLabel "従業者数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "従業者数" := by native_decide
example : isShortLabel "従量割の税率" = true := by native_decide
example : isShortLabel "従量割の税率" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "従量割の税率" := by native_decide
example : isShortLabel "徴収" = true := by native_decide
example : isShortLabel "徴収" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "徴収" := by native_decide
example : isShortLabel "徴収の" = true := by native_decide
example : isShortLabel "徴収の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "徴収の" := by native_decide
example : isShortLabel "徴収の猶予" = true := by native_decide
example : isShortLabel "徴収の猶予" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "徴収の猶予" := by native_decide
example : isShortLabel "徴収を" = true := by native_decide
example : isShortLabel "徴収を" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "徴収を" := by native_decide
example : isShortLabel "徴収職員" = true := by native_decide
example : isShortLabel "徴収職員" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "徴収職員" := by native_decide
example : isShortLabel "徴税吏員" = true := by native_decide
example : isShortLabel "徴税吏員" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "徴税吏員" := by native_decide
example : isShortLabel "徴税費" = true := by native_decide
example : isShortLabel "徴税費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "徴税費" := by native_decide
example : isShortLabel "心身障害者" = true := by native_decide
example : isShortLabel "心身障害者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "心身障害者" := by native_decide
example : isShortLabel "快遊船" = true := by native_decide
example : isShortLabel "快遊船" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "快遊船" := by native_decide
example : isShortLabel "恒久的施設" = true := by native_decide
example : isShortLabel "恒久的施設" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "恒久的施設" := by native_decide
example : isShortLabel "恒久的施設に" = true := by native_decide
example : isShortLabel "恒久的施設に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "恒久的施設に" := by native_decide
example : isShortLabel "恒久的施設の" = true := by native_decide
example : isShortLabel "恒久的施設の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "恒久的施設の" := by native_decide
example : isShortLabel "恒久的施設等" = true := by native_decide
example : isShortLabel "恒久的施設等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "恒久的施設等" := by native_decide
example : isShortLabel "想定価額" = true := by native_decide
example : isShortLabel "想定価額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "想定価額" := by native_decide
example : isShortLabel "意匠権" = true := by native_decide
example : isShortLabel "意匠権" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "意匠権" := by native_decide
example : isShortLabel "慈善又は救" = true := by native_decide
example : isShortLabel "慈善又は救" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "慈善又は救" := by native_decide
example : isShortLabel "態容補正" = true := by native_decide
example : isShortLabel "態容補正" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "態容補正" := by native_decide
example : isShortLabel "我が国" = true := by native_decide
example : isShortLabel "我が国" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "我が国" := by native_decide
example : isShortLabel "戒告" = true := by native_decide
example : isShortLabel "戒告" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "戒告" := by native_decide
example : isShortLabel "戦傷病者手帳" = true := by native_decide
example : isShortLabel "戦傷病者手帳" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "戦傷病者手帳" := by native_decide
example : isShortLabel "戸" = true := by native_decide
example : isShortLabel "戸" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "戸" := by native_decide
example : isShortLabel "戸籍数" = true := by native_decide
example : isShortLabel "戸籍数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "戸籍数" := by native_decide
example : isShortLabel "所在地" = true := by native_decide
example : isShortLabel "所在地" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所在地" := by native_decide
example : isShortLabel "所在地国" = true := by native_decide
example : isShortLabel "所在地国" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所在地国" := by native_decide
example : isShortLabel "所在地（" = true := by native_decide
example : isShortLabel "所在地（" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所在地（" := by native_decide
example : isShortLabel "所得" = true := by native_decide
example : isShortLabel "所得" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所得" := by native_decide
example : isShortLabel "所得の金額" = true := by native_decide
example : isShortLabel "所得の金額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所得の金額" := by native_decide
example : isShortLabel "所得割" = true := by native_decide
example : isShortLabel "所得割" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所得割" := by native_decide
example : isShortLabel "所得割額" = true := by native_decide
example : isShortLabel "所得割額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所得割額" := by native_decide
example : isShortLabel "所得税" = true := by native_decide
example : isShortLabel "所得税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所得税" := by native_decide
example : isShortLabel "所得税、" = true := by native_decide
example : isShortLabel "所得税、" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所得税、" := by native_decide
example : isShortLabel "所得税が" = true := by native_decide
example : isShortLabel "所得税が" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所得税が" := by native_decide
example : isShortLabel "所得税と" = true := by native_decide
example : isShortLabel "所得税と" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所得税と" := by native_decide
example : isShortLabel "所得税に" = true := by native_decide
example : isShortLabel "所得税に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所得税に" := by native_decide
example : isShortLabel "所得税につき" = true := by native_decide
example : isShortLabel "所得税につき" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所得税につき" := by native_decide
example : isShortLabel "所得税に係る" = true := by native_decide
example : isShortLabel "所得税に係る" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所得税に係る" := by native_decide
example : isShortLabel "所得税の" = true := by native_decide
example : isShortLabel "所得税の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所得税の" := by native_decide
example : isShortLabel "所得税の免除" = true := by native_decide
example : isShortLabel "所得税の免除" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所得税の免除" := by native_decide
example : isShortLabel "所得税の徴収" = true := by native_decide
example : isShortLabel "所得税の徴収" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所得税の徴収" := by native_decide
example : isShortLabel "所得税の還付" = true := by native_decide
example : isShortLabel "所得税の還付" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所得税の還付" := by native_decide
example : isShortLabel "所得税の額、" = true := by native_decide
example : isShortLabel "所得税の額、" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所得税の額、" := by native_decide
example : isShortLabel "所得税の額に" = true := by native_decide
example : isShortLabel "所得税の額に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所得税の額に" := by native_decide
example : isShortLabel "所得税の額は" = true := by native_decide
example : isShortLabel "所得税の額は" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所得税の額は" := by native_decide
example : isShortLabel "所得税の額（" = true := by native_decide
example : isShortLabel "所得税の額（" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所得税の額（" := by native_decide
example : isShortLabel "所得税を" = true := by native_decide
example : isShortLabel "所得税を" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所得税を" := by native_decide
example : isShortLabel "所得税法" = true := by native_decide
example : isShortLabel "所得税法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所得税法" := by native_decide
example : isShortLabel "所得税額" = true := by native_decide
example : isShortLabel "所得税額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所得税額" := by native_decide
example : isShortLabel "所得税（" = true := by native_decide
example : isShortLabel "所得税（" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所得税（" := by native_decide
example : isShortLabel "所得金額" = true := by native_decide
example : isShortLabel "所得金額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所得金額" := by native_decide
example : isShortLabel "所掌事務" = true := by native_decide
example : isShortLabel "所掌事務" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所掌事務" := by native_decide
example : isShortLabel "所有持分" = true := by native_decide
example : isShortLabel "所有持分" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所有持分" := by native_decide
example : isShortLabel "所有者" = true := by native_decide
example : isShortLabel "所有者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所有者" := by native_decide
example : isShortLabel "所轄国税局長" = true := by native_decide
example : isShortLabel "所轄国税局長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "所轄国税局長" := by native_decide
example : isShortLabel "扉" = true := by native_decide
example : isShortLabel "扉" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "扉" := by native_decide
example : isShortLabel "手形" = true := by native_decide
example : isShortLabel "手形" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "手形" := by native_decide
example : isShortLabel "扶養義務者" = true := by native_decide
example : isShortLabel "扶養義務者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "扶養義務者" := by native_decide
example : isShortLabel "扶養親族" = true := by native_decide
example : isShortLabel "扶養親族" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "扶養親族" := by native_decide
example : isShortLabel "扶養親族の数" = true := by native_decide
example : isShortLabel "扶養親族の数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "扶養親族の数" := by native_decide
example : isShortLabel "承継市町村等" = true := by native_decide
example : isShortLabel "承継市町村等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "承継市町村等" := by native_decide
example : isShortLabel "技術研究組合" = true := by native_decide
example : isShortLabel "技術研究組合" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "技術研究組合" := by native_decide
example : isShortLabel "投資予定額" = true := by native_decide
example : isShortLabel "投資予定額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "投資予定額" := by native_decide
example : isShortLabel "投資信託" = true := by native_decide
example : isShortLabel "投資信託" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "投資信託" := by native_decide
example : isShortLabel "投資法人" = true := by native_decide
example : isShortLabel "投資法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "投資法人" := by native_decide
example : isShortLabel "投資法人、" = true := by native_decide
example : isShortLabel "投資法人、" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "投資法人、" := by native_decide
example : isShortLabel "投資法人及び" = true := by native_decide
example : isShortLabel "投資法人及び" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "投資法人及び" := by native_decide
example : isShortLabel "投資組合" = true := by native_decide
example : isShortLabel "投資組合" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "投資組合" := by native_decide
example : isShortLabel "投資組合契約" = true := by native_decide
example : isShortLabel "投資組合契約" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "投資組合契約" := by native_decide
example : isShortLabel "投資補正Ⅱ" = true := by native_decide
example : isShortLabel "投資補正Ⅱ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "投資補正Ⅱ" := by native_decide
example : isShortLabel "投資証券" = true := by native_decide
example : isShortLabel "投資証券" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "投資証券" := by native_decide
example : isShortLabel "抹" = true := by native_decide
example : isShortLabel "抹" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "抹" := by native_decide
example : isShortLabel "招集されない" = true := by native_decide
example : isShortLabel "招集されない" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "招集されない" := by native_decide
example : isShortLabel "拳" = true := by native_decide
example : isShortLabel "拳" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "拳" := by native_decide
example : isShortLabel "持分" = true := by native_decide
example : isShortLabel "持分" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "持分" := by native_decide
example : isShortLabel "指定大学等" = true := by native_decide
example : isShortLabel "指定大学等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "指定大学等" := by native_decide
example : isShortLabel "指定市算定額" = true := by native_decide
example : isShortLabel "指定市算定額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "指定市算定額" := by native_decide
example : isShortLabel "指定日" = true := by native_decide
example : isShortLabel "指定日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "指定日" := by native_decide
example : isShortLabel "指定期間" = true := by native_decide
example : isShortLabel "指定期間" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "指定期間" := by native_decide
example : isShortLabel "指定給油所" = true := by native_decide
example : isShortLabel "指定給油所" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "指定給油所" := by native_decide
example : isShortLabel "指定都市等" = true := by native_decide
example : isShortLabel "指定都市等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "指定都市等" := by native_decide
example : isShortLabel "指標" = true := by native_decide
example : isShortLabel "指標" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "指標" := by native_decide
example : isShortLabel "振替口座簿" = true := by native_decide
example : isShortLabel "振替口座簿" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "振替口座簿" := by native_decide
example : isShortLabel "振替株式等" = true := by native_decide
example : isShortLabel "振替株式等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "振替株式等" := by native_decide
example : isShortLabel "振替記載等" = true := by native_decide
example : isShortLabel "振替記載等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "振替記載等" := by native_decide
example : isShortLabel "捜索した日時" = true := by native_decide
example : isShortLabel "捜索した日時" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "捜索した日時" := by native_decide
example : isShortLabel "据置貯金" = true := by native_decide
example : isShortLabel "据置貯金" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "据置貯金" := by native_decide
example : isShortLabel "授業料" = true := by native_decide
example : isShortLabel "授業料" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "授業料" := by native_decide
example : isShortLabel "採掘鉱区" = true := by native_decide
example : isShortLabel "採掘鉱区" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "採掘鉱区" := by native_decide
example : isShortLabel "採草放牧地" = true := by native_decide
example : isShortLabel "採草放牧地" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "採草放牧地" := by native_decide
example : isShortLabel "控除額" = true := by native_decide
example : isShortLabel "控除額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "控除額" := by native_decide
example : isShortLabel "措置" = true := by native_decide
example : isShortLabel "措置" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "措置" := by native_decide
example : isShortLabel "措置法の条項" = true := by native_decide
example : isShortLabel "措置法の条項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "措置法の条項" := by native_decide
example : isShortLabel "掲げる事実" = true := by native_decide
example : isShortLabel "掲げる事実" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "掲げる事実" := by native_decide
example : isShortLabel "掲げる法人" = true := by native_decide
example : isShortLabel "掲げる法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "掲げる法人" := by native_decide
example : isShortLabel "掲げる給与" = true := by native_decide
example : isShortLabel "掲げる給与" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "掲げる給与" := by native_decide
example : isShortLabel "掲げる規定" = true := by native_decide
example : isShortLabel "掲げる規定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "掲げる規定" := by native_decide
example : isShortLabel "掲げる規定を" = true := by native_decide
example : isShortLabel "掲げる規定を" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "掲げる規定を" := by native_decide
example : isShortLabel "掲げる金額（" = true := by native_decide
example : isShortLabel "掲げる金額（" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "掲げる金額（" := by native_decide
example : isShortLabel "提供の" = true := by native_decide
example : isShortLabel "提供の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "提供の" := by native_decide
example : isShortLabel "提供を" = true := by native_decide
example : isShortLabel "提供を" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "提供を" := by native_decide
example : isShortLabel "提供をさせる" = true := by native_decide
example : isShortLabel "提供をさせる" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "提供をさせる" := by native_decide
example : isShortLabel "提供をすべき" = true := by native_decide
example : isShortLabel "提供をすべき" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "提供をすべき" := by native_decide
example : isShortLabel "提供催告書" = true := by native_decide
example : isShortLabel "提供催告書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "提供催告書" := by native_decide
example : isShortLabel "提供場所" = true := by native_decide
example : isShortLabel "提供場所" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "提供場所" := by native_decide
example : isShortLabel "提供通知書" = true := by native_decide
example : isShortLabel "提供通知書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "提供通知書" := by native_decide
example : isShortLabel "提出" = true := by native_decide
example : isShortLabel "提出" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "提出" := by native_decide
example : isShortLabel "提出した個人" = true := by native_decide
example : isShortLabel "提出した個人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "提出した個人" := by native_decide
example : isShortLabel "換地取得資産" = true := by native_decide
example : isShortLabel "換地取得資産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "換地取得資産" := by native_decide
example : isShortLabel "換算率" = true := by native_decide
example : isShortLabel "換算率" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "換算率" := by native_decide
example : isShortLabel "揮発油" = true := by native_decide
example : isShortLabel "揮発油" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "揮発油" := by native_decide
example : isShortLabel "揮発油税" = true := by native_decide
example : isShortLabel "揮発油税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "揮発油税" := by native_decide
example : isShortLabel "損害保険会社" = true := by native_decide
example : isShortLabel "損害保険会社" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "損害保険会社" := by native_decide
example : isShortLabel "損金算入）" = true := by native_decide
example : isShortLabel "損金算入）" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "損金算入）" := by native_decide
example : isShortLabel "損金経理" = true := by native_decide
example : isShortLabel "損金経理" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "損金経理" := by native_decide
example : isShortLabel "損）" = true := by native_decide
example : isShortLabel "損）" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "損）" := by native_decide
example : isShortLabel "搭" = true := by native_decide
example : isShortLabel "搭" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "搭" := by native_decide
example : isShortLabel "撚" = true := by native_decide
example : isShortLabel "撚" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "撚" := by native_decide
example : isShortLabel "播" = true := by native_decide
example : isShortLabel "播" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "播" := by native_decide
example : isShortLabel "支出した金額" = true := by native_decide
example : isShortLabel "支出した金額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "支出した金額" := by native_decide
example : isShortLabel "支払" = true := by native_decide
example : isShortLabel "支払" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "支払" := by native_decide
example : isShortLabel "支払の方法" = true := by native_decide
example : isShortLabel "支払の方法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "支払の方法" := by native_decide
example : isShortLabel "支払の請求" = true := by native_decide
example : isShortLabel "支払の請求" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "支払の請求" := by native_decide
example : isShortLabel "支払命令済額" = true := by native_decide
example : isShortLabel "支払命令済額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "支払命令済額" := by native_decide
example : isShortLabel "支払月" = true := by native_decide
example : isShortLabel "支払月" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "支払月" := by native_decide
example : isShortLabel "支払科目" = true := by native_decide
example : isShortLabel "支払科目" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "支払科目" := by native_decide
example : isShortLabel "支持物基数" = true := by native_decide
example : isShortLabel "支持物基数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "支持物基数" := by native_decide
example : isShortLabel "支配持分" = true := by native_decide
example : isShortLabel "支配持分" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "支配持分" := by native_decide
example : isShortLabel "支配日" = true := by native_decide
example : isShortLabel "支配日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "支配日" := by native_decide
example : isShortLabel "支配関係" = true := by native_decide
example : isShortLabel "支配関係" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "支配関係" := by native_decide
example : isShortLabel "改定取得価額" = true := by native_decide
example : isShortLabel "改定取得価額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "改定取得価額" := by native_decide
example : isShortLabel "改正法" = true := by native_decide
example : isShortLabel "改正法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "改正法" := by native_decide
example : isShortLabel "改築" = true := by native_decide
example : isShortLabel "改築" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "改築" := by native_decide
example : isShortLabel "放棄があつた" = true := by native_decide
example : isShortLabel "放棄があつた" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "放棄があつた" := by native_decide
example : isShortLabel "放棄により" = true := by native_decide
example : isShortLabel "放棄により" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "放棄により" := by native_decide
example : isShortLabel "政令" = true := by native_decide
example : isShortLabel "政令" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "政令" := by native_decide
example : isShortLabel "救援品" = true := by native_decide
example : isShortLabel "救援品" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "救援品" := by native_decide
example : isShortLabel "教職員数" = true := by native_decide
example : isShortLabel "教職員数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "教職員数" := by native_decide
example : isShortLabel "教育資金" = true := by native_decide
example : isShortLabel "教育資金" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "教育資金" := by native_decide
example : isShortLabel "教養文化施設" = true := by native_decide
example : isShortLabel "教養文化施設" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "教養文化施設" := by native_decide
example : isShortLabel "数値、" = true := by native_decide
example : isShortLabel "数値、" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "数値、" := by native_decide
example : isShortLabel "数値並びに" = true := by native_decide
example : isShortLabel "数値並びに" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "数値並びに" := by native_decide
example : isShortLabel "数値急増補正" = true := by native_decide
example : isShortLabel "数値急増補正" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "数値急増補正" := by native_decide
example : isShortLabel "数値急減補正" = true := by native_decide
example : isShortLabel "数値急減補正" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "数値急減補正" := by native_decide
example : isShortLabel "数量" = true := by native_decide
example : isShortLabel "数量" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "数量" := by native_decide
example : isShortLabel "数量、" = true := by native_decide
example : isShortLabel "数量、" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "数量、" := by native_decide
example : isShortLabel "数量及び" = true := by native_decide
example : isShortLabel "数量及び" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "数量及び" := by native_decide
example : isShortLabel "整理番号" = true := by native_decide
example : isShortLabel "整理番号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "整理番号" := by native_decide
example : isShortLabel "文書の種類" = true := by native_decide
example : isShortLabel "文書の種類" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "文書の種類" := by native_decide
example : isShortLabel "料理店業" = true := by native_decide
example : isShortLabel "料理店業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "料理店業" := by native_decide
example : isShortLabel "新たに" = true := by native_decide
example : isShortLabel "新たに" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "新たに" := by native_decide
example : isShortLabel "新令" = true := by native_decide
example : isShortLabel "新令" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "新令" := by native_decide
example : isShortLabel "新区分" = true := by native_decide
example : isShortLabel "新区分" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "新区分" := by native_decide
example : isShortLabel "新受託者" = true := by native_decide
example : isShortLabel "新受託者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "新受託者" := by native_decide
example : isShortLabel "新消費税法" = true := by native_decide
example : isShortLabel "新消費税法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "新消費税法" := by native_decide
example : isShortLabel "新潟運輸局長" = true := by native_decide
example : isShortLabel "新潟運輸局長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "新潟運輸局長" := by native_decide
example : isShortLabel "新潟陸運局長" = true := by native_decide
example : isShortLabel "新潟陸運局長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "新潟陸運局長" := by native_decide
example : isShortLabel "新生命保険料" = true := by native_decide
example : isShortLabel "新生命保険料" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "新生命保険料" := by native_decide
example : isShortLabel "新設分割" = true := by native_decide
example : isShortLabel "新設分割" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "新設分割" := by native_decide
example : isShortLabel "新設合併" = true := by native_decide
example : isShortLabel "新設合併" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "新設合併" := by native_decide
example : isShortLabel "方向探知機" = true := by native_decide
example : isShortLabel "方向探知機" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "方向探知機" := by native_decide
example : isShortLabel "施業整備期間" = true := by native_decide
example : isShortLabel "施業整備期間" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "施業整備期間" := by native_decide
example : isShortLabel "施行の" = true := by native_decide
example : isShortLabel "施行の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "施行の" := by native_decide
example : isShortLabel "施行の日（" = true := by native_decide
example : isShortLabel "施行の日（" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "施行の日（" := by native_decide
example : isShortLabel "施行令" = true := by native_decide
example : isShortLabel "施行令" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "施行令" := by native_decide
example : isShortLabel "施行地区" = true := by native_decide
example : isShortLabel "施行地区" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "施行地区" := by native_decide
example : isShortLabel "施設" = true := by native_decide
example : isShortLabel "施設" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "施設" := by native_decide
example : isShortLabel "施設設備費" = true := by native_decide
example : isShortLabel "施設設備費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "施設設備費" := by native_decide
example : isShortLabel "旅券の発給" = true := by native_decide
example : isShortLabel "旅券の発給" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "旅券の発給" := by native_decide
example : isShortLabel "旅客の数" = true := by native_decide
example : isShortLabel "旅客の数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "旅客の数" := by native_decide
example : isShortLabel "旅客数" = true := by native_decide
example : isShortLabel "旅客数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "旅客数" := by native_decide
example : isShortLabel "旅行業" = true := by native_decide
example : isShortLabel "旅行業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "旅行業" := by native_decide
example : isShortLabel "旅館業" = true := by native_decide
example : isShortLabel "旅館業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "旅館業" := by native_decide
example : isShortLabel "日" = true := by native_decide
example : isShortLabel "日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "日" := by native_decide
example : isShortLabel "日の" = true := by native_decide
example : isShortLabel "日の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "日の" := by native_decide
example : isShortLabel "日の前日の" = true := by native_decide
example : isShortLabel "日の前日の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "日の前日の" := by native_decide
example : isShortLabel "日本船舶" = true := by native_decide
example : isShortLabel "日本船舶" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "日本船舶" := by native_decide
example : isShortLabel "日本酒" = true := by native_decide
example : isShortLabel "日本酒" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "日本酒" := by native_decide
example : isShortLabel "日本銀行" = true := by native_decide
example : isShortLabel "日本銀行" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "日本銀行" := by native_decide
example : isShortLabel "旧令" = true := by native_decide
example : isShortLabel "旧令" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "旧令" := by native_decide
example : isShortLabel "旧効力措置法" = true := by native_decide
example : isShortLabel "旧効力措置法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "旧効力措置法" := by native_decide
example : isShortLabel "旧区分" = true := by native_decide
example : isShortLabel "旧区分" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "旧区分" := by native_decide
example : isShortLabel "旧地方税法" = true := by native_decide
example : isShortLabel "旧地方税法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "旧地方税法" := by native_decide
example : isShortLabel "旧定率法" = true := by native_decide
example : isShortLabel "旧定率法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "旧定率法" := by native_decide
example : isShortLabel "旧定額法" = true := by native_decide
example : isShortLabel "旧定額法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "旧定額法" := by native_decide
example : isShortLabel "旧恒久的施設" = true := by native_decide
example : isShortLabel "旧恒久的施設" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "旧恒久的施設" := by native_decide
example : isShortLabel "旧消費税法" = true := by native_decide
example : isShortLabel "旧消費税法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "旧消費税法" := by native_decide
example : isShortLabel "旧生命保険料" = true := by native_decide
example : isShortLabel "旧生命保険料" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "旧生命保険料" := by native_decide
example : isShortLabel "昭和" = true := by native_decide
example : isShortLabel "昭和" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "昭和" := by native_decide
example : isShortLabel "昭和五十年分" = true := by native_decide
example : isShortLabel "昭和五十年分" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "昭和五十年分" := by native_decide
example : isShortLabel "昭和五十年度" = true := by native_decide
example : isShortLabel "昭和五十年度" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "昭和五十年度" := by native_decide
example : isShortLabel "昼間学科" = true := by native_decide
example : isShortLabel "昼間学科" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "昼間学科" := by native_decide
example : isShortLabel "昼間流入人口" = true := by native_decide
example : isShortLabel "昼間流入人口" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "昼間流入人口" := by native_decide
example : isShortLabel "昼間流出人口" = true := by native_decide
example : isShortLabel "昼間流出人口" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "昼間流出人口" := by native_decide
example : isShortLabel "時価法" = true := by native_decide
example : isShortLabel "時価法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "時価法" := by native_decide
example : isShortLabel "普通徴収" = true := by native_decide
example : isShortLabel "普通徴収" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "普通徴収" := by native_decide
example : isShortLabel "普通法人" = true := by native_decide
example : isShortLabel "普通法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "普通法人" := by native_decide
example : isShortLabel "普通預金通帳" = true := by native_decide
example : isShortLabel "普通預金通帳" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "普通預金通帳" := by native_decide
example : isShortLabel "暗" = true := by native_decide
example : isShortLabel "暗" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "暗" := by native_decide
example : isShortLabel "更地の価額" = true := by native_decide
example : isShortLabel "更地の価額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "更地の価額" := by native_decide
example : isShortLabel "更正の請求" = true := by native_decide
example : isShortLabel "更正の請求" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "更正の請求" := by native_decide
example : isShortLabel "更正又は決定" = true := by native_decide
example : isShortLabel "更正又は決定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "更正又は決定" := by native_decide
example : isShortLabel "更正請求書" = true := by native_decide
example : isShortLabel "更正請求書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "更正請求書" := by native_decide
example : isShortLabel "更生保護法人" = true := by native_decide
example : isShortLabel "更生保護法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "更生保護法人" := by native_decide
example : isShortLabel "更生計画" = true := by native_decide
example : isShortLabel "更生計画" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "更生計画" := by native_decide
example : isShortLabel "書籍" = true := by native_decide
example : isShortLabel "書籍" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "書籍" := by native_decide
example : isShortLabel "最終親会社等" = true := by native_decide
example : isShortLabel "最終親会社等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "最終親会社等" := by native_decide
example : isShortLabel "月" = true := by native_decide
example : isShortLabel "月" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "月" := by native_decide
example : isShortLabel "有しないもの" = true := by native_decide
example : isShortLabel "有しないもの" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "有しないもの" := by native_decide
example : isShortLabel "有価証券" = true := by native_decide
example : isShortLabel "有価証券" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "有価証券" := by native_decide
example : isShortLabel "有収水量" = true := by native_decide
example : isShortLabel "有収水量" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "有収水量" := by native_decide
example : isShortLabel "有料道路" = true := by native_decide
example : isShortLabel "有料道路" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "有料道路" := by native_decide
example : isShortLabel "有料駐車場" = true := by native_decide
example : isShortLabel "有料駐車場" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "有料駐車場" := by native_decide
example : isShortLabel "有期定期金" = true := by native_decide
example : isShortLabel "有期定期金" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "有期定期金" := by native_decide
example : isShortLabel "有線放送業" = true := by native_decide
example : isShortLabel "有線放送業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "有線放送業" := by native_decide
example : isShortLabel "期末時換算法" = true := by native_decide
example : isShortLabel "期末時換算法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "期末時換算法" := by native_decide
example : isShortLabel "期間" = true := by native_decide
example : isShortLabel "期間" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "期間" := by native_decide
example : isShortLabel "期限" = true := by native_decide
example : isShortLabel "期限" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "期限" := by native_decide
example : isShortLabel "期限内申告書" = true := by native_decide
example : isShortLabel "期限内申告書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "期限内申告書" := by native_decide
example : isShortLabel "期限後申告" = true := by native_decide
example : isShortLabel "期限後申告" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "期限後申告" := by native_decide
example : isShortLabel "期限後申告書" = true := by native_decide
example : isShortLabel "期限後申告書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "期限後申告書" := by native_decide
example : isShortLabel "木橋" = true := by native_decide
example : isShortLabel "木橋" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "木橋" := by native_decide
example : isShortLabel "未分配所得額" = true := by native_decide
example : isShortLabel "未分配所得額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "未分配所得額" := by native_decide
example : isShortLabel "未成年者" = true := by native_decide
example : isShortLabel "未成年者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "未成年者" := by native_decide
example : isShortLabel "未成年者口座" = true := by native_decide
example : isShortLabel "未成年者口座" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "未成年者口座" := by native_decide
example : isShortLabel "未納に係る" = true := by native_decide
example : isShortLabel "未納に係る" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "未納に係る" := by native_decide
example : isShortLabel "末日まで" = true := by native_decide
example : isShortLabel "末日まで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "末日まで" := by native_decide
example : isShortLabel "本みりん" = true := by native_decide
example : isShortLabel "本みりん" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "本みりん" := by native_decide
example : isShortLabel "本人口座" = true := by native_decide
example : isShortLabel "本人口座" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "本人口座" := by native_decide
example : isShortLabel "本人証券口座" = true := by native_decide
example : isShortLabel "本人証券口座" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "本人証券口座" := by native_decide
example : isShortLabel "本格焼酎" = true := by native_decide
example : isShortLabel "本格焼酎" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "本格焼酎" := by native_decide
example : isShortLabel "札幌陸運局長" = true := by native_decide
example : isShortLabel "札幌陸運局長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "札幌陸運局長" := by native_decide
example : isShortLabel "東京陸運局長" = true := by native_decide
example : isShortLabel "東京陸運局長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "東京陸運局長" := by native_decide
example : isShortLabel "東北運輸局長" = true := by native_decide
example : isShortLabel "東北運輸局長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "東北運輸局長" := by native_decide
example : isShortLabel "東海海運局長" = true := by native_decide
example : isShortLabel "東海海運局長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "東海海運局長" := by native_decide
example : isShortLabel "林業" = true := by native_decide
example : isShortLabel "林業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "林業" := by native_decide
example : isShortLabel "林道" = true := by native_decide
example : isShortLabel "林道" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "林道" := by native_decide
example : isShortLabel "果実酒" = true := by native_decide
example : isShortLabel "果実酒" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "果実酒" := by native_decide
example : isShortLabel "果実酒類" = true := by native_decide
example : isShortLabel "果実酒類" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "果実酒類" := by native_decide
example : isShortLabel "校" = true := by native_decide
example : isShortLabel "校" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "校" := by native_decide
example : isShortLabel "株主等" = true := by native_decide
example : isShortLabel "株主等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "株主等" := by native_decide
example : isShortLabel "株主等の親族" = true := by native_decide
example : isShortLabel "株主等の親族" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "株主等の親族" := by native_decide
example : isShortLabel "株券" = true := by native_decide
example : isShortLabel "株券" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "株券" := by native_decide
example : isShortLabel "株式" = true := by native_decide
example : isShortLabel "株式" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "株式" := by native_decide
example : isShortLabel "株式の分割" = true := by native_decide
example : isShortLabel "株式の分割" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "株式の分割" := by native_decide
example : isShortLabel "株式交付" = true := by native_decide
example : isShortLabel "株式交付" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "株式交付" := by native_decide
example : isShortLabel "株式交換" = true := by native_decide
example : isShortLabel "株式交換" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "株式交換" := by native_decide
example : isShortLabel "株式交換で" = true := by native_decide
example : isShortLabel "株式交換で" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "株式交換で" := by native_decide
example : isShortLabel "株式交換等" = true := by native_decide
example : isShortLabel "株式交換等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "株式交換等" := by native_decide
example : isShortLabel "株式会社" = true := by native_decide
example : isShortLabel "株式会社" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "株式会社" := by native_decide
example : isShortLabel "株式分配" = true := by native_decide
example : isShortLabel "株式分配" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "株式分配" := by native_decide
example : isShortLabel "株式移転" = true := by native_decide
example : isShortLabel "株式移転" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "株式移転" := by native_decide
example : isShortLabel "案内業" = true := by native_decide
example : isShortLabel "案内業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "案内業" := by native_decide
example : isShortLabel "梁" = true := by native_decide
example : isShortLabel "梁" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "梁" := by native_decide
example : isShortLabel "梱" = true := by native_decide
example : isShortLabel "梱" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "梱" := by native_decide
example : isShortLabel "棚" = true := by native_decide
example : isShortLabel "棚" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "棚" := by native_decide
example : isShortLabel "棚卸資産" = true := by native_decide
example : isShortLabel "棚卸資産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "棚卸資産" := by native_decide
example : isShortLabel "森林災害共済" = true := by native_decide
example : isShortLabel "森林災害共済" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "森林災害共済" := by native_decide
example : isShortLabel "植物園" = true := by native_decide
example : isShortLabel "植物園" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "植物園" := by native_decide
example : isShortLabel "検査自動車" = true := by native_decide
example : isShortLabel "検査自動車" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "検査自動車" := by native_decide
example : isShortLabel "業務勘定" = true := by native_decide
example : isShortLabel "業務勘定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "業務勘定" := by native_decide
example : isShortLabel "業種" = true := by native_decide
example : isShortLabel "業種" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "業種" := by native_decide
example : isShortLabel "構成会社等" = true := by native_decide
example : isShortLabel "構成会社等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "構成会社等" := by native_decide
example : isShortLabel "構築物" = true := by native_decide
example : isShortLabel "構築物" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "構築物" := by native_decide
example : isShortLabel "槽" = true := by native_decide
example : isShortLabel "槽" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "槽" := by native_decide
example : isShortLabel "標準伐期齢" = true := by native_decide
example : isShortLabel "標準伐期齢" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "標準伐期齢" := by native_decide
example : isShortLabel "権利変換期日" = true := by native_decide
example : isShortLabel "権利変換期日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "権利変換期日" := by native_decide
example : isShortLabel "樹木採取権" = true := by native_decide
example : isShortLabel "樹木採取権" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "樹木採取権" := by native_decide
example : isShortLabel "橋りよう" = true := by native_decide
example : isShortLabel "橋りよう" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "橋りよう" := by native_decide
example : isShortLabel "機上用通信機" = true := by native_decide
example : isShortLabel "機上用通信機" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "機上用通信機" := by native_decide
example : isShortLabel "機体" = true := by native_decide
example : isShortLabel "機体" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "機体" := by native_decide
example : isShortLabel "機械修理業" = true := by native_decide
example : isShortLabel "機械修理業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "機械修理業" := by native_decide
example : isShortLabel "機械及び装置" = true := by native_decide
example : isShortLabel "機械及び装置" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "機械及び装置" := by native_decide
example : isShortLabel "機械等修理業" = true := by native_decide
example : isShortLabel "機械等修理業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "機械等修理業" := by native_decide
example : isShortLabel "機械設計業" = true := by native_decide
example : isShortLabel "機械設計業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "機械設計業" := by native_decide
example : isShortLabel "機能通貨" = true := by native_decide
example : isShortLabel "機能通貨" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "機能通貨" := by native_decide
example : isShortLabel "次に" = true := by native_decide
example : isShortLabel "次に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "次に" := by native_decide
example : isShortLabel "次の" = true := by native_decide
example : isShortLabel "次の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "次の" := by native_decide
example : isShortLabel "次の各号" = true := by native_decide
example : isShortLabel "次の各号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "次の各号" := by native_decide
example : isShortLabel "次号" = true := by native_decide
example : isShortLabel "次号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "次号" := by native_decide
example : isShortLabel "次節" = true := by native_decide
example : isShortLabel "次節" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "次節" := by native_decide
example : isShortLabel "次項" = true := by native_decide
example : isShortLabel "次項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "次項" := by native_decide
example : isShortLabel "次項に定める" = true := by native_decide
example : isShortLabel "次項に定める" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "次項に定める" := by native_decide
example : isShortLabel "次項本文" = true := by native_decide
example : isShortLabel "次項本文" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "次項本文" := by native_decide
example : isShortLabel "欧州連合協定" = true := by native_decide
example : isShortLabel "欧州連合協定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "欧州連合協定" := by native_decide
example : isShortLabel "正味資産" = true := by native_decide
example : isShortLabel "正味資産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "正味資産" := by native_decide
example : isShortLabel "歯科医業" = true := by native_decide
example : isShortLabel "歯科医業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "歯科医業" := by native_decide
example : isShortLabel "歯科技工士業" = true := by native_decide
example : isShortLabel "歯科技工士業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "歯科技工士業" := by native_decide
example : isShortLabel "歯科衛生士業" = true := by native_decide
example : isShortLabel "歯科衛生士業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "歯科衛生士業" := by native_decide
example : isShortLabel "死亡" = true := by native_decide
example : isShortLabel "死亡" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "死亡" := by native_decide
example : isShortLabel "死亡した" = true := by native_decide
example : isShortLabel "死亡した" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "死亡した" := by native_decide
example : isShortLabel "死亡又は解散" = true := by native_decide
example : isShortLabel "死亡又は解散" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "死亡又は解散" := by native_decide
example : isShortLabel "残価保証額" = true := by native_decide
example : isShortLabel "残価保証額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "残価保証額" := by native_decide
example : isShortLabel "段階補正" = true := by native_decide
example : isShortLabel "段階補正" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "段階補正" := by native_decide
example : isShortLabel "殻付きのもの" = true := by native_decide
example : isShortLabel "殻付きのもの" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "殻付きのもの" := by native_decide
example : isShortLabel "毎旬の末日" = true := by native_decide
example : isShortLabel "毎旬の末日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "毎旬の末日" := by native_decide
example : isShortLabel "毎月末" = true := by native_decide
example : isShortLabel "毎月末" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "毎月末" := by native_decide
example : isShortLabel "水あめ" = true := by native_decide
example : isShortLabel "水あめ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "水あめ" := by native_decide
example : isShortLabel "水利地益税" = true := by native_decide
example : isShortLabel "水利地益税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "水利地益税" := by native_decide
example : isShortLabel "水利権" = true := by native_decide
example : isShortLabel "水利権" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "水利権" := by native_decide
example : isShortLabel "水族館" = true := by native_decide
example : isShortLabel "水族館" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "水族館" := by native_decide
example : isShortLabel "水泳場" = true := by native_decide
example : isShortLabel "水泳場" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "水泳場" := by native_decide
example : isShortLabel "水源" = true := by native_decide
example : isShortLabel "水源" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "水源" := by native_decide
example : isShortLabel "水産業者数" = true := by native_decide
example : isShortLabel "水産業者数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "水産業者数" := by native_decide
example : isShortLabel "水産行政費" = true := by native_decide
example : isShortLabel "水産行政費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "水産行政費" := by native_decide
example : isShortLabel "水素" = true := by native_decide
example : isShortLabel "水素" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "水素" := by native_decide
example : isShortLabel "氷砂糖" = true := by native_decide
example : isShortLabel "氷砂糖" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "氷砂糖" := by native_decide
example : isShortLabel "決定" = true := by native_decide
example : isShortLabel "決定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "決定" := by native_decide
example : isShortLabel "決算" = true := by native_decide
example : isShortLabel "決算" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "決算" := by native_decide
example : isShortLabel "決議日等" = true := by native_decide
example : isShortLabel "決議日等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "決議日等" := by native_decide
example : isShortLabel "沈" = true := by native_decide
example : isShortLabel "沈" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "沈" := by native_decide
example : isShortLabel "沖縄" = true := by native_decide
example : isShortLabel "沖縄" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "沖縄" := by native_decide
example : isShortLabel "沖縄の所得税" = true := by native_decide
example : isShortLabel "沖縄の所得税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "沖縄の所得税" := by native_decide
example : isShortLabel "河川の延長" = true := by native_decide
example : isShortLabel "河川の延長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "河川の延長" := by native_decide
example : isShortLabel "河床" = true := by native_decide
example : isShortLabel "河床" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "河床" := by native_decide
example : isShortLabel "法" = true := by native_decide
example : isShortLabel "法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法" := by native_decide
example : isShortLabel "法の" = true := by native_decide
example : isShortLabel "法の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法の" := by native_decide
example : isShortLabel "法の施行の際" = true := by native_decide
example : isShortLabel "法の施行の際" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法の施行の際" := by native_decide
example : isShortLabel "法の施行地" = true := by native_decide
example : isShortLabel "法の施行地" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法の施行地" := by native_decide
example : isShortLabel "法人" = true := by native_decide
example : isShortLabel "法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人" := by native_decide
example : isShortLabel "法人が" = true := by native_decide
example : isShortLabel "法人が" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人が" := by native_decide
example : isShortLabel "法人で" = true := by native_decide
example : isShortLabel "法人で" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人で" := by native_decide
example : isShortLabel "法人に" = true := by native_decide
example : isShortLabel "法人に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人に" := by native_decide
example : isShortLabel "法人の" = true := by native_decide
example : isShortLabel "法人の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人の" := by native_decide
example : isShortLabel "法人の区分" = true := by native_decide
example : isShortLabel "法人の区分" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人の区分" := by native_decide
example : isShortLabel "法人は" = true := by native_decide
example : isShortLabel "法人は" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人は" := by native_decide
example : isShortLabel "法人事業税" = true := by native_decide
example : isShortLabel "法人事業税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人事業税" := by native_decide
example : isShortLabel "法人又は" = true := by native_decide
example : isShortLabel "法人又は" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人又は" := by native_decide
example : isShortLabel "法人及び" = true := by native_decide
example : isShortLabel "法人及び" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人及び" := by native_decide
example : isShortLabel "法人番号" = true := by native_decide
example : isShortLabel "法人番号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人番号" := by native_decide
example : isShortLabel "法人税に" = true := by native_decide
example : isShortLabel "法人税に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人税に" := by native_decide
example : isShortLabel "法人税の" = true := by native_decide
example : isShortLabel "法人税の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人税の" := by native_decide
example : isShortLabel "法人税の額" = true := by native_decide
example : isShortLabel "法人税の額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人税の額" := by native_decide
example : isShortLabel "法人税の額に" = true := by native_decide
example : isShortLabel "法人税の額に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人税の額に" := by native_decide
example : isShortLabel "法人税の額の" = true := by native_decide
example : isShortLabel "法人税の額の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人税の額の" := by native_decide
example : isShortLabel "法人税の額（" = true := by native_decide
example : isShortLabel "法人税の額（" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人税の額（" := by native_decide
example : isShortLabel "法人税並びに" = true := by native_decide
example : isShortLabel "法人税並びに" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人税並びに" := by native_decide
example : isShortLabel "法人税割" = true := by native_decide
example : isShortLabel "法人税割" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人税割" := by native_decide
example : isShortLabel "法人税割の額" = true := by native_decide
example : isShortLabel "法人税割の額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人税割の額" := by native_decide
example : isShortLabel "法人税割額" = true := by native_decide
example : isShortLabel "法人税割額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人税割額" := by native_decide
example : isShortLabel "法人税及び" = true := by native_decide
example : isShortLabel "法人税及び" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人税及び" := by native_decide
example : isShortLabel "法人税申告書" = true := by native_decide
example : isShortLabel "法人税申告書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人税申告書" := by native_decide
example : isShortLabel "法人税額" = true := by native_decide
example : isShortLabel "法人税額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人税額" := by native_decide
example : isShortLabel "法人税額を" = true := by native_decide
example : isShortLabel "法人税額を" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人税額を" := by native_decide
example : isShortLabel "法人税額（法" = true := by native_decide
example : isShortLabel "法人税額（法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人税額（法" := by native_decide
example : isShortLabel "法人等の区分" = true := by native_decide
example : isShortLabel "法人等の区分" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人等の区分" := by native_decide
example : isShortLabel "法人課税信託" = true := by native_decide
example : isShortLabel "法人課税信託" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人課税信託" := by native_decide
example : isShortLabel "法人（" = true := by native_decide
example : isShortLabel "法人（" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法人（" := by native_decide
example : isShortLabel "法定申告期限" = true := by native_decide
example : isShortLabel "法定申告期限" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法定申告期限" := by native_decide
example : isShortLabel "法定納期限" = true := by native_decide
example : isShortLabel "法定納期限" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法定納期限" := by native_decide
example : isShortLabel "法第九十八条" = true := by native_decide
example : isShortLabel "法第九十八条" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法第九十八条" := by native_decide
example : isShortLabel "法第十三条" = true := by native_decide
example : isShortLabel "法第十三条" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法第十三条" := by native_decide
example : isShortLabel "法第十条" = true := by native_decide
example : isShortLabel "法第十条" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法第十条" := by native_decide
example : isShortLabel "法第四十七条" = true := by native_decide
example : isShortLabel "法第四十七条" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法第四十七条" := by native_decide
example : isShortLabel "法第四十二条" = true := by native_decide
example : isShortLabel "法第四十二条" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法第四十二条" := by native_decide
example : isShortLabel "法第四十五条" = true := by native_decide
example : isShortLabel "法第四十五条" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法第四十五条" := by native_decide
example : isShortLabel "法第四十六条" = true := by native_decide
example : isShortLabel "法第四十六条" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法第四十六条" := by native_decide
example : isShortLabel "法第四十四条" = true := by native_decide
example : isShortLabel "法第四十四条" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法第四十四条" := by native_decide
example : isShortLabel "法第四条の三" = true := by native_decide
example : isShortLabel "法第四条の三" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法第四条の三" := by native_decide
example : isShortLabel "法第四条の二" = true := by native_decide
example : isShortLabel "法第四条の二" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法第四条の二" := by native_decide
example : isShortLabel "法第百九十条" = true := by native_decide
example : isShortLabel "法第百九十条" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "法第百九十条" := by native_decide
example : isShortLabel "泡盛" = true := by native_decide
example : isShortLabel "泡盛" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "泡盛" := by native_decide
example : isShortLabel "派遣国" = true := by native_decide
example : isShortLabel "派遣国" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "派遣国" := by native_decide
example : isShortLabel "浴場業" = true := by native_decide
example : isShortLabel "浴場業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "浴場業" := by native_decide
example : isShortLabel "海上運送法" = true := by native_decide
example : isShortLabel "海上運送法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "海上運送法" := by native_decide
example : isShortLabel "海事代理士業" = true := by native_decide
example : isShortLabel "海事代理士業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "海事代理士業" := by native_decide
example : isShortLabel "消滅市町村等" = true := by native_decide
example : isShortLabel "消滅市町村等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "消滅市町村等" := by native_decide
example : isShortLabel "消火設備" = true := by native_decide
example : isShortLabel "消火設備" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "消火設備" := by native_decide
example : isShortLabel "消費税法" = true := by native_decide
example : isShortLabel "消費税法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "消費税法" := by native_decide
example : isShortLabel "消費税等" = true := by native_decide
example : isShortLabel "消費税等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "消費税等" := by native_decide
example : isShortLabel "消防費" = true := by native_decide
example : isShortLabel "消防費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "消防費" := by native_decide
example : isShortLabel "涵" = true := by native_decide
example : isShortLabel "涵" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "涵" := by native_decide
example : isShortLabel "混和の方法" = true := by native_decide
example : isShortLabel "混和の方法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "混和の方法" := by native_decide
example : isShortLabel "混成酒類" = true := by native_decide
example : isShortLabel "混成酒類" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "混成酒類" := by native_decide
example : isShortLabel "清算中のもの" = true := by native_decide
example : isShortLabel "清算中のもの" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "清算中のもの" := by native_decide
example : isShortLabel "清算中の法人" = true := by native_decide
example : isShortLabel "清算中の法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "清算中の法人" := by native_decide
example : isShortLabel "清酒" = true := by native_decide
example : isShortLabel "清酒" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "清酒" := by native_decide
example : isShortLabel "清酒一級" = true := by native_decide
example : isShortLabel "清酒一級" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "清酒一級" := by native_decide
example : isShortLabel "減価償却資産" = true := by native_decide
example : isShortLabel "減価償却資産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "減価償却資産" := by native_decide
example : isShortLabel "減額した額" = true := by native_decide
example : isShortLabel "減額した額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "減額した額" := by native_decide
example : isShortLabel "渠" = true := by native_decide
example : isShortLabel "渠" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "渠" := by native_decide
example : isShortLabel "測量士業" = true := by native_decide
example : isShortLabel "測量士業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "測量士業" := by native_decide
example : isShortLabel "港湾運送業" = true := by native_decide
example : isShortLabel "港湾運送業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "港湾運送業" := by native_decide
example : isShortLabel "源泉徴収" = true := by native_decide
example : isShortLabel "源泉徴収" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "源泉徴収" := by native_decide
example : isShortLabel "準農地" = true := by native_decide
example : isShortLabel "準農地" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "準農地" := by native_decide
example : isShortLabel "溜" = true := by native_decide
example : isShortLabel "溜" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "溜" := by native_decide
example : isShortLabel "滅失した貨物" = true := by native_decide
example : isShortLabel "滅失した貨物" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "滅失した貨物" := by native_decide
example : isShortLabel "滞納処分" = true := by native_decide
example : isShortLabel "滞納処分" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "滞納処分" := by native_decide
example : isShortLabel "滞納処分費" = true := by native_decide
example : isShortLabel "滞納処分費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "滞納処分費" := by native_decide
example : isShortLabel "滞納者" = true := by native_decide
example : isShortLabel "滞納者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "滞納者" := by native_decide
example : isShortLabel "漁業" = true := by native_decide
example : isShortLabel "漁業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "漁業" := by native_decide
example : isShortLabel "漁業生産組合" = true := by native_decide
example : isShortLabel "漁業生産組合" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "漁業生産組合" := by native_decide
example : isShortLabel "演劇の俳優" = true := by native_decide
example : isShortLabel "演劇の俳優" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "演劇の俳優" := by native_decide
example : isShortLabel "演劇興行業" = true := by native_decide
example : isShortLabel "演劇興行業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "演劇興行業" := by native_decide
example : isShortLabel "漕艇場" = true := by native_decide
example : isShortLabel "漕艇場" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "漕艇場" := by native_decide
example : isShortLabel "澎" = true := by native_decide
example : isShortLabel "澎" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "澎" := by native_decide
example : isShortLabel "澱" = true := by native_decide
example : isShortLabel "澱" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "澱" := by native_decide
example : isShortLabel "激" = true := by native_decide
example : isShortLabel "激" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "激" := by native_decide
example : isShortLabel "濁酒" = true := by native_decide
example : isShortLabel "濁酒" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "濁酒" := by native_decide
example : isShortLabel "濾" = true := by native_decide
example : isShortLabel "濾" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "濾" := by native_decide
example : isShortLabel "火災保険" = true := by native_decide
example : isShortLabel "火災保険" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "火災保険" := by native_decide
example : isShortLabel "火災共済" = true := by native_decide
example : isShortLabel "火災共済" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "火災共済" := by native_decide
example : isShortLabel "災害" = true := by native_decide
example : isShortLabel "災害" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "災害" := by native_decide
example : isShortLabel "点字印刷機" = true := by native_decide
example : isShortLabel "点字印刷機" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "点字印刷機" := by native_decide
example : isShortLabel "焙" = true := by native_decide
example : isShortLabel "焙" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "焙" := by native_decide
example : isShortLabel "無償譲渡" = true := by native_decide
example : isShortLabel "無償譲渡" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "無償譲渡" := by native_decide
example : isShortLabel "無国籍会社等" = true := by native_decide
example : isShortLabel "無国籍会社等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "無国籍会社等" := by native_decide
example : isShortLabel "無店舗小売業" = true := by native_decide
example : isShortLabel "無店舗小売業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "無店舗小売業" := by native_decide
example : isShortLabel "無期定期金" = true := by native_decide
example : isShortLabel "無期定期金" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "無期定期金" := by native_decide
example : isShortLabel "煽" = true := by native_decide
example : isShortLabel "煽" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "煽" := by native_decide
example : isShortLabel "熱交換機" = true := by native_decide
example : isShortLabel "熱交換機" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "熱交換機" := by native_decide
example : isShortLabel "燃料の種類" = true := by native_decide
example : isShortLabel "燃料の種類" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "燃料の種類" := by native_decide
example : isShortLabel "牌" = true := by native_decide
example : isShortLabel "牌" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "牌" := by native_decide
example : isShortLabel "物品" = true := by native_decide
example : isShortLabel "物品" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "物品" := by native_decide
example : isShortLabel "物品賃貸業" = true := by native_decide
example : isShortLabel "物品賃貸業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "物品賃貸業" := by native_decide
example : isShortLabel "特例法人" = true := by native_decide
example : isShortLabel "特例法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特例法人" := by native_decide
example : isShortLabel "特例申告書" = true := by native_decide
example : isShortLabel "特例申告書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特例申告書" := by native_decide
example : isShortLabel "特例農地等が" = true := by native_decide
example : isShortLabel "特例農地等が" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特例農地等が" := by native_decide
example : isShortLabel "特例適用年" = true := by native_decide
example : isShortLabel "特例適用年" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特例適用年" := by native_decide
example : isShortLabel "特例）" = true := by native_decide
example : isShortLabel "特例）" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特例）" := by native_decide
example : isShortLabel "特別償却設備" = true := by native_decide
example : isShortLabel "特別償却設備" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特別償却設備" := by native_decide
example : isShortLabel "特別利益の額" = true := by native_decide
example : isShortLabel "特別利益の額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特別利益の額" := by native_decide
example : isShortLabel "特別区" = true := by native_decide
example : isShortLabel "特別区" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特別区" := by native_decide
example : isShortLabel "特別区民税" = true := by native_decide
example : isShortLabel "特別区民税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特別区民税" := by native_decide
example : isShortLabel "特別区長" = true := by native_decide
example : isShortLabel "特別区長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特別区長" := by native_decide
example : isShortLabel "特別徴収" = true := by native_decide
example : isShortLabel "特別徴収" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特別徴収" := by native_decide
example : isShortLabel "特別損失の額" = true := by native_decide
example : isShortLabel "特別損失の額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特別損失の額" := by native_decide
example : isShortLabel "特別法人" = true := by native_decide
example : isShortLabel "特別法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特別法人" := by native_decide
example : isShortLabel "特別障害者" = true := by native_decide
example : isShortLabel "特別障害者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特別障害者" := by native_decide
example : isShortLabel "特定世帯" = true := by native_decide
example : isShortLabel "特定世帯" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定世帯" := by native_decide
example : isShortLabel "特定事項" = true := by native_decide
example : isShortLabel "特定事項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定事項" := by native_decide
example : isShortLabel "特定仮換地等" = true := by native_decide
example : isShortLabel "特定仮換地等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定仮換地等" := by native_decide
example : isShortLabel "特定個人" = true := by native_decide
example : isShortLabel "特定個人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定個人" := by native_decide
example : isShortLabel "特定先進船舶" = true := by native_decide
example : isShortLabel "特定先進船舶" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定先進船舶" := by native_decide
example : isShortLabel "特定利子" = true := by native_decide
example : isShortLabel "特定利子" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定利子" := by native_decide
example : isShortLabel "特定収益分配" = true := by native_decide
example : isShortLabel "特定収益分配" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定収益分配" := by native_decide
example : isShortLabel "特定取引" = true := by native_decide
example : isShortLabel "特定取引" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定取引" := by native_decide
example : isShortLabel "特定取引者" = true := by native_decide
example : isShortLabel "特定取引者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定取引者" := by native_decide
example : isShortLabel "特定受託者" = true := by native_decide
example : isShortLabel "特定受託者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定受託者" := by native_decide
example : isShortLabel "特定受託者」" = true := by native_decide
example : isShortLabel "特定受託者」" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定受託者」" := by native_decide
example : isShortLabel "特定受託者の" = true := by native_decide
example : isShortLabel "特定受託者の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定受託者の" := by native_decide
example : isShortLabel "特定受託者を" = true := by native_decide
example : isShortLabel "特定受託者を" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定受託者を" := by native_decide
example : isShortLabel "特定受贈者" = true := by native_decide
example : isShortLabel "特定受贈者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定受贈者" := by native_decide
example : isShortLabel "特定口座" = true := by native_decide
example : isShortLabel "特定口座" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定口座" := by native_decide
example : isShortLabel "特定合併" = true := by native_decide
example : isShortLabel "特定合併" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定合併" := by native_decide
example : isShortLabel "特定合併等" = true := by native_decide
example : isShortLabel "特定合併等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定合併等" := by native_decide
example : isShortLabel "特定学校等" = true := by native_decide
example : isShortLabel "特定学校等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定学校等" := by native_decide
example : isShortLabel "特定対象利子" = true := by native_decide
example : isShortLabel "特定対象利子" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定対象利子" := by native_decide
example : isShortLabel "特定帳簿価額" = true := by native_decide
example : isShortLabel "特定帳簿価額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定帳簿価額" := by native_decide
example : isShortLabel "特定懸賞金等" = true := by native_decide
example : isShortLabel "特定懸賞金等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定懸賞金等" := by native_decide
example : isShortLabel "特定扶養親族" = true := by native_decide
example : isShortLabel "特定扶養親族" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定扶養親族" := by native_decide
example : isShortLabel "特定振替機関" = true := by native_decide
example : isShortLabel "特定振替機関" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定振替機関" := by native_decide
example : isShortLabel "特定支配日" = true := by native_decide
example : isShortLabel "特定支配日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定支配日" := by native_decide
example : isShortLabel "特定支配関係" = true := by native_decide
example : isShortLabel "特定支配関係" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定支配関係" := by native_decide
example : isShortLabel "特定日" = true := by native_decide
example : isShortLabel "特定日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定日" := by native_decide
example : isShortLabel "特定期間年数" = true := by native_decide
example : isShortLabel "特定期間年数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定期間年数" := by native_decide
example : isShortLabel "特定株主等" = true := by native_decide
example : isShortLabel "特定株主等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定株主等" := by native_decide
example : isShortLabel "特定株式" = true := by native_decide
example : isShortLabel "特定株式" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定株式" := by native_decide
example : isShortLabel "特定株式交換" = true := by native_decide
example : isShortLabel "特定株式交換" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定株式交換" := by native_decide
example : isShortLabel "特定株式分配" = true := by native_decide
example : isShortLabel "特定株式分配" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定株式分配" := by native_decide
example : isShortLabel "特定株式等" = true := by native_decide
example : isShortLabel "特定株式等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定株式等" := by native_decide
example : isShortLabel "特定法人" = true := by native_decide
example : isShortLabel "特定法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定法人" := by native_decide
example : isShortLabel "特定法人税法" = true := by native_decide
example : isShortLabel "特定法人税法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定法人税法" := by native_decide
example : isShortLabel "特定特許権等" = true := by native_decide
example : isShortLabel "特定特許権等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定特許権等" := by native_decide
example : isShortLabel "特定目的会社" = true := by native_decide
example : isShortLabel "特定目的会社" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定目的会社" := by native_decide
example : isShortLabel "特定目的信託" = true := by native_decide
example : isShortLabel "特定目的信託" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定目的信託" := by native_decide
example : isShortLabel "特定組合員等" = true := by native_decide
example : isShortLabel "特定組合員等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定組合員等" := by native_decide
example : isShortLabel "特定継続世帯" = true := by native_decide
example : isShortLabel "特定継続世帯" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定継続世帯" := by native_decide
example : isShortLabel "特定美術品" = true := by native_decide
example : isShortLabel "特定美術品" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定美術品" := by native_decide
example : isShortLabel "特定補助金" = true := by native_decide
example : isShortLabel "特定補助金" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定補助金" := by native_decide
example : isShortLabel "特定計画山林" = true := by native_decide
example : isShortLabel "特定計画山林" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定計画山林" := by native_decide
example : isShortLabel "特定販売業者" = true := by native_decide
example : isShortLabel "特定販売業者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定販売業者" := by native_decide
example : isShortLabel "特定資産" = true := by native_decide
example : isShortLabel "特定資産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定資産" := by native_decide
example : isShortLabel "特定通貨" = true := by native_decide
example : isShortLabel "特定通貨" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定通貨" := by native_decide
example : isShortLabel "特定適格合併" = true := by native_decide
example : isShortLabel "特定適格合併" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定適格合併" := by native_decide
example : isShortLabel "特定配当等" = true := by native_decide
example : isShortLabel "特定配当等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定配当等" := by native_decide
example : isShortLabel "特定配当等の" = true := by native_decide
example : isShortLabel "特定配当等の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定配当等の" := by native_decide
example : isShortLabel "特定配当等（" = true := by native_decide
example : isShortLabel "特定配当等（" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定配当等（" := by native_decide
example : isShortLabel "特定配当金額" = true := by native_decide
example : isShortLabel "特定配当金額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特定配当金額" := by native_decide
example : isShortLabel "特殊の関係" = true := by native_decide
example : isShortLabel "特殊の関係" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特殊の関係" := by native_decide
example : isShortLabel "特殊投資法人" = true := by native_decide
example : isShortLabel "特殊投資法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特殊投資法人" := by native_decide
example : isShortLabel "特約業者" = true := by native_decide
example : isShortLabel "特約業者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特約業者" := by native_decide
example : isShortLabel "特級" = true := by native_decide
example : isShortLabel "特級" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特級" := by native_decide
example : isShortLabel "特許権" = true := by native_decide
example : isShortLabel "特許権" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特許権" := by native_decide
example : isShortLabel "特許権者等" = true := by native_decide
example : isShortLabel "特許権者等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "特許権者等" := by native_decide
example : isShortLabel "独立行政法人" = true := by native_decide
example : isShortLabel "独立行政法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "独立行政法人" := by native_decide
example : isShortLabel "猶予適用者" = true := by native_decide
example : isShortLabel "猶予適用者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "猶予適用者" := by native_decide
example : isShortLabel "猶予）又は" = true := by native_decide
example : isShortLabel "猶予）又は" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "猶予）又は" := by native_decide
example : isShortLabel "獣医業" = true := by native_decide
example : isShortLabel "獣医業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "獣医業" := by native_decide
example : isShortLabel "玩具類" = true := by native_decide
example : isShortLabel "玩具類" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "玩具類" := by native_decide
example : isShortLabel "現務の結了" = true := by native_decide
example : isShortLabel "現務の結了" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "現務の結了" := by native_decide
example : isShortLabel "現物出資法人" = true := by native_decide
example : isShortLabel "現物出資法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "現物出資法人" := by native_decide
example : isShortLabel "現物分配法人" = true := by native_decide
example : isShortLabel "現物分配法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "現物分配法人" := by native_decide
example : isShortLabel "現金" = true := by native_decide
example : isShortLabel "現金" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "現金" := by native_decide
example : isShortLabel "理容業" = true := by native_decide
example : isShortLabel "理容業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "理容業" := by native_decide
example : isShortLabel "理由" = true := by native_decide
example : isShortLabel "理由" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "理由" := by native_decide
example : isShortLabel "琺瑯" = true := by native_decide
example : isShortLabel "琺瑯" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "琺瑯" := by native_decide
example : isShortLabel "瑕" = true := by native_decide
example : isShortLabel "瑕" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "瑕" := by native_decide
example : isShortLabel "瑕疵" = true := by native_decide
example : isShortLabel "瑕疵" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "瑕疵" := by native_decide
example : isShortLabel "環境性能割" = true := by native_decide
example : isShortLabel "環境性能割" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "環境性能割" := by native_decide
example : isShortLabel "甘味果実酒" = true := by native_decide
example : isShortLabel "甘味果実酒" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "甘味果実酒" := by native_decide
example : isShortLabel "甚" = true := by native_decide
example : isShortLabel "甚" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "甚" := by native_decide
example : isShortLabel "生じた" = true := by native_decide
example : isShortLabel "生じた" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "生じた" := by native_decide
example : isShortLabel "生じた日" = true := by native_decide
example : isShortLabel "生じた日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "生じた日" := by native_decide
example : isShortLabel "生じた日の" = true := by native_decide
example : isShortLabel "生じた日の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "生じた日の" := by native_decide
example : isShortLabel "生命保険会社" = true := by native_decide
example : isShortLabel "生命保険会社" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "生命保険会社" := by native_decide
example : isShortLabel "生命保険契約" = true := by native_decide
example : isShortLabel "生命保険契約" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "生命保険契約" := by native_decide
example : isShortLabel "生徒数" = true := by native_decide
example : isShortLabel "生徒数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "生徒数" := by native_decide
example : isShortLabel "生物（" = true := by native_decide
example : isShortLabel "生物（" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "生物（" := by native_decide
example : isShortLabel "生産森林組合" = true := by native_decide
example : isShortLabel "生産森林組合" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "生産森林組合" := by native_decide
example : isShortLabel "生産高比例法" = true := by native_decide
example : isShortLabel "生産高比例法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "生産高比例法" := by native_decide
example : isShortLabel "申告、" = true := by native_decide
example : isShortLabel "申告、" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "申告、" := by native_decide
example : isShortLabel "申告を" = true := by native_decide
example : isShortLabel "申告を" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "申告を" := by native_decide
example : isShortLabel "申告及び" = true := by native_decide
example : isShortLabel "申告及び" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "申告及び" := by native_decide
example : isShortLabel "申告書" = true := by native_decide
example : isShortLabel "申告書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "申告書" := by native_decide
example : isShortLabel "申告書の種類" = true := by native_decide
example : isShortLabel "申告書の種類" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "申告書の種類" := by native_decide
example : isShortLabel "申告書等を" = true := by native_decide
example : isShortLabel "申告書等を" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "申告書等を" := by native_decide
example : isShortLabel "申告納付" = true := by native_decide
example : isShortLabel "申告納付" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "申告納付" := by native_decide
example : isShortLabel "申告納入" = true := by native_decide
example : isShortLabel "申告納入" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "申告納入" := by native_decide
example : isShortLabel "申告納税方式" = true := by native_decide
example : isShortLabel "申告納税方式" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "申告納税方式" := by native_decide
example : isShortLabel "申立てをした" = true := by native_decide
example : isShortLabel "申立てをした" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "申立てをした" := by native_decide
example : isShortLabel "申立人" = true := by native_decide
example : isShortLabel "申立人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "申立人" := by native_decide
example : isShortLabel "町村部人口" = true := by native_decide
example : isShortLabel "町村部人口" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "町村部人口" := by native_decide
example : isShortLabel "番号" = true := by native_decide
example : isShortLabel "番号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "番号" := by native_decide
example : isShortLabel "番号既告知者" = true := by native_decide
example : isShortLabel "番号既告知者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "番号既告知者" := by native_decide
example : isShortLabel "異動事由" = true := by native_decide
example : isShortLabel "異動事由" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "異動事由" := by native_decide
example : isShortLabel "異動年月日" = true := by native_decide
example : isShortLabel "異動年月日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "異動年月日" := by native_decide
example : isShortLabel "疇" = true := by native_decide
example : isShortLabel "疇" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "疇" := by native_decide
example : isShortLabel "疵" = true := by native_decide
example : isShortLabel "疵" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "疵" := by native_decide
example : isShortLabel "病床の数" = true := by native_decide
example : isShortLabel "病床の数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "病床の数" := by native_decide
example : isShortLabel "病院" = true := by native_decide
example : isShortLabel "病院" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "病院" := by native_decide
example : isShortLabel "痩" = true := by native_decide
example : isShortLabel "痩" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "痩" := by native_decide
example : isShortLabel "発効日の前日" = true := by native_decide
example : isShortLabel "発効日の前日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "発効日の前日" := by native_decide
example : isShortLabel "発泡剤用" = true := by native_decide
example : isShortLabel "発泡剤用" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "発泡剤用" := by native_decide
example : isShortLabel "発泡性酒類" = true := by native_decide
example : isShortLabel "発泡性酒類" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "発泡性酒類" := by native_decide
example : isShortLabel "発泡酒" = true := by native_decide
example : isShortLabel "発泡酒" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "発泡酒" := by native_decide
example : isShortLabel "発生時換算法" = true := by native_decide
example : isShortLabel "発生時換算法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "発生時換算法" := by native_decide
example : isShortLabel "発行法人等" = true := by native_decide
example : isShortLabel "発行法人等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "発行法人等" := by native_decide
example : isShortLabel "発電施設" = true := by native_decide
example : isShortLabel "発電施設" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "発電施設" := by native_decide
example : isShortLabel "登録免許税法" = true := by native_decide
example : isShortLabel "登録免許税法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "登録免許税法" := by native_decide
example : isShortLabel "登録原票" = true := by native_decide
example : isShortLabel "登録原票" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "登録原票" := by native_decide
example : isShortLabel "登録年月日" = true := by native_decide
example : isShortLabel "登録年月日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "登録年月日" := by native_decide
example : isShortLabel "登録記念物" = true := by native_decide
example : isShortLabel "登録記念物" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "登録記念物" := by native_decide
example : isShortLabel "白酒" = true := by native_decide
example : isShortLabel "白酒" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "白酒" := by native_decide
example : isShortLabel "百万円未満" = true := by native_decide
example : isShortLabel "百万円未満" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "百万円未満" := by native_decide
example : isShortLabel "百五十四億円" = true := by native_decide
example : isShortLabel "百五十四億円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "百五十四億円" := by native_decide
example : isShortLabel "百億円" = true := by native_decide
example : isShortLabel "百億円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "百億円" := by native_decide
example : isShortLabel "百八十人" = true := by native_decide
example : isShortLabel "百八十人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "百八十人" := by native_decide
example : isShortLabel "目的" = true := by native_decide
example : isShortLabel "目的" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "目的" := by native_decide
example : isShortLabel "盲人用つえ" = true := by native_decide
example : isShortLabel "盲人用つえ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "盲人用つえ" := by native_decide
example : isShortLabel "相当する額" = true := by native_decide
example : isShortLabel "相当する額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "相当する額" := by native_decide
example : isShortLabel "相手国の法律" = true := by native_decide
example : isShortLabel "相手国の法律" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "相手国の法律" := by native_decide
example : isShortLabel "相手国団体が" = true := by native_decide
example : isShortLabel "相手国団体が" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "相手国団体が" := by native_decide
example : isShortLabel "相手国等" = true := by native_decide
example : isShortLabel "相手国等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "相手国等" := by native_decide
example : isShortLabel "相手国等の" = true := by native_decide
example : isShortLabel "相手国等の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "相手国等の" := by native_decide
example : isShortLabel "相続人" = true := by native_decide
example : isShortLabel "相続人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "相続人" := by native_decide
example : isShortLabel "相続又は遺贈" = true := by native_decide
example : isShortLabel "相続又は遺贈" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "相続又は遺贈" := by native_decide
example : isShortLabel "相続税法" = true := by native_decide
example : isShortLabel "相続税法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "相続税法" := by native_decide
example : isShortLabel "相続税額" = true := by native_decide
example : isShortLabel "相続税額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "相続税額" := by native_decide
example : isShortLabel "相続税額は" = true := by native_decide
example : isShortLabel "相続税額は" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "相続税額は" := by native_decide
example : isShortLabel "督促" = true := by native_decide
example : isShortLabel "督促" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "督促" := by native_decide
example : isShortLabel "督促に" = true := by native_decide
example : isShortLabel "督促に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "督促に" := by native_decide
example : isShortLabel "督促状" = true := by native_decide
example : isShortLabel "督促状" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "督促状" := by native_decide
example : isShortLabel "短時間労働者" = true := by native_decide
example : isShortLabel "短時間労働者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "短時間労働者" := by native_decide
example : isShortLabel "短期賃貸資産" = true := by native_decide
example : isShortLabel "短期賃貸資産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "短期賃貸資産" := by native_decide
example : isShortLabel "石油ガス" = true := by native_decide
example : isShortLabel "石油ガス" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "石油ガス" := by native_decide
example : isShortLabel "石油ガス税" = true := by native_decide
example : isShortLabel "石油ガス税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "石油ガス税" := by native_decide
example : isShortLabel "石油ガス等" = true := by native_decide
example : isShortLabel "石油ガス等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "石油ガス等" := by native_decide
example : isShortLabel "石油コークス" = true := by native_decide
example : isShortLabel "石油コークス" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "石油コークス" := by native_decide
example : isShortLabel "石油石炭税" = true := by native_decide
example : isShortLabel "石油石炭税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "石油石炭税" := by native_decide
example : isShortLabel "石油税" = true := by native_decide
example : isShortLabel "石油税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "石油税" := by native_decide
example : isShortLabel "石油製品" = true := by native_decide
example : isShortLabel "石油製品" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "石油製品" := by native_decide
example : isShortLabel "石炭" = true := by native_decide
example : isShortLabel "石炭" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "石炭" := by native_decide
example : isShortLabel "砂糖" = true := by native_decide
example : isShortLabel "砂糖" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "砂糖" := by native_decide
example : isShortLabel "砂糖、糖" = true := by native_decide
example : isShortLabel "砂糖、糖" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "砂糖、糖" := by native_decide
example : isShortLabel "砂糖消費税法" = true := by native_decide
example : isShortLabel "砂糖消費税法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "砂糖消費税法" := by native_decide
example : isShortLabel "研修施設" = true := by native_decide
example : isShortLabel "研修施設" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "研修施設" := by native_decide
example : isShortLabel "研究施設" = true := by native_decide
example : isShortLabel "研究施設" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "研究施設" := by native_decide
example : isShortLabel "研究開発" = true := by native_decide
example : isShortLabel "研究開発" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "研究開発" := by native_decide
example : isShortLabel "確定申告書" = true := by native_decide
example : isShortLabel "確定申告書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "確定申告書" := by native_decide
example : isShortLabel "確定申告書等" = true := by native_decide
example : isShortLabel "確定申告書等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "確定申告書等" := by native_decide
example : isShortLabel "確定申告期限" = true := by native_decide
example : isShortLabel "確定申告期限" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "確定申告期限" := by native_decide
example : isShortLabel "確定相続税額" = true := by native_decide
example : isShortLabel "確定相続税額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "確定相続税額" := by native_decide
example : isShortLabel "社会福祉法人" = true := by native_decide
example : isShortLabel "社会福祉法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "社会福祉法人" := by native_decide
example : isShortLabel "社会福祉費" = true := by native_decide
example : isShortLabel "社会福祉費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "社会福祉費" := by native_decide
example : isShortLabel "社債的受益権" = true := by native_decide
example : isShortLabel "社債的受益権" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "社債的受益権" := by native_decide
example : isShortLabel "祀" = true := by native_decide
example : isShortLabel "祀" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "祀" := by native_decide
example : isShortLabel "神戸海運局長" = true := by native_decide
example : isShortLabel "神戸海運局長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "神戸海運局長" := by native_decide
example : isShortLabel "禁" = true := by native_decide
example : isShortLabel "禁" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "禁" := by native_decide
example : isShortLabel "福岡陸運局長" = true := by native_decide
example : isShortLabel "福岡陸運局長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "福岡陸運局長" := by native_decide
example : isShortLabel "福島県" = true := by native_decide
example : isShortLabel "福島県" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "福島県" := by native_decide
example : isShortLabel "福島県の区域" = true := by native_decide
example : isShortLabel "福島県の区域" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "福島県の区域" := by native_decide
example : isShortLabel "福祉年金勘定" = true := by native_decide
example : isShortLabel "福祉年金勘定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "福祉年金勘定" := by native_decide
example : isShortLabel "租税" = true := by native_decide
example : isShortLabel "租税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "租税" := by native_decide
example : isShortLabel "租税徴収法" = true := by native_decide
example : isShortLabel "租税徴収法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "租税徴収法" := by native_decide
example : isShortLabel "租税条約" = true := by native_decide
example : isShortLabel "租税条約" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "租税条約" := by native_decide
example : isShortLabel "租税条約等" = true := by native_decide
example : isShortLabel "租税条約等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "租税条約等" := by native_decide
example : isShortLabel "租税特別措置" = true := by native_decide
example : isShortLabel "租税特別措置" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "租税特別措置" := by native_decide
example : isShortLabel "移入の年月日" = true := by native_decide
example : isShortLabel "移入の年月日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "移入の年月日" := by native_decide
example : isShortLabel "移入の目的" = true := by native_decide
example : isShortLabel "移入の目的" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "移入の目的" := by native_decide
example : isShortLabel "移出の年月日" = true := by native_decide
example : isShortLabel "移出の年月日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "移出の年月日" := by native_decide
example : isShortLabel "移行期限" = true := by native_decide
example : isShortLabel "移行期限" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "移行期限" := by native_decide
example : isShortLabel "税務代理人" = true := by native_decide
example : isShortLabel "税務代理人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "税務代理人" := by native_decide
example : isShortLabel "税務署副署長" = true := by native_decide
example : isShortLabel "税務署副署長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "税務署副署長" := by native_decide
example : isShortLabel "税務署長" = true := by native_decide
example : isShortLabel "税務署長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "税務署長" := by native_decide
example : isShortLabel "税務署長に" = true := by native_decide
example : isShortLabel "税務署長に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "税務署長に" := by native_decide
example : isShortLabel "税務署長等" = true := by native_decide
example : isShortLabel "税務署長等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "税務署長等" := by native_decide
example : isShortLabel "税率" = true := by native_decide
example : isShortLabel "税率" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "税率" := by native_decide
example : isShortLabel "税率、" = true := by native_decide
example : isShortLabel "税率、" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "税率、" := by native_decide
example : isShortLabel "税理士分科会" = true := by native_decide
example : isShortLabel "税理士分科会" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "税理士分科会" := by native_decide
example : isShortLabel "税理士審査会" = true := by native_decide
example : isShortLabel "税理士審査会" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "税理士審査会" := by native_decide
example : isShortLabel "税理士業" = true := by native_decide
example : isShortLabel "税理士業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "税理士業" := by native_decide
example : isShortLabel "税関" = true := by native_decide
example : isShortLabel "税関" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "税関" := by native_decide
example : isShortLabel "税関出張所長" = true := by native_decide
example : isShortLabel "税関出張所長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "税関出張所長" := by native_decide
example : isShortLabel "税関支署長" = true := by native_decide
example : isShortLabel "税関支署長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "税関支署長" := by native_decide
example : isShortLabel "税関総務部長" = true := by native_decide
example : isShortLabel "税関総務部長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "税関総務部長" := by native_decide
example : isShortLabel "税関長" = true := by native_decide
example : isShortLabel "税関長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "税関長" := by native_decide
example : isShortLabel "税関長権限" = true := by native_decide
example : isShortLabel "税関長権限" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "税関長権限" := by native_decide
example : isShortLabel "税額控除額" = true := by native_decide
example : isShortLabel "税額控除額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "税額控除額" := by native_decide
example : isShortLabel "種別" = true := by native_decide
example : isShortLabel "種別" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "種別" := by native_decide
example : isShortLabel "種別割" = true := by native_decide
example : isShortLabel "種別割" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "種別割" := by native_decide
example : isShortLabel "種別補正" = true := by native_decide
example : isShortLabel "種別補正" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "種別補正" := by native_decide
example : isShortLabel "種雄牛" = true := by native_decide
example : isShortLabel "種雄牛" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "種雄牛" := by native_decide
example : isShortLabel "空気調和設備" = true := by native_decide
example : isShortLabel "空気調和設備" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "空気調和設備" := by native_decide
example : isShortLabel "立木" = true := by native_decide
example : isShortLabel "立木" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "立木" := by native_decide
example : isShortLabel "竣" = true := by native_decide
example : isShortLabel "竣" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "竣" := by native_decide
example : isShortLabel "竪" = true := by native_decide
example : isShortLabel "竪" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "竪" := by native_decide
example : isShortLabel "符号ＡＤ" = true := by native_decide
example : isShortLabel "符号ＡＤ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "符号ＡＤ" := by native_decide
example : isShortLabel "第一号ニ" = true := by native_decide
example : isShortLabel "第一号ニ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第一号ニ" := by native_decide
example : isShortLabel "第一号ホ" = true := by native_decide
example : isShortLabel "第一号ホ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第一号ホ" := by native_decide
example : isShortLabel "第一号書式" = true := by native_decide
example : isShortLabel "第一号書式" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第一号書式" := by native_decide
example : isShortLabel "第一条の規定" = true := by native_decide
example : isShortLabel "第一条の規定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第一条の規定" := by native_decide
example : isShortLabel "第一条第七号" = true := by native_decide
example : isShortLabel "第一条第七号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第一条第七号" := by native_decide
example : isShortLabel "第一款" = true := by native_decide
example : isShortLabel "第一款" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第一款" := by native_decide
example : isShortLabel "第一目" = true := by native_decide
example : isShortLabel "第一目" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第一目" := by native_decide
example : isShortLabel "第一種事業" = true := by native_decide
example : isShortLabel "第一種事業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第一種事業" := by native_decide
example : isShortLabel "第一項」と、" = true := by native_decide
example : isShortLabel "第一項」と、" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第一項」と、" := by native_decide
example : isShortLabel "第一項に" = true := by native_decide
example : isShortLabel "第一項に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第一項に" := by native_decide
example : isShortLabel "第一項の" = true := by native_decide
example : isShortLabel "第一項の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第一項の" := by native_decide
example : isShortLabel "第一項の協議" = true := by native_decide
example : isShortLabel "第一項の協議" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第一項の協議" := by native_decide
example : isShortLabel "第一項の承認" = true := by native_decide
example : isShortLabel "第一項の承認" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第一項の承認" := by native_decide
example : isShortLabel "第一項の法人" = true := by native_decide
example : isShortLabel "第一項の法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第一項の法人" := by native_decide
example : isShortLabel "第一項の表" = true := by native_decide
example : isShortLabel "第一項の表" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第一項の表" := by native_decide
example : isShortLabel "第一項の規定" = true := by native_decide
example : isShortLabel "第一項の規定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第一項の規定" := by native_decide
example : isShortLabel "第一項中" = true := by native_decide
example : isShortLabel "第一項中" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第一項中" := by native_decide
example : isShortLabel "第一項又は" = true := by native_decide
example : isShortLabel "第一項又は" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第一項又は" := by native_decide
example : isShortLabel "第一項本文" = true := by native_decide
example : isShortLabel "第一項本文" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第一項本文" := by native_decide
example : isShortLabel "第一項第一号" = true := by native_decide
example : isShortLabel "第一項第一号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第一項第一号" := by native_decide
example : isShortLabel "第一項第七号" = true := by native_decide
example : isShortLabel "第一項第七号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第一項第七号" := by native_decide
example : isShortLabel "第一項第三号" = true := by native_decide
example : isShortLabel "第一項第三号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第一項第三号" := by native_decide
example : isShortLabel "第一項第九号" = true := by native_decide
example : isShortLabel "第一項第九号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第一項第九号" := by native_decide
example : isShortLabel "第一項第二号" = true := by native_decide
example : isShortLabel "第一項第二号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第一項第二号" := by native_decide
example : isShortLabel "第一項第五号" = true := by native_decide
example : isShortLabel "第一項第五号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第一項第五号" := by native_decide
example : isShortLabel "第一項第六号" = true := by native_decide
example : isShortLabel "第一項第六号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第一項第六号" := by native_decide
example : isShortLabel "第一項第十号" = true := by native_decide
example : isShortLabel "第一項第十号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第一項第十号" := by native_decide
example : isShortLabel "第一項第四号" = true := by native_decide
example : isShortLabel "第一項第四号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第一項第四号" := by native_decide
example : isShortLabel "第七号の" = true := by native_decide
example : isShortLabel "第七号の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第七号の" := by native_decide
example : isShortLabel "第七号様式" = true := by native_decide
example : isShortLabel "第七号様式" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第七号様式" := by native_decide
example : isShortLabel "第七条の五" = true := by native_decide
example : isShortLabel "第七条の五" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第七条の五" := by native_decide
example : isShortLabel "第七条の六" = true := by native_decide
example : isShortLabel "第七条の六" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第七条の六" := by native_decide
example : isShortLabel "第七条の十三" = true := by native_decide
example : isShortLabel "第七条の十三" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第七条の十三" := by native_decide
example : isShortLabel "第七条の十八" = true := by native_decide
example : isShortLabel "第七条の十八" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第七条の十八" := by native_decide
example : isShortLabel "第七条の規定" = true := by native_decide
example : isShortLabel "第七条の規定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第七条の規定" := by native_decide
example : isShortLabel "第七条第七項" = true := by native_decide
example : isShortLabel "第七条第七項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第七条第七項" := by native_decide
example : isShortLabel "第七条第九項" = true := by native_decide
example : isShortLabel "第七条第九項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第七条第九項" := by native_decide
example : isShortLabel "第七条第五項" = true := by native_decide
example : isShortLabel "第七条第五項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第七条第五項" := by native_decide
example : isShortLabel "第七条第八項" = true := by native_decide
example : isShortLabel "第七条第八項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第七条第八項" := by native_decide
example : isShortLabel "第七条第六項" = true := by native_decide
example : isShortLabel "第七条第六項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第七条第六項" := by native_decide
example : isShortLabel "第七条第十項" = true := by native_decide
example : isShortLabel "第七条第十項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第七条第十項" := by native_decide
example : isShortLabel "第七項後段" = true := by native_decide
example : isShortLabel "第七項後段" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第七項後段" := by native_decide
example : isShortLabel "第七項第一号" = true := by native_decide
example : isShortLabel "第七項第一号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第七項第一号" := by native_decide
example : isShortLabel "第七項第三号" = true := by native_decide
example : isShortLabel "第七項第三号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第七項第三号" := by native_decide
example : isShortLabel "第七項第二号" = true := by native_decide
example : isShortLabel "第七項第二号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第七項第二号" := by native_decide
example : isShortLabel "第七項第四号" = true := by native_decide
example : isShortLabel "第七項第四号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第七項第四号" := by native_decide
example : isShortLabel "第三十号様式" = true := by native_decide
example : isShortLabel "第三十号様式" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第三十号様式" := by native_decide
example : isShortLabel "第三十四号ヘ" = true := by native_decide
example : isShortLabel "第三十四号ヘ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第三十四号ヘ" := by native_decide
example : isShortLabel "第三号後段" = true := by native_decide
example : isShortLabel "第三号後段" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第三号後段" := by native_decide
example : isShortLabel "第三国団体が" = true := by native_decide
example : isShortLabel "第三国団体が" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第三国団体が" := by native_decide
example : isShortLabel "第三年度" = true := by native_decide
example : isShortLabel "第三年度" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第三年度" := by native_decide
example : isShortLabel "第三条の規定" = true := by native_decide
example : isShortLabel "第三条の規定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第三条の規定" := by native_decide
example : isShortLabel "第三条第一項" = true := by native_decide
example : isShortLabel "第三条第一項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第三条第一項" := by native_decide
example : isShortLabel "第三条第七項" = true := by native_decide
example : isShortLabel "第三条第七項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第三条第七項" := by native_decide
example : isShortLabel "第三条第三項" = true := by native_decide
example : isShortLabel "第三条第三項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第三条第三項" := by native_decide
example : isShortLabel "第三条第九項" = true := by native_decide
example : isShortLabel "第三条第九項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第三条第九項" := by native_decide
example : isShortLabel "第三条第二項" = true := by native_decide
example : isShortLabel "第三条第二項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第三条第二項" := by native_decide
example : isShortLabel "第三条第八項" = true := by native_decide
example : isShortLabel "第三条第八項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第三条第八項" := by native_decide
example : isShortLabel "第三条第六号" = true := by native_decide
example : isShortLabel "第三条第六号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第三条第六号" := by native_decide
example : isShortLabel "第三条第四項" = true := by native_decide
example : isShortLabel "第三条第四項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第三条第四項" := by native_decide
example : isShortLabel "第三条見出し" = true := by native_decide
example : isShortLabel "第三条見出し" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第三条見出し" := by native_decide
example : isShortLabel "第三種事業" = true := by native_decide
example : isShortLabel "第三種事業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第三種事業" := by native_decide
example : isShortLabel "第三項の承認" = true := by native_decide
example : isShortLabel "第三項の承認" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第三項の承認" := by native_decide
example : isShortLabel "第三項の表" = true := by native_decide
example : isShortLabel "第三項の表" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第三項の表" := by native_decide
example : isShortLabel "第三項の規定" = true := by native_decide
example : isShortLabel "第三項の規定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第三項の規定" := by native_decide
example : isShortLabel "第三項各号" = true := by native_decide
example : isShortLabel "第三項各号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第三項各号" := by native_decide
example : isShortLabel "第三項第一号" = true := by native_decide
example : isShortLabel "第三項第一号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第三項第一号" := by native_decide
example : isShortLabel "第三項第七号" = true := by native_decide
example : isShortLabel "第三項第七号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第三項第七号" := by native_decide
example : isShortLabel "第三項第三号" = true := by native_decide
example : isShortLabel "第三項第三号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第三項第三号" := by native_decide
example : isShortLabel "第三項第二号" = true := by native_decide
example : isShortLabel "第三項第二号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第三項第二号" := by native_decide
example : isShortLabel "第三項第六号" = true := by native_decide
example : isShortLabel "第三項第六号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第三項第六号" := by native_decide
example : isShortLabel "第九条の八" = true := by native_decide
example : isShortLabel "第九条の八" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第九条の八" := by native_decide
example : isShortLabel "第九条の六" = true := by native_decide
example : isShortLabel "第九条の六" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第九条の六" := by native_decide
example : isShortLabel "第九条の規定" = true := by native_decide
example : isShortLabel "第九条の規定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第九条の規定" := by native_decide
example : isShortLabel "第九条第一項" = true := by native_decide
example : isShortLabel "第九条第一項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第九条第一項" := by native_decide
example : isShortLabel "第九条第八号" = true := by native_decide
example : isShortLabel "第九条第八号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第九条第八号" := by native_decide
example : isShortLabel "第九項、" = true := by native_decide
example : isShortLabel "第九項、" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第九項、" := by native_decide
example : isShortLabel "第九項に" = true := by native_decide
example : isShortLabel "第九項に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第九項に" := by native_decide
example : isShortLabel "第九項の表" = true := by native_decide
example : isShortLabel "第九項の表" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第九項の表" := by native_decide
example : isShortLabel "第九項の規定" = true := by native_decide
example : isShortLabel "第九項の規定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第九項の規定" := by native_decide
example : isShortLabel "第九項まで" = true := by native_decide
example : isShortLabel "第九項まで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第九項まで" := by native_decide
example : isShortLabel "第九項並びに" = true := by native_decide
example : isShortLabel "第九項並びに" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第九項並びに" := by native_decide
example : isShortLabel "第九項各号" = true := by native_decide
example : isShortLabel "第九項各号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第九項各号" := by native_decide
example : isShortLabel "第九項第一号" = true := by native_decide
example : isShortLabel "第九項第一号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第九項第一号" := by native_decide
example : isShortLabel "第九項第九号" = true := by native_decide
example : isShortLabel "第九項第九号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第九項第九号" := by native_decide
example : isShortLabel "第九項第二号" = true := by native_decide
example : isShortLabel "第九項第二号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第九項第二号" := by native_decide
example : isShortLabel "第九項第五号" = true := by native_decide
example : isShortLabel "第九項第五号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第九項第五号" := by native_decide
example : isShortLabel "第九項第十号" = true := by native_decide
example : isShortLabel "第九項第十号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第九項第十号" := by native_decide
example : isShortLabel "第二十六項の" = true := by native_decide
example : isShortLabel "第二十六項の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第二十六項の" := by native_decide
example : isShortLabel "第二号ロ" = true := by native_decide
example : isShortLabel "第二号ロ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第二号ロ" := by native_decide
example : isShortLabel "第二号書式" = true := by native_decide
example : isShortLabel "第二号書式" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第二号書式" := by native_decide
example : isShortLabel "第二号様式" = true := by native_decide
example : isShortLabel "第二号様式" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第二号様式" := by native_decide
example : isShortLabel "第二年度" = true := by native_decide
example : isShortLabel "第二年度" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第二年度" := by native_decide
example : isShortLabel "第二条の八" = true := by native_decide
example : isShortLabel "第二条の八" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第二条の八" := by native_decide
example : isShortLabel "第二条の十三" = true := by native_decide
example : isShortLabel "第二条の十三" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第二条の十三" := by native_decide
example : isShortLabel "第二条の十二" = true := by native_decide
example : isShortLabel "第二条の十二" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第二条の十二" := by native_decide
example : isShortLabel "第二条の十五" = true := by native_decide
example : isShortLabel "第二条の十五" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第二条の十五" := by native_decide
example : isShortLabel "第二条の十六" = true := by native_decide
example : isShortLabel "第二条の十六" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第二条の十六" := by native_decide
example : isShortLabel "第二条の規定" = true := by native_decide
example : isShortLabel "第二条の規定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第二条の規定" := by native_decide
example : isShortLabel "第二条第一号" = true := by native_decide
example : isShortLabel "第二条第一号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第二条第一号" := by native_decide
example : isShortLabel "第二条第一項" = true := by native_decide
example : isShortLabel "第二条第一項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第二条第一項" := by native_decide
example : isShortLabel "第二条第三項" = true := by native_decide
example : isShortLabel "第二条第三項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第二条第三項" := by native_decide
example : isShortLabel "第二条第九項" = true := by native_decide
example : isShortLabel "第二条第九項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第二条第九項" := by native_decide
example : isShortLabel "第二条第二項" = true := by native_decide
example : isShortLabel "第二条第二項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第二条第二項" := by native_decide
example : isShortLabel "第二条第八項" = true := by native_decide
example : isShortLabel "第二条第八項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第二条第八項" := by native_decide
example : isShortLabel "第二条第六項" = true := by native_decide
example : isShortLabel "第二条第六項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第二条第六項" := by native_decide
example : isShortLabel "第二条第十号" = true := by native_decide
example : isShortLabel "第二条第十号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第二条第十号" := by native_decide
example : isShortLabel "第二条第四項" = true := by native_decide
example : isShortLabel "第二条第四項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第二条第四項" := by native_decide
example : isShortLabel "第二款" = true := by native_decide
example : isShortLabel "第二款" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第二款" := by native_decide
example : isShortLabel "第二目" = true := by native_decide
example : isShortLabel "第二目" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第二目" := by native_decide
example : isShortLabel "第二種事業" = true := by native_decide
example : isShortLabel "第二種事業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第二種事業" := by native_decide
example : isShortLabel "第二章第一節" = true := by native_decide
example : isShortLabel "第二章第一節" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第二章第一節" := by native_decide
example : isShortLabel "第五十号様式" = true := by native_decide
example : isShortLabel "第五十号様式" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第五十号様式" := by native_decide
example : isShortLabel "第五条第一号" = true := by native_decide
example : isShortLabel "第五条第一号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第五条第一号" := by native_decide
example : isShortLabel "第五条第三号" = true := by native_decide
example : isShortLabel "第五条第三号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第五条第三号" := by native_decide
example : isShortLabel "第五条第二号" = true := by native_decide
example : isShortLabel "第五条第二号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第五条第二号" := by native_decide
example : isShortLabel "第五条第六項" = true := by native_decide
example : isShortLabel "第五条第六項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第五条第六項" := by native_decide
example : isShortLabel "第五条第十項" = true := by native_decide
example : isShortLabel "第五条第十項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第五条第十項" := by native_decide
example : isShortLabel "第五条第四項" = true := by native_decide
example : isShortLabel "第五条第四項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第五条第四項" := by native_decide
example : isShortLabel "第五種事業" = true := by native_decide
example : isShortLabel "第五種事業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第五種事業" := by native_decide
example : isShortLabel "第五項の承認" = true := by native_decide
example : isShortLabel "第五項の承認" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第五項の承認" := by native_decide
example : isShortLabel "第五項の表" = true := by native_decide
example : isShortLabel "第五項の表" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第五項の表" := by native_decide
example : isShortLabel "第五項の規定" = true := by native_decide
example : isShortLabel "第五項の規定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第五項の規定" := by native_decide
example : isShortLabel "第五項後段" = true := by native_decide
example : isShortLabel "第五項後段" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第五項後段" := by native_decide
example : isShortLabel "第五項本文" = true := by native_decide
example : isShortLabel "第五項本文" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第五項本文" := by native_decide
example : isShortLabel "第五項第一号" = true := by native_decide
example : isShortLabel "第五項第一号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第五項第一号" := by native_decide
example : isShortLabel "第五項第七号" = true := by native_decide
example : isShortLabel "第五項第七号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第五項第七号" := by native_decide
example : isShortLabel "第五項第三号" = true := by native_decide
example : isShortLabel "第五項第三号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第五項第三号" := by native_decide
example : isShortLabel "第五項第二号" = true := by native_decide
example : isShortLabel "第五項第二号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第五項第二号" := by native_decide
example : isShortLabel "第五項第五号" = true := by native_decide
example : isShortLabel "第五項第五号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第五項第五号" := by native_decide
example : isShortLabel "第五項第六号" = true := by native_decide
example : isShortLabel "第五項第六号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第五項第六号" := by native_decide
example : isShortLabel "第五項第四号" = true := by native_decide
example : isShortLabel "第五項第四号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第五項第四号" := by native_decide
example : isShortLabel "第八条の七" = true := by native_decide
example : isShortLabel "第八条の七" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第八条の七" := by native_decide
example : isShortLabel "第八条の九" = true := by native_decide
example : isShortLabel "第八条の九" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第八条の九" := by native_decide
example : isShortLabel "第八条の十七" = true := by native_decide
example : isShortLabel "第八条の十七" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第八条の十七" := by native_decide
example : isShortLabel "第八条の十三" = true := by native_decide
example : isShortLabel "第八条の十三" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第八条の十三" := by native_decide
example : isShortLabel "第八条の十五" = true := by native_decide
example : isShortLabel "第八条の十五" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第八条の十五" := by native_decide
example : isShortLabel "第八条の十六" = true := by native_decide
example : isShortLabel "第八条の十六" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第八条の十六" := by native_decide
example : isShortLabel "第八条の規定" = true := by native_decide
example : isShortLabel "第八条の規定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第八条の規定" := by native_decide
example : isShortLabel "第八条第一項" = true := by native_decide
example : isShortLabel "第八条第一項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第八条第一項" := by native_decide
example : isShortLabel "第八条第三項" = true := by native_decide
example : isShortLabel "第八条第三項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第八条第三項" := by native_decide
example : isShortLabel "第八条第二項" = true := by native_decide
example : isShortLabel "第八条第二項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第八条第二項" := by native_decide
example : isShortLabel "第八条第四項" = true := by native_decide
example : isShortLabel "第八条第四項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第八条第四項" := by native_decide
example : isShortLabel "第八項後段" = true := by native_decide
example : isShortLabel "第八項後段" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第八項後段" := by native_decide
example : isShortLabel "第八項第一号" = true := by native_decide
example : isShortLabel "第八項第一号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第八項第一号" := by native_decide
example : isShortLabel "第八項第二号" = true := by native_decide
example : isShortLabel "第八項第二号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第八項第二号" := by native_decide
example : isShortLabel "第八項第十号" = true := by native_decide
example : isShortLabel "第八項第十号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第八項第十号" := by native_decide
example : isShortLabel "第六号まで" = true := by native_decide
example : isShortLabel "第六号まで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第六号まで" := by native_decide
example : isShortLabel "第六条の規定" = true := by native_decide
example : isShortLabel "第六条の規定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第六条の規定" := by native_decide
example : isShortLabel "第六条第一号" = true := by native_decide
example : isShortLabel "第六条第一号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第六条第一号" := by native_decide
example : isShortLabel "第六条第一項" = true := by native_decide
example : isShortLabel "第六条第一項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第六条第一項" := by native_decide
example : isShortLabel "第六条第二号" = true := by native_decide
example : isShortLabel "第六条第二号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第六条第二号" := by native_decide
example : isShortLabel "第六条第五項" = true := by native_decide
example : isShortLabel "第六条第五項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第六条第五項" := by native_decide
example : isShortLabel "第六種事業" = true := by native_decide
example : isShortLabel "第六種事業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第六種事業" := by native_decide
example : isShortLabel "第六項の表" = true := by native_decide
example : isShortLabel "第六項の表" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第六項の表" := by native_decide
example : isShortLabel "第六項まで" = true := by native_decide
example : isShortLabel "第六項まで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第六項まで" := by native_decide
example : isShortLabel "第六項本文" = true := by native_decide
example : isShortLabel "第六項本文" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第六項本文" := by native_decide
example : isShortLabel "第六項第一号" = true := by native_decide
example : isShortLabel "第六項第一号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第六項第一号" := by native_decide
example : isShortLabel "第六項第三号" = true := by native_decide
example : isShortLabel "第六項第三号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第六項第三号" := by native_decide
example : isShortLabel "第六項第二号" = true := by native_decide
example : isShortLabel "第六項第二号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第六項第二号" := by native_decide
example : isShortLabel "第六項第四号" = true := by native_decide
example : isShortLabel "第六項第四号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第六項第四号" := by native_decide
example : isShortLabel "第十一号様式" = true := by native_decide
example : isShortLabel "第十一号様式" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第十一号様式" := by native_decide
example : isShortLabel "第十一項に" = true := by native_decide
example : isShortLabel "第十一項に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第十一項に" := by native_decide
example : isShortLabel "第十一項の" = true := by native_decide
example : isShortLabel "第十一項の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第十一項の" := by native_decide
example : isShortLabel "第十一項又は" = true := by native_decide
example : isShortLabel "第十一項又は" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第十一項又は" := by native_decide
example : isShortLabel "第十一項各号" = true := by native_decide
example : isShortLabel "第十一項各号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第十一項各号" := by native_decide
example : isShortLabel "第十七号様式" = true := by native_decide
example : isShortLabel "第十七号様式" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第十七号様式" := by native_decide
example : isShortLabel "第十七項の表" = true := by native_decide
example : isShortLabel "第十七項の表" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第十七項の表" := by native_decide
example : isShortLabel "第十三号様式" = true := by native_decide
example : isShortLabel "第十三号様式" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第十三号様式" := by native_decide
example : isShortLabel "第十三項に" = true := by native_decide
example : isShortLabel "第十三項に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第十三項に" := by native_decide
example : isShortLabel "第十三項の表" = true := by native_decide
example : isShortLabel "第十三項の表" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第十三項の表" := by native_decide
example : isShortLabel "第十二項の表" = true := by native_decide
example : isShortLabel "第十二項の表" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第十二項の表" := by native_decide
example : isShortLabel "第十二項又は" = true := by native_decide
example : isShortLabel "第十二項又は" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第十二項又は" := by native_decide
example : isShortLabel "第十五項まで" = true := by native_decide
example : isShortLabel "第十五項まで" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第十五項まで" := by native_decide
example : isShortLabel "第十八号様式" = true := by native_decide
example : isShortLabel "第十八号様式" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第十八号様式" := by native_decide
example : isShortLabel "第十八項の表" = true := by native_decide
example : isShortLabel "第十八項の表" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第十八項の表" := by native_decide
example : isShortLabel "第十六号様式" = true := by native_decide
example : isShortLabel "第十六号様式" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第十六号様式" := by native_decide
example : isShortLabel "第十六条の四" = true := by native_decide
example : isShortLabel "第十六条の四" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第十六条の四" := by native_decide
example : isShortLabel "第十号様式" = true := by native_decide
example : isShortLabel "第十号様式" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第十号様式" := by native_decide
example : isShortLabel "第十四号様式" = true := by native_decide
example : isShortLabel "第十四号様式" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第十四号様式" := by native_decide
example : isShortLabel "第十条の規定" = true := by native_decide
example : isShortLabel "第十条の規定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第十条の規定" := by native_decide
example : isShortLabel "第十条第三項" = true := by native_decide
example : isShortLabel "第十条第三項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第十条第三項" := by native_decide
example : isShortLabel "第十項の表" = true := by native_decide
example : isShortLabel "第十項の表" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第十項の表" := by native_decide
example : isShortLabel "第十項各号" = true := by native_decide
example : isShortLabel "第十項各号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第十項各号" := by native_decide
example : isShortLabel "第十項本文" = true := by native_decide
example : isShortLabel "第十項本文" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第十項本文" := by native_decide
example : isShortLabel "第十項第一号" = true := by native_decide
example : isShortLabel "第十項第一号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第十項第一号" := by native_decide
example : isShortLabel "第十項第三号" = true := by native_decide
example : isShortLabel "第十項第三号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第十項第三号" := by native_decide
example : isShortLabel "第十項第二号" = true := by native_decide
example : isShortLabel "第十項第二号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第十項第二号" := by native_decide
example : isShortLabel "第四十条の十" = true := by native_decide
example : isShortLabel "第四十条の十" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第四十条の十" := by native_decide
example : isShortLabel "第四条の規定" = true := by native_decide
example : isShortLabel "第四条の規定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第四条の規定" := by native_decide
example : isShortLabel "第四条第一項" = true := by native_decide
example : isShortLabel "第四条第一項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第四条第一項" := by native_decide
example : isShortLabel "第四条第三項" = true := by native_decide
example : isShortLabel "第四条第三項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第四条第三項" := by native_decide
example : isShortLabel "第四条第二項" = true := by native_decide
example : isShortLabel "第四条第二項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第四条第二項" := by native_decide
example : isShortLabel "第四条第五項" = true := by native_decide
example : isShortLabel "第四条第五項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第四条第五項" := by native_decide
example : isShortLabel "第四条第四項" = true := by native_decide
example : isShortLabel "第四条第四項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第四条第四項" := by native_decide
example : isShortLabel "第四種事業" = true := by native_decide
example : isShortLabel "第四種事業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第四種事業" := by native_decide
example : isShortLabel "第四節" = true := by native_decide
example : isShortLabel "第四節" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第四節" := by native_decide
example : isShortLabel "第四項に" = true := by native_decide
example : isShortLabel "第四項に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第四項に" := by native_decide
example : isShortLabel "第四項の承認" = true := by native_decide
example : isShortLabel "第四項の承認" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第四項の承認" := by native_decide
example : isShortLabel "第四項の表" = true := by native_decide
example : isShortLabel "第四項の表" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第四項の表" := by native_decide
example : isShortLabel "第四項各号" = true := by native_decide
example : isShortLabel "第四項各号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第四項各号" := by native_decide
example : isShortLabel "第四項第一号" = true := by native_decide
example : isShortLabel "第四項第一号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第四項第一号" := by native_decide
example : isShortLabel "第四項第七号" = true := by native_decide
example : isShortLabel "第四項第七号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第四項第七号" := by native_decide
example : isShortLabel "第四項第三号" = true := by native_decide
example : isShortLabel "第四項第三号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第四項第三号" := by native_decide
example : isShortLabel "第四項第二号" = true := by native_decide
example : isShortLabel "第四項第二号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第四項第二号" := by native_decide
example : isShortLabel "第四項第八号" = true := by native_decide
example : isShortLabel "第四項第八号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第四項第八号" := by native_decide
example : isShortLabel "第百条第二号" = true := by native_decide
example : isShortLabel "第百条第二号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "第百条第二号" := by native_decide
example : isShortLabel "筏" = true := by native_decide
example : isShortLabel "筏" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "筏" := by native_decide
example : isShortLabel "答弁書" = true := by native_decide
example : isShortLabel "答弁書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "答弁書" := by native_decide
example : isShortLabel "算定する" = true := by native_decide
example : isShortLabel "算定する" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算定する" := by native_decide
example : isShortLabel "算定の基礎" = true := by native_decide
example : isShortLabel "算定の基礎" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算定の基礎" := by native_decide
example : isShortLabel "算定方法" = true := by native_decide
example : isShortLabel "算定方法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算定方法" := by native_decide
example : isShortLabel "算定方法等" = true := by native_decide
example : isShortLabel "算定方法等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算定方法等" := by native_decide
example : isShortLabel "算定額" = true := by native_decide
example : isShortLabel "算定額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算定額" := by native_decide
example : isShortLabel "算式Ⅰ" = true := by native_decide
example : isShortLabel "算式Ⅰ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式Ⅰ" := by native_decide
example : isShortLabel "算式Ⅰの符号" = true := by native_decide
example : isShortLabel "算式Ⅰの符号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式Ⅰの符号" := by native_decide
example : isShortLabel "算式Ⅱ" = true := by native_decide
example : isShortLabel "算式Ⅱ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式Ⅱ" := by native_decide
example : isShortLabel "算式Ⅱの符号" = true := by native_decide
example : isShortLabel "算式Ⅱの符号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式Ⅱの符号" := by native_decide
example : isShortLabel "算式Ⅲ" = true := by native_decide
example : isShortLabel "算式Ⅲ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式Ⅲ" := by native_decide
example : isShortLabel "算式Ⅲの符号" = true := by native_decide
example : isShortLabel "算式Ⅲの符号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式Ⅲの符号" := by native_decide
example : isShortLabel "算式Ⅳ" = true := by native_decide
example : isShortLabel "算式Ⅳ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式Ⅳ" := by native_decide
example : isShortLabel "算式Ⅳの符号" = true := by native_decide
example : isShortLabel "算式Ⅳの符号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式Ⅳの符号" := by native_decide
example : isShortLabel "算式Ⅴ" = true := by native_decide
example : isShortLabel "算式Ⅴ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式Ⅴ" := by native_decide
example : isShortLabel "算式Ⅴの符号" = true := by native_decide
example : isShortLabel "算式Ⅴの符号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式Ⅴの符号" := by native_decide
example : isShortLabel "算式Ⅵ" = true := by native_decide
example : isShortLabel "算式Ⅵ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式Ⅵ" := by native_decide
example : isShortLabel "算式Ⅵの符号" = true := by native_decide
example : isShortLabel "算式Ⅵの符号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式Ⅵの符号" := by native_decide
example : isShortLabel "算式Ⅶ" = true := by native_decide
example : isShortLabel "算式Ⅶ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式Ⅶ" := by native_decide
example : isShortLabel "算式Ⅶの符号" = true := by native_decide
example : isShortLabel "算式Ⅶの符号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式Ⅶの符号" := by native_decide
example : isShortLabel "算式Ⅷ" = true := by native_decide
example : isShortLabel "算式Ⅷ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式Ⅷ" := by native_decide
example : isShortLabel "算式Ⅷの符号" = true := by native_decide
example : isShortLabel "算式Ⅷの符号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式Ⅷの符号" := by native_decide
example : isShortLabel "算式Ⅸ" = true := by native_decide
example : isShortLabel "算式Ⅸ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式Ⅸ" := by native_decide
example : isShortLabel "算式Ⅸの符号" = true := by native_decide
example : isShortLabel "算式Ⅸの符号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式Ⅸの符号" := by native_decide
example : isShortLabel "算式Ⅹ" = true := by native_decide
example : isShortLabel "算式Ⅹ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式Ⅹ" := by native_decide
example : isShortLabel "算式ⅩⅠ" = true := by native_decide
example : isShortLabel "算式ⅩⅠ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式ⅩⅠ" := by native_decide
example : isShortLabel "算式ⅩⅡ" = true := by native_decide
example : isShortLabel "算式ⅩⅡ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式ⅩⅡ" := by native_decide
example : isShortLabel "算式ⅩⅢ" = true := by native_decide
example : isShortLabel "算式ⅩⅢ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式ⅩⅢ" := by native_decide
example : isShortLabel "算式ⅩⅣ" = true := by native_decide
example : isShortLabel "算式ⅩⅣ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式ⅩⅣ" := by native_decide
example : isShortLabel "算式ⅩⅤ" = true := by native_decide
example : isShortLabel "算式ⅩⅤ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式ⅩⅤ" := by native_decide
example : isShortLabel "算式ⅩⅥ" = true := by native_decide
example : isShortLabel "算式ⅩⅥ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式ⅩⅥ" := by native_decide
example : isShortLabel "算式ⅩⅦ" = true := by native_decide
example : isShortLabel "算式ⅩⅦ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式ⅩⅦ" := by native_decide
example : isShortLabel "算式ⅩⅧ" = true := by native_decide
example : isShortLabel "算式ⅩⅧ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式ⅩⅧ" := by native_decide
example : isShortLabel "算式ⅩⅨ" = true := by native_decide
example : isShortLabel "算式ⅩⅨ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式ⅩⅨ" := by native_decide
example : isShortLabel "算式ⅩⅩ" = true := by native_decide
example : isShortLabel "算式ⅩⅩ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式ⅩⅩ" := by native_decide
example : isShortLabel "算式ⅩⅩⅠ" = true := by native_decide
example : isShortLabel "算式ⅩⅩⅠ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式ⅩⅩⅠ" := by native_decide
example : isShortLabel "算式ⅩⅩⅡ" = true := by native_decide
example : isShortLabel "算式ⅩⅩⅡ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式ⅩⅩⅡ" := by native_decide
example : isShortLabel "算式ⅩⅩⅢ" = true := by native_decide
example : isShortLabel "算式ⅩⅩⅢ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式ⅩⅩⅢ" := by native_decide
example : isShortLabel "算式ⅩⅩⅣ" = true := by native_decide
example : isShortLabel "算式ⅩⅩⅣ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式ⅩⅩⅣ" := by native_decide
example : isShortLabel "算式ⅩⅩⅤ" = true := by native_decide
example : isShortLabel "算式ⅩⅩⅤ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式ⅩⅩⅤ" := by native_decide
example : isShortLabel "算式ⅩⅩⅥ" = true := by native_decide
example : isShortLabel "算式ⅩⅩⅥ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式ⅩⅩⅥ" := by native_decide
example : isShortLabel "算式ⅩⅩⅦ" = true := by native_decide
example : isShortLabel "算式ⅩⅩⅦ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式ⅩⅩⅦ" := by native_decide
example : isShortLabel "算式Ⅹの符号" = true := by native_decide
example : isShortLabel "算式Ⅹの符号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式Ⅹの符号" := by native_decide
example : isShortLabel "算式ア" = true := by native_decide
example : isShortLabel "算式ア" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式ア" := by native_decide
example : isShortLabel "算式アの符号" = true := by native_decide
example : isShortLabel "算式アの符号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式アの符号" := by native_decide
example : isShortLabel "算式ア（１）" = true := by native_decide
example : isShortLabel "算式ア（１）" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式ア（１）" := by native_decide
example : isShortLabel "算式ア（２）" = true := by native_decide
example : isShortLabel "算式ア（２）" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式ア（２）" := by native_decide
example : isShortLabel "算式イ" = true := by native_decide
example : isShortLabel "算式イ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式イ" := by native_decide
example : isShortLabel "算式イの符号" = true := by native_decide
example : isShortLabel "算式イの符号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式イの符号" := by native_decide
example : isShortLabel "算式イ（１）" = true := by native_decide
example : isShortLabel "算式イ（１）" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式イ（１）" := by native_decide
example : isShortLabel "算式イ（２）" = true := by native_decide
example : isShortLabel "算式イ（２）" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式イ（２）" := by native_decide
example : isShortLabel "算式ウ" = true := by native_decide
example : isShortLabel "算式ウ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式ウ" := by native_decide
example : isShortLabel "算式ウの符号" = true := by native_decide
example : isShortLabel "算式ウの符号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式ウの符号" := by native_decide
example : isShortLabel "算式エ" = true := by native_decide
example : isShortLabel "算式エ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式エ" := by native_decide
example : isShortLabel "算式エの符号" = true := by native_decide
example : isShortLabel "算式エの符号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式エの符号" := by native_decide
example : isShortLabel "算式オ" = true := by native_decide
example : isShortLabel "算式オ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式オ" := by native_decide
example : isShortLabel "算式オの符号" = true := by native_decide
example : isShortLabel "算式オの符号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式オの符号" := by native_decide
example : isShortLabel "算式カ" = true := by native_decide
example : isShortLabel "算式カ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式カ" := by native_decide
example : isShortLabel "算式カの符号" = true := by native_decide
example : isShortLabel "算式カの符号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式カの符号" := by native_decide
example : isShortLabel "算式キ" = true := by native_decide
example : isShortLabel "算式キ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式キ" := by native_decide
example : isShortLabel "算式キの符号" = true := by native_decide
example : isShortLabel "算式キの符号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式キの符号" := by native_decide
example : isShortLabel "算式ク" = true := by native_decide
example : isShortLabel "算式ク" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式ク" := by native_decide
example : isShortLabel "算式クの符号" = true := by native_decide
example : isShortLabel "算式クの符号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "算式クの符号" := by native_decide
example : isShortLabel "範囲" = true := by native_decide
example : isShortLabel "範囲" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "範囲" := by native_decide
example : isShortLabel "篩" = true := by native_decide
example : isShortLabel "篩" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "篩" := by native_decide
example : isShortLabel "簿記論" = true := by native_decide
example : isShortLabel "簿記論" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "簿記論" := by native_decide
example : isShortLabel "籍" = true := by native_decide
example : isShortLabel "籍" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "籍" := by native_decide
example : isShortLabel "粉末酒" = true := by native_decide
example : isShortLabel "粉末酒" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "粉末酒" := by native_decide
example : isShortLabel "糖みつ" = true := by native_decide
example : isShortLabel "糖みつ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "糖みつ" := by native_decide
example : isShortLabel "糖類" = true := by native_decide
example : isShortLabel "糖類" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "糖類" := by native_decide
example : isShortLabel "納付" = true := by native_decide
example : isShortLabel "納付" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納付" := by native_decide
example : isShortLabel "納付させる" = true := by native_decide
example : isShortLabel "納付させる" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納付させる" := by native_decide
example : isShortLabel "納付した" = true := by native_decide
example : isShortLabel "納付した" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納付した" := by native_decide
example : isShortLabel "納付すべき" = true := by native_decide
example : isShortLabel "納付すべき" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納付すべき" := by native_decide
example : isShortLabel "納付する" = true := by native_decide
example : isShortLabel "納付する" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納付する" := by native_decide
example : isShortLabel "納付に" = true := by native_decide
example : isShortLabel "納付に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納付に" := by native_decide
example : isShortLabel "納付に使用" = true := by native_decide
example : isShortLabel "納付に使用" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納付に使用" := by native_decide
example : isShortLabel "納付の" = true := by native_decide
example : isShortLabel "納付の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納付の" := by native_decide
example : isShortLabel "納付の日" = true := by native_decide
example : isShortLabel "納付の日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納付の日" := by native_decide
example : isShortLabel "納付を" = true := by native_decide
example : isShortLabel "納付を" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納付を" := by native_decide
example : isShortLabel "納付催告書" = true := by native_decide
example : isShortLabel "納付催告書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納付催告書" := by native_decide
example : isShortLabel "納付受託証書" = true := by native_decide
example : isShortLabel "納付受託証書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納付受託証書" := by native_decide
example : isShortLabel "納付場所" = true := by native_decide
example : isShortLabel "納付場所" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納付場所" := by native_decide
example : isShortLabel "納付義務" = true := by native_decide
example : isShortLabel "納付義務" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納付義務" := by native_decide
example : isShortLabel "納付通知書" = true := by native_decide
example : isShortLabel "納付通知書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納付通知書" := by native_decide
example : isShortLabel "納付）" = true := by native_decide
example : isShortLabel "納付）" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納付）" := by native_decide
example : isShortLabel "納入金" = true := by native_decide
example : isShortLabel "納入金" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納入金" := by native_decide
example : isShortLabel "納期限" = true := by native_decide
example : isShortLabel "納期限" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納期限" := by native_decide
example : isShortLabel "納期限の延長" = true := by native_decide
example : isShortLabel "納期限の延長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納期限の延長" := by native_decide
example : isShortLabel "納税" = true := by native_decide
example : isShortLabel "納税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納税" := by native_decide
example : isShortLabel "納税に" = true := by native_decide
example : isShortLabel "納税に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納税に" := by native_decide
example : isShortLabel "納税の" = true := by native_decide
example : isShortLabel "納税の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納税の" := by native_decide
example : isShortLabel "納税の猶予" = true := by native_decide
example : isShortLabel "納税の猶予" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納税の猶予" := by native_decide
example : isShortLabel "納税を" = true := by native_decide
example : isShortLabel "納税を" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納税を" := by native_decide
example : isShortLabel "納税告知書" = true := by native_decide
example : isShortLabel "納税告知書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納税告知書" := by native_decide
example : isShortLabel "納税地等" = true := by native_decide
example : isShortLabel "納税地等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納税地等" := by native_decide
example : isShortLabel "納税申告書" = true := by native_decide
example : isShortLabel "納税申告書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納税申告書" := by native_decide
example : isShortLabel "納税義務者" = true := by native_decide
example : isShortLabel "納税義務者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納税義務者" := by native_decide
example : isShortLabel "納税義務者に" = true := by native_decide
example : isShortLabel "納税義務者に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納税義務者に" := by native_decide
example : isShortLabel "納税者" = true := by native_decide
example : isShortLabel "納税者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納税者" := by native_decide
example : isShortLabel "納税通知書" = true := by native_decide
example : isShortLabel "納税通知書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "納税通知書" := by native_decide
example : isShortLabel "純トン数" = true := by native_decide
example : isShortLabel "純トン数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "純トン数" := by native_decide
example : isShortLabel "純損失の金額" = true := by native_decide
example : isShortLabel "純損失の金額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "純損失の金額" := by native_decide
example : isShortLabel "純資産" = true := by native_decide
example : isShortLabel "純資産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "純資産" := by native_decide
example : isShortLabel "純資産額" = true := by native_decide
example : isShortLabel "純資産額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "純資産額" := by native_decide
example : isShortLabel "紙巻たばこ" = true := by native_decide
example : isShortLabel "紙巻たばこ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "紙巻たばこ" := by native_decide
example : isShortLabel "索道事業" = true := by native_decide
example : isShortLabel "索道事業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "索道事業" := by native_decide
example : isShortLabel "累積増差税額" = true := by native_decide
example : isShortLabel "累積増差税額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "累積増差税額" := by native_decide
example : isShortLabel "累積投資勘定" = true := by native_decide
example : isShortLabel "累積投資勘定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "累積投資勘定" := by native_decide
example : isShortLabel "終身定期金" = true := by native_decide
example : isShortLabel "終身定期金" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "終身定期金" := by native_decide
example : isShortLabel "組合" = true := by native_decide
example : isShortLabel "組合" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "組合" := by native_decide
example : isShortLabel "組合事業" = true := by native_decide
example : isShortLabel "組合事業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "組合事業" := by native_decide
example : isShortLabel "組合員の除名" = true := by native_decide
example : isShortLabel "組合員の除名" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "組合員の除名" := by native_decide
example : isShortLabel "組合契約" = true := by native_decide
example : isShortLabel "組合契約" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "組合契約" := by native_decide
example : isShortLabel "組合財産" = true := by native_decide
example : isShortLabel "組合財産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "組合財産" := by native_decide
example : isShortLabel "組織変更" = true := by native_decide
example : isShortLabel "組織変更" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "組織変更" := by native_decide
example : isShortLabel "経営承継期間" = true := by native_decide
example : isShortLabel "経営承継期間" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "経営承継期間" := by native_decide
example : isShortLabel "経常収入金額" = true := by native_decide
example : isShortLabel "経常収入金額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "経常収入金額" := by native_decide
example : isShortLabel "経由して" = true := by native_decide
example : isShortLabel "経由して" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "経由して" := by native_decide
example : isShortLabel "経費の種類" = true := by native_decide
example : isShortLabel "経費の種類" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "経費の種類" := by native_decide
example : isShortLabel "経過する日" = true := by native_decide
example : isShortLabel "経過する日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "経過する日" := by native_decide
example : isShortLabel "結婚式場" = true := by native_decide
example : isShortLabel "結婚式場" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "結婚式場" := by native_decide
example : isShortLabel "給与所得" = true := by native_decide
example : isShortLabel "給与所得" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "給与所得" := by native_decide
example : isShortLabel "給与等" = true := by native_decide
example : isShortLabel "給与等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "給与等" := by native_decide
example : isShortLabel "給排水設備" = true := by native_decide
example : isShortLabel "給排水設備" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "給排水設備" := by native_decide
example : isShortLabel "継続管理勘定" = true := by native_decide
example : isShortLabel "継続管理勘定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "継続管理勘定" := by native_decide
example : isShortLabel "綜" = true := by native_decide
example : isShortLabel "綜" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "綜" := by native_decide
example : isShortLabel "綻" = true := by native_decide
example : isShortLabel "綻" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "綻" := by native_decide
example : isShortLabel "綿実油" = true := by native_decide
example : isShortLabel "綿実油" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "綿実油" := by native_decide
example : isShortLabel "総会の議決" = true := by native_decide
example : isShortLabel "総会の議決" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "総会の議決" := by native_decide
example : isShortLabel "総務省令" = true := by native_decide
example : isShortLabel "総務省令" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "総務省令" := by native_decide
example : isShortLabel "総所得金額の" = true := by native_decide
example : isShortLabel "総所得金額の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "総所得金額の" := by native_decide
example : isShortLabel "総社員の同意" = true := by native_decide
example : isShortLabel "総社員の同意" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "総社員の同意" := by native_decide
example : isShortLabel "総額　⑳" = true := by native_decide
example : isShortLabel "総額　⑳" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "総額　⑳" := by native_decide
example : isShortLabel "緑化施設" = true := by native_decide
example : isShortLabel "緑化施設" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "緑化施設" := by native_decide
example : isShortLabel "線路設備" = true := by native_decide
example : isShortLabel "線路設備" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "線路設備" := by native_decide
example : isShortLabel "線道路橋）" = true := by native_decide
example : isShortLabel "線道路橋）" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "線道路橋）" := by native_decide
example : isShortLabel "繊維工業" = true := by native_decide
example : isShortLabel "繊維工業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "繊維工業" := by native_decide
example : isShortLabel "繰り延べ額" = true := by native_decide
example : isShortLabel "繰り延べ額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "繰り延べ額" := by native_decide
example : isShortLabel "繰延資産" = true := by native_decide
example : isShortLabel "繰延資産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "繰延資産" := by native_decide
example : isShortLabel "置時計用の台" = true := by native_decide
example : isShortLabel "置時計用の台" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "置時計用の台" := by native_decide
example : isShortLabel "罹" = true := by native_decide
example : isShortLabel "罹" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "罹" := by native_decide
example : isShortLabel "美容業" = true := by native_decide
example : isShortLabel "美容業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "美容業" := by native_decide
example : isShortLabel "美術工芸品" = true := by native_decide
example : isShortLabel "美術工芸品" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "美術工芸品" := by native_decide
example : isShortLabel "美術館" = true := by native_decide
example : isShortLabel "美術館" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "美術館" := by native_decide
example : isShortLabel "翌日" = true := by native_decide
example : isShortLabel "翌日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "翌日" := by native_decide
example : isShortLabel "翌月末日" = true := by native_decide
example : isShortLabel "翌月末日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "翌月末日" := by native_decide
example : isShortLabel "老人扶養親族" = true := by native_decide
example : isShortLabel "老人扶養親族" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "老人扶養親族" := by native_decide
example : isShortLabel "者が" = true := by native_decide
example : isShortLabel "者が" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "者が" := by native_decide
example : isShortLabel "者は" = true := by native_decide
example : isShortLabel "者は" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "者は" := by native_decide
example : isShortLabel "職業訓練施設" = true := by native_decide
example : isShortLabel "職業訓練施設" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "職業訓練施設" := by native_decide
example : isShortLabel "聾" = true := by native_decide
example : isShortLabel "聾" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "聾" := by native_decide
example : isShortLabel "肢" = true := by native_decide
example : isShortLabel "肢" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "肢" := by native_decide
example : isShortLabel "育成者権" = true := by native_decide
example : isShortLabel "育成者権" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "育成者権" := by native_decide
example : isShortLabel "背折り機" = true := by native_decide
example : isShortLabel "背折り機" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "背折り機" := by native_decide
example : isShortLabel "腕時計" = true := by native_decide
example : isShortLabel "腕時計" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "腕時計" := by native_decide
example : isShortLabel "臨時所得" = true := by native_decide
example : isShortLabel "臨時所得" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "臨時所得" := by native_decide
example : isShortLabel "臨時改定事由" = true := by native_decide
example : isShortLabel "臨時改定事由" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "臨時改定事由" := by native_decide
example : isShortLabel "自動車" = true := by native_decide
example : isShortLabel "自動車" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "自動車" := by native_decide
example : isShortLabel "自動車整備業" = true := by native_decide
example : isShortLabel "自動車整備業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "自動車整備業" := by native_decide
example : isShortLabel "自動車税" = true := by native_decide
example : isShortLabel "自動車税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "自動車税" := by native_decide
example : isShortLabel "自動車重量税" = true := by native_decide
example : isShortLabel "自動車重量税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "自動車重量税" := by native_decide
example : isShortLabel "自動送金指図" = true := by native_decide
example : isShortLabel "自動送金指図" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "自動送金指図" := by native_decide
example : isShortLabel "自家用" = true := by native_decide
example : isShortLabel "自家用" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "自家用" := by native_decide
example : isShortLabel "自己資本の額" = true := by native_decide
example : isShortLabel "自己資本の額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "自己資本の額" := by native_decide
example : isShortLabel "自治省令" = true := by native_decide
example : isShortLabel "自治省令" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "自治省令" := by native_decide
example : isShortLabel "自然災害共済" = true := by native_decide
example : isShortLabel "自然災害共済" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "自然災害共済" := by native_decide
example : isShortLabel "自重及び外" = true := by native_decide
example : isShortLabel "自重及び外" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "自重及び外" := by native_decide
example : isShortLabel "興信所業" = true := by native_decide
example : isShortLabel "興信所業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "興信所業" := by native_decide
example : isShortLabel "興行業" = true := by native_decide
example : isShortLabel "興行業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "興行業" := by native_decide
example : isShortLabel "舞踊家" = true := by native_decide
example : isShortLabel "舞踊家" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "舞踊家" := by native_decide
example : isShortLabel "航空保険" = true := by native_decide
example : isShortLabel "航空保険" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "航空保険" := by native_decide
example : isShortLabel "航空機" = true := by native_decide
example : isShortLabel "航空機" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "航空機" := by native_decide
example : isShortLabel "航空機整備業" = true := by native_decide
example : isShortLabel "航空機整備業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "航空機整備業" := by native_decide
example : isShortLabel "航空機燃料" = true := by native_decide
example : isShortLabel "航空機燃料" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "航空機燃料" := by native_decide
example : isShortLabel "航空機燃料税" = true := by native_decide
example : isShortLabel "航空機燃料税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "航空機燃料税" := by native_decide
example : isShortLabel "航空法" = true := by native_decide
example : isShortLabel "航空法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "航空法" := by native_decide
example : isShortLabel "航空計算機" = true := by native_decide
example : isShortLabel "航空計算機" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "航空計算機" := by native_decide
example : isShortLabel "航空運送状" = true := by native_decide
example : isShortLabel "航空運送状" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "航空運送状" := by native_decide
example : isShortLabel "船用品目録" = true := by native_decide
example : isShortLabel "船用品目録" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "船用品目録" := by native_decide
example : isShortLabel "船舶" = true := by native_decide
example : isShortLabel "船舶" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "船舶" := by native_decide
example : isShortLabel "船舶保険" = true := by native_decide
example : isShortLabel "船舶保険" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "船舶保険" := by native_decide
example : isShortLabel "船舶定係場業" = true := by native_decide
example : isShortLabel "船舶定係場業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "船舶定係場業" := by native_decide
example : isShortLabel "船荷証券" = true := by native_decide
example : isShortLabel "船荷証券" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "船荷証券" := by native_decide
example : isShortLabel "船費の額" = true := by native_decide
example : isShortLabel "船費の額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "船費の額" := by native_decide
example : isShortLabel "艤" = true := by native_decide
example : isShortLabel "艤" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "艤" := by native_decide
example : isShortLabel "若しくは" = true := by native_decide
example : isShortLabel "若しくは" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "若しくは" := by native_decide
example : isShortLabel "若しくはその" = true := by native_decide
example : isShortLabel "若しくはその" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "若しくはその" := by native_decide
example : isShortLabel "若しくはハ" = true := by native_decide
example : isShortLabel "若しくはハ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "若しくはハ" := by native_decide
example : isShortLabel "若しくは同項" = true := by native_decide
example : isShortLabel "若しくは同項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "若しくは同項" := by native_decide
example : isShortLabel "若しくは当該" = true := by native_decide
example : isShortLabel "若しくは当該" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "若しくは当該" := by native_decide
example : isShortLabel "若しくは法" = true := by native_decide
example : isShortLabel "若しくは法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "若しくは法" := by native_decide
example : isShortLabel "英国" = true := by native_decide
example : isShortLabel "英国" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "英国" := by native_decide
example : isShortLabel "英国協定" = true := by native_decide
example : isShortLabel "英国協定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "英国協定" := by native_decide
example : isShortLabel "英国通貨" = true := by native_decide
example : isShortLabel "英国通貨" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "英国通貨" := by native_decide
example : isShortLabel "荷為替手形" = true := by native_decide
example : isShortLabel "荷為替手形" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "荷為替手形" := by native_decide
example : isShortLabel "落花生" = true := by native_decide
example : isShortLabel "落花生" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "落花生" := by native_decide
example : isShortLabel "葉たばこ" = true := by native_decide
example : isShortLabel "葉たばこ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "葉たばこ" := by native_decide
example : isShortLabel "葉巻たばこ" = true := by native_decide
example : isShortLabel "葉巻たばこ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "葉巻たばこ" := by native_decide
example : isShortLabel "蒸留酒類" = true := by native_decide
example : isShortLabel "蒸留酒類" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "蒸留酒類" := by native_decide
example : isShortLabel "蔽" = true := by native_decide
example : isShortLabel "蔽" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "蔽" := by native_decide
example : isShortLabel "薬剤師業" = true := by native_decide
example : isShortLabel "薬剤師業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "薬剤師業" := by native_decide
example : isShortLabel "蛋" = true := by native_decide
example : isShortLabel "蛋" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "蛋" := by native_decide
example : isShortLabel "蜂" = true := by native_decide
example : isShortLabel "蜂" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "蜂" := by native_decide
example : isShortLabel "行政書士業" = true := by native_decide
example : isShortLabel "行政書士業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "行政書士業" := by native_decide
example : isShortLabel "行為" = true := by native_decide
example : isShortLabel "行為" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "行為" := by native_decide
example : isShortLabel "行為（" = true := by native_decide
example : isShortLabel "行為（" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "行為（" := by native_decide
example : isShortLabel "衛生設備" = true := by native_decide
example : isShortLabel "衛生設備" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "衛生設備" := by native_decide
example : isShortLabel "衛生費" = true := by native_decide
example : isShortLabel "衛生費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "衛生費" := by native_decide
example : isShortLabel "表の各号" = true := by native_decide
example : isShortLabel "表の各号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "表の各号" := by native_decide
example : isShortLabel "表の第十五号" = true := by native_decide
example : isShortLabel "表の第十五号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "表の第十五号" := by native_decide
example : isShortLabel "表の第十四号" = true := by native_decide
example : isShortLabel "表の第十四号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "表の第十四号" := by native_decide
example : isShortLabel "表示単位" = true := by native_decide
example : isShortLabel "表示単位" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "表示単位" := by native_decide
example : isShortLabel "被合併法人" = true := by native_decide
example : isShortLabel "被合併法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "被合併法人" := by native_decide
example : isShortLabel "被合併法人等" = true := by native_decide
example : isShortLabel "被合併法人等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "被合併法人等" := by native_decide
example : isShortLabel "被災価額" = true := by native_decide
example : isShortLabel "被災価額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "被災価額" := by native_decide
example : isShortLabel "被災共用土地" = true := by native_decide
example : isShortLabel "被災共用土地" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "被災共用土地" := by native_decide
example : isShortLabel "被災受贈者" = true := by native_decide
example : isShortLabel "被災受贈者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "被災受贈者" := by native_decide
example : isShortLabel "被災損失金額" = true := by native_decide
example : isShortLabel "被災損失金額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "被災損失金額" := by native_decide
example : isShortLabel "装蹄師業" = true := by native_decide
example : isShortLabel "装蹄師業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "装蹄師業" := by native_decide
example : isShortLabel "装身具製造用" = true := by native_decide
example : isShortLabel "装身具製造用" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "装身具製造用" := by native_decide
example : isShortLabel "補助原材料" = true := by native_decide
example : isShortLabel "補助原材料" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "補助原材料" := by native_decide
example : isShortLabel "補正の種類" = true := by native_decide
example : isShortLabel "補正の種類" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "補正の種類" := by native_decide
example : isShortLabel "製品" = true := by native_decide
example : isShortLabel "製品" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "製品" := by native_decide
example : isShortLabel "製版機" = true := by native_decide
example : isShortLabel "製版機" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "製版機" := by native_decide
example : isShortLabel "製造たばこ" = true := by native_decide
example : isShortLabel "製造たばこ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "製造たばこ" := by native_decide
example : isShortLabel "製造の期間" = true := by native_decide
example : isShortLabel "製造の期間" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "製造の期間" := by native_decide
example : isShortLabel "製造の目的" = true := by native_decide
example : isShortLabel "製造の目的" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "製造の目的" := by native_decide
example : isShortLabel "製造予定数量" = true := by native_decide
example : isShortLabel "製造予定数量" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "製造予定数量" := by native_decide
example : isShortLabel "製造工場" = true := by native_decide
example : isShortLabel "製造工場" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "製造工場" := by native_decide
example : isShortLabel "製造方法" = true := by native_decide
example : isShortLabel "製造方法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "製造方法" := by native_decide
example : isShortLabel "製造業" = true := by native_decide
example : isShortLabel "製造業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "製造業" := by native_decide
example : isShortLabel "見積残存価額" = true := by native_decide
example : isShortLabel "見積残存価額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "見積残存価額" := by native_decide
example : isShortLabel "規定する" = true := by native_decide
example : isShortLabel "規定する" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "規定する" := by native_decide
example : isShortLabel "規定する事実" = true := by native_decide
example : isShortLabel "規定する事実" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "規定する事実" := by native_decide
example : isShortLabel "規定する利子" = true := by native_decide
example : isShortLabel "規定する利子" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "規定する利子" := by native_decide
example : isShortLabel "規定する税率" = true := by native_decide
example : isShortLabel "規定する税率" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "規定する税率" := by native_decide
example : isShortLabel "規定は、法" = true := by native_decide
example : isShortLabel "規定は、法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "規定は、法" := by native_decide
example : isShortLabel "規定を" = true := by native_decide
example : isShortLabel "規定を" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "規定を" := by native_decide
example : isShortLabel "計理士業" = true := by native_decide
example : isShortLabel "計理士業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "計理士業" := by native_decide
example : isShortLabel "計算した金額" = true := by native_decide
example : isShortLabel "計算した金額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "計算した金額" := by native_decide
example : isShortLabel "計算基準日" = true := by native_decide
example : isShortLabel "計算基準日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "計算基準日" := by native_decide
example : isShortLabel "計算相続税額" = true := by native_decide
example : isShortLabel "計算相続税額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "計算相続税額" := by native_decide
example : isShortLabel "設備" = true := by native_decide
example : isShortLabel "設備" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "設備" := by native_decide
example : isShortLabel "設立の年月日" = true := by native_decide
example : isShortLabel "設立の年月日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "設立の年月日" := by native_decide
example : isShortLabel "設立の日" = true := by native_decide
example : isShortLabel "設立の日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "設立の日" := by native_decide
example : isShortLabel "設立国" = true := by native_decide
example : isShortLabel "設立国" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "設立国" := by native_decide
example : isShortLabel "設立等の日" = true := by native_decide
example : isShortLabel "設立等の日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "設立等の日" := by native_decide
example : isShortLabel "設計監督者業" = true := by native_decide
example : isShortLabel "設計監督者業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "設計監督者業" := by native_decide
example : isShortLabel "診療所" = true := by native_decide
example : isShortLabel "診療所" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "診療所" := by native_decide
example : isShortLabel "診療所の数" = true := by native_decide
example : isShortLabel "診療所の数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "診療所の数" := by native_decide
example : isShortLabel "診療所病床数" = true := by native_decide
example : isShortLabel "診療所病床数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "診療所病床数" := by native_decide
example : isShortLabel "証券投資信託" = true := by native_decide
example : isShortLabel "証券投資信託" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "証券投資信託" := by native_decide
example : isShortLabel "証明の年月日" = true := by native_decide
example : isShortLabel "証明の年月日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "証明の年月日" := by native_decide
example : isShortLabel "証明の番号" = true := by native_decide
example : isShortLabel "証明の番号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "証明の番号" := by native_decide
example : isShortLabel "証紙徴収" = true := by native_decide
example : isShortLabel "証紙徴収" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "証紙徴収" := by native_decide
example : isShortLabel "評価換え等" = true := by native_decide
example : isShortLabel "評価換え等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "評価換え等" := by native_decide
example : isShortLabel "評定" = true := by native_decide
example : isShortLabel "評定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "評定" := by native_decide
example : isShortLabel "試掘権" = true := by native_decide
example : isShortLabel "試掘権" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "試掘権" := by native_decide
example : isShortLabel "試掘鉱区" = true := by native_decide
example : isShortLabel "試掘鉱区" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "試掘鉱区" := by native_decide
example : isShortLabel "試験品" = true := by native_decide
example : isShortLabel "試験品" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "試験品" := by native_decide
example : isShortLabel "試験研究用" = true := by native_decide
example : isShortLabel "試験研究用" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "試験研究用" := by native_decide
example : isShortLabel "該当しない" = true := by native_decide
example : isShortLabel "該当しない" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "該当しない" := by native_decide
example : isShortLabel "認定医療法人" = true := by native_decide
example : isShortLabel "認定医療法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "認定医療法人" := by native_decide
example : isShortLabel "認定承継会社" = true := by native_decide
example : isShortLabel "認定承継会社" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "認定承継会社" := by native_decide
example : isShortLabel "認定移行計画" = true := by native_decide
example : isShortLabel "認定移行計画" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "認定移行計画" := by native_decide
example : isShortLabel "誓約書" = true := by native_decide
example : isShortLabel "誓約書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "誓約書" := by native_decide
example : isShortLabel "誘導標識" = true := by native_decide
example : isShortLabel "誘導標識" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "誘導標識" := by native_decide
example : isShortLabel "誘導灯" = true := by native_decide
example : isShortLabel "誘導灯" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "誘導灯" := by native_decide
example : isShortLabel "課税仕入れ" = true := by native_decide
example : isShortLabel "課税仕入れ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "課税仕入れ" := by native_decide
example : isShortLabel "課税定額" = true := by native_decide
example : isShortLabel "課税定額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "課税定額" := by native_decide
example : isShortLabel "課税対象所得" = true := by native_decide
example : isShortLabel "課税対象所得" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "課税対象所得" := by native_decide
example : isShortLabel "課税時期" = true := by native_decide
example : isShortLabel "課税時期" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "課税時期" := by native_decide
example : isShortLabel "課税期間" = true := by native_decide
example : isShortLabel "課税期間" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "課税期間" := by native_decide
example : isShortLabel "課税標準額" = true := by native_decide
example : isShortLabel "課税標準額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "課税標準額" := by native_decide
example : isShortLabel "課税済金額" = true := by native_decide
example : isShortLabel "課税済金額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "課税済金額" := by native_decide
example : isShortLabel "課税貨物" = true := by native_decide
example : isShortLabel "課税貨物" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "課税貨物" := by native_decide
example : isShortLabel "調整対象法人" = true := by native_decide
example : isShortLabel "調整対象法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "調整対象法人" := by native_decide
example : isShortLabel "調整対象農地" = true := by native_decide
example : isShortLabel "調整対象農地" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "調整対象農地" := by native_decide
example : isShortLabel "調整年数" = true := by native_decide
example : isShortLabel "調整年数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "調整年数" := by native_decide
example : isShortLabel "調査" = true := by native_decide
example : isShortLabel "調査" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "調査" := by native_decide
example : isShortLabel "調査の目的" = true := by native_decide
example : isShortLabel "調査の目的" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "調査の目的" := by native_decide
example : isShortLabel "請求者" = true := by native_decide
example : isShortLabel "請求者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "請求者" := by native_decide
example : isShortLabel "請負業" = true := by native_decide
example : isShortLabel "請負業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "請負業" := by native_decide
example : isShortLabel "諸芸師匠業" = true := by native_decide
example : isShortLabel "諸芸師匠業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "諸芸師匠業" := by native_decide
example : isShortLabel "警察職員数" = true := by native_decide
example : isShortLabel "警察職員数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "警察職員数" := by native_decide
example : isShortLabel "譲与時期" = true := by native_decide
example : isShortLabel "譲与時期" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "譲与時期" := by native_decide
example : isShortLabel "譲渡" = true := by native_decide
example : isShortLabel "譲渡" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "譲渡" := by native_decide
example : isShortLabel "譲渡の年月日" = true := by native_decide
example : isShortLabel "譲渡の年月日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "譲渡の年月日" := by native_decide
example : isShortLabel "譲渡の理由" = true := by native_decide
example : isShortLabel "譲渡の理由" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "譲渡の理由" := by native_decide
example : isShortLabel "譲渡利益金額" = true := by native_decide
example : isShortLabel "譲渡利益金額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "譲渡利益金額" := by native_decide
example : isShortLabel "譲渡制限株式" = true := by native_decide
example : isShortLabel "譲渡制限株式" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "譲渡制限株式" := by native_decide
example : isShortLabel "譲渡割" = true := by native_decide
example : isShortLabel "譲渡割" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "譲渡割" := by native_decide
example : isShortLabel "譲渡対価の額" = true := by native_decide
example : isShortLabel "譲渡対価の額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "譲渡対価の額" := by native_decide
example : isShortLabel "譲渡所得" = true := by native_decide
example : isShortLabel "譲渡所得" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "譲渡所得" := by native_decide
example : isShortLabel "譲渡資産" = true := by native_decide
example : isShortLabel "譲渡資産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "譲渡資産" := by native_decide
example : isShortLabel "負債" = true := by native_decide
example : isShortLabel "負債" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "負債" := by native_decide
example : isShortLabel "負担水準" = true := by native_decide
example : isShortLabel "負担水準" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "負担水準" := by native_decide
example : isShortLabel "負担調整率" = true := by native_decide
example : isShortLabel "負担調整率" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "負担調整率" := by native_decide
example : isShortLabel "財務省令" = true := by native_decide
example : isShortLabel "財務省令" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "財務省令" := by native_decide
example : isShortLabel "財務諸表論" = true := by native_decide
example : isShortLabel "財務諸表論" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "財務諸表論" := by native_decide
example : isShortLabel "財源不足団体" = true := by native_decide
example : isShortLabel "財源不足団体" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "財源不足団体" := by native_decide
example : isShortLabel "財源超過団体" = true := by native_decide
example : isShortLabel "財源超過団体" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "財源超過団体" := by native_decide
example : isShortLabel "財源超過額" = true := by native_decide
example : isShortLabel "財源超過額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "財源超過額" := by native_decide
example : isShortLabel "財産形成信託" = true := by native_decide
example : isShortLabel "財産形成信託" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "財産形成信託" := by native_decide
example : isShortLabel "財産目録" = true := by native_decide
example : isShortLabel "財産目録" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "財産目録" := by native_decide
example : isShortLabel "貨物の用途" = true := by native_decide
example : isShortLabel "貨物の用途" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "貨物の用途" := by native_decide
example : isShortLabel "貨物保険" = true := by native_decide
example : isShortLabel "貨物保険" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "貨物保険" := by native_decide
example : isShortLabel "貨物割" = true := by native_decide
example : isShortLabel "貨物割" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "貨物割" := by native_decide
example : isShortLabel "貨物用" = true := by native_decide
example : isShortLabel "貨物用" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "貨物用" := by native_decide
example : isShortLabel "販売施設" = true := by native_decide
example : isShortLabel "販売施設" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "販売施設" := by native_decide
example : isShortLabel "販売電気" = true := by native_decide
example : isShortLabel "販売電気" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "販売電気" := by native_decide
example : isShortLabel "貯蓄預金通帳" = true := by native_decide
example : isShortLabel "貯蓄預金通帳" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "貯蓄預金通帳" := by native_decide
example : isShortLabel "買主" = true := by native_decide
example : isShortLabel "買主" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "買主" := by native_decide
example : isShortLabel "買入消却" = true := by native_decide
example : isShortLabel "買入消却" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "買入消却" := by native_decide
example : isShortLabel "買取債権" = true := by native_decide
example : isShortLabel "買取債権" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "買取債権" := by native_decide
example : isShortLabel "買受代金の額" = true := by native_decide
example : isShortLabel "買受代金の額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "買受代金の額" := by native_decide
example : isShortLabel "買換資産" = true := by native_decide
example : isShortLabel "買換資産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "買換資産" := by native_decide
example : isShortLabel "貸付信託" = true := by native_decide
example : isShortLabel "貸付信託" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "貸付信託" := by native_decide
example : isShortLabel "貸付回収金" = true := by native_decide
example : isShortLabel "貸付回収金" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "貸付回収金" := by native_decide
example : isShortLabel "貸付期限" = true := by native_decide
example : isShortLabel "貸付期限" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "貸付期限" := by native_decide
example : isShortLabel "貸付金" = true := by native_decide
example : isShortLabel "貸付金" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "貸付金" := by native_decide
example : isShortLabel "貸家住宅" = true := by native_decide
example : isShortLabel "貸家住宅" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "貸家住宅" := by native_decide
example : isShortLabel "貸船料の額" = true := by native_decide
example : isShortLabel "貸船料の額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "貸船料の額" := by native_decide
example : isShortLabel "賃貸料収入" = true := by native_decide
example : isShortLabel "賃貸料収入" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "賃貸料収入" := by native_decide
example : isShortLabel "資本割" = true := by native_decide
example : isShortLabel "資本割" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "資本割" := by native_decide
example : isShortLabel "資本金等の額" = true := by native_decide
example : isShortLabel "資本金等の額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "資本金等の額" := by native_decide
example : isShortLabel "資産" = true := by native_decide
example : isShortLabel "資産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "資産" := by native_decide
example : isShortLabel "資産　当該" = true := by native_decide
example : isShortLabel "資産　当該" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "資産　当該" := by native_decide
example : isShortLabel "資産の交換" = true := by native_decide
example : isShortLabel "資産の交換" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "資産の交換" := by native_decide
example : isShortLabel "資産の譲渡等" = true := by native_decide
example : isShortLabel "資産の譲渡等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "資産の譲渡等" := by native_decide
example : isShortLabel "資産割" = true := by native_decide
example : isShortLabel "資産割" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "資産割" := by native_decide
example : isShortLabel "資金供与者等" = true := by native_decide
example : isShortLabel "資金供与者等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "資金供与者等" := by native_decide
example : isShortLabel "賠償責任保険" = true := by native_decide
example : isShortLabel "賠償責任保険" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "賠償責任保険" := by native_decide
example : isShortLabel "賦課期日" = true := by native_decide
example : isShortLabel "賦課期日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "賦課期日" := by native_decide
example : isShortLabel "賦課課税方式" = true := by native_decide
example : isShortLabel "賦課課税方式" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "賦課課税方式" := by native_decide
example : isShortLabel "購入した土地" = true := by native_decide
example : isShortLabel "購入した土地" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "購入した土地" := by native_decide
example : isShortLabel "購入した設備" = true := by native_decide
example : isShortLabel "購入した設備" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "購入した設備" := by native_decide
example : isShortLabel "購入した資産" = true := by native_decide
example : isShortLabel "購入した資産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "購入した資産" := by native_decide
example : isShortLabel "贈与" = true := by native_decide
example : isShortLabel "贈与" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "贈与" := by native_decide
example : isShortLabel "贈与税に" = true := by native_decide
example : isShortLabel "贈与税に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "贈与税に" := by native_decide
example : isShortLabel "贈与税の" = true := by native_decide
example : isShortLabel "贈与税の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "贈与税の" := by native_decide
example : isShortLabel "贈与者" = true := by native_decide
example : isShortLabel "贈与者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "贈与者" := by native_decide
example : isShortLabel "起債額" = true := by native_decide
example : isShortLabel "起債額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "起債額" := by native_decide
example : isShortLabel "距離測定機" = true := by native_decide
example : isShortLabel "距離測定機" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "距離測定機" := by native_decide
example : isShortLabel "跨" = true := by native_decide
example : isShortLabel "跨" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "跨" := by native_decide
example : isShortLabel "蹄" = true := by native_decide
example : isShortLabel "蹄" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "蹄" := by native_decide
example : isShortLabel "蹴球場" = true := by native_decide
example : isShortLabel "蹴球場" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "蹴球場" := by native_decide
example : isShortLabel "車両" = true := by native_decide
example : isShortLabel "車両" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "車両" := by native_decide
example : isShortLabel "車両総重量" = true := by native_decide
example : isShortLabel "車両総重量" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "車両総重量" := by native_decide
example : isShortLabel "車両重量" = true := by native_decide
example : isShortLabel "車両重量" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "車両重量" := by native_decide
example : isShortLabel "車体の形状" = true := by native_decide
example : isShortLabel "車体の形状" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "車体の形状" := by native_decide
example : isShortLabel "車台番号" = true := by native_decide
example : isShortLabel "車台番号" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "車台番号" := by native_decide
example : isShortLabel "軍属" = true := by native_decide
example : isShortLabel "軍属" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "軍属" := by native_decide
example : isShortLabel "軽油" = true := by native_decide
example : isShortLabel "軽油" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "軽油" := by native_decide
example : isShortLabel "軽油又は重油" = true := by native_decide
example : isShortLabel "軽油又は重油" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "軽油又は重油" := by native_decide
example : isShortLabel "軽自動車" = true := by native_decide
example : isShortLabel "軽自動車" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "軽自動車" := by native_decide
example : isShortLabel "軽自動車税" = true := by native_decide
example : isShortLabel "軽自動車税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "軽自動車税" := by native_decide
example : isShortLabel "軽自動車税の" = true := by native_decide
example : isShortLabel "軽自動車税の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "軽自動車税の" := by native_decide
example : isShortLabel "軽自動車等" = true := by native_decide
example : isShortLabel "軽自動車等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "軽自動車等" := by native_decide
example : isShortLabel "輔" = true := by native_decide
example : isShortLabel "輔" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "輔" := by native_decide
example : isShortLabel "輸入" = true := by native_decide
example : isShortLabel "輸入" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "輸入" := by native_decide
example : isShortLabel "輸入する物品" = true := by native_decide
example : isShortLabel "輸入する物品" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "輸入する物品" := by native_decide
example : isShortLabel "輸入の時" = true := by native_decide
example : isShortLabel "輸入の時" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "輸入の時" := by native_decide
example : isShortLabel "輸入原料品" = true := by native_decide
example : isShortLabel "輸入原料品" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "輸入原料品" := by native_decide
example : isShortLabel "輸入数量" = true := by native_decide
example : isShortLabel "輸入数量" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "輸入数量" := by native_decide
example : isShortLabel "輸入税" = true := by native_decide
example : isShortLabel "輸入税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "輸入税" := by native_decide
example : isShortLabel "輸入者" = true := by native_decide
example : isShortLabel "輸入者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "輸入者" := by native_decide
example : isShortLabel "輸入者に対し" = true := by native_decide
example : isShortLabel "輸入者に対し" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "輸入者に対し" := by native_decide
example : isShortLabel "輸出" = true := by native_decide
example : isShortLabel "輸出" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "輸出" := by native_decide
example : isShortLabel "輸出の年月日" = true := by native_decide
example : isShortLabel "輸出の年月日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "輸出の年月日" := by native_decide
example : isShortLabel "輸出先" = true := by native_decide
example : isShortLabel "輸出先" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "輸出先" := by native_decide
example : isShortLabel "輸出者" = true := by native_decide
example : isShortLabel "輸出者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "輸出者" := by native_decide
example : isShortLabel "輸出貨物" = true := by native_decide
example : isShortLabel "輸出貨物" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "輸出貨物" := by native_decide
example : isShortLabel "農事組合法人" = true := by native_decide
example : isShortLabel "農事組合法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "農事組合法人" := by native_decide
example : isShortLabel "農地" = true := by native_decide
example : isShortLabel "農地" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "農地" := by native_decide
example : isShortLabel "農地等" = true := by native_decide
example : isShortLabel "農地等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "農地等" := by native_decide
example : isShortLabel "農家数" = true := by native_decide
example : isShortLabel "農家数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "農家数" := by native_decide
example : isShortLabel "農家火災共済" = true := by native_decide
example : isShortLabel "農家火災共済" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "農家火災共済" := by native_decide
example : isShortLabel "農林中央金庫" = true := by native_decide
example : isShortLabel "農林中央金庫" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "農林中央金庫" := by native_decide
example : isShortLabel "農林漁業の用" = true := by native_decide
example : isShortLabel "農林漁業の用" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "農林漁業の用" := by native_decide
example : isShortLabel "農業" = true := by native_decide
example : isShortLabel "農業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "農業" := by native_decide
example : isShortLabel "農業用道路" = true := by native_decide
example : isShortLabel "農業用道路" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "農業用道路" := by native_decide
example : isShortLabel "農業行政費" = true := by native_decide
example : isShortLabel "農業行政費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "農業行政費" := by native_decide
example : isShortLabel "近畿海運局長" = true := by native_decide
example : isShortLabel "近畿海運局長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "近畿海運局長" := by native_decide
example : isShortLabel "近畿運輸局長" = true := by native_decide
example : isShortLabel "近畿運輸局長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "近畿運輸局長" := by native_decide
example : isShortLabel "退職手当等" = true := by native_decide
example : isShortLabel "退職手当等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "退職手当等" := by native_decide
example : isShortLabel "送付" = true := by native_decide
example : isShortLabel "送付" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "送付" := by native_decide
example : isShortLabel "送風機" = true := by native_decide
example : isShortLabel "送風機" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "送風機" := by native_decide
example : isShortLabel "通信業" = true := by native_decide
example : isShortLabel "通信業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "通信業" := by native_decide
example : isShortLabel "通信課程" = true := by native_decide
example : isShortLabel "通信課程" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "通信課程" := by native_decide
example : isShortLabel "通常掛金額" = true := by native_decide
example : isShortLabel "通常掛金額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "通常掛金額" := by native_decide
example : isShortLabel "通知預金通帳" = true := by native_decide
example : isShortLabel "通知預金通帳" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "通知預金通帳" := by native_decide
example : isShortLabel "通算子法人" = true := by native_decide
example : isShortLabel "通算子法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "通算子法人" := by native_decide
example : isShortLabel "通算法人" = true := by native_decide
example : isShortLabel "通算法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "通算法人" := by native_decide
example : isShortLabel "通算親法人" = true := by native_decide
example : isShortLabel "通算親法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "通算親法人" := by native_decide
example : isShortLabel "通関手帳" = true := by native_decide
example : isShortLabel "通関手帳" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "通関手帳" := by native_decide
example : isShortLabel "造付金庫" = true := by native_decide
example : isShortLabel "造付金庫" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "造付金庫" := by native_decide
example : isShortLabel "連結子法人" = true := by native_decide
example : isShortLabel "連結子法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "連結子法人" := by native_decide
example : isShortLabel "連結子法人に" = true := by native_decide
example : isShortLabel "連結子法人に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "連結子法人に" := by native_decide
example : isShortLabel "連結所得" = true := by native_decide
example : isShortLabel "連結所得" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "連結所得" := by native_decide
example : isShortLabel "連結法人" = true := by native_decide
example : isShortLabel "連結法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "連結法人" := by native_decide
example : isShortLabel "連結親法人" = true := by native_decide
example : isShortLabel "連結親法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "連結親法人" := by native_decide
example : isShortLabel "連結親法人が" = true := by native_decide
example : isShortLabel "連結親法人が" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "連結親法人が" := by native_decide
example : isShortLabel "遊技場業" = true := by native_decide
example : isShortLabel "遊技場業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "遊技場業" := by native_decide
example : isShortLabel "遊技所業" = true := by native_decide
example : isShortLabel "遊技所業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "遊技所業" := by native_decide
example : isShortLabel "遊漁船" = true := by native_decide
example : isShortLabel "遊漁船" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "遊漁船" := by native_decide
example : isShortLabel "遊覧場" = true := by native_decide
example : isShortLabel "遊覧場" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "遊覧場" := by native_decide
example : isShortLabel "遊覧所業" = true := by native_decide
example : isShortLabel "遊覧所業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "遊覧所業" := by native_decide
example : isShortLabel "運用の方法" = true := by native_decide
example : isShortLabel "運用の方法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "運用の方法" := by native_decide
example : isShortLabel "運用の方法に" = true := by native_decide
example : isShortLabel "運用の方法に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "運用の方法に" := by native_decide
example : isShortLabel "運転予定期間" = true := by native_decide
example : isShortLabel "運転予定期間" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "運転予定期間" := by native_decide
example : isShortLabel "運輸通信業" = true := by native_decide
example : isShortLabel "運輸通信業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "運輸通信業" := by native_decide
example : isShortLabel "運送保険" = true := by native_decide
example : isShortLabel "運送保険" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "運送保険" := by native_decide
example : isShortLabel "運送取扱業" = true := by native_decide
example : isShortLabel "運送取扱業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "運送取扱業" := by native_decide
example : isShortLabel "運送業" = true := by native_decide
example : isShortLabel "運送業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "運送業" := by native_decide
example : isShortLabel "過装置、" = true := by native_decide
example : isShortLabel "過装置、" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "過装置、" := by native_decide
example : isShortLabel "過誤納金" = true := by native_decide
example : isShortLabel "過誤納金" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "過誤納金" := by native_decide
example : isShortLabel "過誤納金が" = true := by native_decide
example : isShortLabel "過誤納金が" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "過誤納金が" := by native_decide
example : isShortLabel "過誤納金を" = true := by native_decide
example : isShortLabel "過誤納金を" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "過誤納金を" := by native_decide
example : isShortLabel "過誤納額" = true := by native_decide
example : isShortLabel "過誤納額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "過誤納額" := by native_decide
example : isShortLabel "道府県に" = true := by native_decide
example : isShortLabel "道府県に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "道府県に" := by native_decide
example : isShortLabel "道府県内" = true := by native_decide
example : isShortLabel "道府県内" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "道府県内" := by native_decide
example : isShortLabel "道府県民税で" = true := by native_decide
example : isShortLabel "道府県民税で" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "道府県民税で" := by native_decide
example : isShortLabel "道府県民税に" = true := by native_decide
example : isShortLabel "道府県民税に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "道府県民税に" := by native_decide
example : isShortLabel "道府県民税額" = true := by native_decide
example : isShortLabel "道府県民税額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "道府県民税額" := by native_decide
example : isShortLabel "道府県知事に" = true := by native_decide
example : isShortLabel "道府県知事に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "道府県知事に" := by native_decide
example : isShortLabel "道県" = true := by native_decide
example : isShortLabel "道県" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "道県" := by native_decide
example : isShortLabel "道路の延長" = true := by native_decide
example : isShortLabel "道路の延長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "道路の延長" := by native_decide
example : isShortLabel "道路の種別" = true := by native_decide
example : isShortLabel "道路の種別" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "道路の種別" := by native_decide
example : isShortLabel "適格事後設立" = true := by native_decide
example : isShortLabel "適格事後設立" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "適格事後設立" := by native_decide
example : isShortLabel "適格分割" = true := by native_decide
example : isShortLabel "適格分割" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "適格分割" := by native_decide
example : isShortLabel "適格分割等" = true := by native_decide
example : isShortLabel "適格分割等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "適格分割等" := by native_decide
example : isShortLabel "適格割引率" = true := by native_decide
example : isShortLabel "適格割引率" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "適格割引率" := by native_decide
example : isShortLabel "適格合併等" = true := by native_decide
example : isShortLabel "適格合併等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "適格合併等" := by native_decide
example : isShortLabel "適格株式" = true := by native_decide
example : isShortLabel "適格株式" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "適格株式" := by native_decide
example : isShortLabel "適格株式分配" = true := by native_decide
example : isShortLabel "適格株式分配" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "適格株式分配" := by native_decide
example : isShortLabel "適格株式移転" = true := by native_decide
example : isShortLabel "適格株式移転" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "適格株式移転" := by native_decide
example : isShortLabel "適格現物出資" = true := by native_decide
example : isShortLabel "適格現物出資" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "適格現物出資" := by native_decide
example : isShortLabel "適格現物分配" = true := by native_decide
example : isShortLabel "適格現物分配" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "適格現物分配" := by native_decide
example : isShortLabel "適用する" = true := by native_decide
example : isShortLabel "適用する" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "適用する" := by native_decide
example : isShortLabel "適用する。" = true := by native_decide
example : isShortLabel "適用する。" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "適用する。" := by native_decide
example : isShortLabel "適用実態調査" = true := by native_decide
example : isShortLabel "適用実態調査" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "適用実態調査" := by native_decide
example : isShortLabel "適用対象金額" = true := by native_decide
example : isShortLabel "適用対象金額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "適用対象金額" := by native_decide
example : isShortLabel "適用日" = true := by native_decide
example : isShortLabel "適用日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "適用日" := by native_decide
example : isShortLabel "適用株主等" = true := by native_decide
example : isShortLabel "適用株主等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "適用株主等" := by native_decide
example : isShortLabel "適用開始日" = true := by native_decide
example : isShortLabel "適用開始日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "適用開始日" := by native_decide
example : isShortLabel "適用開始日と" = true := by native_decide
example : isShortLabel "適用開始日と" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "適用開始日と" := by native_decide
example : isShortLabel "適用開始日）" = true := by native_decide
example : isShortLabel "適用開始日）" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "適用開始日）" := by native_decide
example : isShortLabel "適用額" = true := by native_decide
example : isShortLabel "適用額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "適用額" := by native_decide
example : isShortLabel "適用額明細書" = true := by native_decide
example : isShortLabel "適用額明細書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "適用額明細書" := by native_decide
example : isShortLabel "遮" = true := by native_decide
example : isShortLabel "遮" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "遮" := by native_decide
example : isShortLabel "避雷針設備" = true := by native_decide
example : isShortLabel "避雷針設備" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "避雷針設備" := by native_decide
example : isShortLabel "還付" = true := by native_decide
example : isShortLabel "還付" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "還付" := by native_decide
example : isShortLabel "還付すべき" = true := by native_decide
example : isShortLabel "還付すべき" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "還付すべき" := by native_decide
example : isShortLabel "還付の請求" = true := by native_decide
example : isShortLabel "還付の請求" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "還付の請求" := by native_decide
example : isShortLabel "還付請求書" = true := by native_decide
example : isShortLabel "還付請求書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "還付請求書" := by native_decide
example : isShortLabel "還付請求書を" = true := by native_decide
example : isShortLabel "還付請求書を" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "還付請求書を" := by native_decide
example : isShortLabel "還付資金勘定" = true := by native_decide
example : isShortLabel "還付資金勘定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "還付資金勘定" := by native_decide
example : isShortLabel "還付金等" = true := by native_decide
example : isShortLabel "還付金等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "還付金等" := by native_decide
example : isShortLabel "還付金等が" = true := by native_decide
example : isShortLabel "還付金等が" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "還付金等が" := by native_decide
example : isShortLabel "郵便業" = true := by native_decide
example : isShortLabel "郵便業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "郵便業" := by native_decide
example : isShortLabel "郵便貯金銀行" = true := by native_decide
example : isShortLabel "郵便貯金銀行" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "郵便貯金銀行" := by native_decide
example : isShortLabel "都" = true := by native_decide
example : isShortLabel "都" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "都" := by native_decide
example : isShortLabel "都は" = true := by native_decide
example : isShortLabel "都は" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "都は" := by native_decide
example : isShortLabel "都内" = true := by native_decide
example : isShortLabel "都内" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "都内" := by native_decide
example : isShortLabel "都市計画税" = true := by native_decide
example : isShortLabel "都市計画税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "都市計画税" := by native_decide
example : isShortLabel "都民税" = true := by native_decide
example : isShortLabel "都民税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "都民税" := by native_decide
example : isShortLabel "都民税で" = true := by native_decide
example : isShortLabel "都民税で" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "都民税で" := by native_decide
example : isShortLabel "都民税に" = true := by native_decide
example : isShortLabel "都民税に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "都民税に" := by native_decide
example : isShortLabel "都民税の法" = true := by native_decide
example : isShortLabel "都民税の法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "都民税の法" := by native_decide
example : isShortLabel "都民税額" = true := by native_decide
example : isShortLabel "都民税額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "都民税額" := by native_decide
example : isShortLabel "都知事" = true := by native_decide
example : isShortLabel "都知事" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "都知事" := by native_decide
example : isShortLabel "都道府県" = true := by native_decide
example : isShortLabel "都道府県" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "都道府県" := by native_decide
example : isShortLabel "都道府県に" = true := by native_decide
example : isShortLabel "都道府県に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "都道府県に" := by native_decide
example : isShortLabel "配偶者" = true := by native_decide
example : isShortLabel "配偶者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "配偶者" := by native_decide
example : isShortLabel "配偶者居住権" = true := by native_decide
example : isShortLabel "配偶者居住権" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "配偶者居住権" := by native_decide
example : isShortLabel "配分基準額" = true := by native_decide
example : isShortLabel "配分基準額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "配分基準額" := by native_decide
example : isShortLabel "配当に" = true := by native_decide
example : isShortLabel "配当に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "配当に" := by native_decide
example : isShortLabel "配当の" = true := by native_decide
example : isShortLabel "配当の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "配当の" := by native_decide
example : isShortLabel "配当割" = true := by native_decide
example : isShortLabel "配当割" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "配当割" := by native_decide
example : isShortLabel "配当又は利子" = true := by native_decide
example : isShortLabel "配当又は利子" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "配当又は利子" := by native_decide
example : isShortLabel "配当可能金額" = true := by native_decide
example : isShortLabel "配当可能金額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "配当可能金額" := by native_decide
example : isShortLabel "配当等" = true := by native_decide
example : isShortLabel "配当等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "配当等" := by native_decide
example : isShortLabel "配当等で" = true := by native_decide
example : isShortLabel "配当等で" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "配当等で" := by native_decide
example : isShortLabel "配当等の" = true := by native_decide
example : isShortLabel "配当等の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "配当等の" := by native_decide
example : isShortLabel "配当等（" = true := by native_decide
example : isShortLabel "配当等（" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "配当等（" := by native_decide
example : isShortLabel "酒母" = true := by native_decide
example : isShortLabel "酒母" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "酒母" := by native_decide
example : isShortLabel "酒税" = true := by native_decide
example : isShortLabel "酒税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "酒税" := by native_decide
example : isShortLabel "酒税の" = true := by native_decide
example : isShortLabel "酒税の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "酒税の" := by native_decide
example : isShortLabel "酒税法" = true := by native_decide
example : isShortLabel "酒税法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "酒税法" := by native_decide
example : isShortLabel "酒税等" = true := by native_decide
example : isShortLabel "酒税等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "酒税等" := by native_decide
example : isShortLabel "酒税等の" = true := by native_decide
example : isShortLabel "酒税等の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "酒税等の" := by native_decide
example : isShortLabel "酒類" = true := by native_decide
example : isShortLabel "酒類" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "酒類" := by native_decide
example : isShortLabel "酒類、" = true := by native_decide
example : isShortLabel "酒類、" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "酒類、" := by native_decide
example : isShortLabel "酒類分科会" = true := by native_decide
example : isShortLabel "酒類分科会" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "酒類分科会" := by native_decide
example : isShortLabel "酒類製造者" = true := by native_decide
example : isShortLabel "酒類製造者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "酒類製造者" := by native_decide
example : isShortLabel "醸造酒類" = true := by native_decide
example : isShortLabel "醸造酒類" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "醸造酒類" := by native_decide
example : isShortLabel "重量" = true := by native_decide
example : isShortLabel "重量" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "重量" := by native_decide
example : isShortLabel "野球場" = true := by native_decide
example : isShortLabel "野球場" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "野球場" := by native_decide
example : isShortLabel "金融保険業" = true := by native_decide
example : isShortLabel "金融保険業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "金融保険業" := by native_decide
example : isShortLabel "金融業" = true := by native_decide
example : isShortLabel "金融業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "金融業" := by native_decide
example : isShortLabel "金融機関" = true := by native_decide
example : isShortLabel "金融機関" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "金融機関" := by native_decide
example : isShortLabel "金銭" = true := by native_decide
example : isShortLabel "金銭" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "金銭" := by native_decide
example : isShortLabel "金銭債権" = true := by native_decide
example : isShortLabel "金銭債権" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "金銭債権" := by native_decide
example : isShortLabel "金銭貸付業" = true := by native_decide
example : isShortLabel "金銭貸付業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "金銭貸付業" := by native_decide
example : isShortLabel "金額から" = true := by native_decide
example : isShortLabel "金額から" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "金額から" := by native_decide
example : isShortLabel "金額と" = true := by native_decide
example : isShortLabel "金額と" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "金額と" := by native_decide
example : isShortLabel "金額とし" = true := by native_decide
example : isShortLabel "金額とし" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "金額とし" := by native_decide
example : isShortLabel "金額に" = true := by native_decide
example : isShortLabel "金額に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "金額に" := by native_decide
example : isShortLabel "金額を" = true := by native_decide
example : isShortLabel "金額を" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "金額を" := by native_decide
example : isShortLabel "金額（" = true := by native_decide
example : isShortLabel "金額（" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "金額（" := by native_decide
example : isShortLabel "金額）" = true := by native_decide
example : isShortLabel "金額）" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "金額）" := by native_decide
example : isShortLabel "鉄鋼業" = true := by native_decide
example : isShortLabel "鉄鋼業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "鉄鋼業" := by native_decide
example : isShortLabel "鉱区の種類" = true := by native_decide
example : isShortLabel "鉱区の種類" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "鉱区の種類" := by native_decide
example : isShortLabel "鉱区税" = true := by native_decide
example : isShortLabel "鉱区税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "鉱区税" := by native_decide
example : isShortLabel "鉱業" = true := by native_decide
example : isShortLabel "鉱業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "鉱業" := by native_decide
example : isShortLabel "鉱業権" = true := by native_decide
example : isShortLabel "鉱業権" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "鉱業権" := by native_decide
example : isShortLabel "鉱産税" = true := by native_decide
example : isShortLabel "鉱産税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "鉱産税" := by native_decide
example : isShortLabel "銀行" = true := by native_decide
example : isShortLabel "銀行" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "銀行" := by native_decide
example : isShortLabel "銀行業" = true := by native_decide
example : isShortLabel "銀行業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "銀行業" := by native_decide
example : isShortLabel "錮" = true := by native_decide
example : isShortLabel "錮" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "錮" := by native_decide
example : isShortLabel "鑵" = true := by native_decide
example : isShortLabel "鑵" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "鑵" := by native_decide
example : isShortLabel "長期育林共済" = true := by native_decide
example : isShortLabel "長期育林共済" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "長期育林共済" := by native_decide
example : isShortLabel "開始" = true := by native_decide
example : isShortLabel "開始" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "開始" := by native_decide
example : isShortLabel "開始した日" = true := by native_decide
example : isShortLabel "開始した日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "開始した日" := by native_decide
example : isShortLabel "開発区域" = true := by native_decide
example : isShortLabel "開発区域" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "開発区域" := by native_decide
example : isShortLabel "閏" = true := by native_decide
example : isShortLabel "閏" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "閏" := by native_decide
example : isShortLabel "関係市町村" = true := by native_decide
example : isShortLabel "関係市町村" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "関係市町村" := by native_decide
example : isShortLabel "関係道府県" = true := by native_decide
example : isShortLabel "関係道府県" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "関係道府県" := by native_decide
example : isShortLabel "関係都道府県" = true := by native_decide
example : isShortLabel "関係都道府県" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "関係都道府県" := by native_decide
example : isShortLabel "関東海運局長" = true := by native_decide
example : isShortLabel "関東海運局長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "関東海運局長" := by native_decide
example : isShortLabel "関東運輸局長" = true := by native_decide
example : isShortLabel "関東運輸局長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "関東運輸局長" := by native_decide
example : isShortLabel "関税" = true := by native_decide
example : isShortLabel "関税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "関税" := by native_decide
example : isShortLabel "関税に" = true := by native_decide
example : isShortLabel "関税に" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "関税に" := by native_decide
example : isShortLabel "関税の額" = true := by native_decide
example : isShortLabel "関税の額" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "関税の額" := by native_decide
example : isShortLabel "関税分科会" = true := by native_decide
example : isShortLabel "関税分科会" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "関税分科会" := by native_decide
example : isShortLabel "関税率" = true := by native_decide
example : isShortLabel "関税率" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "関税率" := by native_decide
example : isShortLabel "関税率審議会" = true := by native_decide
example : isShortLabel "関税率審議会" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "関税率審議会" := by native_decide
example : isShortLabel "関連者" = true := by native_decide
example : isShortLabel "関連者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "関連者" := by native_decide
example : isShortLabel "防災用ベンチ" = true := by native_decide
example : isShortLabel "防災用ベンチ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "防災用ベンチ" := by native_decide
example : isShortLabel "防災用倉庫" = true := by native_decide
example : isShortLabel "防災用倉庫" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "防災用倉庫" := by native_decide
example : isShortLabel "防護設備" = true := by native_decide
example : isShortLabel "防護設備" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "防護設備" := by native_decide
example : isShortLabel "防風林" = true := by native_decide
example : isShortLabel "防風林" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "防風林" := by native_decide
example : isShortLabel "附則別表第三" = true := by native_decide
example : isShortLabel "附則別表第三" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "附則別表第三" := by native_decide
example : isShortLabel "附則第三条" = true := by native_decide
example : isShortLabel "附則第三条" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "附則第三条" := by native_decide
example : isShortLabel "附則第三項" = true := by native_decide
example : isShortLabel "附則第三項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "附則第三項" := by native_decide
example : isShortLabel "附則第九条" = true := by native_decide
example : isShortLabel "附則第九条" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "附則第九条" := by native_decide
example : isShortLabel "附則第二項" = true := by native_decide
example : isShortLabel "附則第二項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "附則第二項" := by native_decide
example : isShortLabel "附則第五条" = true := by native_decide
example : isShortLabel "附則第五条" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "附則第五条" := by native_decide
example : isShortLabel "附則第六条" = true := by native_decide
example : isShortLabel "附則第六条" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "附則第六条" := by native_decide
example : isShortLabel "附則第十五条" = true := by native_decide
example : isShortLabel "附則第十五条" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "附則第十五条" := by native_decide
example : isShortLabel "附則第十八条" = true := by native_decide
example : isShortLabel "附則第十八条" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "附則第十八条" := by native_decide
example : isShortLabel "附則第十六項" = true := by native_decide
example : isShortLabel "附則第十六項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "附則第十六項" := by native_decide
example : isShortLabel "附則第十四条" = true := by native_decide
example : isShortLabel "附則第十四条" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "附則第十四条" := by native_decide
example : isShortLabel "附則第十四項" = true := by native_decide
example : isShortLabel "附則第十四項" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "附則第十四項" := by native_decide
example : isShortLabel "附帯税" = true := by native_decide
example : isShortLabel "附帯税" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "附帯税" := by native_decide
example : isShortLabel "限る" = true := by native_decide
example : isShortLabel "限る" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "限る" := by native_decide
example : isShortLabel "除く" = true := by native_decide
example : isShortLabel "除く" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "除く" := by native_decide
example : isShortLabel "除く。）」" = true := by native_decide
example : isShortLabel "除く。）」" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "除く。）」" := by native_decide
example : isShortLabel "除名" = true := by native_decide
example : isShortLabel "除名" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "除名" := by native_decide
example : isShortLabel "除外会社等" = true := by native_decide
example : isShortLabel "除外会社等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "除外会社等" := by native_decide
example : isShortLabel "陸上競技場" = true := by native_decide
example : isShortLabel "陸上競技場" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "陸上競技場" := by native_decide
example : isShortLabel "障害者" = true := by native_decide
example : isShortLabel "障害者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "障害者" := by native_decide
example : isShortLabel "障害者の数" = true := by native_decide
example : isShortLabel "障害者の数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "障害者の数" := by native_decide
example : isShortLabel "集会施設" = true := by native_decide
example : isShortLabel "集会施設" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "集会施設" := by native_decide
example : isShortLabel "集団投資信託" = true := by native_decide
example : isShortLabel "集団投資信託" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "集団投資信託" := by native_decide
example : isShortLabel "集沈" = true := by native_decide
example : isShortLabel "集沈" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "集沈" := by native_decide
example : isShortLabel "雇用者" = true := by native_decide
example : isShortLabel "雇用者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "雇用者" := by native_decide
example : isShortLabel "雇用障害者数" = true := by native_decide
example : isShortLabel "雇用障害者数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "雇用障害者数" := by native_decide
example : isShortLabel "雑収入" = true := by native_decide
example : isShortLabel "雑収入" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "雑収入" := by native_decide
example : isShortLabel "雑所得" = true := by native_decide
example : isShortLabel "雑所得" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "雑所得" := by native_decide
example : isShortLabel "雑損控除" = true := by native_decide
example : isShortLabel "雑損控除" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "雑損控除" := by native_decide
example : isShortLabel "雑酒" = true := by native_decide
example : isShortLabel "雑酒" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "雑酒" := by native_decide
example : isShortLabel "難破貨物" = true := by native_decide
example : isShortLabel "難破貨物" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "難破貨物" := by native_decide
example : isShortLabel "電動機" = true := by native_decide
example : isShortLabel "電動機" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "電動機" := by native_decide
example : isShortLabel "電子取引" = true := by native_decide
example : isShortLabel "電子取引" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "電子取引" := by native_decide
example : isShortLabel "電子決済手段" = true := by native_decide
example : isShortLabel "電子決済手段" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "電子決済手段" := by native_decide
example : isShortLabel "電子署名" = true := by native_decide
example : isShortLabel "電子署名" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "電子署名" := by native_decide
example : isShortLabel "電子計算機" = true := by native_decide
example : isShortLabel "電子計算機" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "電子計算機" := by native_decide
example : isShortLabel "電気の供給" = true := by native_decide
example : isShortLabel "電気の供給" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "電気の供給" := by native_decide
example : isShortLabel "電気供給業" = true := by native_decide
example : isShortLabel "電気供給業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "電気供給業" := by native_decide
example : isShortLabel "電気自動車" = true := by native_decide
example : isShortLabel "電気自動車" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "電気自動車" := by native_decide
example : isShortLabel "電気設備" = true := by native_decide
example : isShortLabel "電気設備" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "電気設備" := by native_decide
example : isShortLabel "電気軽自動車" = true := by native_decide
example : isShortLabel "電気軽自動車" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "電気軽自動車" := by native_decide
example : isShortLabel "電気通信業" = true := by native_decide
example : isShortLabel "電気通信業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "電気通信業" := by native_decide
example : isShortLabel "電波高度計" = true := by native_decide
example : isShortLabel "電波高度計" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "電波高度計" := by native_decide
example : isShortLabel "電磁的方法" = true := by native_decide
example : isShortLabel "電磁的方法" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "電磁的方法" := by native_decide
example : isShortLabel "電磁的記録" = true := by native_decide
example : isShortLabel "電磁的記録" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "電磁的記録" := by native_decide
example : isShortLabel "電話加入権" = true := by native_decide
example : isShortLabel "電話加入権" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "電話加入権" := by native_decide
example : isShortLabel "電路設備" = true := by native_decide
example : isShortLabel "電路設備" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "電路設備" := by native_decide
example : isShortLabel "青色申告書" = true := by native_decide
example : isShortLabel "青色申告書" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "青色申告書" := by native_decide
example : isShortLabel "非上場株式等" = true := by native_decide
example : isShortLabel "非上場株式等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "非上場株式等" := by native_decide
example : isShortLabel "非営利会社等" = true := by native_decide
example : isShortLabel "非営利会社等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "非営利会社等" := by native_decide
example : isShortLabel "非営利型法人" = true := by native_decide
example : isShortLabel "非営利型法人" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "非営利型法人" := by native_decide
example : isShortLabel "非居住贈与者" = true := by native_decide
example : isShortLabel "非居住贈与者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "非居住贈与者" := by native_decide
example : isShortLabel "非永住者" = true := by native_decide
example : isShortLabel "非永住者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "非永住者" := by native_decide
example : isShortLabel "非関連者" = true := by native_decide
example : isShortLabel "非関連者" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "非関連者" := by native_decide
example : isShortLabel "靱" = true := by native_decide
example : isShortLabel "靱" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "靱" := by native_decide
example : isShortLabel "音楽家" = true := by native_decide
example : isShortLabel "音楽家" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "音楽家" := by native_decide
example : isShortLabel "項名" = true := by native_decide
example : isShortLabel "項名" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "項名" := by native_decide
example : isShortLabel "項目" = true := by native_decide
example : isShortLabel "項目" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "項目" := by native_decide
example : isShortLabel "預入等" = true := by native_decide
example : isShortLabel "預入等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "預入等" := by native_decide
example : isShortLabel "預貯金" = true := by native_decide
example : isShortLabel "預貯金" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "預貯金" := by native_decide
example : isShortLabel "預貯金等" = true := by native_decide
example : isShortLabel "預貯金等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "預貯金等" := by native_decide
example : isShortLabel "領収書等" = true := by native_decide
example : isShortLabel "領収書等" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "領収書等" := by native_decide
example : isShortLabel "額、" = true := by native_decide
example : isShortLabel "額、" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "額、" := by native_decide
example : isShortLabel "額に当該土地" = true := by native_decide
example : isShortLabel "額に当該土地" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "額に当該土地" := by native_decide
example : isShortLabel "額をいう" = true := by native_decide
example : isShortLabel "額をいう" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "額をいう" := by native_decide
example : isShortLabel "額及び" = true := by native_decide
example : isShortLabel "額及び" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "額及び" := by native_decide
example : isShortLabel "額）" = true := by native_decide
example : isShortLabel "額）" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "額）" := by native_decide
example : isShortLabel "風水害保険" = true := by native_decide
example : isShortLabel "風水害保険" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "風水害保険" := by native_decide
example : isShortLabel "風水害等共済" = true := by native_decide
example : isShortLabel "風水害等共済" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "風水害等共済" := by native_decide
example : isShortLabel "食料品製造業" = true := by native_decide
example : isShortLabel "食料品製造業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "食料品製造業" := by native_decide
example : isShortLabel "食肉流通統計" = true := by native_decide
example : isShortLabel "食肉流通統計" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "食肉流通統計" := by native_decide
example : isShortLabel "飲食店業" = true := by native_decide
example : isShortLabel "飲食店業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "飲食店業" := by native_decide
example : isShortLabel "香味料" = true := by native_decide
example : isShortLabel "香味料" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "香味料" := by native_decide
example : isShortLabel "香水" = true := by native_decide
example : isShortLabel "香水" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "香水" := by native_decide
example : isShortLabel "香港" = true := by native_decide
example : isShortLabel "香港" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "香港" := by native_decide
example : isShortLabel "駐車場業" = true := by native_decide
example : isShortLabel "駐車場業" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "駐車場業" := by native_decide
example : isShortLabel "高松陸運局長" = true := by native_decide
example : isShortLabel "高松陸運局長" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "高松陸運局長" := by native_decide
example : isShortLabel "）" = true := by native_decide
example : isShortLabel "）" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "）" := by native_decide
example : isShortLabel "）×η" = true := by native_decide
example : isShortLabel "）×η" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "）×η" := by native_decide
example : isShortLabel "）×［｛ｄ" = true := by native_decide
example : isShortLabel "）×［｛ｄ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "）×［｛ｄ" := by native_decide
example : isShortLabel "）、" = true := by native_decide
example : isShortLabel "）、" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "）、" := by native_decide
example : isShortLabel "）、（ｄ" = true := by native_decide
example : isShortLabel "）、（ｄ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "）、（ｄ" := by native_decide
example : isShortLabel "）が" = true := by native_decide
example : isShortLabel "）が" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "）が" := by native_decide
example : isShortLabel "）と" = true := by native_decide
example : isShortLabel "）と" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "）と" := by native_decide
example : isShortLabel "）に係る" = true := by native_decide
example : isShortLabel "）に係る" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "）に係る" := by native_decide
example : isShortLabel "）の" = true := by native_decide
example : isShortLabel "）の" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "）の" := by native_decide
example : isShortLabel "）の株式" = true := by native_decide
example : isShortLabel "）の株式" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "）の株式" := by native_decide
example : isShortLabel "）の規定" = true := by native_decide
example : isShortLabel "）の規定" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "）の規定" := by native_decide
example : isShortLabel "）の譲渡" = true := by native_decide
example : isShortLabel "）の譲渡" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "）の譲渡" := by native_decide
example : isShortLabel "）は、前三条" = true := by native_decide
example : isShortLabel "）は、前三条" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "）は、前三条" := by native_decide
example : isShortLabel "）を納付した" = true := by native_decide
example : isShortLabel "）を納付した" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "）を納付した" := by native_decide
example : isShortLabel "）並びに" = true := by native_decide
example : isShortLabel "）並びに" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "）並びに" := by native_decide
example : isShortLabel "）又は" = true := by native_decide
example : isShortLabel "）又は" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "）又は" := by native_decide
example : isShortLabel "）又は｛ｄ" = true := by native_decide
example : isShortLabel "）又は｛ｄ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "）又は｛ｄ" := by native_decide
example : isShortLabel "）及び" = true := by native_decide
example : isShortLabel "）及び" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "）及び" := by native_decide
example : isShortLabel "）終了の日" = true := by native_decide
example : isShortLabel "）終了の日" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "）終了の日" := by native_decide
example : isShortLabel "）若しくは" = true := by native_decide
example : isShortLabel "）若しくは" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "）若しくは" := by native_decide
example : isShortLabel "）＋（Ａ" = true := by native_decide
example : isShortLabel "）＋（Ａ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "）＋（Ａ" := by native_decide
example : isShortLabel "）＋（ｄ" = true := by native_decide
example : isShortLabel "）＋（ｄ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "）＋（ｄ" := by native_decide
example : isShortLabel "）＋ｂ" = true := by native_decide
example : isShortLabel "）＋ｂ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "）＋ｂ" := by native_decide
example : isShortLabel "）＋ｃ" = true := by native_decide
example : isShortLabel "）＋ｃ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "）＋ｃ" := by native_decide
example : isShortLabel "）＋ｄ" = true := by native_decide
example : isShortLabel "）＋ｄ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "）＋ｄ" := by native_decide
example : isShortLabel "＋ｄ" = true := by native_decide
example : isShortLabel "＋ｄ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "＋ｄ" := by native_decide
example : isShortLabel "／１００" = true := by native_decide
example : isShortLabel "／１００" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "／１００" := by native_decide
example : isShortLabel "１　土地" = true := by native_decide
example : isShortLabel "１　土地" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "１　土地" := by native_decide
example : isShortLabel "１　均等割" = true := by native_decide
example : isShortLabel "１　均等割" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "１　均等割" := by native_decide
example : isShortLabel "１　小学校費" = true := by native_decide
example : isShortLabel "１　小学校費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "１　小学校費" := by native_decide
example : isShortLabel "１　徴税費" = true := by native_decide
example : isShortLabel "１　徴税費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "１　徴税費" := by native_decide
example : isShortLabel "１　教職員数" = true := by native_decide
example : isShortLabel "１　教職員数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "１　教職員数" := by native_decide
example : isShortLabel "１　譲渡割" = true := by native_decide
example : isShortLabel "１　譲渡割" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "１　譲渡割" := by native_decide
example : isShortLabel "１０万円" = true := by native_decide
example : isShortLabel "１０万円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "１０万円" := by native_decide
example : isShortLabel "１１万円" = true := by native_decide
example : isShortLabel "１１万円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "１１万円" := by native_decide
example : isShortLabel "１２未満" = true := by native_decide
example : isShortLabel "１２未満" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "１２未満" := by native_decide
example : isShortLabel "１３万円" = true := by native_decide
example : isShortLabel "１３万円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "１３万円" := by native_decide
example : isShortLabel "１５万円" = true := by native_decide
example : isShortLabel "１５万円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "１５万円" := by native_decide
example : isShortLabel "１６万円" = true := by native_decide
example : isShortLabel "１６万円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "１６万円" := by native_decide
example : isShortLabel "１８万円" = true := by native_decide
example : isShortLabel "１８万円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "１８万円" := by native_decide
example : isShortLabel "２　中学校費" = true := by native_decide
example : isShortLabel "２　中学校費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "２　中学校費" := by native_decide
example : isShortLabel "２　家屋" = true := by native_decide
example : isShortLabel "２　家屋" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "２　家屋" := by native_decide
example : isShortLabel "２　恩給費" = true := by native_decide
example : isShortLabel "２　恩給費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "２　恩給費" := by native_decide
example : isShortLabel "２　所得割" = true := by native_decide
example : isShortLabel "２　所得割" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "２　所得割" := by native_decide
example : isShortLabel "２　河川費" = true := by native_decide
example : isShortLabel "２　河川費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "２　河川費" := by native_decide
example : isShortLabel "２　港湾費" = true := by native_decide
example : isShortLabel "２　港湾費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "２　港湾費" := by native_decide
example : isShortLabel "２　生徒数" = true := by native_decide
example : isShortLabel "２　生徒数" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "２　生徒数" := by native_decide
example : isShortLabel "２　貨物割" = true := by native_decide
example : isShortLabel "２　貨物割" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "２　貨物割" := by native_decide
example : isShortLabel "２０万円" = true := by native_decide
example : isShortLabel "２０万円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "２０万円" := by native_decide
example : isShortLabel "２１万円" = true := by native_decide
example : isShortLabel "２１万円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "２１万円" := by native_decide
example : isShortLabel "２３万円" = true := by native_decide
example : isShortLabel "２３万円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "２３万円" := by native_decide
example : isShortLabel "２５万円" = true := by native_decide
example : isShortLabel "２５万円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "２５万円" := by native_decide
example : isShortLabel "２６万円" = true := by native_decide
example : isShortLabel "２６万円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "２６万円" := by native_decide
example : isShortLabel "２８万円" = true := by native_decide
example : isShortLabel "２８万円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "２８万円" := by native_decide
example : isShortLabel "３　償却資産" = true := by native_decide
example : isShortLabel "３　償却資産" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "３　償却資産" := by native_decide
example : isShortLabel "３　法人税割" = true := by native_decide
example : isShortLabel "３　法人税割" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "３　法人税割" := by native_decide
example : isShortLabel "３　港湾費" = true := by native_decide
example : isShortLabel "３　港湾費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "３　港湾費" := by native_decide
example : isShortLabel "３　衛生費" = true := by native_decide
example : isShortLabel "３　衛生費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "３　衛生費" := by native_decide
example : isShortLabel "３万円" = true := by native_decide
example : isShortLabel "３万円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "３万円" := by native_decide
example : isShortLabel "３０万円" = true := by native_decide
example : isShortLabel "３０万円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "３０万円" := by native_decide
example : isShortLabel "３１万円" = true := by native_decide
example : isShortLabel "３１万円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "３１万円" := by native_decide
example : isShortLabel "３３万円" = true := by native_decide
example : isShortLabel "３３万円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "３３万円" := by native_decide
example : isShortLabel "４　公園費" = true := by native_decide
example : isShortLabel "４　公園費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "４　公園費" := by native_decide
example : isShortLabel "５　下水道費" = true := by native_decide
example : isShortLabel "５　下水道費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "５　下水道費" := by native_decide
example : isShortLabel "５　配当割" = true := by native_decide
example : isShortLabel "５　配当割" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "５　配当割" := by native_decide
example : isShortLabel "５万円" = true := by native_decide
example : isShortLabel "５万円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "５万円" := by native_decide
example : isShortLabel "６　労働費" = true := by native_decide
example : isShortLabel "６　労働費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "６　労働費" := by native_decide
example : isShortLabel "６　清掃費" = true := by native_decide
example : isShortLabel "６　清掃費" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "６　清掃費" := by native_decide
example : isShortLabel "６万円" = true := by native_decide
example : isShortLabel "６万円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "６万円" := by native_decide
example : isShortLabel "６２９×Ａ" = true := by native_decide
example : isShortLabel "６２９×Ａ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "６２９×Ａ" := by native_decide
example : isShortLabel "７０未満" = true := by native_decide
example : isShortLabel "７０未満" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "７０未満" := by native_decide
example : isShortLabel "８万円" = true := by native_decide
example : isShortLabel "８万円" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "８万円" := by native_decide
example : isShortLabel "Ａ×α" = true := by native_decide
example : isShortLabel "Ａ×α" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ａ×α" := by native_decide
example : isShortLabel "Ａ×０．０１" = true := by native_decide
example : isShortLabel "Ａ×０．０１" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ａ×０．０１" := by native_decide
example : isShortLabel "Ａ×０．５" = true := by native_decide
example : isShortLabel "Ａ×０．５" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ａ×０．５" := by native_decide
example : isShortLabel "Ａ×０．６" = true := by native_decide
example : isShortLabel "Ａ×０．６" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ａ×０．６" := by native_decide
example : isShortLabel "Ａ×０．７５" = true := by native_decide
example : isShortLabel "Ａ×０．７５" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ａ×０．７５" := by native_decide
example : isShortLabel "Ａの区分" = true := by native_decide
example : isShortLabel "Ａの区分" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ａの区分" := by native_decide
example : isShortLabel "Ａ＋Ｂ" = true := by native_decide
example : isShortLabel "Ａ＋Ｂ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ａ＋Ｂ" := by native_decide
example : isShortLabel "Ａ＋Ｂ＋Ｃ" = true := by native_decide
example : isShortLabel "Ａ＋Ｂ＋Ｃ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ａ＋Ｂ＋Ｃ" := by native_decide
example : isShortLabel "Ａ－Ｂ" = true := by native_decide
example : isShortLabel "Ａ－Ｂ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ａ－Ｂ" := by native_decide
example : isShortLabel "Ａ－Ｂ＋Ｃ" = true := by native_decide
example : isShortLabel "Ａ－Ｂ＋Ｃ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ａ－Ｂ＋Ｃ" := by native_decide
example : isShortLabel "ＡＡ２" = true := by native_decide
example : isShortLabel "ＡＡ２" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＡ２" := by native_decide
example : isShortLabel "ＡＡ３" = true := by native_decide
example : isShortLabel "ＡＡ３" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＡ３" := by native_decide
example : isShortLabel "ＡＡ４" = true := by native_decide
example : isShortLabel "ＡＡ４" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＡ４" := by native_decide
example : isShortLabel "ＡＡ５" = true := by native_decide
example : isShortLabel "ＡＡ５" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＡ５" := by native_decide
example : isShortLabel "ＡＢ２" = true := by native_decide
example : isShortLabel "ＡＢ２" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＢ２" := by native_decide
example : isShortLabel "ＡＢ３" = true := by native_decide
example : isShortLabel "ＡＢ３" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＢ３" := by native_decide
example : isShortLabel "ＡＢ４" = true := by native_decide
example : isShortLabel "ＡＢ４" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＢ４" := by native_decide
example : isShortLabel "ＡＣ２" = true := by native_decide
example : isShortLabel "ＡＣ２" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＣ２" := by native_decide
example : isShortLabel "ＡＣ３" = true := by native_decide
example : isShortLabel "ＡＣ３" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＣ３" := by native_decide
example : isShortLabel "ＡＣ４" = true := by native_decide
example : isShortLabel "ＡＣ４" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＣ４" := by native_decide
example : isShortLabel "ＡＥ，ｄｉ" = true := by native_decide
example : isShortLabel "ＡＥ，ｄｉ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＥ，ｄｉ" := by native_decide
example : isShortLabel "ＡＥ，ｅｊ" = true := by native_decide
example : isShortLabel "ＡＥ，ｅｊ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＥ，ｅｊ" := by native_decide
example : isShortLabel "ＡＥ，ｎｋ" = true := by native_decide
example : isShortLabel "ＡＥ，ｎｋ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＥ，ｎｋ" := by native_decide
example : isShortLabel "ＡＱ'" = true := by native_decide
example : isShortLabel "ＡＱ'" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＱ'" := by native_decide
example : isShortLabel "ＡＲ'" = true := by native_decide
example : isShortLabel "ＡＲ'" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＲ'" := by native_decide
example : isShortLabel "ＡＴ２" = true := by native_decide
example : isShortLabel "ＡＴ２" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＴ２" := by native_decide
example : isShortLabel "ＡＴ３" = true := by native_decide
example : isShortLabel "ＡＴ３" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＴ３" := by native_decide
example : isShortLabel "ＡＴ４" = true := by native_decide
example : isShortLabel "ＡＴ４" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＴ４" := by native_decide
example : isShortLabel "ＡＴ５" = true := by native_decide
example : isShortLabel "ＡＴ５" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＴ５" := by native_decide
example : isShortLabel "ＡＴ５'" = true := by native_decide
example : isShortLabel "ＡＴ５'" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＴ５'" := by native_decide
example : isShortLabel "ＡＵ２" = true := by native_decide
example : isShortLabel "ＡＵ２" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＵ２" := by native_decide
example : isShortLabel "ＡＵ３" = true := by native_decide
example : isShortLabel "ＡＵ３" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＵ３" := by native_decide
example : isShortLabel "ＡＵ４" = true := by native_decide
example : isShortLabel "ＡＵ４" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＵ４" := by native_decide
example : isShortLabel "ＡＵ５" = true := by native_decide
example : isShortLabel "ＡＵ５" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＵ５" := by native_decide
example : isShortLabel "ＡＵ５'" = true := by native_decide
example : isShortLabel "ＡＵ５'" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＵ５'" := by native_decide
example : isShortLabel "ＡＶ２" = true := by native_decide
example : isShortLabel "ＡＶ２" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＶ２" := by native_decide
example : isShortLabel "ＡＶ３" = true := by native_decide
example : isShortLabel "ＡＶ３" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＶ３" := by native_decide
example : isShortLabel "ＡＶ４" = true := by native_decide
example : isShortLabel "ＡＶ４" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＶ４" := by native_decide
example : isShortLabel "ＡＷ２" = true := by native_decide
example : isShortLabel "ＡＷ２" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＷ２" := by native_decide
example : isShortLabel "ＡＷ３" = true := by native_decide
example : isShortLabel "ＡＷ３" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＷ３" := by native_decide
example : isShortLabel "ＡＷ４" = true := by native_decide
example : isShortLabel "ＡＷ４" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＡＷ４" := by native_decide
example : isShortLabel "Ｂの区分" = true := by native_decide
example : isShortLabel "Ｂの区分" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｂの区分" := by native_decide
example : isShortLabel "Ｂ／Ａ＋１" = true := by native_decide
example : isShortLabel "Ｂ／Ａ＋１" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｂ／Ａ＋１" := by native_decide
example : isShortLabel "Ｃ×１０．０" = true := by native_decide
example : isShortLabel "Ｃ×１０．０" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｃ×１０．０" := by native_decide
example : isShortLabel "Ｃの区分" = true := by native_decide
example : isShortLabel "Ｃの区分" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｃの区分" := by native_decide
example : isShortLabel "Ｃ－Ｂ" = true := by native_decide
example : isShortLabel "Ｃ－Ｂ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｃ－Ｂ" := by native_decide
example : isShortLabel "ＣＡ'" = true := by native_decide
example : isShortLabel "ＣＡ'" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＣＡ'" := by native_decide
example : isShortLabel "ＣＡ''" = true := by native_decide
example : isShortLabel "ＣＡ''" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＣＡ''" := by native_decide
example : isShortLabel "ＣＡ'''" = true := by native_decide
example : isShortLabel "ＣＡ'''" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＣＡ'''" := by native_decide
example : isShortLabel "ＣＢ'" = true := by native_decide
example : isShortLabel "ＣＢ'" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＣＢ'" := by native_decide
example : isShortLabel "ＣＢ''" = true := by native_decide
example : isShortLabel "ＣＢ''" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＣＢ''" := by native_decide
example : isShortLabel "ＣＢ'''" = true := by native_decide
example : isShortLabel "ＣＢ'''" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＣＢ'''" := by native_decide
example : isShortLabel "ＣＣ'" = true := by native_decide
example : isShortLabel "ＣＣ'" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＣＣ'" := by native_decide
example : isShortLabel "ＣＣ''" = true := by native_decide
example : isShortLabel "ＣＣ''" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＣＣ''" := by native_decide
example : isShortLabel "ＣＤ'" = true := by native_decide
example : isShortLabel "ＣＤ'" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＣＤ'" := by native_decide
example : isShortLabel "ＣＤ''" = true := by native_decide
example : isShortLabel "ＣＤ''" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ＣＤ''" := by native_decide
example : isShortLabel "Ｄの区分" = true := by native_decide
example : isShortLabel "Ｄの区分" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｄの区分" := by native_decide
example : isShortLabel "Ｄ－Ｃ" = true := by native_decide
example : isShortLabel "Ｄ－Ｃ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｄ－Ｃ" := by native_decide
example : isShortLabel "Ｅ×５．５０" = true := by native_decide
example : isShortLabel "Ｅ×５．５０" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｅ×５．５０" := by native_decide
example : isShortLabel "Ｅの区分" = true := by native_decide
example : isShortLabel "Ｅの区分" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｅの区分" := by native_decide
example : isShortLabel "Ｈ２" = true := by native_decide
example : isShortLabel "Ｈ２" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｈ２" := by native_decide
example : isShortLabel "Ｈ＝１／ｈ" = true := by native_decide
example : isShortLabel "Ｈ＝１／ｈ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｈ＝１／ｈ" := by native_decide
example : isShortLabel "Ｉ２" = true := by native_decide
example : isShortLabel "Ｉ２" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｉ２" := by native_decide
example : isShortLabel "Ｐ'" = true := by native_decide
example : isShortLabel "Ｐ'" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｐ'" := by native_decide
example : isShortLabel "Ｐ２" = true := by native_decide
example : isShortLabel "Ｐ２" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｐ２" := by native_decide
example : isShortLabel "Ｐ２'" = true := by native_decide
example : isShortLabel "Ｐ２'" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｐ２'" := by native_decide
example : isShortLabel "Ｐ３" = true := by native_decide
example : isShortLabel "Ｐ３" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｐ３" := by native_decide
example : isShortLabel "Ｐ３'" = true := by native_decide
example : isShortLabel "Ｐ３'" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｐ３'" := by native_decide
example : isShortLabel "Ｑ'" = true := by native_decide
example : isShortLabel "Ｑ'" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｑ'" := by native_decide
example : isShortLabel "Ｑ２" = true := by native_decide
example : isShortLabel "Ｑ２" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｑ２" := by native_decide
example : isShortLabel "Ｑ２'" = true := by native_decide
example : isShortLabel "Ｑ２'" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｑ２'" := by native_decide
example : isShortLabel "Ｑ３" = true := by native_decide
example : isShortLabel "Ｑ３" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｑ３" := by native_decide
example : isShortLabel "Ｑ３'" = true := by native_decide
example : isShortLabel "Ｑ３'" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｑ３'" := by native_decide
example : isShortLabel "Ｔ'" = true := by native_decide
example : isShortLabel "Ｔ'" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｔ'" := by native_decide
example : isShortLabel "Ｔ２" = true := by native_decide
example : isShortLabel "Ｔ２" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｔ２" := by native_decide
example : isShortLabel "Ｔ２'" = true := by native_decide
example : isShortLabel "Ｔ２'" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｔ２'" := by native_decide
example : isShortLabel "Ｔ３" = true := by native_decide
example : isShortLabel "Ｔ３" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｔ３" := by native_decide
example : isShortLabel "Ｔ３'" = true := by native_decide
example : isShortLabel "Ｔ３'" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｔ３'" := by native_decide
example : isShortLabel "Ｕ'" = true := by native_decide
example : isShortLabel "Ｕ'" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｕ'" := by native_decide
example : isShortLabel "Ｕ２" = true := by native_decide
example : isShortLabel "Ｕ２" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｕ２" := by native_decide
example : isShortLabel "Ｕ２'" = true := by native_decide
example : isShortLabel "Ｕ２'" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｕ２'" := by native_decide
example : isShortLabel "Ｕ３" = true := by native_decide
example : isShortLabel "Ｕ３" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｕ３" := by native_decide
example : isShortLabel "Ｕ３'" = true := by native_decide
example : isShortLabel "Ｕ３'" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｕ３'" := by native_decide
example : isShortLabel "Ｚ２" = true := by native_decide
example : isShortLabel "Ｚ２" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｚ２" := by native_decide
example : isShortLabel "Ｚ３" = true := by native_decide
example : isShortLabel "Ｚ３" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｚ３" := by native_decide
example : isShortLabel "Ｚ４" = true := by native_decide
example : isShortLabel "Ｚ４" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｚ４" := by native_decide
example : isShortLabel "Ｚ５" = true := by native_decide
example : isShortLabel "Ｚ５" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "Ｚ５" := by native_decide
example : isShortLabel "［｛（Ａ" = true := by native_decide
example : isShortLabel "［｛（Ａ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "［｛（Ａ" := by native_decide
example : isShortLabel "］" = true := by native_decide
example : isShortLabel "］" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "］" := by native_decide
example : isShortLabel "ａ'／ｂ" = true := by native_decide
example : isShortLabel "ａ'／ｂ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ａ'／ｂ" := by native_decide
example : isShortLabel "ａ×ｂ" = true := by native_decide
example : isShortLabel "ａ×ｂ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ａ×ｂ" := by native_decide
example : isShortLabel "ａ　人口" = true := by native_decide
example : isShortLabel "ａ　人口" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ａ　人口" := by native_decide
example : isShortLabel "ａ／ｂ" = true := by native_decide
example : isShortLabel "ａ／ｂ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ａ／ｂ" := by native_decide
example : isShortLabel "ｂ" = true := by native_decide
example : isShortLabel "ｂ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ｂ" := by native_decide
example : isShortLabel "ｃ" = true := by native_decide
example : isShortLabel "ｃ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ｃ" := by native_decide
example : isShortLabel "ｄ" = true := by native_decide
example : isShortLabel "ｄ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ｄ" := by native_decide
example : isShortLabel "ｅ" = true := by native_decide
example : isShortLabel "ｅ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ｅ" := by native_decide
example : isShortLabel "ｉ" = true := by native_decide
example : isShortLabel "ｉ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ｉ" := by native_decide
example : isShortLabel "ｊ×ｋ" = true := by native_decide
example : isShortLabel "ｊ×ｋ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ｊ×ｋ" := by native_decide
example : isShortLabel "ｍ×ｎ" = true := by native_decide
example : isShortLabel "ｍ×ｎ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ｍ×ｎ" := by native_decide
example : isShortLabel "ｏ×γ" = true := by native_decide
example : isShortLabel "ｏ×γ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ｏ×γ" := by native_decide
example : isShortLabel "ｐ×δ" = true := by native_decide
example : isShortLabel "ｐ×δ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ｐ×δ" := by native_decide
example : isShortLabel "ｓ" = true := by native_decide
example : isShortLabel "ｓ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ｓ" := by native_decide
example : isShortLabel "ｙ" = true := by native_decide
example : isShortLabel "ｙ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ｙ" := by native_decide
example : isShortLabel "ｚ" = true := by native_decide
example : isShortLabel "ｚ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ｚ" := by native_decide
example : isShortLabel "ｚ１１　８０" = true := by native_decide
example : isShortLabel "ｚ１１　８０" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ｚ１１　８０" := by native_decide
example : isShortLabel "ｚ１２　４０" = true := by native_decide
example : isShortLabel "ｚ１２　４０" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ｚ１２　４０" := by native_decide
example : isShortLabel "ｚ１４　５２" = true := by native_decide
example : isShortLabel "ｚ１４　５２" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ｚ１４　５２" := by native_decide
example : isShortLabel "ｚ１６　９" = true := by native_decide
example : isShortLabel "ｚ１６　９" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ｚ１６　９" := by native_decide
example : isShortLabel "ｚ１９　９" = true := by native_decide
example : isShortLabel "ｚ１９　９" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ｚ１９　９" := by native_decide
example : isShortLabel "ｚ２　９" = true := by native_decide
example : isShortLabel "ｚ２　９" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ｚ２　９" := by native_decide
example : isShortLabel "ｚ４　３０" = true := by native_decide
example : isShortLabel "ｚ４　３０" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ｚ４　３０" := by native_decide
example : isShortLabel "ｚ５　９" = true := by native_decide
example : isShortLabel "ｚ５　９" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ｚ５　９" := by native_decide
example : isShortLabel "ｚ６　１５" = true := by native_decide
example : isShortLabel "ｚ６　１５" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ｚ６　１５" := by native_decide
example : isShortLabel "ｚ９　６１" = true := by native_decide
example : isShortLabel "ｚ９　６１" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "ｚ９　６１" := by native_decide
example : isShortLabel "｝" = true := by native_decide
example : isShortLabel "｝" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "｝" := by native_decide
example : isShortLabel "｝／（ｄ" = true := by native_decide
example : isShortLabel "｝／（ｄ" = JapanTaxLaw.ShortLabelFragmentsSpec.isShortLabelSpec "｝／（ｄ" := by native_decide

end JapanTaxLaw.ShortLabelFragmentsTests
