import JapanTaxLaw.TaxFinance

/-
# MergerGrantFiscalWindow — 市町村合併補助金 第八条（昭和47〜52年度の適用期間）

Sources (pinned):

  Law id: 347CO0000000160
  Revision: 347CO0000000160_19750430_350CO0000000141
  Raw snapshot: data/raw/347CO0000000160_19750430_350CO0000000141.law.json
  SHA-256: 20d1e1b4cf45e93d4f30be1546919ed16c7c3c8bd63d47cf311a08282d4d85be

Pinned 原文 (verbatim, scoped Article 8; leading fullwidth item marker ３ preserved):
「３国は、昭和四十七年度から昭和五十二年度までの各年度に限り、市町村の合併をしようとする市町村（以下この条において「合併関係市町村」という。）に対し、市町村の合併の実施を促進するため、予算の範囲内で、補助金を交付することができる。」

Scoped claim: only the explicit TEMPORAL APPLICATION WINDOW (validity period) for merger-grant eligibility — fiscal years 昭和47年度 through 昭和52年度 INCLUSIVE (各年度に限り).
Variable contract: fy = 年度 (Nat, 昭和年份, e.g. 47 = 昭和47年度); window is INCLUSIVE at both ends [47,52]; 各年度に限り = only years within the window qualify.
Temporal-application norm only: not modelling budget amount, merger conditions, or other paragraphs.
-/

namespace JapanTaxLaw.MergerGrantFiscalWindow

def windowStartFY : Nat := 47

def windowEndFY : Nat := 52

def inGrantWindow (fy : Nat) : Bool :=
  decide (windowStartFY <= fy && fy <= windowEndFY)

theorem windowStartFY_value : windowStartFY = 47 := rfl

theorem windowEndFY_value : windowEndFY = 52 := rfl

theorem inGrantWindow_46 : inGrantWindow 46 = false := by decide

theorem inGrantWindow_47 : inGrantWindow 47 = true := by decide

theorem inGrantWindow_50 : inGrantWindow 50 = true := by decide

theorem inGrantWindow_52 : inGrantWindow 52 = true := by decide

theorem inGrantWindow_53 : inGrantWindow 53 = false := by decide

end JapanTaxLaw.MergerGrantFiscalWindow
