import JapanTaxLaw.TaxFinance

/-!
# LocalInhabitantTax — 地方税法 市町村民税 art. 314の3（所得割の税率） L4 スライス

Source (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 3DD29E0078BF24E09C79436CE7B0F00FD2CFB5A5BBCB97BD4F4352971BE68D53
  (data/raw/325AC0000000226_20261101_508AC0000000002.law.json,
   revision CurrentEnforced per data/INVENTORY.json;
   same pin as the 道府県民税 slice `LocalIncomeTax.lean`)

Models 地方税法 市町村民税（第二百九十四条以下）の所得割の税率:

* **art. 314の3**: 所得割の額は、課税総所得金額、課税退職所得金額及び課税山林所得金額の
  合計額に、百分の六（指定都市（地方自治法252条の19(1)の市、第三百十四条の六及び
  第三百十四条の七において「指定都市」と定義）の区域内に住所を有する場合には、百分の八）
  の標準税率によつて定める率を乗じて得た金額とする。この場合において、当該定める率は、
  一の率でなければならない。
  - art. 314の3(2)（「課税総所得金額」「課税退職所得金額」「課税山林所得金額」とは、
    それぞれ前条の規定による控除後の前年の総所得金額、退職所得金額又は山林所得金額をいう）
    の定義は呼出元に委ねる（art. 35(2) と同型）。
  - art. 314の6/314の7（指定都市の加算・調整等の手続）は本モジュールの射程外。
  - 道府県民税 art. 35 の百分の四（指定都市の区域内住所者は百分の二）との対称であり、
    市町村民税は「百分の六（指定都市の区域内住所者は百分の八）」であることに注意。

**スコープ外**:
* art. 314の3 以外の市町村民税所得割の特例（均等割 art. 314の7 ほか、
  外国税額控除 art. 314-3 の関連規定等）はモデル化しない。
* 指定都市判定（地方自治法252条の19(1)）は externally established boolean。
* 課税総所得金額等の計算（控除後）の機構は art. 314の2（所得控除等）ほかを経由し、
  本モジュールでは呼出元が供給する。
* art. 314の3 の端数処理: 法文は「乗じて得た金額とする」とだけ規定し、端数処理の方法を
  明示していない。本モジュールは TaxRate.applyFloor（切り捨て）で計算する —
  **modeling candidate**（art. 35 と同じ扱い。method は法文に忠実な読みの一候補にすぎない）。

Pinned evidence in doc-comments only; all theorems here only claim properties of the
model, never of the real legal semantics（誠実性の原則 — Pin ↔ 原文一致 is the trust
boundary; interpretation is not guaranteed)。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 314の3: 市町村民税所得割の標準税率 — 百分の六（指定都市区域内住所者は百分の八）. -/
def localInhabitantStandardRate (livesInDesignatedCity : Bool) : TaxRate :=
  if livesInDesignatedCity then ⟨8, 100, by decide⟩ else ⟨6, 100, by decide⟩

/-- art. 314の3: 所得割の額 = (課税総所得金額 + 課税退職所得金額 + 課税山林所得金額)
    × 標準税率（切り捨て）。課税標準の定義（art. 314の3(2)）は呼出元責任。 -/
def localInhabitantIncomeTaxAmount
    (taxableTotalIncome taxableRetirementIncome taxableForestIncome : Money)
    (livesInDesignatedCity : Bool) : Money :=
  (localInhabitantStandardRate livesInDesignatedCity).applyFloor
    (taxableTotalIncome + taxableRetirementIncome + taxableForestIncome)

-- ==== verified facts about the model (no performance of the law, only model consistency) ====

/-- 標準税率は 6%（指定都市区域内住所者 8%）。 -/
theorem standard_rate_default : (localInhabitantStandardRate false).num = 6 := by decide
theorem standard_rate_designated : (localInhabitantStandardRate true).num = 8 := by decide
theorem standard_rate_designated_den : (localInhabitantStandardRate true).den = 100 := by decide
theorem standard_rate_default_den : (localInhabitantStandardRate false).den = 100 := by decide

/-- 指定都市区域内住所者の標準税率は 6% より 2 ポイント大きい（百分の八 − 百分の六）。 -/
theorem designated_rate_gap :
    (localInhabitantStandardRate true).num - (localInhabitantStandardRate false).num = 2 := by decide

/-- 課税標準が 0 なら額は 0。 -/
theorem zero_base_zero : localInhabitantIncomeTaxAmount 0 0 0 false = 0 := by decide
theorem zero_base_zero_designated : localInhabitantIncomeTaxAmount 0 0 0 true = 0 := by decide

/-- 標準税率適用額が 10,000,000 × 6% = 600,000 となる境界の表示。 -/
theorem example_600000 : localInhabitantIncomeTaxAmount 10_000_000 0 0 false = 600_000 := by decide
theorem example_800000 : localInhabitantIncomeTaxAmount 10_000_000 0 0 true = 800_000 := by decide

/-- 三つの課税標準の合計額で課税する（art. 314の3「合計額に…乗じて」）。 -/
theorem three_bases_compose (a b c : Money) (d : Bool) :
    localInhabitantIncomeTaxAmount a b c d =
      (localInhabitantStandardRate d).applyFloor (a + b + c) := rfl

/-- 所得割の額は課税標準の合計に単調非減少。 -/
theorem localInhabitantIncomeTaxAmount_mono
    {a b c a' b' c' : Money} (h1 : a ≤ a') (h2 : b ≤ b') (h3 : c ≤ c') (d : Bool) :
    localInhabitantIncomeTaxAmount a b c d ≤ localInhabitantIncomeTaxAmount a' b' c' d := by
  unfold localInhabitantIncomeTaxAmount TaxRate.applyFloor
  apply Nat.div_le_div_right
  exact Nat.mul_le_mul_right (localInhabitantStandardRate d).num (Nat.add_le_add (Nat.add_le_add h1 h2) h3)

end JapanTaxLaw
