import JapanTaxLaw.NonTaxSavingsCeiling

/-!
# NonTaxSavingsCeiling spec — 所得税法施行令 art.40 の独立整数定式

Sources (pinned; identical to NonTaxSavingsCeiling.lean):

  Law id: 340CO0000000096
  Revision: 340CO0000000096_20260522_508CO0000000093
  Raw snapshot: data/raw/340CO0000000096_20260522_508CO0000000093.law.json
  Article Num 40, flat/normalized leaf text 186 chars, U+3000 count 0.

Independent restatement（原文逐語のみから導いた整数式。impl の def を参照しない）:

  * 「一万円に整数を乗じた金額」 → specDeclaredCeiling units = 10_000 * units。
  * 「三百万円（…第四号…合計額を控除した残額）以下の金額」 →
    specResidualCeiling total = if 3_000_000 ≤ total then 0 else 3_000_000 - total
    （saturating。第四号が無い場合は caller が total = 0 を渡す）。
  * 中核制約 specCeilingWithinLimit units total =
    specDeclaredCeiling units ≤ specResidualCeiling total。
  * 派生量 specMaxAllowedUnits total = specResidualCeiling total / 10_000（端数切捨て）。

Scope boundaries identical to the implementation: 法第十条第三項第三号・第四号の
具体的記載事項・算式は NOT MODELLED。各金額・整数・該当性は caller-established。
-/

namespace JapanTaxLaw.NonTaxSavingsCeiling

/-- Spec: 原文「一万円に整数を乗じた金額」。impl の定数・def を参照しない独立定式。 -/
def specDeclaredCeiling (units : Nat) : Nat := 10_000 * units

/-- Spec: 原文「三百万円から…合計額を控除した残額」。saturating 減算。
    impl の分岐条件 `baseCeilingYen ≤ item4Total` を同じ向きで整数リテラル直接で書く。 -/
def specResidualCeiling (item4Total : Nat) : Nat :=
  if 3_000_000 ≤ item4Total then 0 else 3_000_000 - item4Total

/-- Spec: 原文「かつ、…以下の金額」の制約。 -/
abbrev specCeilingWithinLimit (units item4Total : Nat) : Prop :=
  specDeclaredCeiling units ≤ specResidualCeiling item4Total

/-- Spec: 上限内で取りうる最大 unit 数（端数切捨て）。 -/
def specMaxAllowedUnits (item4Total : Nat) : Nat :=
  specResidualCeiling item4Total / 10_000

-- ==== spec smoke (kernel-decided) ====

example : specDeclaredCeiling 0 = 0 := by decide
example : specDeclaredCeiling 300 = 3_000_000 := by decide
example : specResidualCeiling 0 = 3_000_000 := by decide
example : specResidualCeiling 1_000_000 = 2_000_000 := by decide
example : specResidualCeiling 3_000_000 = 0 := by decide
example : specResidualCeiling 5_000_000 = 0 := by decide
example : specResidualCeiling 1 = 2_999_999 := by decide
example : specCeilingWithinLimit 300 0 := by decide
example : ¬ specCeilingWithinLimit 301 0 := by decide
example : specCeilingWithinLimit 299 1 := by decide
example : specMaxAllowedUnits 0 = 300 := by decide
example : specMaxAllowedUnits 1 = 299 := by decide
example : specMaxAllowedUnits 3_000_000 = 0 := by decide

/-- Agreement checks between implementation and Spec（定数値の `==` 一致確認であり、
    法的意味の等価証明ではない。有限グリッド、by decide）。 -/
def agreeNonTaxSavingsCeiling : Bool :=
  [ (0, 0), (1, 0), (2, 0), (299, 0), (300, 0), (301, 0),
    (100, 1_000_000), (299, 1), (300, 1), (0, 3_000_000),
    (0, 3_000_001), (1, 2_999_999), (300, 5_000_000),
    (7, 55_555), (123, 1_234_567) ].all (fun (u, t) =>
      declaredCeiling u == specDeclaredCeiling u &&
      residualCeiling t == specResidualCeiling t &&
      maxAllowedUnits t == specMaxAllowedUnits t &&
      decide (ceilingWithinLimit u t) == decide (specCeilingWithinLimit u t))

example : agreeNonTaxSavingsCeiling = true := by decide

end JapanTaxLaw.NonTaxSavingsCeiling
