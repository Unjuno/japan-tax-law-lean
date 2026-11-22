import JapanTaxLaw.TaxFinance

/-
# RatioCapAtOne — 阪神・淡路大震災の被災者等に係る国税関係法律の臨時特例に関する法律施行令 第八条の三（割合が一を超える場合に一とする）モデル

Pinned sources:
  Law id: 407CO0000000029
  Revision: 407CO0000000029_20110101_422CO0000000058
  Raw snapshot: data/raw/407CO0000000029_20110101_422CO0000000058.law.json
  Official title (law_info/revision_info): 阪神・淡路大震災の被災者等に係る国税関係法律の臨時特例に関する法律施行令
  Law type: CabinetOrder (政令). The queue label 「施行条例」 is an abbreviation;
    the official instrument is a 法律施行令 (Cabinet Order), not a 条例
    (local ordinance). BY-DESIGN / CONFIRMED — see adversarial review batch 62.
  Article Num 8_3 (第八条の三), Caption （有限会社の最低資本金を満たすまでの資本増加に係る出資の払込みに充てる利益の配当の非課税）,
    located exactly once at /law_full_text/children/1/children/3/children/1/children/9.
  SHA-256 (raw bytes): 8cc12128db2332ce354b4cfa48b167f6911c61af813bdc7974e832081097b7f4
  Raw file size: 577283 bytes; Article Num="8_3" located exactly once.

Verbatim 原文 needle (count 1 in scoped Article 8_3, Paragraph 2, Item 二):
  「当該社員が出資の引受けをした金額に、イに掲げる金額がロに掲げる金額のうちに占める割合（当該割合が一を超える場合には、一とする。）を乗じて計算した金額」

Variable contract:
  num = イに掲げる金額 (Nat, unit 円)
  den = ロに掲げる金額 (Nat, unit 円). BY-DESIGN scoped assumption: den > 0 is
    required for the ratio num/den to be defined. The model contains no division,
    so den = 0 is outside the intended input domain; this is documented, not
    encoded as a Nat precondition (no dependent types / proofs in the contract).
  一 = 1 = cap value (一とする).

Scope: ONLY the explicit clamp-to-one numeric structure of the ratio
  イ金額 / ロ金額 is modelled. The uncapped ratio num/den exceeds 一 iff num > den,
  so the capped effective numerator (over the fixed denominator den) is
  min num den. Inclusive at 1: num == den stays 1 (exceeds → cap only).
  Exact integers only — no floats and no division in the model. Everything else
  in the article (利益の配当, 有限会社法, 所得税法施行令第百十一条, 出資口数,
  etc.) is NOT MODELLED.
-/

namespace JapanTaxLaw.RatioCapAtOne

/-- 一とする — the statutory cap value (一 = 1). -/
def capValue : Nat := 1

/-- 割合（イ金額 / ロ金額）が一を超える場合には一とする。
    num > den → capped at one (effective numerator den);
    num <= den → unchanged (effective numerator num).
    Equivalent to min num den. den > 0 is the BY-DESIGN input contract above. -/
def cappedRatio (num : Nat) (den : Nat) : Nat := min num den

/-- 一とする: capValue = 一 = 1 (kernel rfl). -/
theorem capValue_is_one : capValue = 1 := rfl

/-- 5/3 は一を超える → capped: effective numerator 3. -/
theorem cappedRatio_over_one : cappedRatio 5 3 = 3 := by decide

/-- 3/5 は一以下 → unchanged: effective numerator 3. -/
theorem cappedRatio_below_one : cappedRatio 3 5 = 3 := by decide

/-- 3/3 = 一 exactly → stays one: effective numerator 3 (inclusive). -/
theorem cappedRatio_at_one : cappedRatio 3 3 = 3 := by decide

/-- 0/5 = 零 → effective numerator 0. -/
theorem cappedRatio_zero : cappedRatio 0 5 = 0 := by decide

end JapanTaxLaw.RatioCapAtOne
