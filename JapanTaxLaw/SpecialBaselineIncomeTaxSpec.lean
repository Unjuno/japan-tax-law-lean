import JapanTaxLaw.SpecialBaselineIncomeTax

/-!
# SpecialBaselineIncomeTaxSpec — 租税特別措置法 art.41の19 の独立整数定式

Sources (pinned; identical to SpecialBaselineIncomeTax.lean):

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01

Independent restatement of the single modelled computation (第1項):

  * art. 41の19 第1項
      impl: `specialRate.applyFloor (baselineIncome - thresholdAmount) - baselineTaxAmount`
      spec: `baselineIncome` から **raw リテラル** 330000000 / 225 / 1000 を使って
            `(baselineIncome - 330000000) * 225 / 1000 - baselineTaxAmount` を書き直す。
    impl の `TaxRate` / 名前付き定数を再利用せず、定式を独立に保つ。
    `agree*` は有限サンプル上の `==` 一致確認であり、法的意味の等価証明ではない。

Scope boundaries identical to the implementation. 本モジュールが扱うのは第1項の明示的な
算術のみ。基準所得金額・基準所得税額・該当性は caller-established、
第2項の基準所得金額算定（各所得の合計・特別控除・政令規定）および第3項の基準所得税額の
各号別算定、第4項・第5項は NOT MODELLED（impl の doc-comment 参照）。

-/


namespace JapanTaxLaw.SpecialBaselineIncomeTax

open JapanTaxLaw.TaxFinance

-- ==== independent formula (raw integer literals, no TaxRate / named constants) ====

/-- Spec: 「百分の二十二・五に相当する金額」= 225/1000（切り捨て）。 -/
def specApplyRate (amount : Money) : Money :=
  amount * 225 / 1000

/-- Spec: 「三億三千万円を超える部分」= saturating 減算。 -/
def specExcess (baselineIncome : Money) : Money :=
  baselineIncome - 330000000

/-- Spec: art. 41の19 第1項の所得税額（独立定式）。 -/
def specSpecialBaselineIncomeTax (baselineIncome baselineTaxAmount : Money) : Money :=
  specApplyRate (specExcess baselineIncome) - baselineTaxAmount

/-- Spec: 該当性（caller-established Bool）による選択。 -/
def specSpecialBaselineIncomeTaxSelected
    (applicable : Bool) (baselineIncome baselineTaxAmount : Money) : Money :=
  if applicable then specSpecialBaselineIncomeTax baselineIncome baselineTaxAmount else 0

-- ==== points (kernel-decided) ====

example : specApplyRate 1000 = 225 := by decide
example : specApplyRate 1 = 0 := by decide
example : specExcess 330_000_000 = 0 := by decide
example : specExcess 330_001_000 = 1000 := by decide
example : specSpecialBaselineIncomeTax 330_000_000 0 = 0 := by decide
example : specSpecialBaselineIncomeTax 330_001_000 0 = 225 := by decide
example : specSpecialBaselineIncomeTax 330_001_000 300 = 0 := by decide

-- ==== agreement checks between implementation and Spec ====

/-- art. 41の19: 率適用の impl ≡ spec（有限サンプル上の `==` 一致）。 -/
def agreeApplyRate : Bool :=
  [0, 1, 2, 5, 999, 1000, 1001, 2000, 10_000].all fun a =>
    applySpecialRate a == specApplyRate a

/-- art. 41の19: 税額の impl ≡ spec（有限サンプル上の `==` 一致）。 -/
def agreeSpecialBaselineIncomeTax : Bool :=
  [ (0, 0),
    (330_000_000, 0),
    (330_000_000, 1),
    (330_000_001, 0),
    (330_000_005, 0),
    (330_001_000, 0),
    (330_001_000, 100),
    (330_001_000, 225),
    (330_001_000, 300),
    (400_000_000, 12_345),
    (1_000_000_000, 0) ].all fun (i, t) =>
      specialBaselineIncomeTax i t == specSpecialBaselineIncomeTax i t

/-- art. 41の19: Bool 選択の impl ≡ spec（有限サンプル上の `==` 一致）。 -/
def agreeSelected : Bool :=
  [ (false, 0, 0),
    (false, 330_001_000, 0),
    (true, 330_001_000, 0),
    (true, 330_001_000, 300),
    (true, 330_000_000, 0) ].all fun (b, i, t) =>
      specialBaselineIncomeTaxSelected b i t == specSpecialBaselineIncomeTaxSelected b i t

example : agreeApplyRate = true := by decide
example : agreeSpecialBaselineIncomeTax = true := by decide
example : agreeSelected = true := by decide

end JapanTaxLaw.SpecialBaselineIncomeTax
