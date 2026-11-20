import JapanTaxLaw.TaxFinance

/-!
# DutyFreeTransfer — 関税法施行令 art.12（免税物品の譲渡の制限）bounded L4 モデル

Sources (pinned):
  Law id: 327CO0000000125
  Revision: 327CO0000000125_20171008_428CO0000000240
  Raw snapshot: data/raw/327CO0000000125_20171008_428CO0000000240.law.json
  Article Num 12, flat/normalized leaf text 176 chars, U+3000 count 0.

原文逐語:
  「法第十一条第一項に規定する譲渡をしようとする者は、その譲渡をしようとする物品が
   既に使用せられたものであり、又はその譲渡が贈与によるものであつて、かつ、その価格が
   一万八千円に満たないものである場合以外の場合に限り、…税関の譲渡の許可を受けなければ
   ならない。」

Computation（原文逐語から導出、数値スライスのみ）:
  thresholdYen = 18,000（一万八千円）
  isBelowThreshold(price) = price < 18,000（「満たない」= 厳密に小さい）

Scope / NOT MODELLED:
  - 「既に使用せられたもの」「贈与によるもの」の認定、許可手続（申告・検査・許可）は
    条文の文構造上の解釈を要し、本スライスでは数値閾値のみを扱う。
  - 満たない = strict < である点を境界で検証する（18000 は Below ではない）。
  - 法11条1項の譲渡の定義、免税物品の範囲は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.DutyFreeTransfer

open JapanTaxLaw.TaxFinance

/-- 価格閾値 = 一万八千円。 -/
def thresholdYen : Money := 18_000

/-- 「一万八千円に満たない」= 厳密に 18,000 円未満。 -/
def isBelowThreshold (price : Money) : Bool :=
  price < thresholdYen

example : thresholdYen = 18_000 := by decide
example : isBelowThreshold 0 = true := by decide
example : isBelowThreshold 17_999 = true := by decide
example : isBelowThreshold 18_000 = false := by decide
example : isBelowThreshold 18_001 = false := by decide

end JapanTaxLaw.DutyFreeTransfer
