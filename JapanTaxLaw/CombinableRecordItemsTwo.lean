import JapanTaxLaw.TaxFinance

/-
# CombinableRecordItemsTwo — 電子帳簿保存法施行規則 第五条（二以上の記録項目の組合せ）

Pinned source:
  Law id: 410M50000040043
  Official title: 電子計算機を使用して作成する国税関係帳簿書類の保存方法等の特例に関する法律施行規則（電子帳簿保存法施行規則）
  Revision: 410M50000040043_20250401_507M60000040028
  Raw snapshot: data/raw/410M50000040043_20250401_507M60000040028.law.json
  SHA-256: 15786f1ae7140c2a1841e02f195246e42f437574b4a20d9f6573dba841899f44
  Statutory article: 第五条 (art. 5; raw JSON Article attr.Num = "5").
  Source path: law_full_text -> Article[Num=5] (verified by independent
  re-extraction: the pinned needle occurs verbatim once in scoped Article 5
  and once in the whole document; SHA-256 matches the pinned bytes).

原文逐語（pinned, 一字一句改変なし）:
  「二以上の任意の記録項目を組み合わせて条件を設定することができること。」

Variable contract:
  `n : Nat` = 組み合わせる記録項目の数 (number of record items), unit 項目.
  `minItems : Nat := 2` = 二 (two record items).
  「二以上」 is INCLUSIVE (n >= 2): exactly two items qualifies; 0 and 1 do not.
  `canCombine n := decide (minItems <= n)` is the Bool flag: true ⟺ 二以上,
  i.e. conditions can be set by combining two or more arbitrary record items.

Scope: ONLY the explicit numeric count threshold is modelled — 二 = 2 and
以上 = inclusive `>=`. The record-item types, the combination semantics, the
nature of the conditions being set, other paragraphs (一, 二) and other
articles are NOT MODELLED.
-/

namespace JapanTaxLaw.CombinableRecordItemsTwo

/-- 二 = 2 項目. Unit 項目; domain Nat. -/
def minItems : Nat := 2

/-- 「二以上の任意の記録項目」: conditions combinable iff n >= 2 (以上 inclusive). -/
def canCombine (n : Nat) : Bool :=
  decide (minItems <= n)

/-- Zero record items is not 二以上. -/
theorem canCombine_0 : canCombine 0 = false := by decide

/-- One record item is not 二以上. -/
theorem canCombine_1 : canCombine 1 = false := by decide

/-- Exactly two record items (二) qualifies: 以上 is inclusive. -/
theorem canCombine_2 : canCombine 2 = true := by decide

/-- Three record items qualifies. -/
theorem canCombine_3 : canCombine 3 = true := by decide

/-- Ten record items qualifies. -/
theorem canCombine_10 : canCombine 10 = true := by decide

/-- The pinned statutory count is 二 = 2. -/
theorem minItems_value : minItems = 2 := rfl

end JapanTaxLaw.CombinableRecordItemsTwo
