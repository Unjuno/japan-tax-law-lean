import JapanTaxLaw.TaxFinance

/-!
# DeliberationQuorum — 審議会の定足数（関税・外国為替等審議会令 art.9 §1）bounded L4 モデル

Sources (pinned):
  Law id: 412CO0000000276
  Revision: 412CO0000000276_20260401_508CO0000000085
  Raw snapshot: data/raw/412CO0000000276_20260401_508CO0000000085.law.json
  Article Num 9 §1, flat/normalized leaf text 155 chars. Needles contain no U+3000.

原文逐語（第1項）:
  「審議会は、委員及び議事に関係のある臨時委員の三分の一以上が出席しなければ、会議を開き、議決することができない。」

Computation（原文逐語から導出、定足数の判定のみ）:
  total = 委員数 + 議事に関係のある臨時委員数
  quorumMet(attendance, total) = attendance * 3 >= total（三分の一以上 = 1/3 以上、整数昇格）

Scope / NOT MODELLED:
  - 第2項の過半数決議・可否同数の会長裁定は NOT MODELLED。
  - 第3項の分科会・部会への準用は NOT MODELLED。
  - 委員・臨時委員の具体的な人数は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.DeliberationQuorum

open JapanTaxLaw.TaxFinance

/-- 定足数を満たすか（出席者が構成員の 1/3 以上）。 -/
def quorumMet (attendance : Nat) (total : Nat) : Bool := attendance * 3 >= total

example : quorumMet 10 30 = true := by decide  -- ちょうど 1/3
example : quorumMet 9 30 = false := by decide  -- 1/3 未満
example : quorumMet 11 30 = true := by decide
example : quorumMet 1 3 = true := by decide    -- ちょうど 1/3
example : quorumMet 0 0 = true := by decide    -- 空の構成（境界）

end JapanTaxLaw.DeliberationQuorum
