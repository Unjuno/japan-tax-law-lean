import JapanTaxLaw.TaxFinance

/-!
# NickelContent — ニッケル含有量の閾値（不当廉売関税政令 art.1 イ）bounded L4 モデル

Sources (pinned):
  Law id: 508CO0000000224
  Revision: 508CO0000000224_20261031_508CO0000000340
  Raw snapshot: data/raw/508CO0000000224_20261031_508CO0000000340.law.json
  Article Num 1 (イ), flat/normalized leaf text 1080 chars, U+3000 count 0.

原文逐語:
  「ニッケルの含有量が全重量の〇・六パーセントを超えるもの」

Computation（原文逐語から導出、含有量閾値のみ）:
  〇・六パーセント = 0.6% = 6/1000
  exceedsNickelThreshold(nickel, total) = (nickel * 1000 > total * 6)
    「超える」= 厳密不等式（0.6% ちょうどは対象外）

Scope / NOT MODELLED:
  - 冷間圧延の有無・クラッド/めっき/被覆の除外・加工品の区分は NOT MODELLED。
  - 重量の測定・含有量の認定手続は NOT MODELLED。
  - 特定国等・期間・関税率表の号の特定は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.NickelContent

open JapanTaxLaw.TaxFinance

/-- ニッケル含有量が全重量の 0.6% を超えるか（厳密）。 -/
def exceedsNickelThreshold (nickel : Money) (total : Money) : Bool :=
  nickel * 1000 > total * 6

example : exceedsNickelThreshold 6 1000 = false := by decide   -- 0.6% ちょうど
example : exceedsNickelThreshold 7 1000 = true := by decide    -- 0.7%
example : exceedsNickelThreshold 5 1000 = false := by decide   -- 0.5%
example : exceedsNickelThreshold 0 1000 = false := by decide

end JapanTaxLaw.NickelContent
