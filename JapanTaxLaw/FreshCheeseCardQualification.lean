import JapanTaxLaw.TaxFinance

/-!
# FreshCheeseCardQualification — 関税率表第〇四〇六・一〇号 フレッシュチーズ・カード要件（bounded slice）

Sources (pinned):
  Law id: 335CO0000000069
  Revision: 335CO0000000069_20260401_508CO0000000085
  Raw snapshot: data/raw/335CO0000000069_20260401_508CO0000000085.law.json
  Normative id: NORM|06ecf4e83a75240fefb191c05f7df0f5ead383672e0052e4472472d1cde8dd3f
  Article Num 32, paragraph 2, item 5.

原文逐語（pinned clause, extracted from the raw snapshot）:
  「関税率表第〇四〇六・一〇号に掲げるフレッシュチーズ及びカード（いずれも乾燥固形分が全重量の四十八パーセント以下のもの（一個の重量が四グラム以下の細片にし、冷凍し、かつ、正味重量が五キログラムを超える直接包装にしたものに限る。）、関税割当チーズ及びクリームチーズ（軟質で展延性のある熟成していないリンドレスチーズであつて、乾燥固形分のうちに占める乳脂肪分の割合、無脂肪ベースでの全重量のうちに占める水分の割合及び全重量のうちに占める乾燥固形分の割合が、それぞれコーデックスのクリームチーズの規格（ＣＯＤＥＸ」

Computation（入力は提供値。乾燥固形分は百分率、細片重量はグラム、
正味重量はキログラム）:
  qualified(drySolidPct, pieceGrams, netWeightKg) =
    drySolidPct <= 48 && pieceGrams <= 4 && 5 < netWeightKg

Scope / NOT MODELLED:
  - CODEX 規格後半の条文中の数値・割合、関税割当チーズ・クリームチーズの
    詳細認定、物品分類、端数処理は NOT MODELLED。
  - 本モデルは原文に明示された三つの数値条件のみを扱い、
    法的レビューを提供しない。
-/

namespace JapanTaxLaw.FreshCheeseCardQualification

/-- 乾燥固形分48%以下・細片4グラム以下・正味5キログラム超か。 -/
def qualified (drySolidPct : Nat) (pieceGrams : Nat) (netWeightKg : Nat) : Bool :=
  drySolidPct <= 48 && pieceGrams <= 4 && 5 < netWeightKg

example : qualified 48 4 6 = true := by decide
example : qualified 49 4 6 = false := by decide
example : qualified 48 5 6 = false := by decide
example : qualified 48 4 5 = false := by decide

end JapanTaxLaw.FreshCheeseCardQualification
